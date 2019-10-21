package main

import (
	"io/ioutil"

	"github.com/gocarina/gocsv"
)

func ReadFromCsvFile(fileName string, out interface{}) {
	var text string
	ReadFromTextFile(fileName, &text)

	err := gocsv.UnmarshalString(text, out)
	if err != nil {
		panic(err)
	}
}

func WriteToCsvFile(fileName string, in interface{}) {
	data, err := gocsv.MarshalString(in)
	if err != nil {
		panic(err)
	}

	WriteToTextFile(fileName, data)
}

func ReadFromTextFile(fileName string, out interface{}) {
	bytes, err := ioutil.ReadFile(fileName)
	if err != nil {
		panic(err)
	}
	*out.(*string) = string(bytes[:])
}

func WriteToTextFile(fileName string, in interface{}) {
	err := ioutil.WriteFile(fileName, []byte(in.(string)), 0644)
	if err != nil {
		panic(err)
	}
}
