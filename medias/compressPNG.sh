#!/bin/bash

SPATH=./
maxsize=921600 #900KB
AFTERFIX=""

COMPRESS () {
        imgpath=$1
        filesize=`ls -l $imgpath | awk '{ print $5 }'`
        echo $filesize
        if [ $filesize -ge $maxsize ]
            then
              echo compressing $file
              afterfix=${filename##*.}
              name=${filename%.*}
              convert -quality 80% $imgpath $imgpath
              # convert -quality 80% $imgpath "${name}s.${afterfix}"
              echo compressed $imgpath
            else
              echo skiped $imgpath
        fi
      }


echo "begin"
filelist=`find $1 -regex ".*/.*.jpg" -o -regex ".*/.*.png"`
for file in $filelist
 do
  if [ -f $file ]
   then
    COMPRESS $file
  fi
done
echo "finished"
