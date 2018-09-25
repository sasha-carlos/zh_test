.. _guests:

*********************************************
Visitor Database
*********************************************

The visitor database contains dossiers on the unwanted visitors and VIP guests. A dossier has to contain one or several photos of a visitor and belong to a certain classification list (watch list), black or white in the simplest case. You can create several watch lists, subject to a visitor status or hazard level. 

.. tip::
   To create dossiers in bulk, use the batch photo upload functionality.   

.. rubric:: In this chapter:

.. contents::
   :local:

Watch Lists
=============================

Create Watch List
----------------------

To create a watch list, do the following:

#. In the web interface, go to the :guilabel:`Watch Lists` tab.

    |create_list_en|

     .. |create_list_ru| image:: /_static/create_list.png
        :scale: 60%

     .. |create_list_en| image:: /_static/create_list_en.png
        :scale: 60%


#. Click :guilabel:`Create`.
#. From the :guilabel:`Label` palette, select a color which will be shown in notifications for this list. Keep in mind that the right color makes for quicker response of security and hospitality managers. 

    |list_en|

     .. |list_ru| image:: /_static/list.png
        :scale: 80%

     .. |list_en| image:: /_static/list_en.png
        :scale: 80%


#. Specify the list name.
#. Check :guilabel:`Require acknowledgment` if it is mandatory that a manager acknowledge events for the list.
#. If necessary, turn on sound notifications for the list.
#. Check :guilabel:`Active`.
#. Click :guilabel:`Save`.


Deactivate or Delete Dossier List
----------------------------------------

In order to deactivate or delete a watch list, do the following:

#. Click on the list name in the table.
#. To deactivate the list, uncheck :guilabel:`Active`. Click :guilabel:`Save`.
#. To delete the list, click :guilabel:`Delete`.

Filter Dossiers by List
-------------------------------------

You can find all dossiers created in FindFace Security on the :guilabel:`Dossiers` tab. Use the :guilabel:`Watch lists` filter to filter dossiers by list.


.. _create-dossier:

Create Dossier Manually
==================================

To create a dossier manually, do the following:

#. In the web interface, go to the :guilabel:`Dossier` tab.

    |create_dossier_en|
 
     .. |create_dossier_ru| image:: /_static/create_dossier.png
        :scale: 60%

     .. |create_dossier_en| image:: /_static/create_dossier_en.png
        :scale: 60%


#. Click :guilabel:`Create`.
#. Attach a photo and specify the name of a visitor. If necessary, add a comment.

   .. important::
      A photo must meet the following requirements:

      * It must contain only one face.
      * A face must be of high quality, i.e. close to a frontal position.

      Photos that do not meet the requirements will be rejected with a detailed error description.

   |dossier_en|

   .. |dossier_ru| image:: /_static/dossier.png
      :scale: 80%

   .. |dossier_en| image:: /_static/dossier_en.png
      :scale: 80%

   
#. From the :guilabel:`Watch lists` drop-down menu, select a classification list for the dossier.
#. Click :guilabel:`Save`.



.. _batch-upload:

Batch Photo Upload
====================================

To create dossiers in bulk, use the batch photo upload. Do the following:

#. In the web interface, go to the :guilabel:`Batch Upload` tab.

     |batch_upload_en|

     .. |batch_upload_ru| image:: /_static/batch_upload.png

     .. |batch_upload_en| image:: /_static/batch_upload_en.png


#. Select multiple image files, or a folder.
#. You can use image file names as a basis for names and/or comments in dossiers to be created. Select the necessary option(s). Then configure the automatic name/comment generation rule by appending a custom prefix and/or postfix to the file name.

   .. tip::
      To avoid merging the 3 words into one, use underscore or another symbol in the prefix and postfix. 

#. From the :guilabel:`Watch lists` drop-down menu, select a classification list for the dossiers.
#. Click :guilabel:`Start` to launch the photo upload.



