---
title: "Azure Active Directory Flavors"
date: 2017-08-03
---

Azure Active Directory is the heart of everything inside of Microsoft Azure. All Azure services are depending on it and using it for Identity Management in the Microsoft Cloud. Office 365, Intune, Exchange Online, Enterprise Mobility Suite, are all examples of Azure Services depending on Azure Active directory for both security and identity management. And when implemented right, all your custom applications, which are hosted in Azure or somehow are integrating with Azure services are using Azure Active Directory as well.

That's why it is high on the agenda of Microsoft and it is constantly evolving. In this article, I want to give an overview of the different flavors of Azure Active Directory and where it stands right know, because what once started as a basic user directory, has now become something much more than that...

## Azure Active Directory

As pointed out before Azure AD is the heart of everything inside of Azure. Plain Azure AD, is the "root service" where you create the user accounts for your organization and which can be used for application access management. It is designed for a single tenant, so it is designed for a single organization. This doesn't mean that it doesn't supports a multi-domain environment, but there are differences and restrictions. Azure Active Directory has been set up using a different architecture as the Windows Server Active Directory was set up many years ago.

Customers that are using Office 365, Intune or Dynamics CRM online, are not always aware of the fact that they are using Azure Active Directory. It can easily be integrated with an existing Windows Server Active Directory using [AAD Connect](https://docs.microsoft.com/en-us/azure/active-directory/connect/active-directory-aadconnect), so the on-premises identity investments that are already made by organizations, can be leveraged in the cloud as well.

Azure Active Directory also consists of a full suite of enterprise identity management capabilities, which are now available for the smaller companies as well for a fair cost. It includes Multi-Factor Authentication, device registration, self-service password management, self-service group management, privileged account management, role based access control, application usage monitoring, rich auditing and security monitoring and alerting. It depends of the Azure AD edition if these features are included. There are three editions, Azure Active Directory Basic, Premium P1 and Premium P2. You can refer to the following article on what is included in these different editions: <https://azure.microsoft.com/en-us/pricing/details/active-directory/>

## Azure Active Directory B2B

Azure Active Directory Business-to-Business is a fairly new service which offers collaboration capabilities for organization which are using Azure AD. With Azure AD B2C you can work safely and securely with users from other organizations.

With the use of this service, organizations can provide access to documents, resources and applications to their partners, while maintaining complete control over their own corporate data. Developers can use the Azure AD B2C API's to write applications that bring two organizations together.

Partners can use their own credentials to sign in, and there is no requirement for having an Azure AD tenant of their own. This means you don't have to manage external accounts anymore.

Corporate data is protected using policies which can be added at the tenant level, the application level and user level.

This sounds very promising and I really hope this can replace the external sharing feature of Office 365, as this is not an enterprise ready sharing mechanism in my opinion.

## 

You can watch [the video](https://www.youtube.com/watch?v=AhwrweCBdsc) with more information on Azure B2B on Youtube

## 

## Azure Active Directory B2C

Azure AD Business to Consumer is a cloud identity management solution for mobile and web applications. It is a highly available and it can scale to hundreds of millions of identities. Azure AD B2C is not Azure AD, it is a developer feature which can be leveraged in custom applications.

With minimal configuration, Azure AD B2C offers the following authentication providers:

- Social Accounts (like Facebook, Google, LinkedIn and more)

- Enterprise Accounts (using open standards protocols, like OpenID Connect or SAML)

- Local Accounts (like accounts using email address and password or username and password)

Beside these authentication providers, additional ones can be added as well through the Azure Portal. New authentication providers are constantly added by Microsoft, so if your application uses some other authentication provider, there's a big change you can add this one to Azure B2C in the Azure portal.

In Azure B2C, you cannot use the employee identities which are stored in Azure AD. It is a separate product and cannot be integrated with Azure AD. So, you can't use the features that are offered for Azure AD inside of Azure B2C. What it does offer is, MFA, sign-in reports, usage reports and audit reports.

## Azure AD Directory Services (AADDS)

Azure AD Directory Services is an extension of Azure AD and it provides managed domain services such as domain join, group policy, LDAP, Kerberos/NTLM authentication that are fully compatible with Windows Server Active Directory.

Legacy applications often depend on LDAP or Windows Integrated Authentication (NTLM or Kerberos) to authenticate users. To migrate those applications to the cloud, these dependencies on the corporate identity infrastructure need to be resolved.

So, instead of having to deploy VM's with domain controllers in the cloud or deploy a site-to-site VPN connection organizations can use Azure AD Directory Services for authenticating users in hybrid scenario's.

For more information you can refer to the following site: <https://docs.microsoft.com/en-us/azure/active-directory-domain-services/active-directory-ds-overview>

## Conclusion

Azure Active Directory has a lot to offer these days. Additional features can help organization to overcome the flaws in the original architecture, as it was designed in the early Azure days. You are not bound to that one Azure AD tenant anymore.

Also, in hybrid scenarios Azure AD has a lot to offer. Migrating to the cloud, is much easier using these features, and it is even possible to keep a part of your applications on-premises.

Hopefully, you got some more understanding of the different services and features after reading this article. And more hopefully, you are going to use them for your organization and applications in the near future.

Cheers, Sjoukje

Ps. I have big expectations of Azure AD B2B myself. So, if anyone is already using this in conjunction with Office 365, please let me know. I'm really curious if this is working as expected.


