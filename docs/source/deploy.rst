.. _deploy:


Deploy Step-By-Step
===============================================

This section will guide you through the FindFace Security step-by-step deployment process. Follow the instructions below minding the sequence.

.. include:: _inclusions/prepare_install.rst


.. rubric:: В этом разделе:

.. contents::
   :local:


Prerequisites
-------------------------------------------

FindFace Security requires PostgreSQL and Redis. Install them from the Ubuntu repository as such:

.. code::

   sudo apt-get update
   sudo apt install -y postgresql-server-dev-9.5 redis-server


Prepare Packages for Installation
-------------------------------------------

To prepare the FindFace Security deb-packages for installation, do the following:

#. Unpack the package with components.

   .. code::

      sudo dpkg -i <findface-security-repo>.deb

#. Add a signature key.

   .. code::

      sudo apt-key add /var/findface-security-repo/public.key
      sudo apt-get update

#. Unpack the packages with the neural network models. 

   .. code::
   
      sudo dpkg -i findface-data*.deb


Licensing
----------------------------------------------------

You receive a license file from your NTechLab manager along with the FindFace Security distributable packages. For on-premise licensing, you will be also provided with a Guardant USB dongle. 

To install and configure the local license server (NTLS), do the following:

#. Install the NTLS component:

   .. code::

      sudo apt-get update
      sudo apt-get install ntls

   .. tip::
       In the NTLS configuration file, you can change the license folder and the NTLS web interface remote access settings. To open the NTLS configuration file, execute::

         sudo vi /etc/ntls.cfg

       If necessary, change the license folder in the ``license-dir`` parameter. By default, license files are stored at ``/ntech/license``::

         license-dir = /ntech/license

       By default, you can access the NTLS web interface from any remote host (``ui = 0.0.0.0:3185``). To indicate that accessing the NTLS web interface must originate from a specific IP address, edit the ``ui`` parameter::

         ui = 127.0.0.1:3185

#. Enable the NTLS service autostart and launch the service:

   .. code::

      sudo systemctl enable ntls && sudo systemctl start ntls

#. Upload the license file via the NTLS web interface ``http://<NTLS_IP_address>:3185/#/``. 
#. For the on-premise licensing, insert a Guardant USB dongle into a USB port.


.. _basic-deployment:

Basic Configuration
------------------------------------------

The FindFace Security basic configuration includes a database, database extensions, the ``ffsecurity`` component and web interface. To install the basic configuration, do the following:

#. Install the ``findface-postgres-9.5-facen`` extension for :program:`PostgreSQL` from the :program:`<ffsecurity-repo>.deb` package:

   .. code::
  
      sudo apt install -y findface-postgres-9.5-facen

#. Using the :program:`PostgreSQL` console, create a new user ``ntech`` and a database ``ffsecurity``. Upload the ``findface-postgres-9.5-facen`` extension to the ``ffsecurity`` database by using the ``facen-compare-bytea`` label.

   .. code::

      sudo -u postgres psql

      postgres=# CREATE ROLE ntech WITH LOGIN;

      postgres=# CREATE DATABASE ffsecurity WITH OWNER ntech ENCODING 'UTF-8' LC_COLLATE='en_US.UTF-8' LC_CTYPE='en_US.UTF-8' TEMPLATE template0;

      postgres=# \c ffsecurity;

      ffsecurity=# CREATE EXTENSION "facen-compare-bytea";

   To quit from the :program:`PostgreSQL` console, type ``\q`` и press :kbd:`Enter`.   

#. Allow authentication in :program:`PostgreSQL` by UID of a socket client. Restart :program:`PostgreSQL`.

   .. code::

      echo 'local all ntech peer' | sudo tee -a /etc/postgresql/9.5/main/pg_hba.conf

      sudo systemctl restart postgresql@9.5-main.service

#. Install the ``ffsecurity`` component from the :program:`<ffsecurity-repo>.deb` package.

   .. note::
      NginX will be automatically installed from dependencies.

   .. code::

      sudo apt install -y ffsecurity

#. Install the ``ffsecurity-ui`` web interface from the :program:`<ffsecurity-repo>.deb` package.

   .. code::

      sudo apt install -y ffsecurity-ui

