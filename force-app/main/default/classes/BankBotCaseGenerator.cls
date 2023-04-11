public with sharing class BankBotCaseGenerator {
   
    
      public class CaseDetail {
        @InvocableVariable(required=true)
        public String email;
    
        @InvocableVariable(required=true)
        public String firstName;
        
        @InvocableVariable(required=true)
        public Integer type;
  
        @InvocableVariable(required=true)
        public String lastName;
      }
    
   
  
  
      
      @InvocableMethod(label='Create Case')
      public static void CreateCase(List<CaseDetail> cases) {

        List<Case> casesToCreate = new List<Case>();

        
    
        
        for (CaseDetail c : cases) {
          Case newCase = new Case();
            switch on c.type{
                when 1{
                    newCase.Origin = 'BOT';
                    newCase.SuppliedName = c.firstName +c.lastName;
                    newCase.Subject = 'Change the debit Date';
                    newCase.SuppliedEmail = c.email;
                    newCase.Description = 'Call the customer to confirm the change of email and send a Confirmation email';
                    casesToCreate.add(newCase);


                }   

                when 2{

                    newCase.Origin = 'BOT';
                    newCase.SuppliedName = c.firstName +c.lastName;
                    newCase.Subject = 'Change the change The Contract Owner';
                    newCase.SuppliedEmail = c.email;
                    newCase.Description = 'Check email if the customer has sent the scanned copy of the new Contract Owner';
                    casesToCreate.add(newCase);


                }
                

                when 3{
                    newCase.Origin = 'BOT';
                    newCase.SuppliedName = c.firstName +c.lastName;
                    newCase.Subject = 'Change IBAN associated with the contract';
                    newCase.SuppliedEmail = c.email;
                    newCase.Description = 'Call the customer to give access to the ';
                    casesToCreate.add(newCase);
                }
            }

            

        }

        insert casesToCreate;
        
      }
    }