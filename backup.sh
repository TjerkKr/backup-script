#!/bin/bash
DATE=$(date +%Y-%m-%d-%H%M%S)

# pfad sollte nicht mit "/" enden!
# Dies ist nur ein Beispiel - bitte an eigene Bedürfnisse anpassen.
# Man muß schreibberechtigt im entsprechenden Verzeichnis sein.
BACKUP_DIR="/local-backup"

BACKUPNAME=""

cat /var/log/syslog > $BACKUP_DIR/syslog

# Hier Verzeichnisse auflisten, die gesichert werden sollen.
# Dies ist nur ein Beispiel - bitte an eigene Bedürfnisse anpassen.
# Bei Verzeichnissen, für die der User keine durchgehenden Leserechte
# hat (z.B. /etc) sind Fehler vorprogrammiert.
# Pfade sollte nicht mit "/" enden!
SOURCE="/root /etc /home /boot /var /opt"

tar cjpf $BACKUP_DIR/$BACKUPNAME-backup-$DATE.tar.bz2 $SOURCE
scp -C2 -P 22 -i ~/.ssh/id_rsa.pub $BACKUP_DIR/*
Benutzer@hostname:/backup/

rm $BACKUP_DIR/syslog
