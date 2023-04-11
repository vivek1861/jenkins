global without sharing class PerformanceNotificationBatch implements database.Batchable<sObject> {
    String query;
    public Static Integer testMonth;

    public PerformanceNotificationBatch() {
    query ='SELECT id,Resource__c, Resource__r.name,Order__r.OrderNumber, January__c, February__c, March__c, April__c, May__c, June__c, July__c, August__c, September__c, October__c, November__c, December__c '+
        'FROM OrderItem__c ' +
        'WHERE Resource__r.RecordType.DeveloperName = \'External_AGS\' OR ' +
        'Resource__r.RecordType.DeveloperName = \'External_GDServices\' OR ' +
        'Resource__r.RecordType.DeveloperName = \'Internal_AGS\' OR ' +
        'Resource__r.RecordType.DeveloperName = \'Internal_GDServices\'';
        system.debug('query'+ query);
        }

    global Database.QueryLocator start(Database.batchableContext BC){
        system.debug('query'+ query);
        return Database.getQueryLocator(query);
        }
    global void execute(Database.BatchableContext BC,List<OrderItem__c> ItemList){
        sendPerformanceNotification(ItemList);
    }

    public static void sendPerformanceNotification(List<OrderItem__c> ItemList){
        Integer month;
        Decimal TrimestralWD;

        if(test.isRunningTest()) {
            month = PerformanceNotificationBatch.testMonth;
        } else {
            month = system.today().month();
        }

        CustomNotificationType notificationType = [SELECT Id, DeveloperName FROM CustomNotificationType WHERE DeveloperName='Alert'];

        User humanResource =[SELECT id,name FROM user WHERE name='Maria Nicla Monacis' LIMIT 1];
        //User humanResource =[SELECT id,name FROM user WHERE name='Developer GD Services' LIMIT 1];
        system.debug('month' + month);

        if (month == 1) {
            for (OrderItem__c OI : ItemList) {
                TrimestralWD= OI.October__c + OI.November__c + OI.December__c;

                if (TrimestralWD > 60 || TrimestralWD < 48) {
                    Messaging.CustomNotification notification = new Messaging.CustomNotification();
                    notification.setTitle('Ordine Critico!');
                    notification.setBody('Criticità sull\'ordine '+OI.Order__r.OrderNumber +' in merito alla risorsa: '+OI.Resource__r.name);
                    notification.setNotificationTypeId(notificationType.Id);
                    notification.setTargetId(OI.id);
                    try {
                        notification.send(new Set<String> {humanResource.id});
                    }
                    catch (Exception e) {
                        System.debug('Houston abbiamo un problema: ' + e.getMessage());
                    }
                }
            }
        }
        else if (month == 4) {
            for (OrderItem__c OI : ItemList) {
                TrimestralWD= OI.January__c + OI.February__c + OI.March__c;

                if (TrimestralWD > 60 || TrimestralWD < 48) {
                    Messaging.CustomNotification notification = new Messaging.CustomNotification();
                    notification.setTitle('Ordine Critico!');
                    notification.setBody('Criticità sull\'ordine '+OI.Order__r.OrderNumber +' in merito alla risorsa: '+OI.Resource__r.name);
                    notification.setNotificationTypeId(notificationType.Id);
                    notification.setTargetId(OI.id);
                    try {
                        notification.send(new Set<String> {humanResource.id});
                    }
                    catch (Exception e) {
                        System.debug('Houston abbiamo un problema: ' + e.getMessage());
                    }
                }
            }
        }
        else if (month == 7) {
            for (OrderItem__c OI : ItemList) {
                TrimestralWD= OI.April__c + OI.May__c + OI.June__c;

                if (TrimestralWD > 60 || TrimestralWD < 48) {
                    Messaging.CustomNotification notification = new Messaging.CustomNotification();
                    notification.setTitle('Ordine Critico!');
                    notification.setBody('Criticità sull\'ordine '+OI.Order__r.OrderNumber +' in merito alla risorsa: '+OI.Resource__r.name);
                    notification.setNotificationTypeId(notificationType.Id);
                    notification.setTargetId(OI.id);
                    try {
                        notification.send(new Set<String> {humanResource.id});
                    }
                    catch (Exception e) {
                        System.debug('Houston abbiamo un problema: ' + e.getMessage());
                    }
                }
            }
        }
        else if (month == 10) {
            for (OrderItem__c OI : ItemList) {
                TrimestralWD= OI.July__c + OI.August__c + OI.September__c;

                if (TrimestralWD > 60 || TrimestralWD < 48) {
                    Messaging.CustomNotification notification = new Messaging.CustomNotification();
                    notification.setTitle('Ordine Critico!');
                    notification.setBody('Criticità sull\'ordine '+OI.Order__r.OrderNumber +' in merito alla risorsa: '+OI.Resource__r.name);
                    notification.setNotificationTypeId(notificationType.Id);
                    notification.setTargetId(OI.id);
                    try {
                        notification.send(new Set<String> {humanResource.id});
                    }
                    catch (Exception e) {
                        System.debug('Houston abbiamo un problema: ' + e.getMessage());
                    }
                }
            }
        }
    }
    global void finish(Database.BatchableContext BC){

    }

    }