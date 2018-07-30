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

V="0"


# Altis
ln -s ./../glowing-octo-shame.Altis ${DIR}/tmp/glowing-octo-shame.Altis

makepbo -M ${DIR}/tmp/glowing-octo-shame.Altis ${DIR}/out/glowing-octo-shame-${V}.Altis.pbo


# Tanoa
if [ ! -d ${DIR}/tmp/glowing-octo-shame.Tanoa ]; then
        mkdir ${DIR}/tmp/glowing-octo-shame.Tanoa
fi

cd ${DIR}/glowing-octo-shame.Altis

for FILE in $(find ./ -maxdepth 1 ! -path "./mission.sqm" ! -path "./"); do
	ln -s ${DIR}/glowing-octo-shame.Altis/${FILE} ${DIR}/tmp/glowing-octo-shame.Tanoa/${FILE}
done

ln -s ${DIR}/glowing-octo-shame.Tanoa/mission.sqm ${DIR}/tmp/glowing-octo-shame.Tanoa/mission.sqm

makepbo -M ${DIR}/tmp/glowing-octo-shame.Tanoa ${DIR}/out/glowing-octo-shame-${V}.Tanoa.pbo


# Altis RHS
if [ ! -d ${DIR}/tmp/glowing-octo-shame-rhs.Altis ]; then
        mkdir ${DIR}/tmp/glowing-octo-shame-rhs.Altis
fi

cd ${DIR}/glowing-octo-shame.Altis

for FILE in $(find ./ -maxdepth 1 ! -path "./mission.sqm" ! -path "./"); do
        ln -s ${DIR}/glowing-octo-shame.Altis/${FILE} ${DIR}/tmp/glowing-octo-shame-rhs.Altis/${FILE}
done

ln -s ${DIR}/glowing-octo-shame-rhs.Altis/mission.sqm ${DIR}/tmp/glowing-octo-shame-rhs.Altis/mission.sqm

makepbo -M ${DIR}/tmp/glowing-octo-shame-rhs.Altis ${DIR}/out/glowing-octo-shame-rhs-${V}.Altis.pbo

