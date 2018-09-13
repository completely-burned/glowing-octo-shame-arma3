#!/bin/bash

DIR=$(dirname "${BASH_SOURCE[0]}")/..

cd ${DIR}

rm -rf ${DIR}/tmp/*

if [ ! -d ${DIR}/tmp ]; then
	mkdir ${DIR}/tmp
fi

if [ ! -d ${DIR}/out ]; then
        mkdir ${DIR}/out
fi

V=$(grep briefingName ${DIR}/glowing-octo-shame.Altis/mission.sqm | sed -e 's/.*glowing-octo-shame v\(.*\) .*/\1/' -e 's/\./\-/gi')


# Altis
ln -s ./../glowing-octo-shame.Altis ${DIR}/tmp/glowing-octo-shame.Altis

makepbo -NM ${DIR}/tmp/glowing-octo-shame.Altis ${DIR}/out/glowing-octo-shame-${V}.Altis.pbo


# Tanoa
ln -s ./../glowing-octo-shame.Tanoa ${DIR}/tmp/glowing-octo-shame.Tanoa

makepbo -NM ${DIR}/tmp/glowing-octo-shame.Tanoa ${DIR}/out/glowing-octo-shame-${V}.Tanoa.pbo


# Altis RHS
ln -s ./../glowing-octo-shame-rhs.Altis ${DIR}/tmp/glowing-octo-shame-rhs.Altis

makepbo -NM ${DIR}/tmp/glowing-octo-shame-rhs.Altis ${DIR}/out/glowing-octo-shame-rhs-${V}.Altis.pbo

