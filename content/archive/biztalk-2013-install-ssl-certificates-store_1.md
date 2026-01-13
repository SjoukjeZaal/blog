---
title: "Certificates in BizTalk 2013 Part 1: How To Install SSL Certificates in the Certificate store"
date: 2016-11-07
---

This is the first part in a series on how to use SSL Certificates in your BizTalk Application to secure your data transfer when connecting to third party (web) services. In this post I'm going to explain how to install the certificates in the BizTalk servers certificate store.

## SSL Certificates

SSL certificates contain a private (.pfx) and a public key (.cer) which will need to be installed in the appropriate certification stores. (For more information on SSL Certificates you can read the following article: [http://www.tldp.org/HOWTO/SSL-Certificates-HOWTO/x64.html.)](http://www.tldp.org/HOWTO/SSL-Certificates-HOWTO/x64.html)

For test scenarios you can create your own certificate using the [Makecert.exe](http://msdn.microsoft.com/en-us/library/bfsktky3%28v=vs.110%29.aspx) tool which is part of the .Net Framework. (For production environments SSL certificates need to be purchased from a Certificate Authority (CA).

But in the case of using SSL certificates in a BizTalk application, the certificates are probibly provided by the third party to which the application connects to. In that case you can skip the next part and go to the part where the certificates are installed in the appropriate stores.

## Creating SSL Certificates

for this demo I've used the following article for creating my SSL certificate: <http://www.jayway.com/2014/09/03/creating-self-signed-certificates-with-makecert-exe-for-development/http://www.jayway.com/2014/09/03/creating-self-signed-certificates-with-makecert-exe-for-development/>

I've made some minor changes to the input paramaters for the Makecert tool. My cmd file consists of the following parameters:

+-----------------------------------+-----------------------------------+
| 1                                 | makecert.exe \^                   |
|                                   |                                   |
| 2                                 | -n \"CN=SjoukjeZaal\" \^          |
|                                   |                                   |
| 3                                 | -r \^                             |
|                                   |                                   |
| 4                                 | -pe \^                            |
|                                   |                                   |
| 5                                 | -a sha512 \^                      |
|                                   |                                   |
| 6                                 | -len 4096 \^                      |
|                                   |                                   |
| 7                                 | -cy authority \^                  |
|                                   |                                   |
| 8                                 | -sv SjoukjeZaal.pvk \^            |
|                                   |                                   |
| 9                                 | SjoukjeZaal.cer                   |
|                                   |                                   |
| 10                                | pvk2pfx.exe \^                    |
|                                   |                                   |
| 11                                | -pvk SjoukjeZaal.pvk \^           |
|                                   |                                   |
| 12                                | -spc SjoukjeZaal.cer \^           |
|                                   |                                   |
| 13                                | -pfx SjoukjeZaal.pfx \^           |
|                                   |                                   |
| 14                                | -po Test123                       |
+===================================+===================================+

After following the steps from the article the below certificates are created:

  ---------------------------------------------------------------------------------------------------------------------
  **Type**                            **Description**
  ----------------------------------- ---------------------------------------------------------------------------------
  sjoukjezaal.cer                     Root certificate

  sjoukjezaal.pfx                     Client certificate with private key. (the password for this file is "Test123″).
  ---------------------------------------------------------------------------------------------------------------------

## Installing the certificates in the appropriate certificate stores

Next is installing the certificates.

- Click **Start**, click **Run** and select **mmc.exe** to open the Microsoft Management Console.

- Click the **File** Menu and select **Add/Remove Snap-in.**

- Select **Certificates** and click the **Add** button.

- Now you have to make a selection in which store you want to install the certificates.

![](./Certificates in BizTalk 2013 Part 1_ How To Install SSL Certificates in the Certificate store/e5ce42b85bf81d0fb357204b9cba67368664e592.png "BizTalk-Certificates-SSL1"){width="3.125in" height="2.28125in"}

The below table shows in which store to install the SSL certificates so BizTalk can use it to encrypt the messages:

The In-Process Host account described in the table below can be obtained by opening the BizTalk Administration Console -\> Host Instances and then check under which account the Host-Instance is running. For installing the certificate, log on to the server with the BizTalk Service account, open MMC and choose My User Account.


+-----------------------------------+--------------------------------------------------------------------------+
| **Certificate**                   | **Store**                                                                |
+===================================+==========================================================================+
| sjoukjezaal.cer                   | - Trusted Root CA (Local machine)                                        |
|                                   |                                                                          |
|                                   | - Trusted People (Local machine)                                         |
|                                   |                                                                          |
|                                   | - Other People (Local machine)                                           |
|                                   |                                                                          |
|                                   | - Trusted Publisher (BizTalk Service Account -- In-Process Host account) |
+-----------------------------------+--------------------------------------------------------------------------+
| sjoukjezaal.pfx                   | - Personal (local machine)                                               |
|                                   |                                                                          |
|                                   | - Personal (Logged in user)                                              |
|                                   |                                                                          |
|                                   | - Personal (BizTalk Service Account -- In-Process Host account).         |
+-----------------------------------+--------------------------------------------------------------------------+

## Summary

In this article I explained how to install SSL certificates which can be used in your BizTalk Application to make a secure call to a third party (web) service. In the second part of this series I will explain how you can configure the BizTalk Send Port to use the certificates to create a secured channel using the WCF Adapter.

-- Sjoukje

