.. _settings:

*********************************************
Configure Confidence Threshold
*********************************************

FindFace Security verifies that a detected face and some face from the dossiers belong to the same person (i. e. the faces match), based on the pre-defined similarity threshold. The default threshold is set to 0.75 which can be considered as optimum. If necessary, you can change the threshold on the :guilabel:`Settings` tab.

.. note::
   The higher is the threshold, the less are chances that a wrong person will be positively verified, however, some valid photos may also fail verification.

|settings_en|

.. |settings_ru| image:: /_static/settings.png
        :scale: 50%

.. |settings_en| image:: /_static/settings_en.png
        :scale: 50%

 
.. tip::
   To save and display an event only if the faces match, enable the ``IGNORE_UNMATCHED`` option at ``/etc/ffsecurity/config.py`` (see :ref:`basic-deployment`).