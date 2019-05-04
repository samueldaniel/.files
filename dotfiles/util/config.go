package util

import (
	"fmt"
	"io/ioutil"
	"log"
	"os"

	"gopkg.in/yaml.v2"
)

type Symlink struct {
	Source      string `yaml:"src"`
	Destination string `yaml:"dest"`
	Platform    string `yaml:"platform"`
}
type Install struct {
	Command  string    `yaml:"cmd"`
	Url      string    `yaml:"url"`
	To       string    `yaml:"to"`
	Symlinks []Symlink `yaml:"symlinks"`
}
type Tool struct {
	Install  []Install `yaml:"install"`
	Symlinks []Symlink `yaml:"symlinks"`
}

func LoadConfig(dotfiles string) map[string]Tool {
	if _, err := os.Stat(dotfiles); os.IsNotExist(err) {
		log.Fatalln(fmt.Sprintf("%s does not exist", dotfiles))
	}
	rawDotfiles, err := ioutil.ReadFile(dotfiles)
	if nil != err {
		log.Fatalln(err)
	}
	dotfilesConfig := make(map[string]Tool)
	err = yaml.Unmarshal([]byte(rawDotfiles), &dotfilesConfig)
	if err != nil {
		log.Fatalln(err)
	}
	return dotfilesConfig
}
