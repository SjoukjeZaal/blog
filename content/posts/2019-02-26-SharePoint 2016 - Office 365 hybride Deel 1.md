---
title : "Azure B2B SharePoint Online Solution"
date : 2019-02-26
---

Deel 1:

Azure Active Directory synchronisatie

Om een hybride omgeving op te zetten m.b.v. SharePoint 2016 en Office
365 dienen een aantal stappen te worden doorlopen. De eerste stap is het
synchroniseren van je On premise Active directory omgeving met Azure
Active directory.

Om je gebruikers accounts te kunnen synchroniseren met de cloud, wordt
de tool Azure AD Connect gebruikt die je hier kan dowloaden:
<https://www.microsoft.com/en-us/download/details.aspx?id=47594> .\
Om Azure AD Connect te kunnen gebruiken dient je server te voldoen aan
een aantal eisen. Deze eisen zijn na te lezen op de volgende website:
<https://azure.microsoft.com/en-us/documentation/articles/active-directory-aadconnect-prerequisites/>.

Als je omgeving voldoet aan de gestelde eisen kan je Azure AD Connect
installeren op de server waar Active Directory Services geinstalleerd
is:

1.  Dubbelklik op het .msi bestand. Dit opent het installatie programma;

2.  De welkomst pagina wordt geopend. Vink de checkbox aan en klik op
    "Continue".

![](media/image1.png)

http://www.avepoint.com/community/avepoint-blog/5-steps-configure-hybrid-features-sharepoint-2016-beta-2/
