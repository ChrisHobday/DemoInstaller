#!/bin/bash
cdISOMountLocation=$(findmnt -n -l -t iso9660 --output=target)

echo ${cdISOMountLocation}