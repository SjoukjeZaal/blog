---
title: Microsoft Azure -- a Cloud Native Success Story
date: 2021-01-29
---

One of our clients supports several retailers, both local and global, in how to acquire, engage, and retain their customers. They achieve this by providing strategy, tools, and tactics around this. These services are provided to the customer in a digital way. The customer can use web portals, a variety of different services, and can get valuable insights in their data.

To bring their services to the next level, and to address the requirements that their customers are having now, and in the future, they decided to take advantage of using the cloud. By leveraging cloud native services, they are able to provide their customers with a set of secure services and give real time insights in data.

To support their customers in the most effective way, they decided to host their services on Microsoft Azure.

# The challenge

The challenge that this client is facing is quite similar to the challenges that a lot of organizations are facing right now. There is an urgent need for digital transformation to keep addressing customer needs, be competitive in the market, and being able to innovate and use state of the art technologies. But most services that are offered to their customers are still running on an on-premises infrastructure that is not ready to support this.

This was also the challenge that our client was facing. They were providing services that were still running on an on-premises environment, which was not able to provide innovative technologies and scale accordingly to address the future needs.

This customer reached out to us to help them implement cloud native services to renew their IT landscape, offer a set of services to their customers that are specifically designed for performance, security and redundancy, and provide real time insights in data coming from various sources. This data is partially stored in Azure, but also still stored in on-premises databases.

# Our approach

Together with the client we decided to take advantage of all the cloud native services that Azure has to offer, from a micro-services and data analytics and insights perspective. The project got divided into two smaller projects, starting with building a full cloud native micro-services environment using only serverless technology. This will then be followed by starting a new project for storing customer data using Azure Data Lake, implementing real-time insights using Azure Event Hub, and using various services to provide interactive, immersive dashboards and reports, such as Azure Data Share and other tooling.

We decided that our cloud native development offering was most applicable to this project. With our offering, we are providing the following to our clients:

- **Domain Driven Design:** When implementing a micro-services architecture, Domain Driven Design (DDD) is a design approach where you can benefit from. Where to draw the boundaries is the key task when designing and defining a microservice. DDD patterns help you understand the complexity in the domain.

- **Cloud Native Design Patterns:** To build highly reliable, scalable, secure applications and services, every developer needs to make use of common Cloud Native Design Patterns. We focus fully on implementing Microsoft Best-Practices and Patterns.

- **Dev/Test optimization:** We bring our own development and test environments to the project. For this, we are using container technologies which have all the commonly used tooling and software pre-deployed. Next, to that we are using automated performance and acceptance tests, fully integrated in Azure DevOps.

- **Everything-as-code:** We are offering out-of-the-box landingzones, which include security and compliance policies, and monitoring rules. Those monitoring rules are based on our experiences and best-practices that we have developed over the years managing cloud environments for our global customers. We are implementing zero-touch deployments using Azure DevOps and CI/CD pipelines for automatically building and releasing applications and services.

# How we implemented it

The first step was to deploy the landingzone which included an API Management gateway, a VNet, Log Analytics, Application Insights, security policies, and default monitoring and logging rules in the Azure subscription. We deployed it automatically using CI/CD pipelines so that it can easily be deployed across different environments. Next, we started building the first APIs, by using serverless services, such as Azure Functions, Azure Storage, Azure Service Bus, an Azure Key Vault, and more. We implemented cloud native design patterns to build them. To get access to the data that still resides in the SAP on-premises environment, an Express Route connection was set up. For authentication, we used Azure Active Directory, Auth 2.0, Open ID Connect and the out-of-the-box libraries that are provided by Microsoft, such as MSAL.

By using landingzones, cloud native patterns & Microsoft best practices, and securing it using Azure Policies and Azure Active Directory in our solution, we now have a solid foundation for rapidly building and deploying additional services.

# Next steps

At this stage, we now have successfully implemented a set of secure micro-services for the client, which are automatically deployed across environments, securely connecting to an on-premises SAP environment, and exposed via a single gateway. Next, will be implementing the second project, where we will form an additional DevOps team that will implement the solution for storing customer data, and providing real-time insights.

# Summary

This blog gave an overview of one of the cloud native projects that we are currently implementing at one of our customers.
