#!/bin/sh
# quick and dirty script to install the blender nif scripts

for BLENDERVERSION in 2.62 2.61 2.60 2.59 2.58 2.57 2.56 2.55 2.54 2.53 2.52 2.51 2.50
do
  BLENDERADDONS=~/.blender/$BLENDERVERSION/scripts/addons
  if [ -e ~/.blender/$BLENDERVERSION/ ]
  then
    break
  fi
done
if [ ! -e ~/.blender/$BLENDERVERSION/ ]
then
  echo Blender addons folder not found.
  echo Start blender at least once, save user preferences, and try again.
  exit 1
fi

echo Installing in
echo $BLENDERADDONS/io_scene_nif
# remove old files
rm -rf $BLENDERADDONS/io_scene_nif/
# copy files from repository to blender addons folder
mkdir -p $BLENDERADDONS/io_scene_nif/
for FILE in __init__.py import_export_nif.py export_nif.py import_nif.py ui.py properties.py operators.py nifdebug.py 
do
  cp scripts/addons/io_scene_nif/$FILE $BLENDERADDONS/io_scene_nif/
done

