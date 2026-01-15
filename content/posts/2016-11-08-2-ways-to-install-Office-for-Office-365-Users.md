---
title : "2 ways to install Office for Office 365 Users"
date : 2016-11-08
---

Office included in Office 365 ProPlus, can be deployed to your users in
two different ways. First is, by using the user driven approach and
second, the IT driven approach. This article explains how to use both
ways to deploy Office to your users..

User Driven Approach\
The first approach is user driven, the end user can login to the Office
365 portals and install Office from the portal. As a user I can choose
which version of Office I want to deploy. As an administrator, there are
a couple of settings in the portal which you can set to restrict the
installation process for your users. You can exclude Office and Skype
for Business and SharePoint designer (for some versions of Office 365
Visio and Project are added to this list as well). But that's all. If
you want complete control over the installation process, you have to use
the IT driven approach.

![C:\\Users\\zaals\\Desktop\\Office_Installations_For_Office365_Users1.png](media/image1.png){width="3.9375in"
height="4.145764435695538in"}

IT Driven Approach\
When using the IT driven approach, the installation material is
installed on a file server. Users can go to this file server and install
Office from there. For this type of installation, the Office Deployment
tool for Click-to-Run is used. There are two different versions of the
Office Deployment Tool available:

- [Office Deployment Tool (Office 2013
  version)](http://go.microsoft.com/fwlink/p/?LinkID=282642)

- [Office Deployment Tool (Office 2016
  version)](http://go.microsoft.com/fwlink/p/?LinkID=626065)

Download the tool and save it to the file server from where Office is
installed. The tool consists of two files. Double click the setup file,
accept the EULA, click Continue and browse to the file share. The files
now will be extracted to the folder.

The file share will now have 2 files, a setup file and a configuration
file. The setup will run the Click-to-Run setup for us and will be using
the information that you add to the configuration file. In the
configuration file you can have complete control over the installation.
In this file you can control the following:

- Determine what Office programs are installed

- Where Office 365 ProPlus is installed from

- How and when Office 365 is updated

- Determine which version of Office is installed

- Choose which languages are available for installation

The configuration file which is added to the file share is a sample
file. To create your own configuration file, you can use the Deployment
Tool Configuration XML
Editor(<https://officedev.github.io/Office-IT-Pro-Deployment-Scripts/XmlEditor.html>
). This is a Github project, which basically creates the configuration
file for you, depending on the values you add to the editor.

![C:\\Users\\zaals\\Desktop\\Office_Installations_For_Office365_Users2.png](media/image2.png){width="6.291666666666667in"
height="3.2083333333333335in"}

The setup.exe file has two capabilities:

- /Download: this allows you to download any Office version from the
  Microsoft Content Delivery Network.

- /Configure: allows you to determine the installation settings.

### /Download

When using the /Download method, the Office version is downloaded from
the CDN. The Office setup is downloaded into the same folder from where
you run the setup file. You add your custom configuration file tot his
folder as well (you can also add multiple config files to the folder,
this way you can split up the configuration file and separate the
downloading part from the configuration part).

Below you see a sample configuration file:

\<Configuration\>

\<Add OfficeClientEdition=\"32\"
SourcePath="[\\\\FileShare\\Folder](file:///\\FileShare\Folder)"
Version="15.0.4420.1017" Channel=\"Current\"\>

\<Product ID=\"VisioProRetail\"\>

\<Language ID=\"en-us\" /\>

\</Product\>

\<Product ID=\"O365ProPlusRetail\"\>

\<Language ID=\"en-us\" /\>

\</Product\>

\</Add\>

\<Updates Enabled=\"TRUE\" /\>

\<Display AcceptEULA=\"TRUE\" Level=\"None\" /\>

\<Logging Level=\"Standard\" Path=\"%temp%\" /\>

\<!\--Silent install of 32-Bit Office 365 ProPlus with Visio with
Updates and Logging enabled\--\>

\</Configuration\>

Open Command Prompt and navigate to the installation folder. Type:
"Setup.exe /Download \<Name_ConfigFile\>.xml". The Office version you
specified in the configuration file, is now downloaded to the
installation folder.

### /Configure

Once downloaded, Office can be installed. This is handled by the
/configure parameter.

Again, open Command Prompt and navigate to the installation folder.
Type: "Setup.exe /Configure \<Name_ConfigFile\>.xml". Office will now be
installed.

### Summary

We now download and installed Office manually. You can also automate
this process using an installer file or you use System Center for
automated deployment.
