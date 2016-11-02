#!/bin/bash
apt-get -y update

# Set up silent MySQL install
dbpass=$1
echo mysql-server mysql-server/root_password password $dbpass | debconf-set-selections
echo mysql-server mysql-server/root_password_again password $dbpass | debconf-set-selections

# Install LAMP stack
apt-get -y install apache2 mysql-server php5 php5-mysql

# Write PHP
cat <<EOF >/var/www/html/index.php
<html>
<head>
    <title>Azure Resource Automation Demo</title>
</head>
<body>
<h1>Azure Resource Management Template Demonstration</h1>
<p>
Hostname: <?php echo gethostname() ?>
</p>
</body>
</html>
EOF

service apache2 restart
