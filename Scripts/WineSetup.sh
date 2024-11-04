#!/bin/bash
pwd

ls

echo "Initializing Wine prefix"
wineboot -i

pwd

ls

echo "Updating Windows registry with Risk paths"
wine regedit /Registry/Risk.reg

echo "Updating Windows registry with Wine graphics keys"
wine regedit /Registry/WineGraphics.reg

pwd

ls

echo "Waiting for registry updates to be applied"
sleep 3
