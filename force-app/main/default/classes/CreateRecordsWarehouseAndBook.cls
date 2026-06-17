/**
 *@description Manages operaatins of warehouse and book object
 */
public with sharing class CreateRecordsWarehouseAndBook {
  final Integer maxReocrds = 100;
  SerialNumberGenerator serialNumberGenerator;
  
  public CreateRecordsWarehouseAndBook(SerialNumberGenerator serialNumberGenerator ){
    this.serialNumberGenerator = serialNumberGenerator;
  }
  
  public void createRecords() {
    List<sObject> genericList = new List<sObject>();
    
    List<Warehouse__c> warehouses = new List<Warehouse__c>();
    List<Book__c> books = new List<Book__c>();
    
    for (Integer i = 0; i < maxReocrds; i++) {
      Warehouse__c  warehouse = new Warehouse__c(Name='Warehouse__c' + i);
      Book__c book = new Book__c(Name='Book' + i);
      book.Warehouse__r = warehouse;
      books.add(book);
      warehouses.add(warehouse);
    }
    genericList.addAll(warehouses);
    genericList.addAll(books);
    
    insert genericList;
  }
  
  public List<Warehouse__c> getWarehouseAndRelatedBooks(){
    return [SELECT Name, (SELECT Id, Name FROM Books__r)  FROM Warehouse__c];
  }
  
  public List<Book__c> getBooks(){
    return [SELECT Name  FROM Book__c];
  }
  
  public void populateSerialNumber(){
    List<Book__c> books =  getBooks();
    for (Book__c b : books) {
      b.Serial_number__c = serialNumberGenerator.geterate();
    }
    update books;
  }
  
}