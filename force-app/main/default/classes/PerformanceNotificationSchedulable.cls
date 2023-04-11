public with sharing class PerformanceNotificationSchedulable implements Schedulable {
    // Seconds Minutes Hours Day_of_month Month Day_of_week optional_year
    public static String JOB_NAME='Performance Notification';
    //public static string CHRONO_FORMAT='30 03 01 Jan,Apr,Jul,Oct *';
    public static string CHRONO_FORMAT='0 0 12 1 1/3 ? *';


    public PerformanceNotificationSchedulable(){

    }
    public void execute(SchedulableContext SC){
        PerformanceNotificationBatch Batch = new PerformanceNotificationBatch();
        Database.executeBatch(Batch);
    }
    public static void createSchedulableJob(){
        List<CronTrigger> scheduler;
        scheduler=([select id,cronjobdetail.id,cronjobdetail.name from CronTrigger where cronjobdetail.name=: PerformanceNotificationSchedulable.JOB_NAME]);
        if(scheduler.isEmpty()){
            system.schedule(PerformanceNotificationSchedulable.JOB_NAME, PerformanceNotificationSchedulable.CHRONO_FORMAT, new PerformanceNotificationSchedulable());
        }
    }
     
        }