#!/usr/bin/bash
if [ -e "/install.sh" ] ; then 
	/install.sh
	rm -rf /install.sh
fi

/usr/sbin/sshd
/usr/sbin/nginx

nohup filebrowser -d /opt/filebrowser/filebrowser.db -a 127.0.0.1 -p 81 -b /filebrowser -r /opt/ComfyUI/ --noauth > /dev/null &
nohup ttyd --port 82 --base-path /ttyd /usr/bin/bash > /dev/null &

cd /opt/ComfyUI
python3.11 main.py $*
