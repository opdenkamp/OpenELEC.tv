#!/bin/sh

################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2011 Stephan Raue (stephan@openelec.tv)
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################


RESOLUTION=`xrandr | grep Screen | cut -f2 -d"," | sed -e "s/ //g" -e "s/current//g"`
RESOLUTION_WIDTH=`echo $RESOLUTION | cut -f1 -d "x"`
RESOLUTION_HEIGHT=`echo $RESOLUTION | cut -f2 -d "x"`

SAUER_DATA=.
SAUER_OPTIONS="-q${HOME}/.config/.sauerbraten -r"

mkdir -p image
  mount -o loop,ro sauerbraten.img image

ln -sf image/* .
./bin/sauer_client ${SAUER_OPTIONS} "$@"

umount image
