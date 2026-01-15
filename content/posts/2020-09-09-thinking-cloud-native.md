---
title: "Thinking Cloud Native"
date: 2020-09-09
---

These days, applications have become very complex and users are demanding more and more of these applications. They expect innovative features, rapid responsiveness, and zero downtime. And problems that arise with building software, such as performance errors, recurring errors, and the inability to move fast are no longer acceptable by the user. If your application does not meet the user's requirements, they simply move on to the competitor.

This means that applications need to be able to address the need for speed and agility. And the solution to this is: A Cloud Native architecture and technologies.

Cloud Native is all about changing the way you think about building and designing critical business systems. Cloud Native systems are specifically designed to respond to large scale, resilience, and rapid change. And they run in modern and dynamic environments, such as public, private, and hybrid clouds. Cloud Native applications are mostly build using one or more of these technologies: Containers, service meshes, microservices, and declarative APIs, running on immutable infrastructure.

Some companies that have implemented Cloud Native and achieved speed, agility, and scalability are Netflix, Uber, and WeChat. They have thousands of independent microservices running in production and they deploy between hundred and thousand times a day. This architectural style enables them to quickly respond to market demand and conditions. By using a Cloud Native approach, they can instantaneously update small areas of a live, complex application, and individually scale those areas as needed.

The speed and agility of cloud native comes from several factors: Cloud infrastructure is key here, but there are five additional pillars that also provide the foundation for building cloud native applications:

# Modern Design

A widely accepted methodology for constructing cloud-based applications is the [Twelve-Factor Application](https://12factor.net/). It describes a set of principles and practices that developers follow to build applications that are optimized for modern cloud environments. There is big focus on portability across environments and declarative automation.

These principles and practices are considered as a solid foundation for building cloud native apps. The systems that are build upon these principles can deploy and scale rapidly and add features to react quickly to market changes.

# Microservices

Cloud native systems and applications embrace microservices, which is a popular style for constructing modern applications. The microservice architectural style is an approach to developing a single application as a suite of small services, each running in their own process and communicating with lightweight mechanisms, such as REST, gRPC, HTTP(S), or WebSockets.

Microservices can scale independently. Instead of scaling the entire application as a single unit, you scale out only those services that require more processing power or network bandwidth. Each microservice also has an autonomous lifecycle and can evolve independently and deploy frequently. You don\'t have to wait for a quarterly release to deploy a new features or update, but you can update small areas of a complex application with less risk of disrupting the entire system.

# Containers

Containers are a great enabler of cloud native systems and applications. Microservice containerization is also placed as the first step in the [Cloud-Native Trial Map](https://raw.githubusercontent.com/cncf/trailmap/master/CNCF_TrailMap_latest.png) -- released by the Cloud Native Computing Foundation. This map offers guidance for enterprises that are beginning their cloud native journey. This technique is very straightforward: you package the code, its dependencies, and the runtime into a binary called a [container image](https://docs.docker.com/glossary/?term=image). Those images are then stored inside a [container registry](https://caylent.com/container-registries) which acts as a repository or library for the images. Those registries can be private or public and can be stored inside your own datacenter or using public cloud services. When needed, you transform the image into a running container instance. These instances can run in the cloud or in your private data center on servers that have a [container runtime](https://kubernetes.io/docs/setup/production-environment/container-runtimes/) engine installed.

Containers provide portability and guarantee consistency across environments. By packaging everything into a single container image, you isolate the microservice and its dependencies from the underlying infrastructure. This also eliminates the expense of pre-configuring each environment with frameworks, software libraries, and runtime engines. And by sharing the underlying operating system and host resources, containers have a much smaller footprint than a full virtual machine. This increases the number of microservices that a given host can run at one time.

# Backing Services

Cloud Native applications and services depend upon several different backing services, such as data stores, monitoring, caching, and logging services, message brokers and identity services. These backing services support the Stateless principle coming from the [Twelve-Factor Application](https://12factor.net/). You can consume those services from a cloud provider. You could also host your own backing services, but then you would be responsible for licensing, provisioning, and managing those resources.

Cloud Native services are typically using backing services from cloud providers. This saves time, and reduces the costs, and operational risk of hosting your own services. Backend services are threated as an attached resource and are dynamically bound to a microservice. The required information to access these services, such as URLs and credentials are then stored in an external configuration store.

# Automation

The previous pillars are specifically focusing on achieving speed and agility. But that is not the complete story. The cloud environments also need to be provisioned to being able to deploy and run cloud native applications and systems. How do you rapidly deploy your apps and features? A widely accepted practice to this is [Infrastructure as Code (IaC)](https://docs.microsoft.com/en-us/azure/devops/learn/what-is-infrastructure-as-code).

Using IaC, you can automate platform provisioning and application deployment. DevOps teams that implement IaC can deliver stable environments rapidly and at scale. By adding testing and versioning to the DevOps practices, your infrastructure and deployments are automated, consistent, and repeatable.

You can use tools like Azure Resource Manager, Terraform, and Azure CLI to create scripts to deploy the cloud infrastructure. This script is versioned and checked into source control as an artifact of the whole project. The script is then automatically invoked in the [Continuous Integration](https://martinfowler.com/articles/continuousIntegration.html) and [Continuous Delivery](https://martinfowler.com/bliki/ContinuousDelivery.html) (CI/CD) pipelines to provision a consistent and repeatable infrastructure across system environments, such as QA, staging, and production. A service that can handle this process from the beginning to the end is [Azure Pipelines](https://azure.microsoft.com/en-us/services/devops/pipelines/) which is part of [Azure DevOps](https://azure.microsoft.com/en-us/services/devops).

# Summary

This blog introduced the five different pillars that provide the foundation for building cloud native applications.