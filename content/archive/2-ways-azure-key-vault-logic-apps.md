---
title: "2 Different Ways of Using Azure Key Vault in Your Logic Apps"
date: 2017-10-25
---

# 2 different ways of using Azure Key Vault in your Logic Apps

Security is key nowadays and this means that you should secure your applications to the max. Azure Key Vault offers you a way to safely store your credentials, certificates and hardware security modules in Azure. These values can also be used inside your custom applications, like in web applications, Azure Functions, and Azure Logic Apps.

Azure Logic Apps offers an out-of-the-box connector that you can use to retrieve values easily and use them in your Logic App. However, there is a caveat here. You cannot use Managed Identities to access the Key Vault using the connector. Managed Identities are service principals in Azure Active Directory that are used to connect different services. You can use the identity to authenticate to any service that supports Azure AD authentication, including Key Vault, without any credentials in your code.

In this blog, I'm going to show you two different ways of connecting to Azure Key Vault from your Logic App. You will get an overview of the differences when using both the approaches from a security perspective. The Logic App is used to create an external user in Azure AD B2B. Therefore, it needs an Azure AD app registration that has permissions to access the Microsoft Graph for creating external users in our Azure AD B2B tenant. The values for accessing the Microsoft Graph, such as the Azure AD tenant ID, App ID, and App secret are stored inside the Key Vault and retrieved in the Logic App.

Before starting this demo, I already created an app registration in Azure AD, added delegated permissions to access the Invitation API of the Microsoft Graph and copied the Azure AD tenant ID, App ID, and App secret to notepad. For more information on how to register an Azure AD app and set the required permissions, you can refer to this post: <https://sjoukjezaal.com/azure-b2b-sharepoint-online-solution-using-powerapps-flow-and-the-graph-api/>. I also already deployed a Logic App called **KeyVaultConnector** in a new resource group called **KeyVaultConnectorGroup.** I used the **Recurrence** trigger for the Logic App. If you want more information on how to create a Logic App, you can refer to the following post: <https://docs.microsoft.com/en-us/azure/logic-apps/quickstart-create-first-logic-app-workflow>.

Now that we have everything in place, we can set up our Key Vault.

## Setting up the Key Vault

To set up the Key Vault, navigate to the Azure portal, select Cloud Shell in the top right corner, select Bash and add the following line of code:

- Create the Key Vault in the same resource group as where the Logic App is deployed (make sure you set an unique name for the Key Vault):

- After creation, we can add the values of the Service Principal to it. For this, navigate to the Azure Key Vault overview page in the Azure portal.

- In the left menu, under settings select **Secrets.** In the top menu, click **+ Generate/import.** There you can create the secrets for the service principal. Make sure **Manual** is selected for and add the values for the Service Principal:
- After adding the three values, the list will look like the following:

Now that we have setup the Key Vault, we can create our Managed Identity for the Logic App.

## Create Managed Identity for the Logic App.

To create the Managed Identity, navigate to the created Logic App in the Azure portal.

- From there, in the left menu under **Settings,** select **Identity.**

- Set the status to **On** and click **Save.** This will create the Managed Identity for the Logic App using the exact same name as the Logic App:\

Now that we have created the Managed Identity for the Logic App, we can add it to the Key Vault to access the values for the Azure AD registration.

## Add Managed Identity to Key Vault

To add the Managed Identity that we created in the previous step to the Key Vault, you have to take the following steps:

- In the Key Vault overview blade, select **Access Policies** in the left menu. Then select **+ Add access policy:\
  

- Select the following values:

  - Secret Permissions: List, Get (this will allow the Logic App to retrieve values from the Key Vault)

  - Select Principal: KeyVaultConnector

- Then select **Add:\

> The Managed Identity of the Logic App now has permissions to retrieve values from the Key Vault. In the next step we are going to retrieve the values in our Logic App.

## Using the Key Vault connector in the Logic App

The out-of-the-box Key Vault connector is the easiest way of retrieving secrets, keys, certificates and other values from the Key Vault in a Logic App. In this step we are going to use this connector and see what it has to offer. Therefore, navigate to the Logic App that you have created in the Azure portal.

- Click **Edit** to open the Logic App designer.

- Under the **Recurrence** trigger, click **+ New step.** Search for Key Vault and select **Get secret** from the list:

- Specify the name of the Key Vault.

- There are two different options here to authenticate. The first is to sign-in to the Key Vault using your credentials. The other one is to connect with a Service Principal. When you select the latter here, you have to specify the Vault name, Client ID, Client Secret and Tenant ID. You are not allowed to select the Managed Identity here:

