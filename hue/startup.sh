#!/bin/sh

apt-get update -y

apt install -y mysql-client
./build/env/bin/pip install --upgrade SQLAlchemy

maxcounter=45
 
counter=1
while ! mysql -h "database" -u "user" -p"secret" -e "show databases;" > /dev/null 2>&1; 
do
	echo "waiting database..."
    sleep 10
    counter=`expr $counter + 1`
    if [ $counter -gt $maxcounter ]; then
        >&2 echo "We have been waiting for MySQL too long already; failing."
        exit 1
    fi;
done

./build/env/bin/hue syncdb --noinput
./build/env/bin/hue migrate
./build/env/bin/supervisor