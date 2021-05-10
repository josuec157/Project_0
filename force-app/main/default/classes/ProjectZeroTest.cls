@isTest
private class ProjectZeroTest {
    @isTest private static void testPeakSeasonValidDates1(){
        Date a = date.newinstance(2021, 06, 03);
        Date b = date.newinstance(2021, 06, 05);
        Time_Off__c t = new Time_Off__c(Name = 'Vacation', Name__c = 'Benny Ben', Type_of_Time_Off__c = 'Personal', Time_Off_Start_Date__c = a , Time_Off_End_Date__c = b );
        
        
        try{
            insert t;
        } catch(exception e){
            system.debug(e.getMessage());
        }
    }
    
    @isTest private static void testPeakSeasonValidDates2(){
        Date a = date.newinstance(2021, 11, 19);
        Date b = date.newinstance(2021, 12, 05);
        Time_Off__c t = new Time_Off__c(Name = 'Vacation', Name__c = 'Benny Ben', Type_of_Time_Off__c = 'Personal', Time_Off_Start_Date__c = a , Time_Off_End_Date__c = b );
        
        try{
            insert t;
        } catch(exception e){
            system.debug(e.getMessage());
            System.assert(e.getMessage().contains('No time off request during Peak Season we need all hands on deck.'));
        }
    }
    
    @isTest private static void testPeakSeasonValidDates3(){
        Date a = date.newinstance(2021, 11, 07);
        Date b = date.newinstance(2021, 11, 19);
        Time_Off__c t = new Time_Off__c(Name = 'Vacation', Name__c = 'Benny Ben', Type_of_Time_Off__c = 'Personal', Time_Off_Start_Date__c = a , Time_Off_End_Date__c = b );
        
        try{
            insert t;
        } catch(exception e){
            system.debug(e.getMessage());
            System.assert(e.getMessage().contains('No time off request during Peak Season we need all hands on deck.'));
        }
    }
    
    @isTest private static void VehicleDelete1(){
        Vehicle__c v = new Vehicle__c(License_Plate__c = '1234asd', Vehicle_type__c = 'Van');
        insert v;
        
        try{
            delete v;
        } catch(exception e){
            system.debug(e.getMessage());
        }
    }
    
    @isTest private static void VehicleDelete2(){
        Driver__c d = new Driver__c(Driver_Name__c = 'Test Driver', Driver_License_Number__c = '132rrwfe4', Work_Email__c = 'hello123@email.com');
        insert d;
        Vehicle__c v = new Vehicle__c(License_Plate__c = '1234asd', Vehicle_type__c = 'Van', Driver__c = d.Id);
        insert v;
        
        try{
            delete v;
        } catch(exception e){
            System.debug(e.getMessage());
            System.assert(e.getMessage().contains('Cannot delete Vehicle attached to a driver'));
        }
    }
        
     @isTest private static void InsuranceCheck1(){
        Decimal tValue = 550.00;
        Product__c p = new Product__c(Shipping_Priority__c = 'Standard', Weight__c = '50LB', Shipping_Cost__c = '125', To__c = 'Benny Ben', Product_Value__c = tValue );
        try{
           insert p;
        } catch(exception e){
            system.debug(e.getMessage());
        }
    }
    
     @isTest private static void InsuranceCheck2(){
        Decimal tValue = 1550.00;
        Product__c p = new Product__c(Shipping_Priority__c = 'Standard', Weight__c = '50LB', Shipping_Cost__c = '125', To__c = 'Benny Ben', Product_Value__c = tValue );
        try{
           insert p;
        } catch(exception e){
            system.debug(e.getMessage());
            System.assert(e.getMessage().contains('Add Company Insurance with product values is 1,000.00 or more'));
        }
    }
    
}