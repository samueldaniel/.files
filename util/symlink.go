package util

import (
	"fmt"
	"log"
	"os"
	"path/filepath"
	"runtime"

	"github.com/mitchellh/go-homedir"
)

func check(err error) {
	if nil != (err) {
		log.Fatalln(err)
	}
}

func InstallSymlink(s Symlink) {
	if "" != s.Platform && s.Platform != runtime.GOOS {
		msg := fmt.Sprintf("Required platform %s does not match %s, skipping %s...", s.Platform, runtime.GOOS, s)
		log.Println(msg)
		return
	}
	source, err := filepath.Abs(s.Source)
	check(err)
	// TODO: check that path actually contains a ~
	dest, err := homedir.Expand(s.Destination)
	check(err)
	if _, err := os.Stat(dest); nil == err {
		msg := fmt.Sprintf("Backing up %s", dest)
		log.Println(msg)
		err := os.Rename(dest, dest+".bak")
		check(err)
	}
	err = os.Symlink(source, dest)
	check(err)
}

func RemoveSymlink(s Symlink) {
	if "" != s.Platform && s.Platform != runtime.GOOS {
		msg := fmt.Sprintf("Required platform %s does not match %s, skipping %s...", s.Platform, runtime.GOOS, s)
		log.Println(msg)
		return
	}
	// TODO: check that path actually contains a ~
	dest, err := homedir.Expand(s.Destination)
	check(err)
	fileInfo, err := os.Lstat(dest)
	check(err)
	bak := dest + ".bak"
	if fileInfo.Mode()&os.ModeSymlink != 0 {
		if _, err := os.Stat(bak); nil == err {
			msg := fmt.Sprintf("Restoring backup %s", bak)
			log.Println(msg)
			err := os.Remove(dest)
			check(err)
			err = os.Rename(bak, dest)
			check(err)
		} else {
			err := os.Remove(dest)
			check(err)
		}
	} else {
		msg := fmt.Sprintf("Doing nothing, %s is not a symlink", dest)
		log.Println(msg)
	}
}
