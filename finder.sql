-----------------BEGIN: Script to be run at Publisher 'ANCHELSEA'-----------------
use [QLVT_DATHANG]
exec sp_addmergesubscription @publication = N'QLVT_DATHANG_TRACUU', @subscriber = N'ANCHELSEA\SERVER3', @subscriber_db = N'QLVT_DATHANG', @subscription_type = N'Push', @sync_type = N'Automatic', @subscriber_type = N'Global', @subscription_priority = 75, @description = null, @use_interactive_resolver = N'False'
exec sp_addmergepushsubscription_agent @publication = N'QLVT_DATHANG_TRACUU', @subscriber = N'ANCHELSEA\SERVER3', @subscriber_db = N'QLVT_DATHANG', @job_login = null, @job_password = null, @subscriber_security_mode = 0, @subscriber_login = N'sa', @subscriber_password = null, @publisher_security_mode = 1, @frequency_type = 64, @frequency_interval = 0, @frequency_relative_interval = 0, @frequency_recurrence_factor = 0, @frequency_subday = 0, @frequency_subday_interval = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 20201202, @active_end_date = 99991231, @enabled_for_syncmgr = N'False'
GO
-----------------END: Script to be run at Publisher 'ANCHELSEA'-----------------

