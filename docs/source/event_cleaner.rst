.. _event-cleaner:

***************************************************
Purge Old Events from Database
***************************************************

Use the ``event-cleaner`` utility to remove old events from the database.

To invoke the ``event-cleaner`` help message, execute:

.. code::

   sudo findface-security cleanup_events --help

.. code::

   usage: findface-security-manage cleanup_events [-h] [--version] [-v {0,1,2,3}]
                                                  [--settings SETTINGS]
                                                  [--pythonpath PYTHONPATH]
                                                  [--traceback] [--no-color]
                                                  --age AGE

   Delete old events

   optional arguments:
    -h, --help            show this help message and exit
    --version             show program's version number and exit
    -v {0,1,2,3}, --verbosity {0,1,2,3}
                          Verbosity level; 0=minimal output, 1=normal output,
                          2=verbose output, 3=very verbose output
    --settings SETTINGS   The Python path to a settings module, e.g.
                          "myproject.settings.main". If this isn't provided, the
                          DJANGO_SETTINGS_MODULE environment variable will be
                          used.
    --pythonpath PYTHONPATH
                          A directory to add to the Python path, e.g.
                          "/home/djangoprojects/myproject".
    --traceback           Raise on CommandError exceptions
    --no-color            Don't colorize the command output.
    --age AGE             Minimum age in days of events to clean up
   
In order to remove events older than a given number of days, use the ``--age`` option. For example, to remove events older than 5 days, execute: 

.. code::

   sudo findface-security cleanup_events --age 5

To automatically remove events, add a scheduled job to Ubuntu’s ``cron``. The command in the example below adds a script file ``/etc/cron.d/cleanup`` that removes events older than 60 days. The script is executed daily at 00:05.

.. code::

   echo '5 0 * * * root /usr/bin/findface-security cleanup_events --age 60' | sudo tee /etc/cron.d/cleanup


