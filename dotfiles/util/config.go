package util

import (
	"fmt"
	"io/ioutil"
	"log"
	"os"

	"gopkg.in/yaml.v2"
)

type Symlink struct {
	Src      string   `json:"src"`
	Dest     string   `json:"dest"`
	Platform []string `json:"platform"`
}
type Install struct {
	Cmd      string    `json:"cmd"`
	Url      string    `json:"url"`
	To       string    `json:"to"`
	Symlinks []Symlink `json:"symlinks"`
}
type Tool struct {
	Install  []Install `json:"install"`
	Symlinks []Symlink `json:"symlinks"`
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
