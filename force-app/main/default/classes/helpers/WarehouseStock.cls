public with sharing class WarehouseStock {
  
  public void calculateBooksEachWarehouse(){
    List<Warehouse__c> warehouses = getWarehouseAndRelatedBooks();
    for (Warehouse__c w : warehouses) {
      w.Number_of_books__c =  w.Books__r.size();
    }
    update warehouses;
  }
  private List<Warehouse__c> getWarehouseAndRelatedBooks(){
    List<Warehouse__c> warehouses = [SELECT Name, (SELECT Id, Name FROM Books__r)  FROM Warehouse__c];
    return warehouses;
  }
  
}