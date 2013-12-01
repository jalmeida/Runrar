#!/bin/bash
#############################################################
#
#
####################################################
#                                                 #
#           USING AT OWN RISK                    #
#                                               #
################################################
#
### CONFIGURATION ###
#
# sitename
siteshort="MU"
#
# INcomplete string for ISO (rar)
rarstring="_INCOMPLETE_"
#
# filename where releaseinfos are stored (e.g. .message)
infofile=".message"
#
#
#
######### DONT TOUCH ANYTHING BELOW UNLESS YOU KNOW WHAT YOU ARE DOING ##########
#
#
#
# Starting now
#
# get local dir

## localdir=`pwd`

# get the sfv file name with the rar files
sfvfile=`ls | grep -i "\.sfv$"`

echo "[-- - RUNRAR v0.1 - --]"

	echo "Start extracting files ..."

	#check if the release is complete
	if [ -d $rarstring ]; then
		echo "Sorry the Release is not Complete ... "
		echo "Please Complete it and run it again."
		exit
	fi

	echo "    Buscando el archivo rar"
	#find the first rar file
	if `ls *.part01.rar> /dev/null 2>&1`; then
        	rarfile=`ls *.part01.rar`
	else
                if `ls *.part1.rar> /dev/null 2>&1`; then
        	        rarfile=`ls *.part1.rar`
	        else
                        if `ls *.rar> /dev/null 2>&1`; then
        	                rarfile=`ls *.rar`
	                else
        	                if `ls *.r00 > /dev/null 2>&1`; then
                	                rarfile=`ls *.r00`
	                        else
        	                        if `ls *.r01 > /dev/null 2>&1`; then
                	                        rarfile=`ls *.r01`
	                                else
        	                                if `ls *.001 > /dev/null 2>&1`; then
                	                                rarfile=`ls *.001`
                        	                else
					                echo "Sorry we found no rar file."
					                exit
                                                fi
                                        fi
				fi
                	fi
        	fi
	fi
	echo "    Archivo rar encontrado: $rarfile"
	#extract the rar's
#	/usr/bin/unrar x $rarfile > /dev/null
        /usr/bin/unrar x $rarfile | grep %
	if [ ! $? -eq 0 ] ; then
		echo "Problems during unrar the files ..."
		exit
	fi

	# delete the rar files and the old sfv file
	for x in `grep -v ";" $sfvfile | grep -v "#" | sed 's/ .*//'` ; do
		rm $x
		echo "Deleting $x"
	done
	rm $sfvfile > /dev/null 2>&1
	rm $infofile > /dev/null 2>&1
	rm -rf Sample > /dev/null 2>&1
	rm *.missing > /dev/null 2>&1
	rm -rf *INCOMPLE* > /dev/null 2>&1
#	rm $localdir/*[$siteshort]*[$siteshort]* > /dev/null 2>&1




