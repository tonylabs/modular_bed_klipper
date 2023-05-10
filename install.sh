#!/bin/bash

KDIR="${HOME}/klipper"
KENV="${HOME}/klippy-env"

BKDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

if [ ! -d "$KDIR" ] || [ ! -d "$KENV" ]; then
    echo "modular_bed: klipper or klippy env doesn't exist"
    exit 1
fi

# install modular bed requirements to env
echo "modular_bed: installing python requirements to env, this may take 10+ minutes."
"${KENV}/bin/pip" install -r "${BKDIR}/requirements.txt"

# update link to modular_bed.py
echo "modular_bed: linking klippy to modular_bed.py."
if [ -e "${KDIR}/klippy/extras/modular_bed.py" ]; then
    rm "${KDIR}/klippy/extras/modular_bed.py"
fi
ln -s "${BKDIR}/modular_bed.py" "${KDIR}/klippy/extras/modular_bed.py"

# exclude modular_bed.py from klipper git tracking
if ! grep -q "klippy/extras/modular_bed.py" "${KDIR}/.git/info/exclude"; then
    echo "klippy/extras/modular_bed.py" >> "${KDIR}/.git/info/exclude"
fi
echo "modular_bed: installation successful."
