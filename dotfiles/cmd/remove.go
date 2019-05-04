package cmd

import (
	"fmt"
	"log"
	"os"
	"strings"

	"github.com/samueldaniel/.files/dotfiles/util"
	"github.com/spf13/cobra"
)

func init() {
	rootCmd.AddCommand(removeCmd)
	wd, err := os.Getwd()
	if nil != err {
		log.Fatalln(err)
	}
	if !strings.HasSuffix(wd, ".files/dotfiles") {
		log.Fatalln(fmt.Sprintf("%s is not a valid working dir", wd))
	}
}

var removeCmd = &cobra.Command{
	Use:   "remove [TOOL] ([TOOL]...)",
	Short: "Remove customization",
	Run: func(cmd *cobra.Command, args []string) {
		if 0 == len(args) {
			log.Fatalln("Pick a tool to customize")
		}
		dotfiles, _ := rootCmd.PersistentFlags().GetString("dotfiles")
		tools := util.LoadConfig(dotfiles)
		for _, a := range args {
			val, ok := tools[a]
			if !ok {
				log.Fatalln(fmt.Sprintf("%s is not a valid tool", a))
			}
			if 0 < len(val.Symlinks) {
				for _, s := range val.Symlinks {
					util.RemoveSymlink(s)
				}
			}
		}
	},
}
