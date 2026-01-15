---
title: "SharePoint 2013 Workflow Part 1: Workflow Manager Architecture"
date: 2014-11-07
---

This is the first part in a series of posts about SharePoint 2013 Workflows. In this post we will discuss the architecture and improvements of the new Workflow Model in SharePoint 2013.

## Workflow Architecture

Besides the SharePoint 2010 workflow model, which is still part of the SharePoint 2013 installation, Microsoft introduced a new Workflow architecture in SharePoint 2013 (and Office 365).

SharePoint 2013 is now using Workflow Manager 1.0 which acts as the host for the workflow runtime, is hosting the latest version of Windows Workflow Foundation (WF 4.5) and unlike the 2010 Workflow model, is totally decoupled from SharePoint using OAuth secured WCF Services. SharePoint 2013 is configured to send all related tasks to the workflow manager to execute workflows using these services.

Workflow Manager 1.0 consists of 3 components:

**Workflow Frontend**\
This is a web service that receive calls from an external application, SharePoint in our case. Calls that are made by SharePoint to the Workflow Service are then logged in the Service Bus.

**Service Bus**\
The Service bus uses the Pub/Sub model and will publish the message which is send to the service to all the subscribers.

**Workflow Backend**\
The Workflow Backend service is a Windows Service and it is responsible for processing the actual Workflow. It communicates with SharePoint by using the SharePoint REST API.

Figure 1: Workflow Manager Architecture (copied from MSDN)

Note that Office 365 is using this same Workflow Architecture only Microsoft handles all the installation and configuration regarding the Workflow Manager.

## How it works

After installing and configuring the workflow Manager a Workflow Manager farm is created within SharePoint which contains all of the necessary databases to store workflows and services to communicate with the Workflow Manager Frontend Service. The Workflow Manager farm is configured by SharePoint as an App.

When a workflow is published, SharePoint only stores a copy of the workflow, the actual workflow is going to be send to the workflow manager farm which will handle the execution of the workflow. By the time the workflow needs to be executed, SharePoint tells the Workflow Manager farm to execute the workflow and adds some extra context information to the call, like which start-up parameters to use and what SharePoint list it has to execute on. This call is send to the Workflow Manager Frontend and will be queued in the Workflow Manager Service Bus until the Workflow Manager Bacnkend process is picking it up to execute.

Workflows that are executed by the Workflow Manager Backend will need to communicate with SharePoint on several occasions, for instance to send emails, store items in lists, creating tasks and retrieve other relevant information for the workflow. This communication is done by using the SharePoint REST API and it uses S2S high trust authentication.

## Improvements

Workflow Manager uses Windows Workflow Foundation 4.5. This means that you can only create declarative workflows in SharePoint 2013 and you are not allowed anymore to add custom code to your workflow.

Workflow Manager includes a HTTP Send activity which can make Web Service calls and REST / OData calls. The business logic will now need to be added to a custom web service which can be called from the HTTP Send activity. This activity is also added to SharePoint Designer. In my upcoming posts I will provide you with some samples on how to do this.

By moving the business logic from out of SharePoint to custom services, you can reuse this logic in multiple applications (like mobile apps, BizTalk, custom applications, etc.) and It can be hosted on premise or for instance, in Windows Azure.

Workflow Manager 1.0 can also be installed on multiple servers, which don't need to have a SharePoint installation on it. This means that you can easily scale out your workflow environment and you don't have to deal with additional SharePoint licensing costs.

## Summary

Microsoft has made a lot of great improvements with this new Workflow Model. The Workflow Manager is scalable and robust and because it uses the most recent version of the workflow model, it can integrate with almost everything.

Below are some interesting sites about workflow manager:

- MSDN: <http://msdn.microsoft.com/en-us/library/jj193528%28v=azure.10%29.aspx>

- Workflow Team Blog: <http://blogs.msdn.com/b/workflowteam/>

- I recommend the book Pro WF 4.5: <http://www.amazon.com/Pro-WF-4-5-Bayer-White/dp/143024383X> or you can visit: <http://msdn.microsoft.com/en-us/library/hh305677%28v=vs.110%29.aspx>

In my next post I will install and configure Workflow Manager 1.0 which can be used in the later samples of this series.

-- Sjoukje
