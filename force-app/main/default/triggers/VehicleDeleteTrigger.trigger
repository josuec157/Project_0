trigger VehicleDeleteTrigger on Vehicle__c (before delete) {
    VehicleDeleteClass.PreventVehicleDelete(Trigger.old);
}