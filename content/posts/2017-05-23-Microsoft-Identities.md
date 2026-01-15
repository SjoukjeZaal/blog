---
title: "Microsoft Identities: What's new"
date: 2017-05-23
---

At Build conference, a lot of new features were released. And of course,
also in the Microsoft Identity space. This article will provide an
overview of all the awesome new features that were covered there.

## Azure Active Directory v2.0 Endpoint

The v2.0 endpoint allows developer to write apps that accept sign in
from both Microsoft Accounts and Azure AD accounts, using one single
authentication endpoint.

When your application makes a call to the Microsoft Graph, additional
functionality and data will be available for Azure AD users. For
instance, data from SharePoint and Microsoft Teams. But for reading a
user's mail, or retrieving contacts, the code is exactly the same for
both Microsoft and Azure AD accounts.

For more information about the v2.0 endpoint, check out the
[overview](https://docs.microsoft.com/en-us/azure/active-directory/develop/active-directory-appmodel-v2-overview).
However, there are some
[limitations](https://docs.microsoft.com/en-us/azure/active-directory/develop/active-directory-v2-limitations)
to be aware of.

## New Application Registration Portal

To register an app that works with the v2.0 endpoint, you must use the
new application registration portal:

<https://apps.dev.microsoft.com>

![](media/image1.png)

## One Application Middleware

In .Net Core 2.0 (preview), there is only one application middleware
using different handlers for OpenID Connect, Cookies, etc. In the near
future (approximately 1 or 2 weeks), this will be released for mobile
applications as well.

## Production-Ready MSAL Preview

At Build 2016 the first developer preview of the Microsoft
Authentication Library (MSAL) was released for .NET. One year later,
this SDK is now production ready and enhanced with MSAL iOS, MSAL
Android and MSAL JavaScript.

MSAL is the successor of ADAL and works with Azure AD v2. This means,
using this SDK, you can also log in using work & school accounts,
personal accounts and Azure B2C.

For a sample using MSAL, check the following site:
<https://azure.microsoft.com/nl-nl/resources/samples/active-directory-dotnet-webapp-openidconnect-v2/>

## Microsoft Graph

The number of data sets that are available through the Microsoft Graph
are now increased:

- The SharePoint sites API, Planner API and OneNote APIs are now
  available in the Microsoft Graph v1.0 endpoint.

- The Microsoft Teams APIs, the New Insights APIs, the refreshed
  SharePoint list APIs and the Office Reporting APIs are now available
  in the Microsoft Graph beta endpoint.

### Delta Query

Delta query enables applications to discover newly created, updated or
deleted data without performing a full read with every request. Delta
query is available for Users, Groups, Messages, Mail Folders, Calendar
Events, Personal Contact, Contact Folders and Drives.

For more information, check the Delta Query
[overview](https://developer.microsoft.com/en-us/graph/docs/concepts/delta_query_overview).

### New Webhooks

Applications can already subscribe to and receive notifications from
several resources including messages, events, contacts, group
conversations and drive root items.

Now, new subscriptions to Azure AD Users and Groups and additional
support for Outlook.com resources were introduced.

For more information on webhooks, check the following site:
<https://dev.office.com/blogs/guide-to-office-at-build-2017>

### Custom Data Extensions

You can extend the Microsoft Graph with your custom data. For instance,
you can add your favorite color to your user profile data using the
Graph. This new feature is now production-ready.

For more information, check the following article:
<https://dev.office.com/blogs/adding-customer-data-to-resources-in-Microsoft-Graph-preview>

### Batching

Using JSON batching requests, multiple requests to the Microsoft Graph
can now be combined in a single HTTP call.

More information will be posted in the upcoming weeks at
<https://developer.microsoft.com/en-us/graph/>

## Azure Active Directory B2C

Azure Active Directory B2C, makes it easy for customers to sign in to
applications using their existing social accounts (now Twitter as well).
Besides that, you can also add your own.

For Azure AD B2C the following new features are available:

- MSAL (on all available platforms);

- The ASP.NET middleware (OpenId Connect) works with B2C;

- New web app templates for Visual Studio.

- Create custom identity policies.

## Wrap Up

Lots of awesome new features regarding Microsoft Identities were
released at build this year. I've tried to describe them all in this
article but in case I've forgotten one, please let me know. I will then
add them to the above overview.

Hopefully you are just as excited about this new features as I am!

-Sjoukje
