---
title: "Azure containers overview"
date: 2021-08-31
---

"It works on my machine" - a phrase that every developer has uttered, at
least once in his or her career.

Containers are the solution to the problem of how to get software run
reliably when moved between computing environments. From a developer
laptop to production environments, or from on-premises environments to
cloud environments. By packaging all the required dependencies together
with the application, you ensure that it can run in every environment.
That is one of the reasons that container deployment is so successful
nowadays. They also give you the portability to run exactly the same
workloads across different cloud providers. You see that a lot of
enterprises are heavily investing in multi-cloud environments. Gartner
forecasts that by 2022, more than 75% of global organizations will be
running containerized applications in production.

Microsoft Azure provides different solutions to deploy and run
applications in Azure. In this article I will dive briefly into the
various offerings that Microsoft provides for running container
deployments and when to use what for your workloads.

## Web App for Containers

With Web App for Containers, you can easily deploy your custom Docker
images in Azure App Services and take advantage of the managed platform.
Patching and managing is all handled for you by Azure. You can deploy
both Windows and Linux containers. By running your containers in Azure
App Services, you can also make use of the features that it provides,
such as autoscaling, security, load balancing, DevOps capabilities such
as continuous deployment from Azure DevOps, GitHub, Docker Hub, and
other sources. It also provides package management, staging
environments, custom domain, and TLS/SSL certificates and integration
with other PaaS services in Azure and Azure AD.

**When to use Azure Web App for Containers:** If your development team
is already familiar with Azure Web Apps, you have one or a few
long-running containers/services that are being deployed, you want to
deploy container applications quickly, don't want to manage the
platform, and run containers on a small scale. And at last, you want to
take advantage of built-in auto-scaling capabilities available through
Azure Monitor.

## Azure Container instances (ACI)

Azure Container Instances is a fully managed service and offers the
fastest and simplest way to run a container in Azure, without having to
manage any virtual machines and without having to adopt a higher-level
service. ACI offer significant startup benefits over virtual machines
(VMs). Azure Container Instances can start containers in Azure in
seconds, without the need to provision and manage VMs. You can also run
Windows and Linux containers in ACI. ACI can also provide 'virtual
nodes' to form the backbone of a serverless cluster within AKS.

**When to use Azure Container Instances:** if you want to get started
with containers, you only want to pay based on consumption, have simple
requirements and have short-lived workloads that respond to on-demand
events or schedules, ACI is a well fitted solution.

## Azure Kubernetes Services (AKS)

For scenarios where you need full container orchestration, including
service discovery across multiple containers, automatic scaling, and
coordinated application upgrades, AKS is recommended. Kubernetes has
established itself as the standard for container orchestration nowadays.
Azure offers a fully managed service for Kubernetes that offers
integrated features such as identity with Azure AD, networking and
monitoring capabilities. It also reduces the configuration overhead of
the cluster.

**When to use Azure Kubernetes Services:** if you're looking to run
containers at scale with flexible networking and customization options.
If you also want your infrastructure to be portable for on-premises and
other cloud providers and want to use as many open sources tooling as
possible. If you also have a development team that is familiar with
Kubernetes, AKS is a good solution.
