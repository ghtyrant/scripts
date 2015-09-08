#!/bin/sh

nvidia-settings -q gpucoretemp |grep '):' | cut -d ' ' -f 6,6 | sed -e 's/.\{1\}$//'
