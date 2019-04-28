package cmd

import (
	"fmt"
	"log"
	"os"
	"strings"

	"github.com/spf13/cobra"
)

var installCmd = &cobra.Command{
	Use: "install [TOOL] ([TOOL]...)",
	Short: "Install customization",
	Args: func(cmd *cobra.Command, args []string) error {
		wd, err :=  os.Getwd()
		if nil != err {
			log.Fatalln(err)
		}
		if !strings.HasSuffix(wd, ".files/dotfiles") {
			log.Fatalln(fmt.Sprintf("%s is not a valid working dir", wd))
		}
		log.Println(wd)
		return nil
	},
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println(fmt.Sprintf("install %s", args))
	},
}

func init() {
	rootCmd.AddCommand(installCmd)
}