- Since the Managed Identity is created automatically, we don't have access to the secret. So, we cannot use it in here. Therefore, we are going to connect with our administrator credentials for now. Click **Connect with sign in** and click the **Sign in** button.

- Pick your account, in my case this is an administrator account, so I have access to the Key Vault by default. After authenticating you can select the secrets from the Key Vault:

> This is not an ideal way of authenticating. Of course, you can use an account with least privileges, but we want to connect with our Managed Identity. By the time of writing this blog, the only way to connect to the Key Vault using the Managed Identity is by using a **HTTP action** and make a request to the Key Vault API. Let's do this in the next part.

## Connect to the Key Vault using the API

Delete the Azure Key Vault action from the Logic App designer and take the following steps:

- Add a new step to the canvas.

- Search for HTTP and select the HTTP action. Then select HTTP from the list.\

- Add the following values:

  - Method: GET

  - URI: <https://SZConnectorKeyVault.vault.azure.net/secrets/TenantID> (change this if your Key Vault has a different name)

  - Queries: api-version; 2016-10-01

  - Then select **Add new parameter** and select **Authentication.**

  - Authentication:

    - Authentication type: Managed Identity

    - Managed Identity: System Assigned Managed Identity

    - Audience: <https://vault.azure.net>


- Now, we can use the Managed Identity to connect to the Key Vault.

- Repeat this last step until you have retrieved all three of the secrets from the Key Vault, including the App ID and the App secret. This will look like the following image:

- Now that we have our Key Vault secrets using the Managed Identity, we can store them in variables. Therefore add three new steps and select the **Initialize variable** actions. For each variable, add a name, such as TenantID, AppID and AppSecret of type **string** and add for each action add an expression to the **Value** field with the following expressions:

  - Value 1: body(\'Get_TenantID\')?\[\'value\'\]

  - Value 2: body(\'Get_AppID\')?\[\'value\'\]

  - Value 3: body(\'Get_AppSecret\')?\[\'value\'\]

- This will look like the following image:
 
- Next, make a request to the Graph API. First, we need an access token from Azure AD. Add another HTTP action under the previous one and add the following values (replace the TenantID, AppID and AppSecret with the variables that were created in the previous steps):

  - Method: POST

  - URI: [https://login.microsoftonline.com/{](https://login.microsoftonline.com/%7b)\'TenantID\'}/oauth2/token

  - Headers: Content-Type; application/x-www-form-urlencoded

  - Body: grant_type=client_credentials&client_id=@{\'AppID\'}&client_secret={ \'AppSecret\'}&resource=https://graph.microsoft.com

- This will look like the following image:

- Before we proceed this, first save the Logic App and **Run** it.

- When the Logic App finished executing Click on the last HTTP action and copy the body from the output and paste it into Notepad.

- Open the Logic App in edit mode again and add a new step and select the **Parse JSON** action. We are going to parse the access token to a variable so we can use it in the next step. Add the following values:

  - Content: Select the Body from the previous step.

  - Schema: For this, select **Use sample payload to generate** schema and paste the output from the previous step here to let the schema be generated based on the output of the body.

- Add a new HTTP action for the request to the Microsoft Graph using the access token. Add the following values:

  - Method: POST

  - URI: <https://graph.microsoft.com/v1.0/invitations> (the URL to the Azure AD B2B REST API

  - Headers: Authorization; Bearer {access_token}. Here select the access token from the dynamic content list and make sure there is a whitespace between the Bearer part and the access token.

  - Body:

> {
>
> \"inviteRedirectUrl\": \"https://myapps.microsoft.com\",
>
> \"invitedUserDisplayName\": \"Sjoukje Zaal\",
>
> \"invitedUserEmailAddress\": \"sjoukje@emailaddress.com\",
>
> \"invitedUserMessageInfo\": {
>
> \"customizedMessageBody\": \"Hey there! Check this out. I created an invitation through the Graph API\"
>
> },
>
> \"sendInvitationMessage\": true
>
> }

- Click **Save** and run the Logic App again. This will create an external user in Azure AD B2B.

## Wrap up

We have now successfully created an external user in our Azure AD B2B tenant using the credentials that were stored inside the Azure Key Vault. We have used two different approaches for this, the former using the out-of-the-box connector which offers a lot of functionality but cannot be used in conjunction with a Managed Identity, and the latter, using the Key Vault API and the Managed Identity.

Authenticating using a Managed Identity is the most secure way of connecting to the Key Vault because you don't have to login using any other credentials except the Logic App credentials and you don't have to maintain any recycling of access tokens. This is all handled for you by Azure.
