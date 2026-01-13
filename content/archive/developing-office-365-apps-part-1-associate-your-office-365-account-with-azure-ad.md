---
title: "Developing Office 365 Apps Part 1 -- Associate your Office 365 account with Azure AD"
date: 2017-11-08
---

First, you need to download and install the Office 365 Developer Tools:
<https://www.visualstudio.com/en-us/features/office-tools-vs.aspx>

This is the first part in the series on developing an Office 365 app. In
this article I will explain how you can associate your Office 365
account with Azure AD, which is the first step in Developing Office 365
Apps.

In my case I've created an Office 365 Developer account using my MSDN
Premium subscription (Ultimate will do as well). This means that you
will get a Microsoft Office 365 Enterprise E3 Developer account for
free. You can also register for a trial account or buy an Office 365
license. For an overview of the different Office 365 versions you can
check my post: [Detailed Office 365 version
Comparison](http://puttysoft.net/index.php/2016/01/27/detailed-office-365-version-comparison/)

After you created the account, you can associate your account with your
existing Microsoft Azure subscription.

1.  Log on to the Azure Management Portal with your existing Azure
    credentials.

2.  Select **Active Directory -- Directory -- New**

3.  Select **Directory -- Custom Create**

4.  In the Directory Drop down, select **Use existing directory** and
    check the box **I am ready to be signed out now.** Then click the
    checkmark in the lower right corner.

5.  You are signed out. Now, log in with your Office 365 credentials.
    You will be prompted whether you will use your directory with Azure.

6.  Click **continue** and then click **sign out now**.

7.  Again, sign in with your Azure Credentials and you will see that the
    Office 365 directory is added to your subscription.

## Wrap-up

This is the first article in a series on Office 365 development. There
will be more, so stay tuned!
