.. _installer:

Deploy from Console Installer
================================================

To deploy FindFace Security standalone, you can use a developer-friendly console installer.


.. warning::
   The installer cannot be used to update FindFace Security.

.. warning::
   The FindFace Security host must have a static IP address in order to be running successfully. To make the IP address static, open the ``etc/network/interfaces`` file and modify the current primary network interface entry as shown in the case study below. Be sure to substitute the suggested addresses with the actual ones, subject to your network specification.

   .. code::

     sudo vi /etc/network/interfaces

     iface eth0 inet static
     address 192.168.112.144
     netmask 255.255.255.0
     gateway 192.168.112.254
     dns-nameservers 192.168.112.254

   Restart networking.

   .. code::

      sudo service networking restart

   Be sure to edit the ``etc/network/interfaces`` file with extreme care. Please refer to the Ubuntu guide on `networking <https://help.ubuntu.com/lts/serverguide/network-configuration.html#ip-addressing>`__ before proceeding.  

.. seealso::
   
   * :ref:`deploy`

To deploy from an installer, do the following:

#. Download the installer file ``<findface-security-xxx>.run``.
#. Put the ``.run`` file into some directory on the designated host (for example, ``/home/username``).
#. From this directory, make the ``.run`` file executable.

   .. code::

       chmod +x <findface-security-xxx>.run

#. Execute the ``.run`` file.

   .. code::

       sudo ./<findface-security-xxx>.run

   The installer will perform several automated checks to ensure that the host meets the system requirements. After that, the FindFace Security components will be automatically installed, configured and/or started in the following configuration:


   +-----------------------------+----------------------------------------------------------------------------+
   | Component                   | Details                                                                    |
   +=============================+============================================================================+
   | findface-postgres-facen     | Installed and started.                                                     |
   +-----------------------------+----------------------------------------------------------------------------+
   | ffsecurity                  | Installed and started.                                                     |
   +-----------------------------+----------------------------------------------------------------------------+
   | ffsecurity-ui               | Installed and started.                                                     |
   +-----------------------------+----------------------------------------------------------------------------+
   | fkvideo_detector 	         | Installed and started.                                                     |
   +-----------------------------+----------------------------------------------------------------------------+
   | findface-extraction-api     | Installed and started.                                                     |
   +-----------------------------+----------------------------------------------------------------------------+
   | NTLS 	                 | Installed and started.                                                     |
   +-----------------------------+----------------------------------------------------------------------------+  
   | nginx                       | Installed and started.                                                     |
   +-----------------------------+----------------------------------------------------------------------------+
   | PostgreSQL database         | Installed and started in a standard configuration.                         |
   +-----------------------------+----------------------------------------------------------------------------+
   | Redis                       | Installed and started.                                                     |
   +-----------------------------+----------------------------------------------------------------------------+
   | jq 	                 | Installed. Used to pretty-print API responses from FindFace Security.      |
   +-----------------------------+----------------------------------------------------------------------------+
 
#. Once the installation is complete, the following output will be shown on the console:

   .. tip::
      Be sure to save this data: you will need it later.     

   .. code::

      ###############################################
      #          Installation is complete           #
      ###############################################
      - upload your license to http://172.17.47.21:3185/
        login:          admin
        password:       0MBNics
      - user interface: http://172.17.47.21/
        superuser:      admin
        password:       admin
        documentation:  http://172.17.47.21/doc/

#. Upload the FindFace Security license file via the NTLS web interface ``http://<Host_IP_address>:3185/#/``. To access the NTLS web interface, use the credentials provided in the console.

   .. note::
      The host IP address is shown in the links to FindFace web services in the following way: either as an external IP address if the host belongs to a network, or ``127.0.0.1`` otherwise.

.. important::
   Do not disclose the ``superuser`` (Super Administrator) credentials to others. To administer the system, create a new user with the administrator privileges. Whatever the role, Super Administrator cannot be deprived of its rights.       



