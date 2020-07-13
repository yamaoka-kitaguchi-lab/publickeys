#!/bin/bash
cd $HOME

REPO="https://github.com/yamaoka-kitaguchi-lab/publickeys"
LOCALDIR="publickeys"

git clone $REPO $LOCALDIR
if (( $? > 0 )); then
    pushd $LOCALDIR
    git pull
    popd
fi

rsync $LOCALDIR/authorized_keys .ssh/authorized_keys
chown -R $USER .ssh
chmod -R 700 .ssh

