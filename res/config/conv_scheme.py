#!/usr/bin/env python  
#coding=utf-8

import os.path
import zipfile
import shutil

fzip_name = 'scheme.pak'
scheme_path = './'

def main():

    fzip = zipfile.ZipFile(fzip_name, 'w' ,zipfile.ZIP_DEFLATED)
   
    files = os.listdir(scheme_path)
    print(files)
    for f in files:
        print(f)
        if os.path.splitext(f)[1] == '.txt':
            fzip.write(f)
    fzip.close()

    shutil.copy(fzip_name, "../output/scheme")
if __name__ == '__main__':
    main()
