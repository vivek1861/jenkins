@isTest
public with sharing class PerformanceNotificationBatchClassTest {
    @TestSetup
    static void makeData(){
        Id RTClient= Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Client').getRecordTypeId();
        Id RTExtAgs= Schema.SObjectType.Contact.getRecordTypeInfosByDeveloperName().get('External_AGS').getRecordTypeId();

        Account acc= new Account();
        acc.Name='gigi';
        acc.RecordTypeId=RTClient;
        insert acc;

        Contact cnt= new Contact();
        cnt.LastName='Rossi';
        cnt.FirstName='mario';
        cnt.MobilePhone='788373773';
        cnt.AccountId=acc.id;
        cnt.Email='chchhcch@ghff.it';
        cnt.RecordTypeId=RTExtAgs;
        insert cnt;

        OrderItem__c ordI = new OrderItem__c();
        ordI.name='RCI';
        ordI.Resource__c=cnt.Id;
        ordI.profile__c='Web Architect';
        ordI.January__c=40.0;
        ordI.February__c=20.0;
        ordI.March__c=30.0;
        ordI.April__c=40.0;
        ordI.May__c=20.0;
        ordI.June__c=10.0;
        ordI.July__c=40.0;
        ordI.August__c=20.0;
        ordI.September__c=20.0;
        ordI.October__c=40.0;
        ordI.November__c=20.0;
        ordI.December__c=7.0;
        insert ordI;

        CustomNotificationType cnType=[select id,DeveloperName FROM CustomNotificationType where DeveloperName='Alert'];
        Messaging.CustomNotification notif=new Messaging.CustomNotification();
    }

    @isTest
    public static void testMonth1() {
        Test.startTest();
        PerformanceNotificationBatch.testMonth = 1;
        PerformanceNotificationBatch obj = new PerformanceNotificationBatch();
        DataBase.executeBatch(obj);
        Test.stopTest();
    }

    @isTest
    public static void testMonth4() {

        Test.startTest();
        PerformanceNotificationBatch.testMonth = 4;
        PerformanceNotificationBatch obj = new PerformanceNotificationBatch();
        DataBase.executeBatch(obj);
        Test.stopTest();
    }

    @isTest
    public static void testMonth7() {

        Test.startTest();
        PerformanceNotificationBatch.testMonth = 7;
        PerformanceNotificationBatch obj = new PerformanceNotificationBatch();
        DataBase.executeBatch(obj);
        Test.stopTest();
    }


    @isTest
    public static void testMonth10() {

        Test.startTest();
        PerformanceNotificationBatch.testMonth = 10;
        PerformanceNotificationBatch obj = new PerformanceNotificationBatch();
        DataBase.executeBatch(obj);
        Test.stopTest();
    }
}