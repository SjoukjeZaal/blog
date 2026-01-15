---
title: "Azure AD: Manually Create Authentication Code Part 1"
date: 2017-03-24
---

Visual Studio generates a lot of code for you, when you use the ASP.Net
project templates. The code required for authentication your application
to Azure AD, is added automatically for you when you run the ASP.NET Web
Application wizard creating a new project. As a developer, you don't
have to know what happens under de hood. You can just fill in your Azure
subscription details, generate your project and press F5... That's all.

But what is actually added to this project by Visual Studio? Which
classed and code do you actually need to authenticate your application?
And how does this all work?

If you want to know more, read on!

Let's start with creating a ASP.NET application, and ass this logic to
the application ourselves.

Open Visual Studio and create a new Web Application. Give it a name and
click OK. Then select **MVC** and leave the default or select **Change
Authentication** and make sure it is set to **No Authentication.**

Click OK and your project is created.
