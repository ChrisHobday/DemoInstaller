#!/bin/bash
echo "Creating symlink from $1 to /var/data/WinePrefix/dosdevices/d:"
ln -s $1 /var/data/WinePrefix/dosdevices/d:

echo "Making /var/data/WinePrefix/drive_c/Games"
mkdir /var/data/WinePrefix/drive_c/Games

echo "Copying /var/data/WinePrefix/dosdevices/d: to /var/data/WinePrefix/drive_c/Games/Risk (to act as Risk installation dir and CDPATH)"
cp -r --no-preserve=mode /var/data/WinePrefix/dosdevices/d:/ /var/data/WinePrefix/drive_c/Games/Risk

echo "Removing symlink from $riskMountLocation to /var/data/WinePrefix/dosdevices/d:"
rm /var/data/WinePrefix/dosdevices/d:

echo "Moving /var/data/WinePrefix/drive_c/Games/Risk/ENGLISH/RISK.EXE to /var/data/WinePrefix/drive_c/Games/Risk/risk.exe"
mv /var/data/WinePrefix/drive_c/Games/Risk/ENGLISH/RISK.EXE /var/data/WinePrefix/drive_c/Games/Risk/risk.exe
