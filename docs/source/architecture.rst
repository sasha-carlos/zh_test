.. _architecture:

*******************************
Architecture
*******************************

FindFace Security can be deployed on a single host (standalone) or in a cluster environment.

.. tip:: 
   See :ref:`requirements`.

FindFace Security is delivered in the following distributable packages:

* A package with the FindFace Security components :program:`<findface-security-repo>.deb`.
* Packages with the biometric neural network models :program:`<findface-data>.deb`.

The FindFace Security functioning is provided by interaction of the following components:


.. csv-table::
   :header: "Component", "Description"
   :widths: 15 40
   :file: _tables/components.csv
   :encoding: UTF-8
   :delim: ;

.. note::
   Use a :ref:`web interface <wui>` to work with FindFace Security.

.. note::
   To purge old events from the database, use the ``event-cleaner`` :ref:`utility <event-cleaner>`.
