---
title: "Microsoft.Workflow.Common. FatalException error after installing Cumulative Update for Workflow Manager 1.0"
date: 2014-06-04
---

When I installed the **Cumulative Update for Workflow Manager 1.0**, I received a Microsoft.Workflow.Common.FatalException error. The **Workflow Manager Backend Service** stopped working and when I tried to re-start the service, it crashed.

Navigating to the **Workflow Management Site** resulted in a **500 Internal Server Error**.

## **Error Details**

After checking the **Event Viewer**, the following error message appeared:

Plaintext

Microsoft.Workflow.Common.FatalException: An unrecoverable error occurred.   
For diagnostic purposes, this English message is associated with the failure:   
‘A required Workflow Manager configuration ‘WorkflowServiceScopeSnapshotProcessBatchSize’ is not present.   
Please add this configuration value.’. —\> System.IO.InvalidDataException:   
A required Workflow Manager configuration ‘WorkflowServiceScopeSnapshotProcessBatchSize’ is not present.

### **Stack Trace**

Plaintext

at Microsoft.Workflow.Common.AsyncResult.End\[TAsyncResult\](IAsyncResult result)  
at Microsoft.Workflow.Service.WorkflowServiceBackendHost.OnStartCompleted(IAsyncResult result)  
— End of inner exception stack trace —  
at Microsoft.Workflow.Common.Fx.\<\>c\_\_DisplayClass2.\<FailFast\>b\_\_0()  
at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state, Boolean preserveSyncCtx)  
at System.Threading.ExecutionContext.Run(ExecutionContext executionContext, ContextCallback callback, Object state, Boolean preserveSyncCtx)  
at System.Threading.ExecutionContext.Run(ExecutionContext executionContext, ContextCallback callback, Object state)  
at System.Threading.ThreadHelper.ThreadStart()

## **Solution**

It seems that there are some configuration values missing from the **Workflow Resource Management Database**. Add the below values to the WorkflowServiceConfig table:

* **WorkflowServiceScopeSnapshotProcessBatchSize**: 20  
* **WorkflowServiceScopeSnapshotProcessLoopInterval**: 00:05:00  
* **WorkflowServiceSuspendedInstanceRetentionDuration**: 30.00:00:00  
* **WorkflowServiceMaxInstanceCompressedSizeKB**: 5120

### **Verification**

Restart the **Workflow Manager Backend Service** and navigate to the **Workflow Management Site**. The service should now be operational.