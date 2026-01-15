---
title: "Securing Your Azure Logic Apps Part 5: Secure your Logic App using an App Service Environment"
date: 2018-05-18
---

This is the fifth part in the series about securing your Logic Apps. In
the previous post, we've covered how to use the Validate JWT access
Restriction Policy in API Management for securing your Logic Apps. In
this post, I'm going to show you how you can add your Logic App to an
App Service Environment to create an isolated and secure environment for
your app to run in.

In this series:

- [Secure access to the
  trigger](https://blogs.msdn.microsoft.com/azuredev/2017/07/26/securing-your-azure-logic-apps-part-1-secure-access-to-the-trigger/).

- [Secure your Logic App using API Management -- Access Restriction
  Policies.](https://blogs.msdn.microsoft.com/azuredev/2017/08/16/part-2-secure-your-logic-app-using-api-management-access-restriction-policies/)

- [Secure your Logic App using Azure Active
  Directory](mailto:https://blogs.msdn.microsoft.com/azuredev/2017/09/21/part-3-secure-your-logic-app-with-azure-active-directory-using-azure-api-management/)

- [Secure your Logic App using API Management -- Validate JWT Access
  Restriction
  Policy](https://blogs.msdn.microsoft.com/azuredev/2017/10/18/securing-your-azure-logic-apps-part-4-secure-your-logic-app-using-api-management-validate-jwt-access-restriction-policy/)

- Secure your Logic App using an App Service Environment

For this article, I've used the Logic App which is created in the [first
post](https://blogs.msdn.microsoft.com/azuredev/2017/08/16/part-2-secure-your-logic-app-using-api-management-access-restriction-policies/)
of this series.

<https://azure.microsoft.com/en-us/blog/introducing-app-service-environment/>

# App Service Environment

An App Service Environment (ASE) offers a fully isolated and dedicated
environment for securely running all kinds of apps, like Web Apps,
Mobile Apps, API Apps and Logic Apps. The ASE feature is a deployment of
an Azure App Service directly into the Azure Resource Manager virtual
network (VNet). ASEs are created inside a subnet of the Azure Virtual
Network, which enables your apps to connect securely to endpoints that
are accessible only from within the VNet (this includes endpoints that
are connected using VPNs and ExpressRoute circuits). ASEs are most
suitable for apps that require very high scale, isolation and secure
network access and high memory utilization.

At the time of writing, Microsoft offers two versions of the App Service
Environment, v1 and v2. The former uses **workers** that need to be
added to ASE manually. When you need more capacity, you need to add more
workers to the pool. With ASEv2, this is all done automatically. Besides
that, ASEv1 has support for a maximum of 50 workers, where ASEv2
supports a maximum of 50 workers. ASEv2 offers faster CPUs, twice the
memory per core and SSDs. ASEv1 can be deployed in a classic virtual
network and in a Resource Manager virtual network and has a different
pricing model.

In this demo we are going to use the ASEv2. For more information about
V1, you can refer to the following article: [App Service Environment v1
introduction](https://docs.microsoft.com/en-ca/azure/app-service/environment/app-service-app-service-environment-intro).

## Creating an App Service Environment

*App Service Environments are very expensive, so I strongly advice to
remove them immediately after this demo...*

To create an App Service Environment, take the following steps:

Navigate to <https://portal.azure.com>, Click on **Create a new
resource,** type **App Service Environment** in the searchbox and create
a new ASE.

Add the below settings (if you select the ASE pricing details, you can
get an idea of the monthly costs of the ASE). You can keep the default
Virtual Network Location for this demo.

Click **Create**. It will take some time before the ASE is created.

## Add the Logic App to the ASE

When the deployment of the ASE is finished, next is adding the Logic App
to the ASE. To do that.

The Logic App is added to a Consumption Plan, meaning that you only pay
for the action executions that are performed by the Logic App instance
are billed. So, the first step is to move the Logic App from the
Consumption plan to an App Service Plan.

According to the Microsoft documentation, the way to do this, is to
manually redeploy the Logic App into another Service Plan. Since we have
initially deployed the Logic App from Visual Studio, we will redeploy
the App from there as well.

Take the following steps to do this:

Open Visual Studio 2017, and select the **Cloud Explorer** tab. In there
select the Logic App which was created in the first chapter. Right click
it and select **Open with Logic App Editor.**

![](media/image1.png){width="2.0838582677165354in"
height="5.170795056867892in"}

This will open the Logic App instance which is deployed in Azure. Click
download in the top menu top download the JSON template. Save the
template somewhere on your filesystem.

![](media/image2.png){width="5.354166666666667in"
height="4.157694663167104in"}

Open the **SecureLogicApp** Project from Visual Studio. On the Solution
Explorer tab, open the **LogicApp.json** file. This will automatically
open the JSON Outline tab as well.

Right click resources, and add and select **Add new resource.** Select
**App Service Plan (Server Farm)** and add the following settings:

![](media/image3.png){width="6.268055555555556in"
height="3.995138888888889in"}

Click **Add.**

Right click the project and select **Deploy -\> New.**

![](media/image4.png){width="6.268055555555556in"
height="3.995138888888889in"}

Select the appropriate Azure Subscription and Resource Group and click
**Edit Parameters...**

![](media/image5.png){width="4.663207567804024in"
height="4.005208880139983in"}

Fill in the parameters like the values below:

![](media/image6.png){width="6.135461504811898in"
height="3.067730752405949in"}

Click **Save** and in the next screen click **Deploy.** The Logic App is
now deployed inside an App Service Plan.

![](media/image7.png){width="6.268055555555556in"
height="3.995138888888889in"}

# Conclusion

# Usefull links

For this post, I've used the following links for research:

- [Introduction to the App Service
  Environments](https://docs.microsoft.com/en-ca/azure/app-service/environment/intro)