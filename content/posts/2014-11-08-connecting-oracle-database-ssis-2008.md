---
title: "Connecting to an Oracle Database using SSIS 2008"
date: 2014-11-08
---

Last week I had to connect to an Oracle Database using SSIS 2008. I had a couple of issues installing the Oracle Client tools, the Microsoft Connector for Oracle Provided by Attunity and the configuration on the client side (my SSIS server) and the server side (the Oracle Database server).

Besides that, it took me an awful lot of time reading the amount of information written on this subject before actually finding the right solution for making the connection.

This post is for explaining the steps regarding the installation as well as pointing to the right sites for downloading the tools and the blog posts which provide invaluable content for installing, configuring the SSIS and Oracle environment and troubleshooting the connection.

## Install the Attunity Connector

*Note that both servers are part of the same domain.*

To install the Oracle Client tools and the Microsoft Connector for Oracle by Attunity browse to the following site: <http://msdn.microsoft.com/en-us/library/ee470675%28v=sql.100%29.aspx>

Note that you have to install the Attunity Connector first. By installing the Oracle client tools before the Connector, you will eventually get errors creating the connection in SSIS.

In my case I was installing the Client tools on a 64 bits Windows 2008 R2 server. BIDS 2008 is running in 32-bit mode so I had to install both the 32 bit client tools as well as the 64 bits client tools.

