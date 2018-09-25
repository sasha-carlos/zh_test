.. _cameras:

*****************************
Camera Management
*****************************

To configure video-based biometric identification, add cameras to FindFace Security, grouping them subject to their location.

.. rubric:: In this chapter:

.. contents::
   :local:


Create Group of Cameras
============================

To create a group of cameras, do the following:

#. Navigate to the :guilabel:`Camera Groups` tab.

    |create_camera_group_en|

     .. |create_camera_group_ru| image:: /_static/create_camera_group.png
        :scale: 60%

     .. |create_camera_group_en| image:: /_static/create_camera_group_en.png
        :scale: 60%

#. Click :guilabel:`Create`.
#. Specify the group name. Add a comment.

     |camera_group_en|

     .. |camera_group_ru| image:: /_static/camera_group.png
        :scale: 80%

     .. |camera_group_en| image:: /_static/camera_group_en.png
        :scale: 80%


#. If you want to deduplicate events from cameras that belong to the same group, i. e. exclude coinciding events, check :guilabel:`Deduplicate Events` and specify the deduplication interval (interval between 2 consecutive checks for event uniqueness).
#. Check :guilabel:`Active`.
#. Click :guilabel:`Save`.


Add Camera to Group
====================================

To add a camera to a group, do the following:

#. In the web interface, go to the :guilabel:`Cameras` tab.

     |create_camera_en|

     .. |create_camera_ru| image:: /_static/create_camera.png
        :scale: 60%

     .. |create_camera_en| image:: /_static/create_camera_en.png
        :scale: 60%


#. Click :guilabel:`Add`.
#. Specify the name of a camera and add it to a group. If necessary, add a comment.

     |camera_en|

     .. |camera_ru| image:: /_static/camera.png
        :scale: 80%

     .. |camera_en| image:: /_static/camera_en.png
        :scale: 80%


#. Specify the camera URL.
#. If necessary, specify the value of the ``ROT`` parameter to enable detecting and tracking faces only inside a clipping rectangle (region of tracking). You can use this option to reduce the ``fkvideo_detector`` load.

     |roi_rot_en|

     .. |roi_rot_ru| image:: /_static/roi_rot.png
        :scale: 70%

     .. |roi_rot_en| image:: /_static/roi_rot_en.png
        :scale: 70%


#. If necessary, specify the value of the ``ROI`` parameter to enable posting faces detected only inside a region of interest.
#. Check :guilabel:`Active`.
#. Click :guilabel:`Save`.



