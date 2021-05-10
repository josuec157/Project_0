trigger TimeOffTrigger on Time_Off__c (before insert) {
    TimeOffClass.PeakSeasonCheck(Trigger.new);
}