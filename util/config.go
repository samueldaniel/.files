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
type Command struct {
	Name string   `yaml:"name"`
	Args []string `yaml:"args"`
}
type Tool struct {
	Commands []Command `yaml:"cmds"`
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
