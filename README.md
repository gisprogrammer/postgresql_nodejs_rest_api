# postgresql_nodejs_rest_api
Simple nodejs rest api for postgresql db with Oracle PL/SQL usage

add postgres_api.service file to /usr/lib/systemd/system/ 

sudo systemctl reboot

open port 3000
firewall-cmd --zone=public --add-port=3000/tcp
