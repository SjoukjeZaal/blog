---
title: "Registering your application in the new Application Portal"
date: 2017-06-20
---

In my earlier post: [Microsoft Identities: What's
new](https://blogs.msdn.microsoft.com/azuredev/2017/05/24/microsoft-identities-whats-new/),
I briefly talked about the new Application Portal for application
registration in Azure. In this post, I want to show how you can register
your application in the new portal. No more manually registering your
application in Azure Active Directory using the Azure Portal, from the
Microsoft Graph site, you can do this in a couple of clicks.

So, let's get started.

Navigate to <https://graph.microsoft.com/>.

Click on **Quick Start** in the main menu.

Inside the Quick Start, you can pick the platform you'll be building
for. In this case, we are using ASP.NET MVC. Click the icon in the
overview.

The page scrolls down after picking the platform and you can get an App
Id and a secret. This is the part which registers your application in
Azure Active Directory. Click the **Get an App Id and Secret** button.

Sign in with your Azure credentials and your application is registered.
In the next screen, copy your App Secret to the clipboard and click the
button to go back.

If everything went well, you get a confirmation that the application is
registered. The application was given a default name. If you want to
change that, click the 'Manage your app in the Application Registration
Portal' at the bottom.

In there, you can also set the permissions for the application.


Scroll a bit down (in the previous screen), to the Start Coding section,
and paste the App secret from the clipboard into the text field. After
that click on the **Download the SDK based code sample**.

The Visual Studio solution is downloaded. Unzip the package and open the
solution.

Open the Web.config and you can see that all the settings for connecting
your application to Azure Active Directory are there.

Click F5 to run the application. Click on the log in link at the right
of the screen. Accept the permissions and click the **Get Email
Address** button.

Your email address is retrieved from Azure Active Directory using the
Microsoft Graph and filled in the text field.

## Conclusion

The new application portal makes it very easy to get started developing.
In a few clicks your application is registered and up and running. From
there you can start writing your own application code, and you don\'t
have to think or worry about the authentication code.

If you want more information, you can refer to the below links:

- <https://docs.microsoft.com/en-us/azure/active-directory/develop/active-directory-v2-app-registration>

- <https://docs.microsoft.com/en-us/azure/active-directory/develop/active-directory-appmodel-v2-overview>

- <https://docs.microsoft.com/en-us/azure/active-directory/develop/guidedsetups/active-directory-aspnetwebapp>

-Sjoukje
