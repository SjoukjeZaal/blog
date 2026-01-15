---
title: "Getting started with Azure architecture"
date: 2021-09-03
---

Cloud computing is redefining how modern services and applications are
designed. Instead of building traditional monoliths, applications are
broken down into smaller, decentralized microservices. And instead of
running on a traditional server, they are using serverless services
where you don't have to worry about infrastructure at all and only pay
for the services you actually use. Microservices typically communicate
with other microservices by through APIs and asynchronous messaging.
This allows applications to scale more efficiently, be more cost
effective and easier to replace and deploy. Cloud platforms and
microservices ask for a different type of architecture.

The are many cloud providers in the market, but Microsoft Azure is one
of the biggest, used by 95 percent of the Fortune 500 companies.
Microsoft provides a lot of resources on how to architect and develop
applications and services on their platform, which will be covered in
the next sections.

## Azure Architecture Center

The Azure Architecture Center is a great starting point for everyone who
wants to start developing services and applications on Azure. It offers
proven guidance for architecting solutions on Azure including patterns
and practices. You can use the technology choices and guides to decide
which services are right for your solution. The guides include all
aspects for building apps and services for the cloud, such as
operations, reliability, performance, security, and cost optimization.
There are a couple of sections that I want to highlight here:

- [Reference
  Architectures](https://docs.microsoft.com/en-us/azure/architecture/browse/):
  Microsoft provides a collection of reference architectures that you
  can use as a starting point for building your own applications and
  services. This also gives architects a lot of in-depth information
  about how to combine the different services.

- [Cloud
  best-practices](https://docs.microsoft.com/en-us/azure/architecture/guide/):
  This guide presents structured approach for designing scalable,
  resilient, secure, and highly available applications and services on
  Azure. A great starting point for gaining knowledge about building
  distributed apps.

To get started, you can refer to the following overview page:
<https://docs.microsoft.com/en-us/azure/architecture/>

## Cloud Adoption Framework

The Cloud Adoption Framework is a collection of documentation,
best-practices, implementation guidance and tools that can accelerate
cloud adoption in organizations. It is focused on different
methodologies, such as strategy, planning, readiness, migrations,
innovation, governance, managing, and organizing which all together
offers a full broad adoption lifecyle framework, which supports
organizations throughout each phase of cloud adoption.

To get started, you can refer to the following site:
<https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/>

## Landing zones

Microsoft offers a set of enterprise scale landing zones that you can
use to get started as well. A landing zone is an environment for hosting
your workloads, preprovisioned through code. Because no single solution
will fit all technical environments, there are a couple of landing zone
implementations that you can choose from to get started:

- [Enterprise-Scale
  foundation](https://github.com/Azure/Enterprise-Scale/blob/main/docs/reference/wingtip/README.md):
  This landing zone offers a foundation for organizations to support
  their application portfolios, regardless of whether the applications
  are being migrated or are newly developed and deployed to Azure. It
  enables organizations to start as small as needed and scale alongside
  their business requirements. It is a good solution when hybrid
  connectivity to on-premises datacenters is not required from the
  start.

- [Enterprise-scale for small
  enterprises:](https://github.com/Azure/Enterprise-Scale/blob/main/docs/reference/treyresearch/README.md)
  This landing zone is similar to the foundation one above. It also
  allows organizations to start small. This reference implementation is
  aimed at organizations that do not have a large IT team and do not
  require fine grained administration delegation models.

- [Enterprise-Scale with Azure
  VWAN:](https://github.com/Azure/Enterprise-Scale/blob/main/docs/reference/contoso/Readme.md)
  This landing zone offers a foundation for organizations that want to
  focus on application portfolios and hybrid connectivity with
  ExpressRoute or VPN. It also offers an architecture based on an Azure
  Virtual WAN network topology.

- [Enterprise-Scale with hub and spoke
  architecture](https://github.com/Azure/Enterprise-Scale/blob/main/docs/reference/adventureworks/README.md):
  This landing zone example is also for organizations that want to
  support their application portfolios and add hybrid connectivity with
  ExpressRoute or VPN. If organizations require hybrid connectivity to
  on-premises locations from the beginning, you can start with this
  architecture based on the traditional hub and spoke network topology.

## Well-Architected Framework

Lastly, I want to cover the Azure Well Architected Framework. This can
be used to improve the quality of your workloads on Azure. The framework
consists of five pillars of architecture excellence:

- [Cost
  optimization](https://docs.microsoft.com/en-us/azure/architecture/framework/cost/overview):
  The principles of cost optimization are a series of important
  considerations that can help achieve both business objectives and cost
  justification.

- [Operational
  Excellence](https://docs.microsoft.com/en-us/azure/architecture/framework/devops/overview):
  This pillar covers the operations processes that keep an application
  running in production. If focuses on reliable and automated
  deployments, which can easily roll back or forward when required.

- [Performance
  Efficiency](https://docs.microsoft.com/en-us/azure/architecture/framework/scalability/overview):
  Performance efficiency is the ability of your workload to scale to
  meet the demands.

- [Reliability](https://docs.microsoft.com/en-us/azure/architecture/framework/resiliency/principles):
  In the cloud, we acknowledge up front that failures will happen.
  Instead of trying to prevent failures altogether, the goal is to
  minimize the effects of a single failing component.

- [Security](https://docs.microsoft.com/en-us/azure/architecture/framework/security/overview):
  Extremely important nowadays. You should protect your applications and
  data from threats at all costs.
