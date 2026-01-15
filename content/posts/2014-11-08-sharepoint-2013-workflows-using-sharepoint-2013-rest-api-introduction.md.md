---
title: "SharePoint 2013 Workflows - Using The SharePoint 2013 REST API: Introduction"
date: 2014-11-08
---

In this series of posts I will focus on leveraging the Out-of-the-Box SharePoint REST API in visual studio workflows.

I will provide some samples on how to use this REST API, which includes making calls to the REST Services as well as retrieving Security Tokens to authenticate to SharePoint.

Besides that I will create some Custom Activities which can be downloaded and used in your own SharePoint Workflow projects.

The following topics are included in this series:

1.  SharePoint 2013 Workflows - Using The SharePoint 2013 REST API: Introduction

2.  SharePoint 2013 Workflows -- Retrieving a Security Digest for your Workflow

# SharePoint 2013 Workflows - Using The SharePoint 2013 REST API Part 2: Creating a List item 

In this post I will create a Custom Workflow in Visual Studio that uses the SharePoint REST API to create a new list item in a SharePoint site.

In this scenario a List item is created in a vacation requests list. After creating the request item, the workflow is automatically triggered to create a copy of this item in the Approved Vacation Requests list.

Both the lists and the workflow are created as an app in SharePoint. For creating an item in the Approved Vacation list the SharePoint REST API is leveraged in the custom Workflow.

In a real world scenario, the request probably will need to be approved or rejected by a manager, but for this demo this step is not required because I only want to show how to use the REST API in a workflow.

## Setting Up the Visual Studio Project

Create a new Visual Studio Project, choose the **App for SharePoint** project and give it a name.

Select **SharePoint-Hosted** app and fill in a SharePoint Development Site Url.


After the project is created, add a new list to the project. Call the list **VacationRequests.** Add another list to the project and call it **ApprovedVacationRequests.**

Add the below fields to both the **Vacation Request** and the **ApprovedVacationRequests** list.

Change the start page for the App to point to the default Url of the **Vacation Request** list. Open the **AppManifest.xml** and change the start page.

The last step for setting up the project is to add a workflow. Name it **CreateListItemWorkflow**.

In the next screen select **List Workflow**, click next and select the Vacation Requests list to associate the workflow to. Create a new History and Task list.

Select the option that the workflow automatically needs be started when an item is created.

The workflow is created and the below items are added to the project.

## Creating the Workflow

So now the project is created the next step is to create the actual Workflow. First I will add a few variables I will need throughout the project:

Request Title : Type String

First_Date_Of_Leave : Type String

Last_Date_Of_Leave : Type String

Additional_Information : Type String

### Get ListItem Properties

Add an Sequence activity to the Root Activity and call it **Get Vacation Request Properties.** Add a **SetUserStatus** Activity to the sequence and add the description: **Collecting Data from the List Item.** The **SetUserStatus** will create an internal status property which will be displayed on the Workflow Status Page.

Add a **LookUpSPListItem** activity below the SetUserStatus Activity and create a new variable **ListRequestItemProperties** of the type DynamicValue. This type is referenced in the Microsoft Activity Assembly under Microsoft Activities -\> DynamicValue.

The DynamicValue is a new data type which understands JSON, so when you make a call to a WCF using the HTTP Send Activity, it return s an object of the type DynamicValue. You can then use an activity to extract data from this variables using an XPATH Expression.

Rename the **LookUpSPListItem** to **Get List Item Request Properties** and add the following properties:

- ItemId = (currentitem)

- ListId = (currentlist)

- Result = ListRequestItemProperties

Add an **GetDynamicValueProperties** Activity, call it **Extract ListItem Properties** and add the ListRequestItemProperties as the source in the property pane. Click on the ellipsis button next to properties and add the items to the properties box like the items in the below figure:

Add a **WriteToHistory Activity** and add the message provided below:

### Create the new List Item

Now we can create a new list item in the Approved Vacation Request list using the REST API.

Add a new Sequence to the Root and call it **Create List item.** Create the following variables:

- CreateListRequestPayLoad : Type DynamicValue

- CreateListResponseBody: Type DynamicValue

- AppWebUrl : Type String

Add a WebUri Activity to the sequence and call it **GetAppWebUrl.** Select the AppWebUrl as the result in the property pane.

Add a SetUserStatus Activity and the following description: [\"Create a list item in the]{.mark} Approved Vacation List".

To Create the new list item we need to create the payload we are going to send to the REST API using JSON. Add a BuildDynamicValue Activity and add the following properties:

- DisplayName: Create new List Item Payload

- Result: [CreateListRequestPayLoad]{.mark}

- Properties

Add an **HTTPSend** Activity and add the following properties:

- DisplayName: Create List Item

- Method: POST

- Request Content: [CreateListRequestPayLoad]{.mark}

- Request Headers: Add the following request header:

  - Accept: "application/json;odata=verbose"

  - Content-Type: "application/json;odata=verbose"

- Uri: [AppWebUrl + \"\_api/web/lists/GetByTitle('ApprovedVacationRequests\')/items\"]{.mark}

- ResponseContent: [CreateListResponseBody]{.mark}

Figure 21: Workflow Model.

### 

### Deploying the Workflow

Now that the workflow is finished we can deploy it to SharePoint. Click F5. Add a new Vacation Request to the list and Click Save.