#. Open the ``/etc/ffsecurity/config.py`` configuration file. In the ``EXTERNAL_ADDRESS`` parameter, specify the host external IP address or URL to be used to access the web interface. To authorize the video face detector in ``ffsecurity``, come up with a token and specify it as ``VIDEO_DETECTOR_TOKEN`` (you have to specify the same token when :ref:`configuring <identification>` the video face detector). 

   .. tip::
      If necessary, ensure data security by enabling :ref:`SSL <https>`. 

   .. tip::
      If necessary, set ``’IGNORE_UNMATCHED’: True`` to disable logging events for faces which have no match in the dossiers (negative verification result). Enable this option if the system has to process a large number of faces. The face similarity threshold for verification is defined by the ``CONFIDENCE_THRESHOLD`` parameter.
 
   .. _quality:   

   .. tip::
      It is recommended to change the ``MINIMUM_DOSSIER_QUALITY`` default value. This parameter determines the minimum quality of a face in a dossier photo. Photos containing faces of worse quality will be rejected when uploading to a dossier. Upright faces in frontal position are considered the best quality. They result in values around 0, mostly negative (such as -0.00067401276, for example). Inverted faces and large face angles are estimated with negative values some -5 and less. By default, ``’MINIMUM_DOSSIER_QUALITY’: -7`` which means that faces of any quality can be uploaded to a dossier.
     
   .. code::

      sudo vi /etc/ffsecurity/config.py
 
      MEDIA_ROOT="/var/lib/ffsecurity/uploads"
      STATIC_ROOT="/var/lib/ffsecurity/static"

      EXTERNAL_ADDRESS="192.168.104.204"

      DEBUG = False

      LANGUAGE_CODE = 'ru-ru'

      TIME_ZONE = 'UTC'

      DATABASES = {
         'default': {
             'ENGINE': 'django.db.backends.postgresql',
             'NAME': 'ffsecurity',
         }
      }

      FFSECURITY = {
         'VIDEO_DETECTOR_TOKEN': 'Ghj545dfd',
         'CONFIDENCE_THRESHOLD': 0.75,
         'MINIMUM_DOSSIER_QUALITY': -0.1,
         'IGNORE_UNMATCHED': False,
         'EXTRACTION_API': 'http://127.0.0.1:18666/',
      }

    
   .. tip::
      If necessary, edit the ``/etc/nginx/sites-available/ffsecurity-nginx.conf`` configuration file as well.
 
#. Disable the default nginx server and add the ``ffsecurity`` server to the list of enabled servers. Restart nginx.

   .. code::

      sudo rm /etc/nginx/sites-enabled/default

      sudo ln -s /etc/nginx/sites-available/ffsecurity-nginx.conf /etc/nginx/sites-enabled/

      sudo nginx -s reload

#. Migrate the database architecture from FindFace Security to :program:`PostgreSQL`, create user groups with :ref:`pre-defined <users>` rights and the first user with administrator rights (a.k.a. Super Administrator).

   .. important::
      Super Administrator cannot be deprived of its rights, whatever the role.       

   .. code::

      sudo findface-security migrate

      sudo findface-security create_groups

      sudo findface-security createsuperuser --username admin --email root@localhost

#. Start the services.

   .. important::
      The ffsecurity service includes ``findface-security-proto`` (provides HTTP and web socket) and ``findface-security-worker`` (provides interaction of the other system components). The number of the ``findface-security-worker`` instances is calculated using the formula: ``N=(number of CPU cores-1)``, and specified after the ``@`` character, for example, ``findface-security-worker@{1,2,3}`` indicates 3 instances.  

   .. code::

      sudo systemctl enable redis-server findface-security-proto findface-security-worker@{1,2,3,4}

      sudo systemctl start redis-server findface-security-proto findface-security-worker@{1,2,3,4}


.. _identification:

Video-Based Biometric Identification
----------------------------------------------------------

To install ``fkvideo_detector`` and ``extraction-api``, components for video-based biometric identification, do the following:


#. Install the video face detector.

   .. code::

      sudo apt install -y fkvideo-detector 

#. Open the video face detector configuration file and edit the following settings:

   .. note:: 
      Note that the values of ``api-token`` and ``VIDEO_DETECTOR_TOKEN`` (``/etc/ffsecurity/config.py``) must be the same (see :ref:`basic-deployment`). 

   .. code:: 

      sudo vi /etc/fkvideo.ini
      
      api-url=127.0.0.1:8002

      api-token=<'VIDEO_DETECTOR_TOKEN'>

      detector-name=detector1

      request-url=/video-detector/frame/

      camera-url=/video-detector/cameras/

      realtime=0

   .. important::
      By default, the video face detector selects the best face snapshot in the real-time mode (``realtime=1``). In this mode, the video face detector posts a face to ``ffsecurity`` immediately after it appears in a camera field of view. For more effective snapshot selection, we recommend you to set the offline mode (``realtime=0``). The offline mode is less storage intensive as it allows posting only one snapshot per face, but of the highest quality.

#. Enable the ``fkvideo_detector`` service autostart and launch the service. Make sure that the service is active. 

   .. code::

      sudo systemctl enable fkvideo_detector@fkvideo && sudo systemctl start fkvideo_detector@fkvideo

      sudo systemctl status fkvideo_detector@fkvideo

#. Install the ``extraction-api`` component.

   .. code::

      sudo apt install -y findface-extraction-api

#. In the ``extraction-api`` configuration file, enable the ``quality_estimator`` to be able to estimate the face quality in a dossier.

   .. note::
      The :ref:`minimum face quality <quality>` in a dossier photo is set as ``MINIMUM_DOSSIER_QUALITY`` in ``/etc/ffsecurity/config.py``.

   .. code::

      sudo vi /etc/findface-extraction-api.ini  
    
      quality_estimator: true

#. In the ``extraction-api`` configuration file, disable gender, age and emotions recognition models search by passing empty values to the ``gender``, ``age`` and ``emotions`` parameters:

   .. warning::
      Do not remove the parameters themselves as in this case the system will be searching for default models. 
  
   .. code::

      models:
        gender: ""
        age: ""
        emotions: ""

#. Enable the ``extraction-api`` service autostart and launch the service. Make sure that the service is active.

   .. code::

      sudo systemctl enable findface-extraction-api && sudo systemctl start findface-extraction-api

      sudo systemctl status findface-extraction-api
      



