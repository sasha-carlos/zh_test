��          |               �   
   �   v   �   �   _  �     C   �  L   �     )  U   F  6   �  %   �  ,   �    &  
   �  v   �  �   (  �   �  C   a  L   �     �  U     6   e  %   �  ,   �   Audit Logs Audit logs contain detailed information about all the events occurred in the system and are great for troubleshooting. If necessary, uncomment and edit the ``SystemMaxUse`` parameter as well. This parameter determines the maximum volume of log files on your hard drive (10% by default). In order to enable saving audit logs to your hard drive, uncomment and edit the ``Storage`` parameter in the ``etc/systemd/journald.conf`` file: In the log below, the ``admin`` user creates a dossier ``id=1879``. In the next log, the list of faces is requested for the dossier ``id=1879``. To view audit logs, execute: When interpreting audit logs, first of all pay attention on the following parameters: ``REQUEST_DATA``: detailed information of the request. ``REQUEST_PATH``: URL of the request; ``REQUEST_USER``: user who made the changes; Project-Id-Version: FindFace Security 1.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2018-09-23 14:07+0700
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: zh
Language-Team: zh <LL@li.org>
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.5.3
 Audit Logs Audit logs contain detailed information about all the events occurred in the system and are great for troubleshooting. If necessary, uncomment and edit the ``SystemMaxUse`` parameter as well. This parameter determines the maximum volume of log files on your hard drive (10% by default). In order to enable saving audit logs to your hard drive, uncomment and edit the ``Storage`` parameter in the ``etc/systemd/journald.conf`` file: In the log below, the ``admin`` user creates a dossier ``id=1879``. In the next log, the list of faces is requested for the dossier ``id=1879``. To view audit logs, execute: When interpreting audit logs, first of all pay attention on the following parameters: ``REQUEST_DATA``: detailed information of the request. ``REQUEST_PATH``: URL of the request; ``REQUEST_USER``: user who made the changes; 