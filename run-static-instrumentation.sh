#!/bin/sh
./build.sh
./instrument.sh

# run:
export CLASSPATH=classes
for file in `ls lib` ; do export  CLASSPATH=$CLASSPATH:lib/$file; done

java -cp $CLASSPATH -DoutputDirectory=$OUTDIR activejdbc.examples.simple.SimpleExample

