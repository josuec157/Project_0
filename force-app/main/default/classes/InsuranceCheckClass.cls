public class InsuranceCheckClass {
    public static void CompanyInsurancePolicy(List<Product__c> Product){
        for(Product__c p : Product){
            Decimal MinValue = 1000.00;
            if(p.Product_Value__c >= MinValue && p.Company_Insurance__c == False){
                p.addError('Add Company Insurance with product values is 1,000.00 or more');
            }
        }
    }
}