You can download the Oracle connector from this website: [www.microsoft.com/en-us/download/details.aspx?id=29284](http://www.microsoft.com/en-us/download/details.aspx?id=29284). Download the 64bits OraAdapter and follow the installation guide provided by MSDN.

## Install the Oracle Client Tools

After installing the connector open the Oracle Database and execute the following statement to retrieve the Oracle Database version. You need this version number to download the Client Tools:

  -----------------------------------------------------------------------
  1                                   SELECT version FROM V\$INSTANCE
  ----------------------------------- -----------------------------------

  -----------------------------------------------------------------------

For downloading the 32 bits client tools browse to: <http://www.oracle.com/technetwork/topics/winsoft-085727.html>

For the 64bits tools browse to: <http://www.oracle.com/technetwork/topics/winx64soft-089540.html>

Choose the instant client package for the right Oracle database version and download the zip files.

Unzip the installation packages and run "setup.exe".


***Figure 1: installing the Oracle client --Choose the type of installation***

Choose to install the Adminstrator version, this will give you the possibility to ping the Oracle Database server and to create a "tnsnames.ora" file for setting the connecting from within the Attunity Oracle Source Adapter. Click "Next".

In the next screen leave the default language (you can add additional languages if you like) and click "Next".


***Figure 2: installing the Oracle client -- Specify the Oracle base path***

The above screenshot shows the Oracle Base path and the software location where the client tools will be installed. Leave the default and click "Next". This will start the installer and a Path Environment Variable will be created which is pointed to the Software location showed in the above screenshot.

Repeat the installation steps for installing the 64 bits client tools.

## Create the TNS_Admin Environment Variable

For pointing to the "tnsnames.ora" file that we will be creating in the next step, first there needs to be an Environment Variable in place.

Create a new environment variable and call it "TNS_Admin". In the Variable Value text box add the path where the "tnsnames.ora" file is saved. This path is the same as the software location path you entered installing the product with "\\network\\admin " added to it at the end.

The Settings for the variable will be:

Variable name = TNS_ADMIN\
Variable value = C:\\app\\Administrator\\product\\11.2.0\\client_1\\ network\\admin

***Figure 3: Creating the TNS_ADMIN environment variable***

## Create the tnsnames.ora

Navigate to the TNS_Admin path you specified above and copy the tnsnames.ora sample file from the "Sample" folder to this folder. The alias specified in this file will be used by the Attunity Oracle Source Adapter to communicate with the Oracle Database server. Open the file and add the following code to it:

+-----------------------------------+------------------------------------------------------------------------------------------+
| 1                                 | \<alias\> =                                                                              |
|                                   |                                                                                          |
| 2                                 | (DESCRIPTION =                                                                           |
|                                   |                                                                                          |
| 3                                 | (ADDRESS = (PROTOCOL = TCP)(HOST = \<Oracle Database Server IP Adress\>)(PORT = 1521))   |
|                                   |                                                                                          |
| 4                                 | (CONNECT_DATA =                                                                          |
|                                   |                                                                                          |
| 5                                 | (SERVER = DEDICATED)                                                                     |
|                                   |                                                                                          |
| 6                                 | (SERVICE_NAME = \<alias\>)                                                               |
|                                   |                                                                                          |
| 7                                 | )                                                                                        |
|                                   |                                                                                          |
| 8                                 | )                                                                                        |
|                                   |                                                                                          |
| 9                                 | LISTENER\_\<alias\> =                                                                    |
|                                   |                                                                                          |
| 10                                | (ADDRESS = (PROTOCOL = TCP)(HOST = \<Oracle Database Server IP Adress\>)()(PORT = 1521)) |
+===================================+==========================================================================================+

Replace the \<alias\> with a more appropriate name and save the file.

## Setting up the Listener.ora

After setting up the above file the listener.ora file on the Oracle Database server will need some changes as well. I assume the client tools for the server are already installed on the database server.

On the Oracle Database server navigate to the folder where the client tools are installed (something like "C:\\app\\....\\product\\11.2.0" and open the "dbhome_1" folder. Navigate to "NETWORK\\ADMIN" and open the Listener.ora file and add the following code to it:

+-----------------------------------+-------------------------------------------------------------------------------+
| 1                                 | LISTENER =                                                                    |
|                                   |                                                                               |
| 2                                 | (DESCRIPTION_LIST =                                                           |
|                                   |                                                                               |
| 3                                 | (DESCRIPTION =                                                                |
|                                   |                                                                               |
| 4                                 | (ADDRESS = (PROTOCOL = IPC)(KEY = EXTPROC1521))                               |
|                                   |                                                                               |
| 5                                 | (ADDRESS = (PROTOCOL = TCP)(HOST = \<computername.domainname\>)(PORT = 1521)) |
|                                   |                                                                               |
| 6                                 | )                                                                             |
|                                   |                                                                               |
| 7                                 | )                                                                             |
+===================================+===============================================================================+

## Checking the Connection

After setting up the listener file we can check if we have a connection.

On the Oracle Database server open "cmd.exe" and type "lsnrctl reload". After that, type "lsnrctl status". You should get the following information:


***Figure 4: Checking the Oracle listener.***

If the connection is in place there should be a instance with the state "Ready".

Next is to check if the SSIS server can connect to the Oracle Listener. Open "cmd.exe" on the SSIS server and type "tnsping \<alias\>" (the alias provided in the tnsnames.ora)

If the connection is made you should receive the following information:

***Figure 5: Checking the TNS Connection***

## Troubleshooting

If you have any problems setting up the connection with the Oracle listener (like I had...) the following sites will give a lot of information:

- <https://community.oracle.com/thread/371929?tstart=0>

- <http://edstevensdba.wordpress.com/2011/03/19/ora-12514/>

- <https://community.oracle.com/thread/363885?tstart=0>

## Connecting to Oracle using the Attunity Adapters

Open BIDS 2008 and follow the instructions provided by the MSDN article: <http://msdn.microsoft.com/en-us/library/ee470675%28v=sql.100%29.aspx> .

You first need to add the Oracle Source and Oracle Destination Adapter to the toolbox. After that, you can set up a connection using these adapters. Note that, when creating the actual connection, the \<alias\> from the tnsnames.ora should be added to the "TNS Service Name".

In this blog I demonstrated how to set up a connection with an Oracle Database from SSIS 2008. I did had problems creating the actual connection between the servers, but the articles provided in the Troubleshooting section of this post, gave me a lot of samples and information to set up the tnsnames.ora and the listener.ora file. The Attunity Connector does a great job creating the connection and querying the oracle data.

-- Sjoukje
