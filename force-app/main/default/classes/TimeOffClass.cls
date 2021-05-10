public class TimeOffClass {
    public static void PeakSeasonCheck(List<Time_Off__c> timeOff){
        
        for(Time_Off__c t : timeOff){
            date peakStart = date.parse('11/19/2021');
            date peakEnd = date.parse('01/04/2022');
            if(t.Time_Off_Start_Date__c >= peakStart && t.Time_Off_Start_Date__c <= peakEnd){
                t.Time_Off_Start_Date__c.addError( 'No time off request during Peak Season we need all hands on deck.');
            }
            if(t.Time_Off_End_Date__C >= peakStart && t.Time_Off_End_Date__C <= peakEnd){
                t.Time_Off_End_Date__c.addError( 'No time off request during Peak Season we need all hands on deck.');
            }
        }
    }
}