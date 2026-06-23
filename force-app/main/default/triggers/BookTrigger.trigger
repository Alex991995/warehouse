trigger BookTrigger on Book__c(
  before insert,
  after insert,
  after update,
  after delete,
  after undelete
) {
  WarehouseBookService.populateSerialNumber(Trigger.new);
}
