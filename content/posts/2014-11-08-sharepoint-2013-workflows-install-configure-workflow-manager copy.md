---
title: "SharePoint 2013 Workflows Part 2: Installing and Configuring The Workflow Manager"
date: 2014-11-08
---

In this post I will guide you through installing and configuring the Workflow Manager for SharePoint 2013.

Before starting the installation of the Workflow Manager, make sure that at least the [SharePoint 2013 March Public Update (KB 2767999)](http://support.microsoft.com/default.aspx?scid=kb;EN-US;2767999) is installed on toy SharePoint Server. This update has some bug fixes and added extra support for the Workflow Manager and workflow.

## Installing the Workflow Manager

It is best to install the Workflow Manager using the Web Platform Installer tool. This will automatically install all the prerequisites like Service Bus 1.0.

- You can download Workflow Manager 1.0 from here: <http://www.microsoft.com/en-us/download/details.aspx?id=35375>

- You can also download the Web Platform Installer Tools Command Line for offline installation: <http://www.iis.net/learn/install/web-platform-installer/web-platform-installer-v4-command-line-webpicmdexe-rtw-release>

When workflow manager is installed, the Web Platform Installer will also install the workflow Manager Client 1.0. SharePoint uses this client to communicate with the Workflow Manager.

If the Workflow Manager is installed on a separate server, this client will still need to be installed (manually) on the SharePoint Server. You can download the Workflow Manager Client 1.0 from the same website as the Workflow Manager.

The Web Platform installer will also automatically install the Workflow Manager Tools 1.0 for Visual Studio if Visual Studio is already installed on the system.

Run the Workflow Manager installer. This will launch the Web Platform Installer and click "**Install"** and follow the installation steps.

**Figure 1: Installing Workflow Manager 1.0 using the Web Platform installer.**

## Configuring the Workflow Manager

After the installation the configuring screen is automatically opened. This configuration wizard creates the databases and Workflow Manager farm and provisions the Service Bus. It also provides a PowerShell which can be used to configure other server installations as well.


**Figure 2: Configuring Workflow Manager 1.0.**

For this installation choose **Configure Workflow Manager With Custom Settings** and in the next screen enter the name of the SQL Server Instance, you can change the database name or leave the default if you like, and you can test the connection.

**Figure 3: Configuring Workflow Manager 1.0.**

If you scroll down you can configure the service account. Best Practice is to create a new Service account for the workflow manager.

**Figure 4: Configuring Workflow Manager 1.0.**

In the next section add a certification Generation Key and confirm. You need this key if you want to join extra servers to the workflow farm so memorize it!

**Figure 5: Configuring Workflow Manager 1.0.**

Scroll down again and in the next section you can configure the ports. Leave the default settings and for developing purposes you can check the **Allow Workflow Management over HTTP on this Computer** box.

**Figure 6: Configuring Workflow Manager 1.0.**

Click on the right arrow to go to the next screen to configure the Service Bus.

Here you can provide the database settings for the Service Bus. I used the default settings here for my development environment.

**Figure 7: Configuring Workflow Manager 1.0.**

Here you can provide the Service Account Settings. You can choose the same Service Account credentials as you used for the Workflow Manager or add different credentials. The same for the Certificate key, I used the same key as I entered for the Workflow Manager.

**Figure 8: Configuring Workflow Manager 1.0.**

Leave the default ports in the next section and click the right arrow.

**Figure 9: Configuring Workflow Manager 1.0.**

The next screen provides you with an overview of the settings. Review them and Click **Apply.** You can also download the PowerShell Script here for installing.

If everything went right you will see the following screen after the installation:

**Figure 10: Configuring Workflow Manager 1.0.**

After installing and configuring the workflow manager and creating the SharePoint Manager Farm you need to connect both environments to communicate with each other.

This is done by running a PowerShell script on the SharePoint 2013 farm. It configures the SharePoint farm to send all workflow related tasks to the Workflow Manager Frontend Service.

Open the SharePoint Management Console and type the following Powershell cmdlet:

**For communicating over HTTP (only recommended for a development environment)**

  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  1                                   Register-SPWorkflowService --SPSite <http://sp-siteurl> --WorkflowHostUri [http://workflowhostURI:12291](http://workflowhosturi:12291/) --AllowOAuthHttp
  ----------------------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------

  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

**For communicating over HTTPS**

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  1                                   Register-SPWorkflowService --SPSite <http://sp-siteurl> --WorkflowHostUri [https://workflowhostURI:12290](https://workflowhosturi:12290/)
  ----------------------------------- -------------------------------------------------------------------------------------------------------------------------------------------

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

To Retrieve the Workflowhost Url open IIS, look for the Workflow Management Site check the settings.

After running this command the Workflow Manager is connected to the SharePoint farm and you can begin to create custom Workflows.

Microsoft released a Workflow Manager Best Practice analyzer which scans your Workflow Environment and provides best practices on installing and configuring. For more information see this site: <http://msdn.microsoft.com/library/azure/jj730571%28v=azure.10%29.aspx>

## Updating Workflow Manager 1.0

The Workflow Manager Service and the Service Bus are released prior to the RTM release of SharePoint 2013. Since then, some things changed and some bugs where found and resolved in below updates.

Install the Azure Services February 2013 Cumulative Updates:

- [Cumulative Update for Service Bus 1.0 (KB2799752)](http://www.microsoft.com/en-us/download/confirmation.aspx?id=36794)

- [Cumulative Update for Workflow Manager 1.0 (KB2799754)](http://www.microsoft.com/en-us/download/details.aspx?id=36800)

## Summary

In this article I explained how to install and configure the Workflow Manager 1.0. The steps are already explained in several other articles on the internet, but in most cases some settings and steps are left out of it, so I wasn't able to connect the workflow manager to the SharePoint farm.

Also running the SharePoint updates before installing the Workflow Manager and installing the Windows Azure February updates afterwards is a critical step, which will solve a lot of problems using the SharePoint 2013 Workflow Manager and creating Workflows.

This was the last article in this series on Workflows in SharePoint 2013. In my upcoming posts on this topic I will focus on leveraging the SharePoint REST API in Visual Studio Workflows. I will provide some workflow examples as well as a couple of custom activities which you can use in your own workflows.

-- Sjoukje
