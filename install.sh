#!/bin/bash
cd `dirname $0`
TARGET_FILE="AtomicParsleyLinux.zip"
URL=`curl -s https://github.com/wez/atomicparsley/releases | grep href | grep "releases\/download\/" | grep "${TARGET_FILE}" | head -n 1 | cut -d '"' -f 2 | sed -e "s/^/https\:\/\/github\.com/g"`
TARGET_URL=`curl -I -Ls -o /dev/null -w %{url_effective} ${URL}`
curl ${TARGET_URL} -o ${TARGET_FILE} || exit 1
unzip AtomicParsleyLinux.zip
chmod +x AtomicParsley
mv AtomicParsley /usr/local/bin/

ln -s `pwd`/dl_freyr /usr/local/bin/

