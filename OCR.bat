@echo off
title Tesseract OCR
@shift /0
mode con cols=75 lines=25


if exist ".\out\out.pdf" del /s /f /q ".\out\out.pdf"
if exist ".\tmp\*.pdf" del /s /f /q ".\tmp\*.pdf"

cls

if not exist tmp mkdir tmp
if not exist out mkdir out
if not exist input mkdir input

python.exe ocr.py
if exist ".\input\*" del /s /f /q ".\input\*"
pause
