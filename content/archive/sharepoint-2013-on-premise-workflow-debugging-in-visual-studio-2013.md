---
title: "SharePoint 2013 On-Premise Workflow Debugging in Visual Studio 2013"
date: 2014-06-03
---


If you want to debug your SharePoint 2013 on-premise workflows you need to allow the workflow manager to access your system through the firewall.

Take the following steps to allow the workflow manager to access your system:

* In Control Panel, choose System and Security and then Windows Firewall.  
* In the Control Panel Home list, choose the Advanced Settings link.  
* In the left pane of Windows Firewall, choose Inbound Rules.  
* In the Inbound Rules list, choose Workflow Manager Tools 1.0 for Visual Studio 2012 – Test Service Host.  
* In the Actions list, choose Enable Rule.  
* On the properties page of your SharePoint project, choose the SharePoint tab, and then select the Enable Workflow debugging check box.

