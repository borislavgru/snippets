-- drop foreign key constraints from tables which will be dropped
Declare @sql nvarchar(MAX); 
Select @sql = COALESCE(@sql + '; ' + query, query) 
        From 
		(
		SELECT 
    'ALTER TABLE [' +  OBJECT_SCHEMA_NAME(parent_object_id) +
    '].[' + OBJECT_NAME(parent_object_id) + 
    '] DROP CONSTRAINT [' + name + '] ' query
FROM sys.foreign_keys
WHERE referenced_object_id IN 
(object_id('ManagementDiagramColumn'),
object_id('AppColor'),
object_id('AutomaticTaskClusterReport'),
object_id('ManagementViewCapacityRange'),
object_id('Capacity'),
object_id('IpFamilySteeringStatu'),
object_id('KanbanColumn'),
object_id('ManagementView'),
object_id('ManagementViewXprocessConnection'),
object_id('XProcessJobInstanceMinMax'),
object_id('XProcessJobInstance'),
object_id('XProcessQGInstance'),
object_id('XProcessInstance'),
object_id('XProcessVersion'),
object_id('XQG'),
object_id('MilestoneCluster'),
object_id('PublicHoliday'),
object_id('PublicHolidayDate'),
object_id('SchedulerDetailedStatus'),
object_id('SchedulerStatus'),
object_id('SwRelease'),
object_id('Xjob'),
object_id('TaskCluster'),
object_id('TypeOfCharge'),
object_id('UserCombustionEngine'),
object_id('UserEDriveEngine'),
object_id('UserSery'),
object_id('VCycleTest'),
object_id('VCycleTestAtct'),
object_id('VcycleCluster'),
object_id('WorkingDaysOfWeek'),
object_id('XProcessJobConnection'),
object_id('XProcessJobRole'),
object_id('XProcessJob'),
object_id('XProcessJobConnectionGroupInstance'),
object_id('XProcessJobConnectionGroup'),
object_id('XProcessMarket'),
object_id('XProcessQG'),
object_id('Xprocess'))) a
execute sp_executesql @sql

-- drop foreign key columns
ALTER TABLE AutomaticTaskClusterReportAtctCluster DROP COLUMN AutomaticTaskClusterReportId
GO
ALTER TABLE AutomaticTaskClusterReportMdv DROP COLUMN AutomaticTaskClusterReportId
GO
ALTER TABLE KanbanColumns DROP COLUMN ManagementViewId
GO
ALTER TABLE ManagementDiagramColumn DROP COLUMN ManagementViewId
GO
ALTER TABLE ManagementViewCapacityRange DROP COLUMN ManagementViewId
GO
ALTER TABLE ManagementViewXProcessConnection DROP COLUMN ManagementViewId
GO
ALTER TABLE PublicHolidayDate DROP COLUMN PublicHolidayId
GO
ALTER TABLE SchedulerDetailedStatus DROP COLUMN ProcessInstanceId
GO
ALTER TABLE XProcessJobConnectionGroupInstance DROP COLUMN ProcessInstanceId
GO

-- drop views
DROP VIEW IF EXISTS
ViewFina,
ViewIpFamilyAllFinasLong,
ViewIpFamilyAtct,
ViewIpFamilyDifferentiation,
ViewIpFamilyDifferentiationCode,
ViewIpFamilyFina,
ViewIpFamilyFirstFunktionsTypAtct,
ViewIpFamilyXprocess,
ViewMyTask
GO

-- drop tables
DROP TABLE IF EXISTS
ManagementDiagramColumn,
AppColor,
AutomaticTaskClusterReport,
ManagementViewCapacityRange,
Capacity,
IpFamilySteeringStatu,
KanbanColumn,
ManagementView,
ManagementViewXprocessConnection,
XProcessJobInstanceMinMax,
XProcessJobInstance,
XProcessQGInstance,
XProcessInstance,
XProcessVersion,
XQG,
MilestoneCluster,
PublicHoliday,
PublicHolidayDate,
SchedulerDetailedStatus,
SchedulerStatus,
SwRelease,
Xjob,
TaskCluster,
TypeOfCharge,
UserCombustionEngine,
UserEDriveEngine,
UserSery,
VCycleTest,
VCycleTestAtct,
VcycleCluster,
WorkingDaysOfWeek,
XProcessJobConnection,
XProcessJobRole,
XProcessJob,
XProcessJobConnectionGroupInstance,
XProcessJobConnectionGroup,
XProcessMarket,
XProcessQG,
Xprocess
GO