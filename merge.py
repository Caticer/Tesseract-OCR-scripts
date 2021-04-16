import os
from PyPDF2 import PdfFileMerger
import re

def atoi(text):
    return int(text) if text.isdigit() else text

def natural_keys(text):
    return [ atoi(c) for c in re.split('(\d+)',text) ]
	
pdfs = os.listdir('./input')
pdfs.sort(key=natural_keys)

merger = PdfFileMerger()

for pdf in pdfs:
    merger.append(f'./input/{pdf}')

merger.write("./out/merged.pdf")
merger.close()
