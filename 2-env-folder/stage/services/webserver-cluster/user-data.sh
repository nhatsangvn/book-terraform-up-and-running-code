#!/bin/bash
echo "<h1>Hello, World - $HOSTNAME</h1>" > index.html
cat >> index.html <<EOF
<p>DB address: ${db_address}</p>
<p>DB port: ${db_port}</p>
EOF

nohup busybox httpd -f -p ${server_port} &
