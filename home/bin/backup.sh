#!/bin/bash

################################################################
# Main

# if ! [ -e "$2" ]; then
#         echo "$2 not found" >&2
#         exit 1
# fi
# if ! [ -d "$2" ]; then
#         echo "$2 not a directory" >&2
#         exit 1
# fi

################################################################
# Variabeln
TIMESTAMP="`date +%Y-%m-%d_%H-%M-%S`"
# HOSTNAME="`uname -n`"

RSYNC="rsync"
RSYNC_PARAMETER="-avhzP --delete"

MODE="$1"
SRC="$2"
BACKUPDIR="$3"

# CONFIGFILE="`dirname $0`/backup.conf"
# LOGFILE=backup.log

################################################################
# Funktionen
usage ()
{
        echo "Usage: $0 ( daily | weekly | monthly | yearly ) [source-directory] [backup-directory] [rsync-args...]" >&2
}

################################################################
# Backup-Funktionen
daily ()
{
        rm -rf $BACKUPDIR/daily_7
        mv $BACKUPDIR/daily_6 $BACKUPDIR/daily_7
        mv $BACKUPDIR/daily_5 $BACKUPDIR/daily_6
        mv $BACKUPDIR/daily_4 $BACKUPDIR/daily_5
        mv $BACKUPDIR/daily_3 $BACKUPDIR/daily_4
        mv $BACKUPDIR/daily_2 $BACKUPDIR/daily_3
        mv $BACKUPDIR/daily_1 $BACKUPDIR/daily_2
        mkdir $BACKUPDIR/daily_1
        gcp -al $BACKUPDIR/current/* $BACKUPDIR/daily_1
}

weekly ()
{
        rm -rf $BACKUPDIR/weekly_4
        mv $BACKUPDIR/weekly_3 $BACKUPDIR/weekly_4
        mv $BACKUPDIR/weekly_2 $BACKUPDIR/weekly_3
        mv $BACKUPDIR/weekly_1 $BACKUPDIR/weekly_2
        mkdir $BACKUPDIR/weekly_1
        gcp -al $BACKUPDIR/current/* $BACKUPDIR/weekly_1
}

monthly ()
{
        rm -rf $BACKUPDIR/monthly_12
        mv $BACKUPDIR/monthly_11 $BACKUPDIR/monthly_12
        mv $BACKUPDIR/monthly_10 $BACKUPDIR/monthly_11
        mv $BACKUPDIR/monthly_9 $BACKUPDIR/monthly_10
        mv $BACKUPDIR/monthly_8 $BACKUPDIR/monthly_9
        mv $BACKUPDIR/monthly_7 $BACKUPDIR/monthly_8
        mv $BACKUPDIR/monthly_6 $BACKUPDIR/monthly_7
        mv $BACKUPDIR/monthly_5 $BACKUPDIR/monthly_6
        mv $BACKUPDIR/monthly_4 $BACKUPDIR/monthly_5
        mv $BACKUPDIR/monthly_3 $BACKUPDIR/monthly_4
        mv $BACKUPDIR/monthly_2 $BACKUPDIR/monthly_3
        mv $BACKUPDIR/monthly_1 $BACKUPDIR/monthly_2
        mkdir $BACKUPDIR/monthly_1
        gcp -al $BACKUPDIR/current/* $BACKUPDIR/monthly_1
}

yearly ()
{
        rm -rf $BACKUPDIR/yearly_5
        mv $BACKUPDIR/yearly_4 $BACKUPDIR/yearly_5
        mv $BACKUPDIR/yearly_3 $BACKUPDIR/yearly_4
        mv $BACKUPDIR/yearly_2 $BACKUPDIR/yearly_3
        mv $BACKUPDIR/yearly_1 $BACKUPDIR/yearly_2
        mkdir $BACKUPDIR/yearly_1
        cp -al $BACKUPDIR/current/* $BACKUPDIR/yearly_1
}

################################################################
# Main
if [ "$#" -lt 3 ]; then
        usage
        exit 1
fi

echo "$TIMESTAMP Backup $1 start" >&2
case $MODE in
  daily|weekly|monthly|yearly)
    $MODE >&2
    ;;
  *)
    usage
    exit 1
    ;;
esac

echo "Hardlinks were copied for $MODE backup. Now create backup ..."

# Dateien synchronisieren
mkdir -p $BACKUPDIR/current
shift 3
$RSYNC $RSYNC_PARAMETER $SRC $BACKUPDIR/current $@

echo "$TIMESTAMP Backup $MODE done" >&2

# EOF
