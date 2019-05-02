#!/bin/bash
RSNAPSHOT=/usr/bin/rsnapshot

DEVICE=/dev/sda1
MOUNTPNT=/mnt/backup-drive

#---------------
mounted=0

#mount
mount | grep "on ${MOUNTPNT} type" > /dev/null
if [ ! $? -eq 0 ] ; then
        echo mount $DEVICE $MOUNTPNT
        mount $DEVICE $MOUNTPNT
        if [ $? -eq 0 ] ; then
                mounted=1
        fi
fi

#do snapshot with $1 as interval
echo $RSNAPSHOT $1
$RSNAPSHOT $1

#umount
if [ $mounted -eq 1 ] ; then
        echo umount $DEVICE
        umount $DEVICE
fi
