CREATE TABLE `BizAppFlow` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `AppName` varchar(50) NOT NULL,
  `AppInstanceID` varchar(50) NOT NULL,
  `AppInstanceCode` varchar(50) NULL,
  `Status` varchar(10) NULL,
  `ActivityName` varchar(50) NOT NULL,
  `Remark` varchar(1000) NULL,
  `ChangedTime` datetime NOT NULL,
  `ChangedUserID` varchar(50) NOT NULL,
  `ChangedUserName` varchar(50) NULL,
  PRIMARY KEY )
);

CREATE TABLE `HrsLeave` (
  `ID` int NOT NULL,
  `LeaveType` smallint NOT NULL,
  `Days` decimal(18,1) NOT NULL,
  `FromDate` date NOT NULL,
  `ToDate` date NOT NULL,
  `CurrentActivityText` varchar(50) NULL,
  `Status` int NULL,
  `CreatedUserID` int NOT NULL,
  `CreatedUserName` varchar(50) NOT NULL,
  `CreatedDate` date NOT NULL,
  `DepManagerRemark` varchar(50) NULL,
  `DirectorRemark` varchar(50) NULL,
  `DeputyGeneralRemark` varchar(50) NULL,
  `GeneralManagerRemark` varchar(50) NULL,
  PRIMARY KEY )
);

CREATE TABLE `HrsLeaveOpinion` (
  `ID` int NOT NULL,
  `AppInstanceID` varchar(50) NOT NULL,
  `ActivityID` varchar(50) NULL,
  `ActivityName` varchar(50) NOT NULL,
  `Remark` varchar(1000) NULL,
  `ChangedTime` datetime NOT NULL,
  `ChangedUserID` int NOT NULL,
  `ChangedUserName` varchar(50) NULL,
  PRIMARY KEY )
);

CREATE TABLE `ManProductOrder` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `OrderCode` varchar(30) NULL,
  `Status` smallint NULL,
  `ProductName` varchar(100) NULL,
  `Quantity` int NULL,
  `UnitPrice` decimal(18,2) NULL,
  `TotalPrice` decimal(18,2) NULL,
  `CreatedTime` datetime NULL,
  `CustomerName` varchar(50) NULL,
  `Address` varchar(100) NULL,
  `Mobile` varchar(30) NULL,
  `Remark` varchar(1000) NULL,
  `LastUpdatedTime` datetime NULL,
  PRIMARY KEY )
);

CREATE TABLE `SysDepartment` (
  `ID` int NOT NULL,
  `DeptCode` varchar(50) NOT NULL,
  `DeptName` varchar(100) NOT NULL,
  `ParentID` int NOT NULL,
  `Description` varchar(500) NULL,
  PRIMARY KEY )
);

CREATE TABLE `SysEmployee` (
  `ID` int NOT NULL,
  `DeptID` int NOT NULL,
  `EmpCode` varchar(50) NOT NULL,
  `EmpName` varchar(50) NOT NULL,
  `UserID` int NULL,
  `Mobile` varchar(20) NULL,
  `EMail` varchar(100) NULL,
  `Remark` varchar(500) NULL,
  PRIMARY KEY )
);

CREATE TABLE `SysEmployeeManager` (
  `ID` int NOT NULL,
  `EmployeeID` int NOT NULL,
  `EmpUserID` int NOT NULL,
  `ManagerID` int NOT NULL,
  `MgrUserID` int NOT NULL,
  PRIMARY KEY )
);

CREATE TABLE `SysResource` (
  `ID` int NOT NULL,
  `ResourceType` smallint NOT NULL,
  `ParentResourceID` int NOT NULL,
  `ResourceName` varchar(50) NOT NULL,
  `ResourceCode` varchar(100) NOT NULL,
  `OrderNo` smallint NULL,
  PRIMARY KEY )
);

CREATE TABLE `SysRole` (
  `ID` int NOT NULL,
  `RoleCode` varchar(50) NOT NULL,
  `RoleName` varchar(50) NOT NULL,
  PRIMARY KEY )
);

