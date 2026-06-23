/**
 *@description Manages operaatins of warehouse and book object
 */
public with sharing class WarehouseBookService {
  final Integer MAX_RECORDS = 100;
  WarehouseStock warehouseStock;

  public WarehouseBookService(WarehouseStock warehouseStock) {
    this.warehouseStock = warehouseStock;
  }

  public void createRecords() {
    List<sObject> genericList = new List<sObject>();

    List<Warehouse__c> warehouses = new List<Warehouse__c>();
    List<Book__c> books = new List<Book__c>();

    for (Integer i = 0; i < MAX_RECORDS; i++) {
      Warehouse__c warehouse = new Warehouse__c(Name = 'Warehouse__c' + i);
      Book__c book = new Book__c(Name = 'Book' + i);
      book.Warehouse__r = warehouse;
      books.add(book);
      warehouses.add(warehouse);
    }
    genericList.addAll(warehouses);
    genericList.addAll(books);

    insert genericList;
  }

  public List<Warehouse__c> getWarehouseAndRelatedBooks() {
    return [
      SELECT Id, Name, Number_of_books__c, (SELECT Id, Name FROM Books__r)
      FROM Warehouse__c
    ];
  }

  public List<Book__c> getBooks() {
    return [SELECT Id, Name, Serial_number__c FROM Book__c];
  }

  public static void populateSerialNumber(List<Book__c> books) {
    for (Book__c b : books) {
      Boolean isEmpty = (Boolean) String.isEmpty(b.Serial_number__c);
      if (isEmpty) {
        b.Serial_number__c = SerialNumberGenerator.generate();
      }
    }
    warehouseStock.calculateBooksPerWarehouse();
  }
}
