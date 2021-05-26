#!/bin/bash

if ! tesseract -v tesseract &> /dev/null
then
    echo -e "\e[41mTesseract-ocr could not be found\e[0m"
    echo -e "Follow this guide to install:"
    echo -e "\e[34mhttps://tesseract-ocr.github.io/tessdoc\e[0m"
    exit
fi

echo -e "\e[41mCleaning old files\e[0m"
test -f tmp/* || rm -rf tmp/*
test -f out/* || rm -rf out/*

if [ ! -d "input" ]
then
    echo -e "\e[41mInput directory DOES NOT exists.\e[0m"
    echo -e "Creating.."
    mkdir input
fi

if [ ! -d "tmp" ]
then
    echo -e "\e[41mTemp directory DOES NOT exists.\e[0m"
    echo -e "Creating.."
    mkdir tmp
fi

if [ ! -d "out" ]
then
    echo -e "\e[41mOut directory DOES NOT exists.\e[0m"
    echo -e "Creating.."
    mkdir out
fi

clear

test -f input/* || echo -e "\e[41minput directory empty.\e[0m"

python3 ocr.py