CREATE TABLE `SysRoleUser` (
  `ID` int NOT NULL,
  `RoleID` int NOT NULL,
  `UserID` int NOT NULL,
  PRIMARY KEY )
);

CREATE TABLE `SysUser` (
  `ID` int NOT NULL,
  `UserName` varchar(50) NOT NULL,
  PRIMARY KEY )
);

CREATE TABLE `SysUserResource` (
  `ID` int NOT NULL,
  `UserID` int NOT NULL,
  `ResourceID` int NOT NULL,
  PRIMARY KEY )
);

CREATE TABLE `WfActivityInstance_20190731152709` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ProcessInstanceID` int NOT NULL,
  `AppName` varchar(50) NOT NULL,
  `AppInstanceID` varchar(50) NOT NULL,
  `ProcessGUID` varchar(100) NOT NULL,
  `ActivityGUID` varchar(100) NOT NULL,
  `ActivityName` varchar(50) NOT NULL,
  `ActivityType` smallint NOT NULL,
  `ActivityState` smallint NOT NULL,
  `WorkItemType` smallint NOT NULL,
  `AssignedToUserIDs` varchar(1000) NULL,
  `AssignedToUserNames` varchar(2000) NULL,
  `BackwardType` smallint NOT NULL,
  `BackSrcActivityInstanceID` int NULL,
  `GatewayDirectionTypeID` smallint NULL,
  `CanRenewInstance` tinyint NOT NULL,
  `TokensRequired` int NOT NULL,
  `TokensHad` int NOT NULL,
  `ComplexType` smallint NULL,
  `MergeType` smallint NULL,
  `MIHostActivityInstanceID` int NULL,
  `CompareType` smallint NULL,
  `CompleteOrder` float NULL,
  `SignForwardType` smallint NULL,
  `CreatedByUserID` varchar(50) NOT NULL,
  `CreatedByUserName` varchar(50) NOT NULL,
  `CreatedDateTime` datetime NOT NULL,
  `LastUpdatedByUserID` varchar(50) NULL,
  `LastUpdatedByUserName` varchar(50) NULL,
  `LastUpdatedDateTime` datetime NULL,
  `EndedByUserID` varchar(50) NULL,
  `EndedByUserName` varchar(50) NULL,
  `EndedDateTime` datetime NULL,
  `RecordStatusInvalid` tinyint NOT NULL,
  `RowVersionID` timestamp NULL,
  PRIMARY KEY (`ID`)
);

CREATE TABLE `WfLog_20190731152709` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `EventTypeID` int NOT NULL,
  `Priority` int NOT NULL,
  `Severity` varchar(50) NOT NULL,
  `Title` varchar(256) NOT NULL,
  `Message` varchar(500) NULL,
  `StackTrace` varchar(4000) NULL,
  `InnerStackTrace` varchar(4000) NULL,
  `RequestData` varchar(2000) NULL,
  `Timestamp` datetime NOT NULL,
  PRIMARY KEY (`ID`)
);

CREATE TABLE `WfProcess_20190731152709` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ProcessGUID` varchar(100) NOT NULL,
  `ProcessName` varchar(50) NOT NULL,
  `Version` varchar(20) NOT NULL,
  `IsUsing` tinyint NOT NULL,
  `AppType` varchar(20) NULL,
  `PageUrl` varchar(100) NULL,
  `XmlFileName` varchar(50) NULL,
  `XmlFilePath` varchar(50) NULL,
  `XmlContent` varchar(2147483647) NULL,
  `StartType` tinyint NOT NULL,
  `StartExpression` varchar(100) NULL,
  `EndType` tinyint NOT NULL,
  `EndExpression` varchar(100) NULL,
  `Description` varchar(1000) NULL,
  `CreatedDateTime` datetime NOT NULL,
  `LastUpdatedDateTime` datetime NULL,
  PRIMARY KEY (`ID`)
);

