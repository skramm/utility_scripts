#!/usr/bin/python3
# tested with Python 3.8.10
# home: https://github.com/skramm/utility_scripts

# !!! WORK IN PROGRESS !!!


import glob
import sys
import os
import re # Regular Expressions
from pathlib import Path
import numpy

# source folder in given folder
source='src'

if len(sys.argv) == 1:
	print( "missing folder" )
	sys.exit(1)

folder=sys.argv[1]
if os.path.isdir(folder) == False :
	print( 'folder"',folder, '"does not exist' )
	sys.exit(2)

def search_str(file_path, word):
	with open(file_path, 'r') as file:
		content = file.read()
		if word in content:
			return True
		else:
			return False

full = folder + '/' + source
	
paths_png  = glob.glob( full + '/**/*.png',  recursive=True )
paths_jpg  = glob.glob( full + '/**/*.jpg',  recursive=True )
paths_jpg += glob.glob( full + '/**/*.jpeg', recursive=True )
imgfiles = paths_jpg + paths_png

texfiles = glob.glob(full+'/**/*.tex*', recursive=True )

rows, cols = (len(texfiles), len(imgfiles))
tex_img = numpy.zeros((rows, cols), dtype=numpy.int16)

arr_unused=[]
NbUnused=0
cimg=0
for imgfile in imgfiles:
	img=Path(imgfile).stem
#	print( '\n* processing', img )
	found=False
	ctex=0
	for texfile in texfiles:
		if search_str(texfile, img ) == True:
			found=True
			tex_img[ctex][cimg]+=1
		ctex+=1 

	if found == False:
		img2=re.sub( full+'/', '', imgfile )
		arr_unused.append(img2)
		NbUnused+=1      
	cimg+=1
	
print('RESULTS')
print( ' -latex files:', len(texfiles) )
print( ' -image files:', len(imgfiles) )
print( '   -png:', len(paths_png) )
print( '   -jpeg:', len(paths_jpg))
print( ' -unused images:', NbUnused )
for i in arr_unused:
	print( ' -',i )

#print( tex_img )

ctex=0
for texfile in texfiles:
	print( "file: '"+ texfile+ "' uses", sum(tex_img[ctex]), "images" )
	cimg=0
	for i in tex_img[ctex]:
		if i != 0:
#			print( ' -', Path(imgfiles[cimg]).stem )
			img2=re.sub( full+'/', '', imgfiles[cimg] )
			print( ' -',  img2 )
		cimg+=1
	ctex+=1
	
	
	

