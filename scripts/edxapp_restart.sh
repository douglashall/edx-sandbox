#!/bin/bash

set -e

sudo /edx/bin/supervisorctl restart edxapp:*
