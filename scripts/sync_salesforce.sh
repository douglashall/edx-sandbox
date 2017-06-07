#!/bin/bash

source /home/douglashall/venvs/edx-salesforce/bin/activate
cd /home/douglashall/src/edx-salesforce
python manage.py sync_salesforce -s juilliard.sandbox.edx.org -o JuilliardOpenClassroom --settings=settings.local >> /home/douglashall/logs/sync_salesforce.log 2>&1
echo "Salesforce Synchronization Successful: $(date)" >> /home/douglashall/logs/sync_salesforce.log
