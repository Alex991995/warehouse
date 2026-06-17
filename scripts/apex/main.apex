SerialNumberGenerator serialNumberGenerator = new SerialNumberGenerator();
WarehouseStock warehouseStock = new WarehouseStock();
CreateRecordsWarehouseAndBook warehouseAndBook = new CreateRecordsWarehouseAndBook(serialNumberGenerator);

// 1
// warehouseAndBook.createRecords();
// 2
// System.debug(warehouseAndBook.getWarehouseAndRelatedBooks());
// 3
// System.debug(warehouseAndBook.getBooks());
// 4
// warehouseAndBook.populateSerialNumber();
// 5
// warehouseStock.calculateBooksEachWarehouse();