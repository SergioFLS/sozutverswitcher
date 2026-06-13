#!/bin/sh
#set -e
if [ -z $1 ]
then
	echo 'usage: versioncheck [data/game file]'
	exit 1
fi
INPUT=$1
HASH=$(sh ./rhash.com --md5 --one-hash $INPUT)
if [ -z $HASH ]
then
	echo 'file hashing failed'
	exit 1
fi
if ! grep $HASH allundertaleversions.txt
then
	echo $HASH Not a recognized version of Undertale.
	echo Please ensure you are using the data.win, game.win, game.ios, or game.unx file.
	exit 1
fi
