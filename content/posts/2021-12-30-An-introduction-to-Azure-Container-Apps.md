---
title: "An introduction to Azure Container Apps"
date: 2021-12-30
---

Nowadays, nearly every developer is a developer of distributed
applications or systems. Modern software development involves building
distributed applications: almost every application leverages a
distributed architecture, and most are backed by services in the public
cloud. Microservices are a successful approach for building distributed
services. And by using containers to build these microservices, you will
introduce scalability, faster deployments, and the ability to run
applications everywhere.

Microsoft recently released a new container service in Azure: Azure
Container Apps, which is a serverless container service for running
modern apps at scale. Azure Container Apps is released during Ignite, in
September 2021, and currently still in preview. The IT industry is
embracing containerization heavily the last couple of years, but
struggles managing the infrastructure. Kubernetes, the facto standard at
many organizations, is challenging to learn and to manage for many IT
professionals. Azure Container Apps offers a solution for this: this
service is specifically aimed to deploy containerized applications
without the need to manage complex infrastructure. It manages the
details of Kubernetes and container orchestrations for you.

In this article I will tell you more about the features Azure Container
Apps provide, and how this service differs from the other container
services that Microsoft offers in Azure.

## Azure Container Apps

With Azure Container Apps you can run your containerized applications
and your microservices on a serverless platform. Applications can be
written in different programming languages or frameworks, and it offers
full support for [Distributed Application Runtime
(DAPR)](https://dapr.io/) and [Kubernetes Event-Driven Autoscaling
(KEDA)](https://keda.sh/) to scale your applications or microservices
dynamically based on the HTTP traffic or events that occur.

Azure Container Apps is suitable for running microservices, handling
event-driven processing, hosting background applications, and deploying
API endpoints. Your applications can scale dynamically based on CPU or
memory load, event-driven processing, HTTP traffic, or [KEDA-supported
scalers](https://keda.sh/docs/2.5/scalers/).

This service offers the following features and capabilities:

- **Run multiple *revisions* of containers:** Azure Containers Apps
  works application lifecycle resolves around revisions. When you deploy
  your first application in Azure Container Apps, the first revision of
  your application is automatically created. As containers get change or
  get updated, more revisions get created.

- **Support for running applications from multiple container
  registries:** Azure Container Apps supports multiple container
  registries to store your images. It offers support for both public and
  private registries, such as Azure Container Registry, Docker.
  Basically, any Linux-based container image is supported from any
  public or private registry.

- **Autoscaling:** Applications can be scaled automatically by any
  KEDA-supported scale trigger. Most applications can scale to zero,
  except applications that are configured to scale on CPU or memory
  load.

- **Building microservices with DAPR:** Building applications using
  microservices based architecture, introduces a lot of complexity. You
  need to account for failures, retries, and timeouts, spread across the
  network and the distributed services.
  [DAPR](https://docs.dapr.io/concepts/overview/) includes features to
  make life a lot easier, it includes features like observability,
  retries, pub/sub, and service-to-service invocation with mutual TLS,
  and much more.

- **Support for ARM templates, PowerShell, and Azure CLI:** You can use
  ARM templates, PowerShell, and the Azure CLI to deploy your containers
  apps services in Azure and applications that run on it. Besides ARM
  and the Azure CLI, you can also use Bicep to deploy Azure Container
  Apps and the applications.

- **Enables HTTP Ingress:** Applications and microservices that run on
  Azure Container Apps can be exposed to the public web by enabling
  ingress. By using ingress, you don't need to create an Azure Load
  Balancer, public IP address, or any other Azure resource to enable
  incoming HTTPS request. In my opinion, this is most suitable for
  smaller organizations. For most enterprises a load balancer or
  multiple load balancers are already part of the architecture (and
  security requirements) and the preferred way for enabling incoming
  traffic.

- **Internal ingress and service discovery:** Ingress can also be
  enabled for internal communication between the different
  microservices, or applications deployed inside the same Container Apps
  environment. When ingress is enabled, each container app will be
  exposed through a domain name.

- **Split traffic:** Azure Container Apps offer support for traffic
  direction strategies, such as A/B testing and Bluegreen deployments.
  For instance, you can configure traffic splitting rules that split
  traffic based on percentages. You can assign percentage values to
  balance traffic among different revisions.

- **Viewing application logs:** Azure Container Apps has support for
  Azure Log Analytics. Data logged via a container app are stored inside
  a custom table in the Log Analytics workspace. These logs can then be
  viewed through the Azure portal or with the Azure CLI.

## Comparing Container Apps with other Azure container options

Currently, there are a lot options you can choose from when developing
container applications and host them on Azure. Microsoft has released a
number of Azure container-based products that all have their own
characteristics and are suitable in certain scenarios. Below, you see an
overview of the different services and the scenarios and use cases for
each service, compared to Azure Container Apps:

###  Azure Container Apps

As mentioned before, with Azure Container Apps you can deploy
containerized apps without managing the complex infrastructure. It is
powered by Kubernetes and open-source technologies like Dapr, KEDA, and
[envoy](https://www.envoyproxy.io/). It fully supports Kubernetes style
applications and microservices with features like service discovery and
traffic splitting. It also offers support for scaling based on traffic
and pulling from event sources like queues, including scale to zero.

However, because it is a serverless platform, it doesn't provide direct
access to the underlying Kubernetes APIs. If access to the Kubernetes
APIs and control plane is required, then you should consider using Azure
Kubernetes Service. If this access is not required, then Azure Container
Apps provide a fully managed experience based on industry
best-practices.

### Azure Container Instances

Azure Container Instances offers a single pod of Hyper-V isolated
containers on demand. Compared to Azure Container Apps, this can be
thought of as a lower level \"building block\". ACI does not provide
features such as scaling, load balancing, and certificates. For
instance, to scale to three container instances, you create three
distinct container instances. ACI is often used to interact with through
other services, Azure Kubernetes can layer orchestration and scale on
top of ACI through virtual nodes. If you don't have scaling, load
balancing, or certificate requirements for your applications, ACI can be
a good solution.

###  Azure App Service

Azure App Service is optimized for web applications. It provides fully
managed hosting for web applications including websites and web APIs.
These applications can be deployed on Azure App Service using code or
containers, and it integrates with other Azure services including Azure
Container Apps or Azure Functions. This makes it most suitable for
scenario's where you only build web apps.

###  Azure Kubernetes Service

Azure Kubernetes Service (AKS) offers a fully managed Kubernetes option
in Azure, which includes access to the Kubernetes API and control plane.
The full cluster resides in your Azure subscription, which makes you
responsible for managing the cluster configurations and operations. If
you are looking for a fully managed version of Kubernetes in Azure, AKS
is a good solution.

###  Azure Functions

Azure Functions is optimized for running event-driven applications using
the functions programming model. It offers similar functionality with
Azure Container Apps around scaling and integration with events but is
mostly optimized for ephemeral functions. They can be deployed using
code and containers, where the latter makes it portable to deploy them
to other container-based platforms. They are most suitable in scenarios
where you want to trigger the execution of your functions on events and
bind to other data sources in Azure.

### Azure Spring Cloud

When you are developing Spring Boot microservice applications, Azure
Spring Cloud makes it easy to deploy them to Azure without any code
changes. This is a fully managed service so developers can focus only on
writing the code, instead of managing the environment. Azure Spring
Cloud provides lifecycle management using CI/CD integration,
configuration management, monitoring and diagnostics, service discovery,
blue-green deployments, and more. In scenarios where your development
team is predominantly Spring, this is a good solution.

## Getting started

Want to get started with Azure Container Apps and experience it
yourself? Here is a list of useful articles that can get you started:

- Azure Container Apps Preview environments:
  <https://docs.microsoft.com/en-us/azure/container-apps/environment>

- Microservices with Azure Containers Apps Preview:
  <https://docs.microsoft.com/en-us/azure/container-apps/microservices>

- Quickstart: Deploy your first container app:
  <https://docs.microsoft.com/en-us/azure/container-apps/get-started>

- Publish revisions with GitHub Actions in Azure Container Apps Preview:
  <https://docs.microsoft.com/en-us/azure/container-apps/github-actions-cli?tabs=bash>
