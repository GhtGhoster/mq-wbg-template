#!/bin/bash
echo `# <#`

# Bash goes here (tested on Ubuntu)

gnome-terminal -- basic-http-server .
xdg-open http://localhost:4000

exit
#> > $null

# PowerShell goes here

Start-Process basic-http-server .
Start-Process http://localhost:4000
