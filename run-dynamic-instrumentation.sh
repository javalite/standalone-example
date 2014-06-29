#!/bin/sh

./build.sh

# run:
export CLASSPATH=classes
for file in `ls lib` ; do export  CLASSPATH=$CLASSPATH:lib/$file; done

java -cp $CLASSPATH -DoutputDirectory=$OUTDIR -javaagent:build_time_libs/activejdbc-instrumentation-1.4.10-SNAPSHOT.jar   activejdbc.examples.simple.SimpleExample

