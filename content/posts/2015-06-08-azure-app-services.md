---
title: "Azure App Services"
date: 2015-06-08
---

Afgelopen maart heeft Microsoft Azure App Services gelanceerd. App Services is een samenvoeging van verschillende services n.l., Web Apps (wat voorheen Azure Websites was), Mobile Apps (wat gebaseerd is op Azure Mobile Services) en 2 nieuwe services, Logic Apps en API Apps.

Met deze nieuwe services biedt Microsoft een breed scala aan mogelijkheden. Met Web Apps en Mobile Apps kunnen ontwikkelaars web applicaties en mobiele applicaties bouwen. Met Logic Apps is het mogelijk om integratieoplossingen te ontwikkelen en deze onderdelen kunnen onderling met elkaar communiceren d.m.v. API Apps.

Hieronder leg ik kort uit wat de mogelijkheden van deze nieuwe services zijn.

## Web Apps

Azure Web Apps vervangt de bestaande Azure Websites en bevat alle onderdelen die Azure websites ook boden. Dit bevat o.a.:

- Ondersteuning voor .NET, Node.js, Java, PHP en Python code

- Ingebouwde functie voor automatisch schalen en taakverdeling

- Hoge beschikbaarheid met automatische patches

- Doorlopende implementaties met Git, TFS, GitHub, BItBucket en Visual Studio Online

- Virtuele netwerk ondersteuning en hybride connecties met on-premise netwerken en databases

Als je al gebruik maakt van Azure Websites dan zal je zien dat alle instances in de Azure Management Portal hernoemd zijn naar Web Apps.

Kijk hier voor meer informatie over Web Apps: <http://azure.microsoft.com/nl-nl/services/app-service/web/>

## Mobile Apps

Azure Mobile Services blijft bestaan als een losstaande service en wordt nog volledig ondersteund door Microsoft.

Azure Mobile Apps bevat de basisonderdelen van Azure Mobile Services en daarnaast een aantal nieuwe onderdelen zoals:

- Ingebouwde functie voor automatisch schalen en taakverdeling

- Doorlopende implementaties met Git, TFS, GitHub, BItBucket en Visual Studio Online

- Virtuele netwerk ondersteuning en hybride connecties met on-premise netwerken en databases

- Traffic Manager ondersteuning (automatische wereldwijde schaling)

Azure Mobile Apps is op dit moment nog in public preview. Kijk hier voor meer informatie: <http://azure.microsoft.com/nl-nl/services/app-service/mobile/>

## Logic Apps

Logic Apps is een nieuwe services die gebaseerd is op de technologie van BizTalk Services (BizTalk Services blijft bestaan als een losstaande service en wordt nog volledig ondersteund door Microsoft). Hiermee is het mogelijk om integratieoplossingen te bouwen.

Je kan hiermee b.v. een workflow configureren die automatisch uitgevoerd wordt bij het aanroepen van een API, of die op ingestelde tijden een record wegschrijft naar een database. Binnen die workflow is het dan mogelijk om bepaalde taken uit te voeren, zoals het ophalen van een record uit CRM / Salesforce, een item aanmaken in Office 365, een email te verzenden of een bericht te posten op Facebook, Twitter of Yammer.

Workflows kunnen gedefinieerd worden met een JSON bestand of m.b.v de Logic Designer in de nieuwe Azure Portal.

Hieronder zie je een screenshot van de nieuwe Logic Designer. Hierin is een workflow geconfigureerd die iedere minuut op Twitter zoekt naar een tweet over Azure. Via Twilio worden er dan sms berichten gestuurd met de inhoud van de tweet.

## 

Azure Logic Apps bevat op dit moment de onderstaande connectoren:

Logic Apps is op dit moment nog in public preview. Kijk hier voor meer informatie over Logic Apps: <http://azure.microsoft.com/nl-nl/services/app-service/logic/>

## API Apps

Naast de al bestaande mogelijkheid om API's te hosten in Azure Web Apps is het nu mogelijk om een API App te bouwen. Dit biedt de volgende extra mogelijkheden:

- De SDK om de API aan te roepen kan automatisch gegeneerd worden

- API Apps kunnen in Logic Apps gebruikt worden

- De API App kan in publieke galerieën (waaronder de Marketplace) en in particuliere organisatie-galerieën gedeeld en verkocht worden (*Dit is nog niet mogelijk in de preview versie*).

- API Apps kunnen automatisch geüpdatet worden. (*Dit is nog niet mogelijk in de preview versie*).

API Apps kunnen in .NET, Node.js, Java, PHP en Python code gebouwd worden. Achter de schermen wordt er dan een Web App gecreëerd met speciale metadata.

Ook API Apps is op dit moment nog in public preview. Kijk hier voor meer informatie over API Apps: <http://azure.microsoft.com/nl-nl/services/app-service/api/>

## Meer informatie

Wil je meer informatie over de nieuwe Azure App Services of gaan beginnen met het bouwen van Apps, kijk dan op de onderstaande sites:

Azure App Services: <http://azure.microsoft.com/en-us/services/app-service/>

Azure App Service Architecture: <https://www.youtube.com/watch?v=jMtNOzUKhDQ>

Logic Apps: <http://channel9.msdn.com/events/Ignite/2015/BRK1450>

Azure App Service Logic Apps with Josh Twist: <http://channel9.msdn.com/Shows/Azure-Friday/Azure-App-Service-Logic-Apps-with-Josh-Twist>

Configure a Web API project as an API app: <http://azure.microsoft.com/en-us/documentation/articles/app-service-dotnet-create-api-app-visual-studio/>

Azure App Services pricing: <http://azure.microsoft.com/en-us/pricing/details/app-service/>

Azure Preview Portal: <https://portal.azure.com>