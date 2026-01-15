---
title : "SharePoint 2013 Workflows -- Introduction"
date : 2016-11-08
---

In this series of posts I will take a deep dive on creating Workflows in
SharePoint 2013. As I am focusing on Microsoft integration in my daily
work and had to create some workflows for the SharePoint 2013 platform
in the last months, I have spent a lot of time doing research on this
subject.

Workflow has changed a lot in SharePoint 2013 (in a positive way) and in
upcoming posts I will provide you with some product insights as well as
samples you can use in your own projects. I will stick to Microsoft Best
Practices and give some more information on (workflow) Architecture,
reusability and security regarding this topic.

I will cover the following topics over the series:

1.  SharePoint 2013 Workflows

2.  SharePoint 2013 Workflows Part 1: Workflow Manager 1.0 Architecture

3.  SharePoint 2013 Workflows Part 2: Installing and Configuring The
    Workflow Manager.

4.  SharePoint 2013 Workflows Part 3: Using the SharePoint 2013 REST API
    in a Visual Studio 2013 Workflow.

5.  SharePoint 2013 Workflows Part 5: Using Secure WCF Services in a
    Visual Studio workflow.

In the first post of this series I will start off by discussing the
Workflow Manager.

# SharePoint 2013 Workflow Part 1: Workflow Manager Architecture

This is the first part in a series of posts about SharePoint 2013
Workflows. In this post we will discuss the architecture and
improvements of the new Workflow Model in SharePoint 2013.

Note that Office 365 is using this same Workflow Architecture only
Microsoft handles all the installation and configuration regarding the
Workflow Manager.

## Workflow Architecture 

Besides the SharePoint 2010 workflow model, which is still part of the
SharePoint 2013 installation, Microsoft introduced a new Workflow
architecture in SharePoint 2013 (and Office 365).

SharePoint 2013 is now using Workflow Manager 1.0 which acts as the host
for the workflow runtime, is hosting the latest version of Windows
Workflow Foundation (WF 4.5) and unlike the 2010 Workflow model, is
totally decoupled from SharePoint using OAuth secured WCF Services.
SharePoint 2013 is configured to send all related tasks to the workflow
manager to execute workflows using these services.

Workflow Manager 1.0 consists of 3 components:

**Workflow Frontend**

This is a web service that receive calls from an external application,
SharePoint in our case. Calls that are made by SharePoint to the
Workflow Service are then logged in the Service Bus.

**Service Bus**

The Service bus uses the Pub/Sub model and will publish the message
which is send to the service to all the subscribers.

**Workflow Backend**

The Workflow Backend service is a Windows Service and it is responsible
for processing the actual Workflow. It communicates with SharePoint by
using the SharePoint REST API.

Figure 1: Workflow Manager Architecture (copied from MSDN)

## How it works

After installing and configuring the workflow Manager a Workflow Manager
farm is created within SharePoint which contains all of the necessary
databases to store workflows and services to communicate with the
Workflow Manager Frontend Service. The Workflow Manager farm is
configured by SharePoint as an App.

When a workflow is published, SharePoint only stores a copy of the
workflow, the actual workflow is going to be send to the workflow
manager farm which will handle the execution of the workflow. By the
time the workflow needs to be executed, SharePoint tells the Workflow
Manager farm to execute the workflow and adds some extra context
information to the call, like which start-up parameters to use and what
SharePoint list it has to execute on. This call is send to the Workflow
Manager Frontend and will be queued in the Workflow Manager Service Bus
until the Workflow Manager Bacnkend process is picking it up to execute.

Workflows that are executed by the Workflow Manager Backend will need to
communicate with SharePoint on several occasions, for instance to send
emails, store items in lists, creating tasks and retrieve other relevant
information for the workflow. This communication is done by using the
SharePoint REST API and it uses S2S high trust authentication.

## Improvements

Workflow Manager uses Windows Workflow Foundation 4.5. This means that
you can only create declarative workflows in SharePoint 2013 and you are
not allowed anymore to add custom code to your workflow.

Workflow Manager includes a HTTP Send activity which can make Web
Service calls and REST / OData calls. The business logic will now need
to be added to a custom web service which can be called from the HTTP
Send activity. This activity is also added to SharePoint Designer. In my
upcoming posts I will provide you with some samples on how to do this.

By moving the business logic from out of SharePoint to custom services,
you can reuse this logic in multiple applications (like mobile apps,
BizTalk, custom applications, etc.) and It can be hosted on premise or
for instance, in Windows Azure.

