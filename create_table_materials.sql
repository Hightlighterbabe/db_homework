use Materials

CREATE TABLE AvilabilityOfMaterials 
(
    WarehouseNum int NOT NULL PRIMARY KEY IDENTITY(101, 1), --номер склада
	MatCode  int NOT NULL , -- код матриала
	UnitOfMeasurement VARCHAR(5), --единица измерения
	QuantityOfMatsInStock int NOT NULL check(QuantityOfMatsInStock>0), --количество матриалов на складе
	DateOfTheLastOperation DATE,
)

CREATE TABLE AccountingOfSuppliesOfMaterials 
(
    WarehouseNum int NOT NULL, --номер склада
	NumOfTheAdmisDoc int NOT NULL DEFAULT(001), --номер документа о приеме
	ContractNum int NOT NULL, --номер договора
	MatCode int NOT NULL, --код материала
	UnitOfMeasurement VARCHAR(5), --единица измерения
	QuantityOfMats int NOT NULL check(QuantityOfMats>0), --количество метриала
	DateOfReceipt DATE, --дата поступления
	CONSTRAINT PK_AccOfSupOfMats PRIMARY KEY(WarehouseNum, ContractNum),
	CONSTRAINT FK_AvOfMats FOREIGN KEY(WarehouseNum) REFERENCES AvilabilityOfMaterials(WarehouseNum)
)

CREATE TABLE ContractualSuppliesOfMaterials 
(
    WarehouseNum int NOT NULL, --номер склада
	MatCode int NOT NULL DEFAULT (01), --код материала
	ContractNum int NOT NULL, --номер договора
	UnitOfMeasurement VARCHAR(5), --единица измерения
	DeliveryStartDate DATE, --начало доставки
	DeliveryCompletionDate DATE, --завершение доставки
	DeliveryPlan int NOT NULL, -- план доставки (кол-во единиц измерения)
	ContractualPriceUnit int NOT NULL check(ContractualPriceUnit>0), --договорная цена за единицу
	
	CONSTRAINT FK_ContrSupOfMatsAccOfSupOfMats FOREIGN KEY(WarehouseNum, ContractNum)
	REFERENCES AccountingOfSuppliesOfMaterials(WarehouseNum, ContractNum)
		on delete cascade on update cascade,

	CONSTRAINT PK_ContrSupOfMats PRIMARY KEY(ContractNum, MatCode, WarehouseNum)
)