CREATE TABLE `WfProcessInstance_20190731152709` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ProcessGUID` varchar(100) NOT NULL,
  `ProcessName` varchar(50) NOT NULL,
  `Version` varchar(20) NOT NULL,
  `AppInstanceID` varchar(50) NOT NULL,
  `AppName` varchar(50) NOT NULL,
  `AppInstanceCode` varchar(50) NULL,
  `ProcessState` smallint NOT NULL,
  `ParentProcessInstanceID` int NULL,
  `ParentProcessGUID` varchar(100) NULL,
  `InvokedActivityInstanceID` int NOT NULL,
  `InvokedActivityGUID` varchar(100) NULL,
  `CreatedDateTime` datetime NOT NULL,
  `CreatedByUserID` varchar(50) NOT NULL,
  `CreatedByUserName` varchar(50) NOT NULL,
  `OverdueDateTime` datetime NULL,
  `OverdueTreatedDateTime` datetime NULL,
  `LastUpdatedDateTime` datetime NULL,
  `LastUpdatedByUserID` varchar(50) NULL,
  `LastUpdatedByUserName` varchar(50) NULL,
  `EndedDateTime` datetime NULL,
  `EndedByUserID` varchar(50) NULL,
  `EndedByUserName` varchar(50) NULL,
  `RecordStatusInvalid` tinyint NOT NULL,
  `RowVersionID` timestamp NULL,
  PRIMARY KEY (`ID`)
);

CREATE TABLE `WfTasks_20190731152709` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ActivityInstanceID` int NOT NULL,
  `ProcessInstanceID` int NOT NULL,
  `AppName` varchar(50) NOT NULL,
  `AppInstanceID` varchar(50) NOT NULL,
  `ProcessGUID` varchar(100) NOT NULL,
  `ActivityGUID` varchar(100) NOT NULL,
  `ActivityName` varchar(50) NOT NULL,
  `TaskType` smallint NOT NULL,
  `TaskState` smallint NOT NULL,
  `EntrustedTaskID` int NULL,
  `AssignedToUserID` varchar(50) NOT NULL,
  `AssignedToUserName` varchar(50) NOT NULL,
  `CreatedByUserID` varchar(50) NOT NULL,
  `CreatedByUserName` varchar(50) NOT NULL,
  `CreatedDateTime` datetime NOT NULL,
  `LastUpdatedByUserID` varchar(50) NULL,
  `LastUpdatedByUserName` varchar(50) NULL,
  `LastUpdatedDateTime` datetime NULL,
  `EndedByUserID` varchar(50) NULL,
  `EndedByUserName` varchar(50) NULL,
  `EndedDateTime` datetime NULL,
  `RecordStatusInvalid` tinyint NOT NULL,
  `RowVersionID` timestamp NULL,
  PRIMARY KEY (`ID`)
);

CREATE TABLE `WfTransitionInstance_20190731152709` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TransitionGUID` varchar(100) NOT NULL,
  `AppName` varchar(50) NOT NULL,
  `AppInstanceID` varchar(50) NOT NULL,
  `ProcessInstanceID` int NOT NULL,
  `ProcessGUID` varchar(100) NOT NULL,
  `TransitionType` tinyint NOT NULL,
  `FlyingType` tinyint NOT NULL,
  `FromActivityInstanceID` int NOT NULL,
  `FromActivityGUID` varchar(100) NOT NULL,
  `FromActivityType` smallint NOT NULL,
  `FromActivityName` varchar(50) NOT NULL,
  `ToActivityInstanceID` int NOT NULL,
  `ToActivityGUID` varchar(100) NOT NULL,
  `ToActivityType` smallint NOT NULL,
  `ToActivityName` varchar(50) NOT NULL,
  `ConditionParseResult` tinyint NOT NULL,
  `CreatedByUserID` varchar(50) NOT NULL,
  `CreatedByUserName` varchar(50) NOT NULL,
  `CreatedDateTime` datetime NOT NULL,
  `RecordStatusInvalid` tinyint NOT NULL,
  `RowVersionID` timestamp NULL,
  PRIMARY KEY (`ID`)
);


