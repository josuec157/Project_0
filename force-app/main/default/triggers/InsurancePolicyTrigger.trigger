trigger InsurancePolicyTrigger on Product__c (before insert, before update) {
    InsuranceCheckClass.CompanyInsurancePolicy(Trigger.new);
}