Workflow Manager 1.0 can also be installed on multiple servers, which
don't need to have a SharePoint installation on it. This means that you
can easily scale out your workflow environment and you don't have to
deal with additional SharePoint licensing costs.

## Summary

Microsoft has made a lot of great improvements with this new Workflow
Model. The Workflow Manager is scalable and robust and because it uses
the most recent version of the workflow model, it can integrate with
almost everything.

Below are some interesting sites about workflow manager:

MSDN:
<http://msdn.microsoft.com/en-us/library/jj193528%28v=azure.10%29.aspx>

Workflow Team Blog: <http://blogs.msdn.com/b/workflowteam/>

For more information on Workflow Foundation 4.5 I recommend the book Pro
WF 4.5: <http://www.amazon.com/Pro-WF-4-5-Bayer-White/dp/143024383X> or
you can visit:

<http://msdn.microsoft.com/en-us/library/hh305677%28v=vs.110%29.aspx>

# SharePoint 2013 Workflows Part 2: Installing and Configuring The Workflow Manager

In this post I will guide you through installing and configuring the
Workflow Manager for SharePoint 2013.

This is the second post in the following series:

1.  [SharePoint 2013 Workflows:
    Introduction](http://www.sjoukjezaal.com/blog/2014/05/sharepoint-2013-workflows-introduction/)

2.  [SharePoint 2013 Workflows Part 1: Workflow Manager 1.0
    Architecture](http://www.sjoukjezaal.com/blog/2014/05/sharepoint-2013-workflow-part-1-workflow-manager-architecture/)

3.  SharePoint 2013 Workflows Part 2: Installing and Configuring The
    Workflow Manager.

4.  SharePoint 2013 Workflows Part 3: Using the SharePoint 2013 REST API
    in a Visual Studio 2013 Workflow.

5.  SharePoint 2013 Workflows Part 5: Using Secure WCF Services in a
    Visual Studio workflow.

Before starting the installation of the Workflow Manager, make sure that
at least the SharePoint 2013 March Public Update (KB 2767999) is
installed on toy SharePoint Server:
<http://support.microsoft.com/default.aspx?scid=kb;EN-US;2767999>. This
update solves some bug fixes and added extra support for the Workflow
Manager and workflow development in Visual Studio.

## Installing the Workflow Manager

It is best to install the Workflow Manager using the Web Platform
Installer tool. This will automatically install all the prerequisites
like Service Bus 1.0.

You can download Workflow Manager 1.0 from here:
<http://www.microsoft.com/en-us/download/details.aspx?id=35375>.

You can also download the Web Platform Installer Tools Command Line for
offline installation:

<http://www.iis.net/learn/install/web-platform-installer/web-platform-installer-v4-command-line-webpicmdexe-rtw-release>

When workflow manager is installed, the Web Platform Installer will also
install the workflow Manager Client 1.0.

SharePoint uses this client to communicate with the Workflow Manager.

If the Workflow Manager is installed on a separate server, this client
will still need to be installed (manually) on the SharePoint Server. You
can download the Workflow Manager Client 1.0 from the same website as
the Workflow Manager.

The Web Platform installer will also automatically install the Workflow
Manager Tools 1.0 for Visual Studio if Visual Studio is already
installed on the system.

Run the Workflow Manager installer. This will launch the Web Platform
Installer and click "**Install"** and follow the installation steps.


Figure 1: Installing Workflow Manager 1.0 using the Web Platform
installer.

## Configuring the Workflow Manager

After the installation the configuring screen is automatically opened.
This configuration wizard creates the databases and Workflow Manager
farm and provisions the Service Bus. It also provides a PowerShell which
can be used to configure other server installations as well.

Figure 2: Configuring Workflow Manager 1.0.

For this installation choose **Configure Workflow Manager With Custom
Settings** and in the next screen enter the name of the SQL Server
Instance, you can change the database name or leave the default if you
like, and you can test the connection.

Figure 3: Configuring Workflow Manager 1.0.

If you scroll down you can configure the service account. Best Practice
is to create a new Service account for the workflow manager.

Figure 4: Configuring Workflow Manager 1.0.

In the next section add a certification Generation Key and confirm. You
need this key if you want to join extra servers to the workflow farm so
memorize it!

Figure 5: Configuring Workflow Manager 1.0.

Scroll down again and in the next section you can configure the ports.
Leave the default settings and for developing purposes you can check the
**Allow Workflow Management over HTTP on this Computer** box.

Figure 6: Configuring Workflow Manager 1.0.

Click on the right arrow to go to the next screen to configure the
Service Bus.

Here you can provide the database settings for the Service Bus. I used
the default settings here for my development environment.

Figure 7: Configuring Workflow Manager 1.0.

Here you can provide the Service Account Settings. You can choose the
same Service Account credentials as you used for the Workflow Manager or
add different credentials. The same for the Certificate key, I used the
same key as I entered for the Workflow Manager.

Figure 8: Configuring Workflow Manager 1.0.

Leave the default ports in the next section and click the right arrow.

Figure 9: Configuring Workflow Manager 1.0.

The next screen provides you with an overview of the settings. Review
them and Click **Apply.** You can also download the PowerShell Script
here for installing.

If everything went right you will see the following screen after the
installation:

Figure 10: Configuring Workflow Manager 1.0.

After installing and configuring the workflow manager and creating the
SharePoint Manager Farm you need to connect both environments to
communicate with each other.

This is done by running a PowerShell script on the SharePoint 2013 farm.
It configures the SharePoint farm to send all workflow related tasks to
the Workflow Manager Frontend Service.

Open the SharePoint Management Console and type the following Powershell
cmdlet:

**For communicating over HTTP (only recommended for a development
environment)**

Register-SPWorkflowService --SPSite <http://sp-siteurl>
--WorkflowHostUri <http://workflowhostURI:12291> --AllowOAuthHttp

**For communicating over HTTPS**

Register-SPWorkflowService --SPSite [http://
sp-siteurl](http://sharepointsite) --WorkflowHostUri
<https://workflowhostURI:12290>

To Retrieve the Workflowhost Url open IIS, look for the Workflow
Management Site check the settings.

After running this command the Workflow Manager is connected to the
SharePoint farm and you can begin to create custom Workflows.

Microsoft released a Workflow Manager Best Practice analyzer which scans
your Workflow Environment and provides best practices on installing and
configuring. For more information see this site:
<http://msdn.microsoft.com/library/azure/jj730571%28v=azure.10%29.aspx>

## Updating Workflow Manager 1.0

The Workflow Manager Service and the Service Bus are released prior to
the RTM release of SharePoint 2013. Since then, some things changed and
some bugs where found and resolved in below updates.

Install the Azure Services February 2013 Cumulative Updates:

Cumulative Update for Service Bus 1.0 (KB2799752) :
<http://www.microsoft.com/en-us/download/confirmation.aspx?id=36794>

Cumulative Update for Workflow Manager 1.0 (KB2799754) :
<http://www.microsoft.com/en-us/download/details.aspx?id=36800>

## Summary

In this article I explained how to install and configure the Workflow
Manager 1.0. The steps are already explained in several other articles
on the internet, but in most cases some settings and steps are left out
of it, so I wasn't able to connect the workflow manager to the
SharePoint farm.

Also running the SharePoint updates before installing the Workflow
Manager and installing the Windows Azure February updates afterwards is
a critical step, which will solve a lot of problems using the SharePoint
2013 Workflow Manager and creating Workflows.

In my next post I will actually create a SharePoint 2013 Workflow......

# SharePoint 2013 Workflows Part 3: Using the SharePoint 2013 REST API in a Visual Studio 2013 Workflow

# 

In this post I will create a Custom Workflow in Visual Studio that uses
the SharePoint REST API to create a new list item in a SharePoint list
site.

This is the second post in the following series:

1.  [SharePoint 2013 Workflows:
    Introduction](http://www.sjoukjezaal.com/blog/2014/05/sharepoint-2013-workflows-introduction/)

2.  [SharePoint 2013 Workflows Part 1: Workflow Manager 1.0
    Architecture](http://www.sjoukjezaal.com/blog/2014/05/sharepoint-2013-workflow-part-1-workflow-manager-architecture/)

3.  SharePoint 2013 Workflows Part 2: Installing and Configuring The
    Workflow Manager.

4.  SharePoint 2013 Workflows Part 3: Using the SharePoint 2013 REST API
    in a Visual Studio 2013 Workflow.

5.  SharePoint 2013 Workflows Part 4: Using Secure WCF Services in a
    Visual Studio workflow.

In this scenario a List item is created in a vacation requests list.
After creating the request item, the workflow is automatically triggered
to create a copy of this item in the Approved Vacation Requests list.

Both the Vacation Request list and the workflow are created as an app in
SharePoint which means they are stored in the App web. The Approved
Vacation list is a list created using a Farm solution and is stored in
the host web.

The workflow in the app needs to create a list item in the Host Web
under the workflow manager context and not the user context. In this
case you don't need to give users permissions to create the list items,
you only have the give the app the appropriate permissions. I think this
is one of the biggest advantages using apps and that's why I include
this in my post.

In a real world scenario, the request probably will need to be approved
or rejected by a manager, but for this demo this step is not required
because I only want to show how to use the REST API in a workflow and to
create a new list item in the host web.

## Setting Up the Visual Studio Project

Create a new Visual Studio Project, choose the **App for SharePoint**
project and give it a name.

Select **SharePoint-Hosted** app and fill in a SharePoint Development
Site Url.


After the project is created, add a new list to the project. Call the
list **Vacation Requests.**

Create another SharePoint project choose SharePoint Solutions -\> Empty
SharePoint Project and call it **HostWebApprovedVacationRequests**.
Deploy it as a Farm solution Project. Add a new list to the new Project
and call it **ApprovedVacationRequests.** This list will be deployed to
the host web.

Deploy the Solution.

Add the below fields to both the lists.

Change the start page for the App to point to the default Url of the
Vacation Request list. Open the **AppManifest.xml** and change the start
page.

The App will create the list in the Host web and not in the App web so
you have to change the App permissions so it will have full control on
the host web.

The last step for setting up the project is to add a workflow. Name it
**CreateListItemWorkflow**.

In the next screen select **List Workflow**, click next and select the
Vacation Requests list to associate the workflow to. Create a new
History and Task list.

Select the option that the workflow automatically needs be started when
an item is created.

The workflow is created and the below items are added to the project.

## Creating the Workflow

So now the project is created the next step is to create the actual
Workflow. First I will add a few variables I will need throughout the
project.

Add the below variables. The first are for the listitem fields, the
SecurityDigest and the WMSecurityToken are both used for authenticating
to the REST API.

You can get a reference of the SecurityToken type from the below
Assembly.

### Get ListItem Properties

Add an Sequence activity to the Root Activity and call it **Get Vacation
Request Properties.** Add a **SetUserStatus** Activity to the sequence
and add the description: **Collecting Data from the List Item.** The
**SetUserStatus** will create an internal status property which will be
displayed on the Workflow Status Page.

Add a **LookUpSPListItem** activity below the SetUserStatus Activity and
create a new variable **ListRequestItemProperties** of the type
DynamicValue. This type is referenced in the Microsoft Activity Assembly
under Microsoft Activities -\> DynamicValue.

The DynamicValue is a new data type which understands JSON, so when you
make a call to a WCF using the HTTP Send Activity, it return s an object
of the type DynamicValue. You can then use an activity to extract data
from this variables using an XPATH Expression.

Rename the **LookUpSPListItem** to Get List Item Request Properties and
add the following properties:

- ItemId = (currentitem)

- ListId = (currentlist)

- Result = ListRequestItemProperties


Add an **GetDynamicValueProperties** Activity, call it Extract ListItem
Properties, and add the ListRequestItemProperties as the source in the
property pane. Click on the ellipsis button next to properties and add
the items to the properties box like the items in the below figure:

Add a **WriteToHistory Activity** and add the message provided below:

### Retrieve the Root Site Collection Url

Add a new variable and call it HostWebUrl. In the next step we are going
to obtain the Url of the Web where the **Approved Vacation Requests**
list is stored**.**

Add a new sequence below the Get Vacation Request Properties sequence
and call it Get Host Url. Add a SetUserStatus Activity to it and add the
description "Retrieving Host Url".

Add the variables in the below figure:

These variables are scoped at the Get Host Url because they are only
needed for this sequence.

To retrieve the Host Web Url a couple of calls need to be made to the
REST API. First we need the Url of the **App web**, then we are going to
use the REST API to get the properties of the current app web hosting
SPWeb (Host Web), then we retrieve the server relative url of this Host
web.

Add a WebUri Activity to the sequence and call it **GetAppWebUrl.**
Select the AppWebUrl as the result in the property pane.

Add a HTTPSend Activity and call it GetHostingWebProperties to get the
properties of the current site collection. Add the following properties:

- Method: POST

- Request Headers: Add the following request header:

  - Accept: "application/json;odata=verbose"

- Uri: AppWebUrl + \"/api/web/parentweb\"

- ResponseContent: GetHostSiteCollectionPropertiesResponse

Then add a GetDynamicValueProperty\<T\> activity to extract the Server
Relative Url from the response, select the type **String,** and call it
**Retract Host Web Relative Url.** Set the following properties:

- PropertyName: "d/ServerRelativeUrl"

- Result: [HostWebServerRelativeUrl]{.mark}

- Source: [GetHostWebPropertiesResponse]{.mark}

Add a **HTTPSend** Activity, call it **Get Host SiteCollection
Properties** and add the following properties:

- Method: GET

- Request Headers: Add the following request header:

  - Accept: "application/json;odata=verbose"

- Uri: AppWebUrl + [\"\_api/site\"]{.mark}

- ResponseContent: [GetHostSiteCollectionPropertiesResponse]{.mark}

Add a GetDynamicValueProperty\<T\> activity to extract the absolute Url
of the Host Site Collection, , select the type **String,** and call it
**Extract Host Site Collection Property** and add the following
properties:

- PropertyName: "d/Url"

- Result: [HostWebSiteCollectionUrl]{.mark}

- Source: [GetHostSiteCollectionPropertiesResponse]{.mark}

Finally add a Assign Activity to concat the HostWebSiteCollectionUrl and
the [HostWebServerRelativeUrl]{.mark} and store that in the HostWebUrl
Variable.

Add the following properties:

- Displayname: Get The Host Web Absolute Url

- To: HostWebUrl

- Value: [HostWebSiteCollectionUrl + HostWebServerRelativeUrl]{.mark}

Add a WriteToHistory activity and add the following message:

"The Host Web root url is: " + HostWebUrl

### 

### Security Digest

To submit an HTTP Post to the SharePoint REST API we need a Security
Digest. The next step in the workflow is to obtain this.

As I pointed out before, the workflow in the app needs to create a list
item in the Host Web under the workflow manager context. The user may
not have permissions to create a list item. To create a list item as the
workflow manager we need to pass along a OAuth Security token.

So to get this token add the GetS2SSecurityToken Activity below the Get
Host Url Sequence. Add the Following Properties:

- Displayname: Get Worfklow Manager Token

- Result: [WMSecurityToken]{.mark}

Now that we have the token we can obtain the security Digest. Add a new
Sequence and call it Get **SP Security Digest**. Add a new Variable and
call it **GetSecurityDigestReponse**, type DynamicValue.

Add an **HTTPSend** Activity and add the following properties:

- Method: POST

- Request Headers: Add the following request header:

  - Accept: "application/json;odata=verbose"

  - Content-Length: "0"

- SecurityToken: [WMSecurityToken]{.mark}

- Uri: [HostWebUrl + \"\_api/contextinfo\"]{.mark}

- ResponseContent: [GetSecurityDigestReponse]{.mark}

Add a GetDynamicValueProperty\<T\> activity of type String and add the
following properties:

- DisplayName: Get SP Security Digest

- PropertyName: "d/GetContextWebInformation/FormDigestValue"

- Result: [SecurityDigest]{.mark}

- Source: [GetSecurityDigestReponse]{.mark}

For Debugging add a WriteToHistoryList Activity to write the digest to
the histtorylist. Add the following message:

[\"SP Security Digest: \" + SecurityDigest]{.mark}

It is not recommended to add this line of code in production... ☺

### Create the new List Item

With the digest obtained we can create the new List Item.

Add a new Sequence to the Root and call it **Create List item.** Create
the following variables:

- CreateListRequestPayLoad

- CreateListResponseBody

Add a SetUserStatus Activity and the following description: [\"Create a
list item in the Host Web.\"]{.mark}

To Create the new list item we need to create the payload we are going
to send to the REST API using JSON. Add a BuildDynamicValue Activity and
add the following properties:

- DisplayName: Create new List Item Payload

- Result: [CreateListRequestPayLoad]{.mark}

- Properties:

Add an **HTTPSend** Activity and add the following properties:

- DisplayName: Create List Item

- Method: POST

- Request Content: [CreateListRequestPayLoad]{.mark}

- Request Headers: Add the following request header:

  - Accept: "application/json;odata=verbose"

  - Content-Type: "application/json;odata=verbose"

  - X-RequestDigest: [SecurityDigest]{.mark}

- SecurityToken: [WMSecurityToken]{.mark}

- Uri: [HostWebUrl +
  \"\_api/web/lists/GetByTitle('ApprovedVacationRequests\')/items\"]{.mark}

- ResponseContent: [CreateListResponseBody]{.mark}

### Deploying the Workflow

Now the workflow is created so we are going to deploy it to SharePoint.
If you did not already deployed the Farm feature do it now.

Set the Worfklow Projects as the Start-Up project and click F5.

Add a new Vacation Request to the list and
