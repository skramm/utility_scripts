#!/usr/bin/python3
# tested with Python 3.8.10
# home: https://github.com/skramm/utility_scripts

import glob
import sys
import os
import re # Regular Expressions
from pathlib import Path

if len(sys.argv) == 1:
	print( "missing folder" )
	sys.exit(1)

folder=sys.argv[1]
if os.path.isdir(folder) == False :
	print( 'folder"',folder, '"does not exist' )
	sys.exit(2)

def search_str(file_path, word):
	with open(file_path, 'r') as file:
# read all content of a file
		content = file.read()
# check if string present in a file
		if word in content:
			return True
		else:
			return False


full=folder+'/src'
print('full=',full)
	
#print( "args="+sys.argv[1] )
paths_png = glob.glob(full+'/**/*.png', recursive=True )
#print( paths)
paths_jpg = glob.glob('CM/src/**/*.jpg', recursive=True )
paths_jpg += glob.glob('CM/src/**/*.jpeg', recursive=True )
imgfiles = paths_jpg + paths_png
print( 'png: total=', len(paths_png))
print( 'jpg: total=', len(paths_jpg))

paths_tex = glob.glob(full+'/**/*.tex*', recursive=True )
print ('paths_tex=',paths_tex)

NbUnused=0
for imgfile in imgfiles:
	print( 'processing', imgfile )
	img=Path(imgfile).stem
	found=False
	for texfile in paths_tex:
		if search_str(texfile, img ) == True:
			found=True
	if found == True:
		print( 'found!' )
	else:
		NbUnused+=1         

print('RESULTS')
print('total:\n-', len(imgfiles),'image files')
print( len(paths_tex),'latex files')
print( 'unused images:', NbUnused )

