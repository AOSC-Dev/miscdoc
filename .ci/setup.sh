#!/bin/bash


GDIR="$PWD"

echo "This is a message from 'setup.sh'."




##################################################################
### Retrieve building dependencies
curl https://repo.aosc.io/misc/cidep/miscdoc/miscdoc.cidep.tar -o miscdoc.cidep.tar
tar -pxvf miscdoc.cidep.tar

cd .cidep

### Step: Install fonts
mkdir -p /usr/share/fonts/githubci
mv Inter /usr/share/fonts/githubci/
mv JetBrains_Mono /usr/share/fonts/githubci/

cd "$GDIR"
##################################################################

apt update
yes | apt install jq uuid-runtime pandoc fonts-noto-cjk

exit 0


### Opportunistically change mirror
if [[ "$PWD" == *"/EWS/"* ]]; then
    ### If we can find "/EWS/" in our $PWD,
    ### the task must be running in a local debugging environment,
    ### and not a GitHub Actions worker.
    ### This assumption should be correct, hopefully!
    echo "[INFO] Working in a debugging environment and not on GitHub."
    sed -i 's|archive.ubuntu.com|distromirror.ndlt7.lan.neruthes.xyz|' /etc/apt/sources.list
fi
sed -i 's|focal|impish|' /etc/apt/sources.list


yes | apt install \
    uuid-runtime \
    pandoc \
    fontconfig \
    fonts-noto-cjk \
    fonts-noto-cjk-extra \
    texlive-full \
    texlive-fonts-extra \
    texlive-fonts-recommended
