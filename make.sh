#!/bin/sh

set -xe
ls *.typ *.yml | entr -s "typst compile resume.typ out/resume.pdf"