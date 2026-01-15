---
title: "SharePoint 2013 Workflow Part 1: Workflow Manager Architecture"
date: 2012-02-02
---

**Leveraging Azure Marketplace Data in SharePoint Part 1: Consuming Azure Marketplace Data in BCS**

Windows Azure Marketplace data is a service by Microsoft that hosts WCF services in Windows Azure. Organizations and individuals can consume that data via a subscription model. These services expose data using REST services which can be leveraged in SharePoint using BCS.

For this example we are going to use US Crime data statistics Service (DATA.gov). By using BCS we can consume the Azure WCF Service and display this data in SharePoint via an External List.

For achieving the above we are going to take the following steps:

- Create an Azure Marketplace account and consume the data.

- Create a Custom .Net Connector to leverage this data in BCS.

- Use the Secure Store Service for Azure Marketplace authentication (part 2).

In the first part of this series we are going to register for an Azure Marketplace account so we can subscribe to a service. After this, we are going to create a BCS Custom .Net Connector for adding that data to SharePoint's BCS. In the next part of this series we are going to use Secure Store Service for Azure Marketplace Authentication.

**Azure Marketplace Data**

To get started navigate to [[https://datamarket.azure.com/]{.underline}](https://datamarket.azure.com/) and register for an account by using your Windows Live ID. Click the Windows Live Sign in the upper right corner, add your information, accept the license agreement and click register. Get a developer account, search for the US Crime Data Statistics Service and add it to your account. (some data sets cost money, so be aware). After you found the data feed click on it for more details. Then click the Sign Up button on the right. After this the data feed will be added to your account. Click the "My Account" button in the top navigation and click on "My Data" in the left navigation. You will see the newly added subscription on the page. Click on the title of the service which sends you to the details page of the Crime Service. Click on "Explore the dataset". A new window is opened and here you can filter the service data using the web browser. Add "Washington" to the "City" Textbox and click on "Run Query".

- Click on the "Develop" Button next to the Build Query window. This URL contains the address of the service together with the filter we've added earlier in the Query Box. You can use the whole URL if you like but you can also use the root service URL and filter the data using LINQ in the custom .Net Connector. At the top of the screen locate the Service Root URL and copy it.

**Create a Custom .Net Connector for Connecting to the Azure Service**

After registering for an Azure Marketplace account we are going to create a custom .Net Connector to connect the data feed with SharePoint. The build in WCF connector is not suitable for this scenario because the marketplace feed expects the developer key for consuming the service. So in this case a custom connector needs to be developed using Visual Studio.

For this example we are going to create a .Net Assembly Connector. This type of connector is used when the External System Schema is fixed, like the data schema of the Crime data feed.

- Open Visual Studio and create a new project.

- Choose the "Business Data Connectivity Model" as the project type. Call it "USCrimeDataConnector" (or call it anything you like) and click "OK".

- Choose the SharePoint Server URL on which you're going to debug and click Finish.

- Rename the default BDCModel and call it "CrimeDataModel".

- We start by creating an External List for the Azure Crime Data. Right click the existing **Entity1** and select **Delete**.

- Select **Entity1.cs** and **EntityService1.cs** in the **Solution Explorer** and delete them.

- Right click the canvas and select **Add -\> Entity**. Right click the new Entity and select **Properties.** In the properties window set the **Name** to **CrimeData.**

- Right click the CrimeData entity and select **Add -\> Identifier**.

- Select the Identifier and set the **Name** to **Id** using the **Properties Window**.

- Add a **ReadList** method to the CrimeData Entity. Right click the CrimeData Entity and select **Add -\> Method.** Rename the method to **ReadList**. In the **BDC Method Details** pane locate the **ReadList** Method and expand its parameters. Click the dropdown in **\<Add a Parameter\>** and choose **Create Parameter.** Set the following properties in the properties window:

  - **Name** to **ReturnParameter**

  - **ParameterDirection** to **Return**.

- In the BDC Method Details pane locate the **Instances** node, select **\<Add a Method Instance\>** and choose **Create Finder Instance.** Set the following properties in the **Properties Window**:

  - **Name** to **ReadList**

  - **Default** to **True**

  - **DefaultDisplay Name** to **Read List**

  - **Return Parameter** name to **returnParameter.**

- Open the **BDC Explorer Window**, expand the **ReadList** message and select the **returnParameterTypeDescriptor**. Set the following properties in the **Properties Window**:

  - **Name** = **CrimeDataList**

  - **TypeName** = **System.Collections.Generic.IEnumerable\`1\[\[USCrimeDataConnector.CrimeDataModel.CrimeData, CrimeDataModel\]\]**

  - **IsCollection** = **True.**

- In the **BDC Explorer**, right click **CrimeDataList** and select **Add Type Descriptor**. Set the following properties in the **Properties Window:**

  - **Name** = **CrimeData**

  - **TypeName** = **USCrimeDataConnector.CrimeDataModel.CrimeData, CrimeDataModel**.

- In the **BDC Explorer**, right click **CrimeData** and select **Add Type Descriptor**. Set the following properties in the **Properties Window:**

  - **Name** = **Id**

  - **TypeName** = **System.Int32**

  - **Identifier** = **Id.**

- Add 3 more type descriptors and set the following properties (same as above):

  - **Name** = **City**

  - **TypeName** = **System.String**

  - **Name** = **State**

  - **TypeName** = **System.String**

  - **Name** = **Year**

  - **TypeName** = **System.Int32**

- The next step is to define the **ReadItem** method. Right click the CrimeData Enitity in the canvas and select **Add -\> Method**. Rename the method to **ReadItem.**

- Switch to the **BDC Method Details Pane** and select the **ReadItem** node. Click the dropdown in **\<Add a Parameter\>** and choose **Create Parameter.** Set the following properties in the properties window:

  - **Name** = **ReturnParameter**

  - **ParameterDirection** = **Return**.

- Add another parameter and set the following properties:

  - **Name** = **Id**

  - **ParameterDirection** = **In.**

- In the **ReadItem** method **instances** node add a new **Create Finder** instance and set the following properties:

  - **Name** = **ReadItem**.

  - **Type** = **Specific Finder**

  - **Default** = **True**

  - **DefaultDisplayName = ReadItem**

  - **Return Parameter** = **ReturnParameter**

- In the BDC Explorer Window locate the ReadItem parameters and expand them both.

- Select **idTypeDescriptor** under the **ReadItem's** id parameter and set the following values in the **Properties** window:

  - **Name** = **CrimeDataId**.

  - **TypeName** = **System**. **Int32.**

  - **Identifier** = **Id.**

- Right Click **CrimeData** under **ReadList** -\> **ReturnParameter** -\> **CrimeDataList** -\> **CrimeData** and select **Copy.**

- Right Click **ReturnParameter** under **ReadItem** and select **Paste.**

- Click **Yes.**

- Locate the **Model** and rename it from **BDCModel1** to **CrimeDataModel.** Repeat this for the **LobSystem** and the **LobSystemInstance.**

- the BDC Explorer Window will look like the following figure:

- The BDC Model is ready. The next step is adding the Azure Marketplace Service Reference. Switch to the Solution Explorer and a **Service Reference.**

- Add the Azure Marketplace URL to the Address box and Call the Service **CrimeDataServiceReference**. Click **OK.**

- Switch back to the **Solution Explorer** and add a new class to the project. Call it **CrimeData.**

- Add the following code to the **CrimeData** class:

+---+------------------------------------+
| 1 | public class CrimeData {           |
|   |                                    |
| 2 |  public int Id { get; set; }       |
|   |                                    |
| 3 |  public string City { get; set; }  |
|   |                                    |
| 4 |  public string State { get; set; } |
|   |                                    |
| 5 |  public int Year { get; set; }     |
|   |                                    |
| 6 |                                    |
|   |                                    |
| 7 | }                                  |
+===+====================================+

- Add a new class to the project and call it **CrimeDataService**. Add the following code to the CrimeDataService class:

+----+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| 1  | public partial class CrimeDataService {                                                                                                                                                                                      |
|    |                                                                                                                                                                                                                              |
| 2  |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 3  | private string \_url = \"[[https://api.datamarket.azure.com/data.gov/Crimes/]{.underline}](https://api.datamarket.azure.com/data.gov/Crimes/)\";                                                                             |
|    |                                                                                                                                                                                                                              |
| 4  |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 5  | private string \_liveID = \"{Your LiveID}\";                                                                                                                                                                                 |
|    |                                                                                                                                                                                                                              |
| 6  |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 7  | private string \_accountID = \"{Your AccountKey}\";                                                                                                                                                                          |
|    |                                                                                                                                                                                                                              |
| 8  |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 9  | private static CrimeDataServiceReference.datagovCrimesContainer \_context;                                                                                                                                                   |
|    |                                                                                                                                                                                                                              |
| 10 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 11 | public CrimeDataService() {                                                                                                                                                                                                  |
|    |                                                                                                                                                                                                                              |
| 12 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 13 | \_context = new CrimeDataServiceReference.datagovCrimesContainer(new Uri(\_url))  Credentials = new NetworkCredential(\_liveID, \_accountID)                                                                                 |
|    |                                                                                                                                                                                                                              |
| 14 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 15 | };                                                                                                                                                                                                                           |
|    |                                                                                                                                                                                                                              |
| 16 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 17 | /// The underlying connection was closed: Could not establish trust relationship for the SSL/TLS secure channel.                                                                                                             |
|    |                                                                                                                                                                                                                              |
| 18 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 19 | /// \-\--\> System.Security.Authentication.AuthenticationException: The remote certificate is invalid according to the validation procedure.                                                                                 |
|    |                                                                                                                                                                                                                              |
| 20 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 21 | ServicePointManager.ServerCertificateValidationCallback += (sender1, certificate, chain, sslPolicyErrors) =\> true;                                                                                                          |
|    |                                                                                                                                                                                                                              |
| 22 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 23 | }                                                                                                                                                                                                                            |
|    |                                                                                                                                                                                                                              |
| 24 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 25 | public static IEnumerable\<CrimeData\> ReadList() {                                                                                                                                                                          |
|    |                                                                                                                                                                                                                              |
| 26 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 27 | try {                                                                                                                                                                                                                        |
|    |                                                                                                                                                                                                                              |
| 28 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 29 | var crimeData = (from c in \_context.CityCrime                                                                                                                                                                               |
|    |                                                                                                                                                                                                                              |
| 30 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 31 | where c.City == \"Washington\"                                                                                                                                                                                               |
|    |                                                                                                                                                                                                                              |
| 32 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 33 | select new CrimeData {                                                                                                                                                                                                       |
|    |                                                                                                                                                                                                                              |
| 34 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 35 | Id = c.ROWID,                                                                                                                                                                                                                |
|    |                                                                                                                                                                                                                              |
| 36 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 37 | City = c.City,                                                                                                                                                                                                               |
|    |                                                                                                                                                                                                                              |
| 38 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 39 | State = c.State,                                                                                                                                                                                                             |
|    |                                                                                                                                                                                                                              |
| 40 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 41 | Year = c.Year                                                                                                                                                                                                                |
|    |                                                                                                                                                                                                                              |
| 42 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 43 | }).ToList();                                                                                                                                                                                                                 |
|    |                                                                                                                                                                                                                              |
| 44 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 45 | return crimeData;                                                                                                                                                                                                            |
|    |                                                                                                                                                                                                                              |
| 46 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 47 | } catch (Exception ex) {                                                                                                                                                                                                     |
|    |                                                                                                                                                                                                                              |
| 48 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 49 | SPDiagnosticsService.Local.WriteTrace(0, new SPDiagnosticsCategory(\"Azure BCS connector: failed to fetch read list\", TraceSeverity.Unexpected, EventSeverity.Error), TraceSeverity.Unexpected, ex.Message, ex.StackTrace); |
|    |                                                                                                                                                                                                                              |
| 50 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 51 | }                                                                                                                                                                                                                            |
|    |                                                                                                                                                                                                                              |
| 52 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 53 | return null;                                                                                                                                                                                                                 |
|    |                                                                                                                                                                                                                              |
| 54 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 55 | }                                                                                                                                                                                                                            |
|    |                                                                                                                                                                                                                              |
| 56 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 57 | &amp;amp;amp;amp;nbsp;                                                                                                                                                                                                       |
|    |                                                                                                                                                                                                                              |
| 58 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 59 | public static CrimeData ReadItem(int Id) {                                                                                                                                                                                   |
|    |                                                                                                                                                                                                                              |
| 60 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 61 | try {                                                                                                                                                                                                                        |
|    |                                                                                                                                                                                                                              |
| 62 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 63 | var item = \_context.CityCrime.Where(x =\> x.ROWID == Id).ToList().First();                                                                                                                                                  |
|    |                                                                                                                                                                                                                              |
| 64 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 65 | var crimeData = new CrimeData {                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 66 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 67 | Id = item.ROWID,                                                                                                                                                                                                             |
|    |                                                                                                                                                                                                                              |
| 68 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 69 | City = item.City,                                                                                                                                                                                                            |
|    |                                                                                                                                                                                                                              |
| 70 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 71 | State = item.State,                                                                                                                                                                                                          |
|    |                                                                                                                                                                                                                              |
| 72 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 73 | Year = item.Year                                                                                                                                                                                                             |
|    |                                                                                                                                                                                                                              |
| 74 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 75 | };                                                                                                                                                                                                                           |
|    |                                                                                                                                                                                                                              |
| 76 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 77 | return crimeData;                                                                                                                                                                                                            |
|    |                                                                                                                                                                                                                              |
| 78 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 79 | } catch (Exception ex) {                                                                                                                                                                                                     |
|    |                                                                                                                                                                                                                              |
| 80 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 81 | SPDiagnosticsService.Local.WriteTrace(0, new SPDiagnosticsCategory(\"Azure BCS connector: failed to fetch read item\", TraceSeverity.Unexpected, EventSeverity.Error), TraceSeverity.Unexpected, ex.Message, ex.StackTrace); |
|    |                                                                                                                                                                                                                              |
| 82 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 83 | }                                                                                                                                                                                                                            |
|    |                                                                                                                                                                                                                              |
| 84 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 85 | return null;                                                                                                                                                                                                                 |
|    |                                                                                                                                                                                                                              |
| 86 |                                                                                                                                                                                                                              |
|    |                                                                                                                                                                                                                              |
| 87 | }                                                                                                                                                                                                                            |
+====+==============================================================================================================================================================================================================================+

- Press F5;

- After deploying the external Content Type we first need to set the permissions in the BDC Service Application. Browse to Central Administration. Go to **Application Management** -\> **Service Applications** and click the BDC Service application. Select the **CrimeData** ECT and click **Set Object Permissions**.

- Add yourself and assign all the permissions.

- Next is creating an external list for the CrimeData ECT. Creating an external list can be done by using SharePoint Designer or the browser. We will use the browser for this sample.

- Browse to the SharePoint site, click on **Site Actions -\> View All Site Content -\> Create.**

- Choose **External List** and Click **Create.**

- Name the List **CrimeData,** click on select **Select External Content Type** and choose the CrimeData external content type from the dialog. Click the **Create** button.

- After creating the External list verify that the Azure Marketplace CrimeData is visible in the page.

- Click on one of the list items to see the details.