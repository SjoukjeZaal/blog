---
title: "Introduction to Azure Event Grid"
date: 2018-05-28
---

Modern computing today is all distributed and Azure is designed from the
ground up using distributed services and resources. Examples of those
services and resources are, Azure Functions, Logic Apps, Azure Services
Bus, IoT Hub, and more. But, all those services and resources are
operating on their own island and to let those different resources,
communicate with each other, Azure Event Grid comes into place.

Azure Event Grid offers a fully-managed intelligent event routing
service, which can be used to glue all these different distributed
services and resources together. It is part of the messaging landscape
of Azure and it offers a cross cloud eventing platform from the
Microsoft Cloud.

Azure Event Grid simplifies the creation of event-based applications by
managing all routing of events from any source, to any destination, for
any application and Azure resource. Using Event Grid, you don't have to
create all these connections and integrations manually. You can
subscribe to any event that is happening across the different Azure
resources in your subscription, and act on that event using Azure
Functions, Logic Apps, different apps and services included in Office
365, custom applications and more.

In Azure Event Grid, you can easily select the resource you would like
to subscribe to and specify the event handler or WebHook to publish the
event to. You can use filters to select specific events or use filters
to route specific events to specific endpoints as well.


# Azure Event Grid Concepts

Azure Event Grid uses the below concepts:

## Events

An event is a piece of information that describes something that
happened inside a system or application. Each event has common
information like a unique identifier, the source of the event and the
time the event took place. It has relevant information about the type of
the event as well. For example, an event that is created after a new
file or image is being uploaded to Azure Blob Storage, has specific
details about that file as well, like BlobType, which described the type
of Blob. This can be a Block Blob or a Page Blob, for instance.

## Event Sources/ Publishers

The Event Source is the initiator or creator of the event. For example,
Azure Blob Storage is the event source for Blob created events. The
Event sources are responsible for publishing the events to Event Grid.

By the time of writing this post, the following Azure Services support
publishing events to Event Grid:

- Azure Subscriptions and Resource Groups (management operations)

- Event Hubs

- Media Services

- Blob Storage

- Service Bus

- Storage General-purpose v2 (GPv2)

- IoT Hub

- Custom Topics

## Topics

Events are categorized into topics by the publisher. Azure Event Grid
offers an endpoint where the publisher can send events to. When the
event is published to Event Grid, the subscriber can decide to which
topic it described to. Topics also provide a schema, so the subscribers
can know how to subscribe to the event accordingly.

## Event Subscriptions

The subscription tells Event Grid where the events on a topic are sent
to. It also gives information about which specific events the subscriber
is interested in. It provides information about how the event needs to
be delivered to the subscriber as well.

## 

## Event Handlers

The Event Handler is the receiver of the event and it is responsible of
further processing the event and take further action on the event. Azure
Event Grid offers different mechanisms for delivering the event to the
Event Handler. It offers a retrying mechanism for HTTP and WebHooks.

By the time of writing this post, the following Event handlers are
available:

- Event Hubs

- Hybrid Connections

- Azure Automation

- Azure Functions

- Logic Apps

- Microsoft Flow

- Queue Storage

- WebHooks

## Security

Event Grid offers security for subscribing for, and publishing topics.
Subscribers need to have sufficient permissions (**Write** permissions)
on the resource or topics. For publishing events, a SAS token or key
authentication is needed for the topic.

See below the overview image of the different Topics and Subscribers.
This image is taken from the following Azure Event Grid documentation
website: <https://docs.microsoft.com/en-us/azure/event-grid/overview>

# Wrap-up

In this post, I've described Azure Event Grid from a high level, briefly
talked about how Azure is designed from the ground up using distributed
components and what Azure Event Grid has to offer to let all those
components communicate with each other from a single service. In the
upcoming posts, we will work out some scenarios where Event Grid is used
to glue the different services and resources together.

-Sjoukje