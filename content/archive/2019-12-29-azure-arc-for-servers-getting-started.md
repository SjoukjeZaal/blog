---
title : "Azure Arc for Servers: Getting started"
date : 2019-12-29
---

Most organizations embrace a hybrid and multi cloud approach for their businesses. This will give them the full benefits of their on-premises investments, the ability to innovate using cloud technologies, and the ability to avoid vendor lock-in.
For the last two years, Microsoft is investing enormously in enabling seamless hybrid capabilities. They released Azure Stack, which enables a consistent cloud model, but is deployed on-premises. They enabled security threat protection for any infrastructure, which is fully powered from the cloud, and they enabled the ability to run Microsoft Azure Cognitive Services AI models anywhere. Microsoft recently released Azure Arc, which unlocks new hybrid scenarios for organizations by bringing new Azure services and management features to any infrastructure.
Azure Arc extends the Azure Resource Manager capabilities to Linux and Windows servers, and Kubernetes clusters on any infrastructure across on-premises, multi-cloud, and the edge. You can use Azure Arc to run Azure data services anywhere, which includes always up-to-date data capabilities, deployment in seconds, and dynamic scalability on any infrastructure. Azure Arc for Servers is currently in preview, and that is what we are going to cover in this post.

Azure Arc for Servers
---------------------

With Azure Arc for servers, you can manage machines that are hosted outside of Azure. When these types of machines are connected to Azure using Azure Arc for servers, they become **Connected Machines,**and they will be treated as native resources in Azure. Each Connected machine will get a Resource ID during registration in Azure and it will be managed as part of a Resource group inside an Azure subscription. This will enable the ability to benefit from Azure features and capabilities, such as Azure Policies, and tagging.
For each machine that you want to connect to Azure, an agent package needs to be installed. Based on how recently the agent has checked in, the machine will have a status of **Connected** or **Disconnected.** If a machine has not checked-in within the past 5 minutes, it will show as Disconnected until connectivity is restored. This check-in is called a heartbeat. The Azure Resource Manager service limits are also applicable to Azure Arc for server, which means that there is a limit of 800 servers per resource group.

### Supported Operating Systems

By the time of writing this post, the public preview supports the following operating systems:

* Windows Server 2012 R2 and newer
* Ubuntu 16.04 and 18.04

### Networking

During installation and runtime, the agent requires connectivity to Azure Arc service endpoints. If outbound connectivity is blocked by the firewall, make sure that the following URLs are not blocked:

| Domain Environment | Required Azure service endpoints |
| --- | --- |
| management.azure.com | Azure Resource Manager |
| login.windows.net | Azure Active Directory |
| dc.services.visualstudio.com | Application Insights |
| agentserviceapi.azure-automation.net | Guest Configuration |
| \*-agentservice-prod-1.azure-automation.net | Guest Configuration |
| \*.his.hybridcompute.azure-automation.net | Hybrid Identity Service |

 
In the next part of this post, we are going to connect an on-premises machine in Azure using Azure Arc. For this demonstration, I have an on-premises Hyper-V environment with one Windows Server 2016 machine.

Register the required Resource Providers in Azure
-------------------------------------------------

First, we need to register the required resource providers in Azure. Therefore, take the following steps:

* Open a browser and navigate to the Azure portal at: [https://portal.azure.com/](\"https://portal.azure.com/\")
* Login with your administrator credentials.
* Open Cloud Shell in the top right menu, and add the following lines of code to register the **Microsoft.HybridCompute** and the **Microsoft.GuestConfiguration** resource providers:

  ```
  Register-AzResourceProvider -ProviderNamespace Microsoft.HybridCompute
  Register-AzResourceProvider -ProviderNamespace Microsoft.GuestConfiguration
  ```
* This will result in the following output.
* Note that the resource providers are only registered in specific locations.

 
In the next part, we are going to connect the server to Azure Arc.

Connect the machine to Azure Arc for Servers
--------------------------------------------

There are two different ways to connect on-premises machines to Azure Arc. You can download a script and run it manually on the server. This is the best approach when you are adding single servers to Azure Arc. You can also follow the PowerShell Quickstart for adding multiple machines using a Service Principal. You can find the quickstart here: [https://docs.microsoft.com/en-us/azure/azure-arc/servers/quickstart-onboard-powershell.](\"https://docs.microsoft.com/en-us/azure/azure-arc/servers/quickstart-onboard-powershell\")
We are adding one machine in this demo, so we are going to follow the [Portal Quickstart](\"https://docs.microsoft.com/en-us/azure/azure-arc/servers/quickstart-onboard-portal\").
To connect the machine to Azure, we need to generate the agent install script in the Azure portal. This script is going to download the **Azure Connected Machine Agent (AzCMAgent)** installation package, install it on the on-premises machine and register the machine in Azure Arc.

### Generate the agent install script using the Azure portal

To generate the agent install script, take the following steps:

* Navigate to the Azure portal  and type **Azure Arc** in the search box. Or you can launch [https://aka.ms/hybridmachineportal](\"https://aka.ms/hybridmachineportal\")
* Click on ****+Add.****
* Select ******Add machines using interactive script:******

* In the **Basics**blade, keep the default settings and click **Review + generate**. If you want, you can create a new resource group for your machines that are connected to Azure Arc:

* The last page has a script generated which you can copy (or download). This script needs to be executed on the on-premises machine:

### Connect the on-premises machine to Azure Arc

To connect the on-premises machine to Azure Arc, we first need install the agent on the on-premises machine. Therefore, take the following steps:

* Open Windows PowerShell ISE as an administrator.
* Paste the script, that is generated in the previous step in PowerShell, in the window and execute it.
* The machine will be onboarded to Azure, which can take a few minutes to complete.
* You will receive a registration code during script execution. Navigate to [https://microsoft.com/devicelogin](\"https://microsoft.com/devicelogin\").
* Paste in the code from PowerShell and click ****Next:****

* You will receive a confirmation that the device is registered in Azure Arc.
* You can now close the browser window.
* If you now go back to the Azure portal and refresh the page, you will see that the server is added to Azure with the **Connected**status.

Managing the machine in Azure Arc
---------------------------------

* To manage the machine from Azure, click on the machine in the overview blade, like in the previous image.
* In the overview blade, you can add tags to the machine. You can also Manage access, and apply policies to the machine from here.

Summary
-------

In this post, we've covered how to connect an on-premises machine to Azure Arc for servers. I find it extremely easy to connect the on-premises machine to Azure. By generating the script in the Azure portal, which includes downloading and installing the agent on the on-premises machine, makes it easy to connect it to Azure. Once connected, the machine can be managed as if it is a native Azure VM.

-Sjoukje