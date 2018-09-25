.. _requirements:

***********************************
System Requirements
***********************************

FindFace Security can be deployed on a single host (standalone) or in a cluster environment. To calculate the host(s) characteristics, use the following requirements:


+--------------------+-----------------------------------------------------------------------------+
| Requirement        | Description                                                                 |
+====================+=============================================================================+
| CPU                | Intel Xeon E5 with AVX support or similar CPU. The characteristics depend   |
|                    | on the number of cameras in use. A single camera 1080p@25FPS requires 2     | 
|                    | cores HT >2 GHz for video processing and 2 cores HT >2 GHz for face         |         
|                    | recognition.                                                                |
+--------------------+-----------------------------------------------------------------------------+
| RAM                | Depends on the number of cameras in use. A single camera 1080p@25FPS        |
|                    | requires 4 GB for video processing and 4 GB for face recognition.           |
+--------------------+-----------------------------------------------------------------------------+
| HDD                | The own needs of the operating system and FindFace Security require 10 GB.  |
|                    | The total volume is subject to the required depth of the event archive in   |
|                    | the database and in the log, at the rate of 1.5 Mb per 1 event.             |
+--------------------+-----------------------------------------------------------------------------+
| Operating system   | Ubuntu 16.04 LTS (x64)                                                      |
+--------------------+-----------------------------------------------------------------------------+

.. note::
   The minimum configuration to process a video stream 1x720p (1280×720) 25 FPS is 6th generation INTEL Core i5 CPU with 4 physical cores 2,8 GHz, and 6 GB RAM.