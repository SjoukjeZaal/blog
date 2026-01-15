---
title : "Office 365: Setting up your development environment"
date : 2016-12-13
---

In this wiki article I give an overview on how to set up your
development environment for Office 365.

## Office 365 Developer Tenant

Before you can start coding, you need an Office 365 developer tenant.
You could sign up for a 1-year free developer subscription on:
<http://dev.office.com> . Navigate to the website, follow the
instructions and sign up. You will receive a welcome email with a link
to sign up for an Office 365 development tenant. First Release will be
enabled already for this tenant.

![](media/image1.png)

You could also create an Office 365 developer tenant using your MSDN
subscription (Premium and Ultimate).

The Office 365 development tenant is for developing and testing purposes
only.

## Visual Studio

For a development environment, you can choose between Visual Studio Code
or Visual Studio 2015. Visual Studio Code is the free open source tool
Microsoft developed. Check the download section for downloading VSCode.

For most development tasks VSCode will be suitable. however, if you want
to use the Office Development tools for Visual Studio, you need to
install Visual Studio 2015 with update 2. The Office Development tools
will provide some project templates that give you a head start on
developing SharePoint Add-ins or Office Add-ins. Besides Office 365
development, Visual Studio will provide project templates targeting the
old on premise development model as well (SharePoint and VSTO
solutions). So, you should focus on the templates displayed in the image
below:

![C:\\Users\\Administrator\\AppData\\Local\\Microsoft\\Windows\\INetCache\\Content.Word\\Office354_Dev1.png](media/image2.png){width="6.5in"
height="4.489583333333333in"}

In VSCode you have to write almost everything from scratch. There are
some helpful open source tools, but it will not give you the same
development experience that Visual Studio 2015 will give.

## Office 365 Developer Patterns & Practices Tools

Besides the Microsoft tools there is a community project called Office
365 Developer Patterns & Practices (PnP). The focus of PnP is to provide
training, guiding, articles and solutions to support the community.

One of the key elements PnP is offering is a framework which makes it
easy to develop Office 365 solutions. This is an open source library on
GitHub called [SharePoint PnP
Core](https://github.com/SharePoint/PnP-Sites-Core) . You can include
this library in all your Visual Studio projects using a NuGet package.
After installing this NuGet package you can call common CSOM/REST
operations using [Extension
Methods](https://msdn.microsoft.com/en-us/library/bb383977.aspx).

![](media/image3.png)

The PnP Core team also provides the [PnP Remote Provisioning
Engine](https://github.com/SharePoint/PnP/tree/master/Samples/Provisioning.Framework.Console).
With this engine you can provision SharePoint on premise and SharePoint
Online artifact using SharePoint CSOM instead of the 'old' SharePoint
feature framework.

Another solution which is provided by the PnP Core Team is the [PnP
Powershell Cmdlets](https://github.com/SharePoint/PnP-PowerShell). This
solution contains a library of PowerShell commands that allows you to
perform provisioning and management actions towards SharePoint on
premise and SharePoint Online.

You can download a .msi setup package from GitHub to install the PnP
Powershell Cmdlets. If your operating system is Windows 10 or Windows
Server 2016 (or have PowerShell 3.0 installed), you can install the
Cmdlets from within your PowerShell Command line.

SharePoint Online:

Install-Module SharePointPnPPowerShellOnline -AllowClobber

SharePoint 2016

Install-Module SharePointPnPPowerShell2016 -AllowClobber

SharePoint 2013

Install-Module SharePointPnPPowerShell2013 -AllowClobber

![](media/image4.png)

## SharePoint Framework

On May 4, 2016 Microsoft Announced the SharePoint Framework, which
allows you to develop client side web parts and applications using
JavaScript.

For development using the SharePoint Framework, you can use any kind of
code editor as long as you can use it to write JavaScript, TypeScript
and Node.js.

To install the latest version of the Node.js runtime, navigate to the
[Node.js website](https://nodejs.org/en/). After installing, update the
NPM package manager to the latest version using the node.js command
line. Type the following command:

npm install -g npm

![](media/image5.png)

## Wrap-up

This concludes setting up your development environment for Office 365.
Below is a list for further reading. You should definitely check these
out. There is a lot more information on PnP and the SharePoint Framework
there.

## Further Reading

- <https://dev.office.com/sharepoint/docs/spfx/set-up-your-developer-tenant>

- [SharePoint / Office 365 Dev Patterns & Practices
  (PnP)](https://dev.office.com/patterns-and-practices)

- [SharePoint PnP
  Core](https://github.com/SharePoint/PnP-Sites-Core/tree/master/Core)

- [PnP Provisioning
  Framework](https://msdn.microsoft.com/en-us/pnp_articles/pnp-provisioning-framework)

- [PnP Provisioning
  Engine](https://channel9.msdn.com/blogs/OfficeDevPnP/PnP-Provisioning-Engine-Introducing-PnP-file-type-for-template-handling)

- [Introduction to Office 365 Dev PnP Provisioning
  Engine](https://dev.office.com/blogs/introduction-to-office-365-dev-pnp-provisioning-engine)

- [What you should learn to prepare for developing solutions on the
  SharePoint
  Framework](https://blog.mastykarz.nl/learn-sharepoint-framework/)

## 

## Downloads

## 

- [Visual Studio Code](https://code.visualstudio.com/)

- [Office Development Tools for Visual Studio
  2015](http://aka.ms/getlatestofficedevtools)

- [SharePoint PnP Core](https://github.com/SharePoint/PnP-Sites-Core)

- [PnP Remote Provisioning
  Engine](https://github.com/SharePoint/PnP/tree/master/Samples/Provisioning.Framework.Console)

- [PnP Powershell Cmdlets](https://github.com/SharePoint/PnP-PowerShell)

- [Node.js](https://nodejs.org/en/)
