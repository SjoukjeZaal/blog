---
title: "Certificates in BizTalk 2013 Part 2: How To Configure the BizTalk WCF Adapter to use the SSL Certificates"
date: 2016-11-08
---

## Certificates in BizTalk 2013 Part 2: How To Configure the BizTalk WCF Adapter to use the SSL Certificates

In the previous post I explained hot how install SSL certificates in BizTalk to make a secure connection to a third party (web) service. In this article I will explain how you can configure the WCF Adapter to use these installed certificates to encrypt the message that is send to the service.

##  Creating the Send Port

First, we need a send port. You can create a new BizTalk application in the BizTalk adminstration console or use a excisiting one.

- Richt click on **Send Ports -- new -- Static one-way send port.**

- The Send Port properties are displayes. Fill in/select the following values:

  - Name -- for instance WebServiceSendPort

  - Type -- WCF-BasisHttp

  - Send Pipeline -- PassThruTransmit


- Click the **Configure Button**

- The transport properties screen is displayed. Fill in the Service Url, and the SOAP Action header. Click the **Security** tab and fill in/select the following values:

  - Security mode = Transport

  - Transport Client Credential Type = Certificate

- Under Client Certificate, click the **browse** Button. Select the installed private certificate and click **Ok.**

- Under Server Certificate, click the **browse** Button. Select the installed public certificate and click **Ok.**

- The transport property pane will look like the following figure:

- Click **Ok**, and again **Ok.** The Send Port is now configured.

##  Summary

This is the last part of the series where I explained how to use SSL certificates in BizTalk to create a secure connection to a third party service.
