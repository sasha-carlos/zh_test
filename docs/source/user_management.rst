.. _users:

**************************************
User Management
**************************************

To manage FindFace Security users, navigate to the Users tab.

.. rubric:: In this chapter:

.. contents::
   :local:


Roles
=================================

FindFace Security provides the following pre-defined roles:

* Administrator has rights to :ref:`manage cameras <cameras>`, events, FindFace Security users, and the :ref:`visitor database <guests>`.

  .. important::
     Whatever the role, the first administrator :ref:`created on the console <basic-deployment>` (Super Administrator) cannot be deprived of its rights.

* Operator can :ref:`create dossiers manually <create-dossier-operator>`, receive and acknowledge events, and search for faces in the event list and social networks. The other data is available read-only. The :ref:`batch dossier creation <batch-upload>` is unavailable.
* User has a right to receive and acknowledge events, and to search for faces in the event list and social networks. The other data is available read-only.


Create User
===============================

To create a user, do the following:

#. Click :guilabel:`Create`.

     |create_user_en|
  
     .. |create_user_ru| image:: /_static/create_user.png

     .. |create_user_en| image:: /_static/create_user_en.png


#. Specify such user data as name, login and password. From the :guilabel:`Role` drop-down menu, select the user role. If necessary, add a comment.

     |user_en|
 
     .. |user_ru| image:: /_static/user.png
        :scale: 80%

     .. |user_en| image:: /_static/user_en.png
        :scale: 80%


#. Check :guilabel:`Active`.
#. Click :guilabel:`Create`.


Deactivate or Delete User
=========================================

In order to deactivate or delete a user from FindFace Security, do the following:

#. Click on the user login in the list.
#. To deactivate the user, uncheck :guilabel:`Active`. Click :guilabel:`Update`.
#. To delete the user, click :guilabel:`Delete`.
 
