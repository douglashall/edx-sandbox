#!/usr/bin/env bash

set -e

sudo /edx/bin/supervisorctl restart credentials:*
