@isTest
public with sharing class PerformanceNotificationSchedulableTest {
   @isTest
   static void testMethod1(){
      test.startTest();
      PerformanceNotificationSchedulable.createSchedulableJob();
      test.stopTest();
   }
}