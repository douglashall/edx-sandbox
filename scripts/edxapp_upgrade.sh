#!/bin/bash

set -e

npm install
pip install -r /edx/app/edxapp/edx-platform/requirements/edx/pre.txt
pip install -r /edx/app/edxapp/edx-platform/requirements/edx/base.txt
pip install -r /edx/app/edxapp/edx-platform/requirements/edx/github.txt
pip install -r /edx/app/edxapp/edx-platform/requirements/edx/edx-private.txt
pip install -r /edx/app/edxapp/edx-platform/requirements/edx/local.txt
pip install -r /edx/app/edxapp/edx-platform/requirements/edx/post.txt

python manage.py cms migrate --settings=aws
python manage.py lms migrate --settings=aws

paver update_assets --theme-dirs /edx/var/edx-themes/edx-themes/edx-platform /edx/var/edx-themes/olive-themes/edx-platform --themes juilliardopenclassroom.com israelxedu.gov.il globalacademy.hms.harvard.edu harvardxplus.harvard.edu mitprofessionalx.mit.edu professionaleducation.wharton.upenn.edu --settings=aws
