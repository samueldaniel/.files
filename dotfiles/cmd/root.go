package cmd

import (
	"fmt"
	"log"

	"github.com/spf13/cobra"
)

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
	rootCmd.PersistentFlags().String("dotfiles", "dotfiles.yaml", "dotfiles yaml")
}
