.. _https:

*******************************************
Appendix. Enable Data Encryption
*******************************************

To ensure data security, it is recommended to enable SSL encryption. Do the following:

#. Under the nginx configuration directory, create a directory that will be used to hold all of the SSL data:

   .. code::

      sudo mkdir /etc/nginx/ssl

#. Create the SSL key and certificate files:

   .. code::

      sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt

   You will be asked a few questions about your server in order to embed the information correctly in the certificate. Fill out the prompts appropriately. The most important line is the one that requests the ``Common Name``. You need to enter the domain name or public IP address that you want to be associated with your server. Both of the files you created (``nginx.key`` and ``nginx.crt``) will be placed in the ``/etc/nginx/ssl`` directory.

#. Configure nginx to use SSL. Open the nginx configuration file. Add the ``listen 443 ssl`` line into it, as well as the certificate ``ssl_certificate`` and key ``ssl_certificate_key`` data (marked with ## in the example below). 

   .. code::

      sudo vi /etc/nginx/nginx.conf

      server {
              listen 80 default_server;
              listen [::]:80 default_server ipv6only=on;
              
              ##
              listen 443 ssl;

              root /usr/share/nginx/html;
              index index.html index.htm;

              server_name your_domain.com;
              ##
              ssl_certificate /etc/nginx/ssl/nginx.crt;
              ##
              ssl_certificate_key /etc/nginx/ssl/nginx.key;

              location / {
                      try_files $uri $uri/ =404;
              }
      }

#. Restart nginx.

   .. code::

      sudo service nginx restart

#. Edit the ``ffsecurity`` configuration file. In the ``EXTERNAL_ADDRESS`` parameter, substitute the ``http://`` prefix with ``https://``.

   .. code::

      sudo vi /etc/ffsecurity/config.py
 
      EXTERNAL_ADDRESS="https://192.168.104.204"



