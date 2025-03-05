#!/usr/bin/bash
source /root/.local/bin/env
source /opt/venv/bin/activate
for file in /opt/installer/*.sh
do
    if test -f $file
    then
        /usr/bin/bash $file
	rm -rf $file
    fi
done

/usr/sbin/sshd
/usr/sbin/nginx

nohup filebrowser -d /opt/filebrowser/filebrowser.db -a 127.0.0.1 -p 81 -b /filebrowser -r / --noauth > /dev/null &

if [ ! -e "/opt/ttyd" ]; then
        mkdir /opt/ttyd
fi


if [ ! -e "/opt/ttyd/.bash_source" ]; then
	echo "source /root/.local/bin/env" >> /opt/ttyd/.bash_source
        echo "source /opt/venv/bin/activate" >> /opt/ttyd/.bash_source
fi

nohup ttyd --port 82 --base-path /ttyd /usr/bin/bash --init-file /opt/ttyd/.bash_source > /dev/null &

cd /opt/ComfyUI
echo "use $*"
nohup python main.py $*
