#!/usr/bin/env bash

set -e

# Acquire lock using script itself as lockfile.
# Exit if script in use.
exec 200<$0
flock -n 200 || { echo "Another upgrade is already in progress. Double-check HipChat."; exit 1; }

npm install
pip install -Ur /edx/app/edxapp/edx-platform/requirements/edx/pre.txt
pip install -Ur /edx/app/edxapp/edx-platform/requirements/edx/base.txt
pip install -Ur /edx/app/edxapp/edx-platform/requirements/edx/github.txt
pip install -Ur /edx/app/edxapp/edx-platform/requirements/edx/edx-private.txt
pip install -Ur /edx/app/edxapp/edx-platform/requirements/edx/local.txt
pip install -Ur /edx/app/edxapp/edx-platform/requirements/edx/post.txt

python manage.py cms migrate --settings=aws
python manage.py lms migrate --settings=aws

paver update_assets --theme-dirs /edx/var/edx-themes/edx-themes/edx-platform /edx/var/edx-themes/olive-themes/edx-platform --themes juilliardopenclassroom.com israelxedu.gov.il globalacademy.hms.harvard.edu harvardxplus.harvard.edu mitprofessionalx.mit.edu professionaleducation.wharton.upenn.edu --settings=aws
