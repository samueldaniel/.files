package cmd

import (
	"fmt"
	"io/ioutil"
	"log"
	"os"

	"github.com/spf13/cobra"
	"gopkg.in/yaml.v2"
)

type Symlink struct {
	Src string
	Dest string
	Platform []string
}
type Install struct {
	Cmd string
	Url string
	To string
	Symlinks []Symlink
}
type Tool struct {
	Install []Install
	Symlinks []Symlink
}

var rootCmd = &cobra.Command{
	Use:   "dotfiles",
	Short: "Manage customizations for nvim, bash, etc.",
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("hello, world!")
	},
}

func Execute() {
	if err := rootCmd.Execute(); err != nil {
		log.Fatalln(err)
	}
}

func init() {
	cobra.OnInitialize(initConfig)
	rootCmd.PersistentFlags().String("dotfiles", "", "dotfiles yaml")
}

func initConfig() {
	var dotfiles, _ = rootCmd.PersistentFlags().GetString("dotfiles")
	if _, err := os.Stat(dotfiles); os.IsNotExist(err) {
		log.Fatalln(fmt.Sprintf("%s does not exist", dotfiles))
	}
	data, err := ioutil.ReadFile(dotfiles)
	if nil != err {
		log.Fatalln(err)
	}
	m := make(map[string]Tool)
        err = yaml.Unmarshal([]byte(data), &m)
        if err != nil {
                log.Fatalln(err)
        }
	for k, v := range m {
		fmt.Printf("%s: %s\n", k, v)
	}
}
