trigger BookTrigger on Book__c(before insert) {
  WarehouseBookService.populateSerialNumber(Trigger.new);
}
