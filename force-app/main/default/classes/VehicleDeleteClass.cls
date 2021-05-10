public class VehicleDeleteClass {
    public static void PreventVehicleDelete(List<Vehicle__c> vehicle){
        for(Vehicle__c V : vehicle){
            if(V.Driver__c != null){
                V.addError('Cannot delete Vehicle attached to a driver');
            }
        }
    }
}