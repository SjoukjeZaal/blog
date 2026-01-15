---
title: Microsoft Azure Well-Architected Framework - five pillars of architecture excellence
date: 2020-08-24
---

Microsoft recently introduced the [Microsoft Azure Well-Architected Framework](https://docs.microsoft.com/en-us/azure/architecture/framework/) which provides customers with a set of Azure best-practices to help them build and deliver well-architected solutions on top of the Azure platform.

The framework consists of five pillars of architecture excellence, that can be used as guiding to improve the quality of the workloads that run on Azure. These five pillars are: Cost Optimization, Operational Excellence, Performance Efficiency, Reliability, and Security. They will be explained in more detail in the following sections.

## Cost Optimization

One thing to focus on when architecting cloud solutions, is to generate incremental value early in the process. To accelerate the time to market while avoiding capital-intensive solutions, the principles of [Build-Measure-Learn](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/innovate/considerations/adoption) can be applied. This is one of the central principles of Lean Startup, which helps to create customer partnerships by building with customer empathy, measuring impact on customers, and learning with customers.

By using this pay-as-you-go strategy in your architecture, you will invest in scaling out after customer success, instead of delivering a large investment first version. Keep a balance in your architecture between costs for first mover advantage versus "fast follow". For this, you can use the cost calculators to estimate the initial costs and the operational costs. Finally, establish policies, budgets, and controls that set cost limits for your solution.

For a detailed guidance on cost optimization, you can refer to the following articles:

- [Principles of cost optimization](https://docs.microsoft.com/en-us/azure/architecture/framework/cost/overview)

- [Develop a cost model](https://docs.microsoft.com/en-us/azure/architecture/framework/cost/design-model)

- [Set budgets and alerts](https://docs.microsoft.com/en-us/azure/architecture/framework/cost/monitor-alert)

- Review the [cost optimization checklist](https://docs.microsoft.com/en-us/azure/architecture/framework/cost/optimize-checklist)

## Operational Excellence

Operational Excellence involves the operations processes that keep applications running in production. To make deployments reliable and predictable, they should be fully automated to reduce human errors. This should be a fast and repeatable process, so they don't slow down the release of new features or bug fixes. You should also need to be able to quickly roll back or roll forward when a release has problems or bugs.

To accomplish this, monitoring and diagnostics are crucial. You don't have full control over the infrastructure and operating system when using Azure solutions. Monitoring and diagnostics will give you the insights to the systems and the solutions that run on top of it. Use a common and consistent logging schema that let's you correlate events across different systems, Azure resources, and custom applications.

A successful monitoring and diagnostics process has several distinct phases:

1.  **Instrumentation:** Log and generate the raw data, from all the different resources and services that you are using, such as application logs, web server logs, VM logs, diagnostics built in the Azure platform, and other sources.

2.  **Collection and storage**: Collect all the raw data and consolidate it into one place.

3.  **Analysis and diagnosis:** Analyze the data that is collected to see the overall health of the platform, services, and your applications and to troubleshoot issues.

4.  **Visualization and alerts:** Visualize the data that is analyzed to spot trends or set up alerting to alert the operation teams.

To get more information and further guidance about operational excellence, you can refer to the following articles:

- [Design patterns for management and monitoring](https://docs.microsoft.com/en-us/azure/architecture/patterns/category/management-monitoring)

- [Best practices for monitoring cloud applications](https://docs.microsoft.com/en-us/azure/architecture/best-practices/monitoring)

## Performance Efficiency

With performance efficiency, you make sure that your workload can scale to meet the demands placed on it by the users in an effective manner. You can achieve by implementing PaaS offering that scale automatically or implementing scaling effectively in your solutions and applications.

Applications can scale in two different ways: horizontally (scale out) where new instances of the resource is added, such as extra VMs or database instances. You can also scale vertically (scale up), where you increase the capacity of a single resource, for example by using a larger VM size.

Horizontal scale needs to be architected into the system. You can scale out by placing VMs behind a load balancer. The applications that run on these VMs, also need to be able to scale. This can be accomplished by designing stateless applications or by storing state and data externally. Simply adding more instances, will not guarantee that your application will scale. Scaling can also lead to more additional measures and bottlenecks.

Therefore, you should always conduct performance and load testing to find these potential bottlenecks. You can use the following articles for this:

- [Design patterns for scalability and performance](https://docs.microsoft.com/en-us/azure/architecture/patterns/category/performance-scalability)

- Best practices: [Autoscaling](https://docs.microsoft.com/en-us/azure/architecture/best-practices/auto-scaling), [Background jobs](https://docs.microsoft.com/en-us/azure/architecture/best-practices/background-jobs), [Caching](https://docs.microsoft.com/en-us/azure/architecture/best-practices/caching), [CDN](https://docs.microsoft.com/en-us/azure/architecture/best-practices/cdn), [Data partitioning](https://docs.microsoft.com/en-us/azure/architecture/best-practices/data-partitioning)

- [Performance efficiency checklist](https://docs.microsoft.com/en-us/azure/architecture/framework/scalability/performance-efficiency) 

## Reliability

Reliable workloads are both resilient and available. Resilient applications are able to return to a fully functioning state after a failure occurs. Available applications can be accessed by the users when they need to.

In cloud computing a different mind set is needed then in traditional application development. Cloud applications are built as distributed systems, which means they are often more complex. The costs for cloud environments are kept low through the use of commodity hardware, so occasional hardware failures must be expected. Today, users also expect systems to be available 24/7 without ever going offline.

This means that cloud application must be architected differently. They need to be designed to expect occasional failures and need to be able to recover from them quickly. When designing your applications to be resilient, you first must understand availability requirements. How much downtime is acceptable for this application, how much downtime will cost your business, and how much should be invested in making the application highly available.

In the following articles you will get more information about how you can design and build reliable workloads and applications in Azure:

- [Overview of the reliability pillar](https://docs.microsoft.com/en-us/azure/architecture/framework/resiliency/overview)

- [Resiliency patterns](https://docs.microsoft.com/en-us/azure/architecture/patterns/category/resiliency)

- Best practices: [Transient fault handling](https://docs.microsoft.com/en-us/azure/architecture/best-practices/transient-faults), [Retry guidance for specific services](https://docs.microsoft.com/en-us/azure/architecture/best-practices/retry-service-specific)

## Security

Security should be embedded throughout the entire lifecycle of an application. From the design phase all the way up to the deployments and operations phase. Protection against a variety of threats, such as DDoS attacks, is already provided by the Azure platform, but you are still responsible for building security into your application and into the DevOps processes.

Security areas that need to be considered for application development are:

- Identity Management: For authenticate and authorize users, Azure Active Directory should be considered. Azure AD is a fully managed identity and access management service, and it is integrated to Azure services, Office 365, Dynamics CRM Online, Active Directory on-premises in a hybrid deployment, and many third-party SaaS applications. For consumer-facing applications, Azure AD offers Azure AD Business to Consumer, which lets users authenticate with their existing social accounts, such as Facebook, Google, LinkedIn and more, as well as creating new accounts that is managed by Azure AD.

- Application Security: Best practices for applications, such as SSL everywhere, protecting against CSRF and XSS attacks, preventing SQL injection attacks, and so on, still apply to the cloud. You should also store your application keys and secrets in Azure Key Vault.

- Protecting the infrastructure: Control access to all the Azure resources that you deploy. Every resource has a trust relationship with the Azure AD tenant. To grant the users in your organization the correct permissions to the Azure resources that are deployed, you can use Role Based Access Control (RBAC). These permissions can be added to different scopes, to subscriptions, resource groups, or single resources.

- Data encryption: When you set up high availability in Azure, make sure that you store the data in the correct geopolitical zone. Azure geo-replicated uses the concept of paired regions, which stores the replicated data in the same geopolitical region. To store cryptographic keys and secrets, you can use Azure Key Vault. You can also use Key Vault to store that are protected by hardware security modules.

For more information about this, you can refer to the following articles:

- [Identity Management](https://docs.microsoft.com/en-us/azure/architecture/reference-architectures/identity/) reference architectures.

- [Azure Security Center](https://azure.microsoft.com/en-us/services/security-center/) provides integrated security monitoring and policy management across your Azure subscriptions.

- [Azure Security Documentation](https://docs.microsoft.com/en-us/azure/security/)

- [Microsoft Trust Center](https://azure.microsoft.com/en-us/overview/trusted-cloud/)

## Wrap up

Azure Well-Architected Framework provides comprehensive architecture principles and guidelines to build cost effective, secure, reliable, and manageable solutions in Azure. If you want to get started with the Azure Well-Architected Framework:

- Read the framework content, reference material, and samples available in the [Azure Architecture Center](https://docs.microsoft.com/azure/architecture/framework).

- Take the [Azure Well-Architected Review](https://aka.ms/architecture/review) on Microsoft Assessments.

- Learn how to [Build great solutions with the Microsoft Azure Well-Architected Framework](https://aka.ms/architecture/learn) on Microsoft Learn.