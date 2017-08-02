#!/bin/bash

# Set initial configuration
if [ ! -f /.pika_configured ]; then
    PASS=`printenv PIKA_PASS`
    echo ${PASS}
    sed -e "s@requirepass.*@requirepass : ${PASS}@" -i /etc/pika.conf
    cat /etc/pika.conf | grep -e "requirepass"

    touch /.pika_configured
fi

exec /usr/local/bin/pika -c /etc/pika.conf