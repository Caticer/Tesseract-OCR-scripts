import os
from PyPDF2 import PdfFileMerger
import re

def atoi(text):
    return int(text) if text.isdigit() else text

def natural_keys(text):
    return [ atoi(c) for c in re.split('(\d+)',text) ]

for i in os.listdir('./input'):
    os.system(f'tesseract ./input/"{i}" ./tmp/"{i}" --oem 1 -l tur pdf')
	
pdfs = os.listdir('./tmp')
pdfs.sort(key=natural_keys)

merger = PdfFileMerger()

for pdf in pdfs:
    merger.append(f'./tmp/{pdf}')

merger.write("./out/out.pdf")
merger.close()
