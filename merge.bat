@echo off
title Merge PDF files
@shift /0
mode con cols=70 lines=20


if exist ".\out\out.pdf" del /s /f /q ".\out\out.pdf"
if exist ".\tmp\*.pdf" del /s /f /q ".\tmp\*.pdf"
if exist ".\input\*" del /s /f /q ".\input\*"
if not exist tmp mkdir tmp
if not exist out mkdir out
if not exist input mkdir input

python.exe merge.py
pause
