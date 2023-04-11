public  class BankBot{

    public class TranscriptInput {
      @InvocableVariable(required=true)
      public ID routableID;
    }
    
    public class VisitorNameOutput {
      @InvocableVariable(required=true)
      public String FirstName;

      @InvocableVariable(required=true)
      public String LastName;
  
      @InvocableVariable(required=true)
      public String email;
    }

   
  
    @InvocableMethod(label='Get Transcript Variables')
    public static List<VisitorNameOutput> getUserName(List<TranscriptInput> transcripts) {
  
      List<VisitorNameOutput> names = new List<VisitorNameOutput>();
    
      for (TranscriptInput transcript : transcripts) {
      
        // Query for the transcript record based on the ID
        LiveChatTranscript transcriptRecord = [SELECT Name ,Email__c,Last_Name__c,First_Name__c                                    
                                                FROM LiveChatTranscript 
                                               WHERE Id = :transcript.routableID 
                                               LIMIT 1];
        
        // Store the first name in an output variable
        VisitorNameOutput nameData = new VisitorNameOutput();
        nameData.FirstName = transcriptRecord.First_Name__c;
        nameData.LastName = transcriptRecord.Last_Name__c;
  
        // Store the order number in an output variable
        nameData.email = transcriptRecord.Email__c;
        
        // Add the name to the list of outputs
        names.add(nameData);
      }
      System.debug(names);
      return names;
    }


    
  }