public with sharing class WarehouseStock {

  public void calculateBooksPerWarehouse() {
    AggregateResult[] books = getBooks();
    List<Warehouse__c> updatedWarehouses = new List<Warehouse__c>();
System.debug(books);
    for (AggregateResult b : books) {
      Warehouse__c w = new Warehouse__c();
      w.Id = (Id) b.get('warehouseId');
      w.Number_of_books__c = (Integer) b.get('totalBooks');
      updatedWarehouses.add(w);
    }
    // {Id=null, Number_of_books__c=3}
    // System.debug(updatedWarehouses);
    update updatedWarehouses;
  }

  private AggregateResult[] getBooks() {
    return [
      SELECT Warehouse__c warehouseId, COUNT(Id) totalBooks
      FROM Book__c
      GROUP BY Warehouse__c
    ];
  }
}
