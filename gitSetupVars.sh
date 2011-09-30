#!/bin/bash
echo "Remember to uncomment the proper autocrlf option in this script"
git config --global user.name "Enrique Ramirez"
git config --global user.email enriquein@gmail.com
git config --global color.ui auto
#on unix boxes
#git config --global core.autocrlf input
#on windows boxes
#git config --global core.autocrlf true
git config --global core.whitespace cr-at-eol
