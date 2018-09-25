.. _events:

**********************************************
Face Recognition Events
**********************************************

Navigate to the :guilabel:`Events` tab to view and process the face recognition events. 

.. tip::
   Search the event database and social networks for faces on the :guilabel:`Search` tab.

.. rubric:: In this chapter:

.. contents::
   :local:

.. _event-list:

List of Events
===============================

Once a face detected, you will see a notification in the event list.

|events_en|

.. |events_ru| image:: /_static/events.png

.. |events_en| image:: /_static/events_en.png

A notification can feature different pieces of information, depending on whether a detected face has a match in the database:

* Match not found: normalized face image, detection date and time, camera group name.
* Match found: normalized face image, photo from the dossier, the person name, similarity between the faces, comment from the dossier, watch list name, detection date and time, camera group name.

.. note::
   You can configure the system in such a way that you will get notifications only for the faces with a match.

.. important::
   In order to pause the notifications thread, click |pause| above the list of events.

.. |pause| image:: /_static/pause.png


When working with events, the following filters may come in handy:

* :guilabel:`Dossier`: display events only for a selected dossier.
* :guilabel:`Watch lists`: display events only for a selected dossier category (watch list).
* :guilabel:`Matches`: display events only with/without matches, or all events.
* :guilabel:`Acknowledged`: display only acknowledged/unacknowledged events, or all events.
* :guilabel:`Cameras`: display only events from a selected camera.
* :guilabel:`Camera groups`: display only events from a selected group of cameras.
* :guilabel:`Start`, :guilabel:`End`: display only events occurred within a certain time period.
* :guilabel:`id`: display an event with a given ID.


Event Ticket. Acknowledging Event
====================================================

In order to navigate to an event ticket from the list of events, click on the face recognition result in a notification (:guilabel:`No matches` or the name of a matching person).

An event ticket contains the same data as a relevant :ref:`notification <event-list>`. It also allows for acknowledging the event. To do so, check :guilabel:`Acknowledge event`. Click :guilabel:`Save`.

|accept_en|

.. |accept_ru| image:: /_static/accept.png
   :scale: 70% 

.. |accept_en| image:: /_static/accept_en.png
   :scale: 70% 


.. tip::
   If a detected face has a match in the dossiers, you can navigate into the relevant dossier by clicking on the person’s name in the event ticket.


Event Ticket. Face Search
======================================

FindFace Security allows you to search for faces detected in video in the internal (list of events) and external (social network vk.com) databases. To navigate from an event ticket to the search tab, click :guilabel:`Events` or :guilabel:`Social networks`.


|search_ticket_en|

.. |search_ticket_ru| image:: /_static/event_ticket_search.png
   :scale: 70% 

.. |search_ticket_en| image:: /_static/event_ticket_search_en.png
   :scale: 70% 


.. seealso::
   * :ref:`face-search`.

