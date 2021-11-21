use Materials

CREATE TABLE AvilabilityOfMaterials 
(
    WarehouseNum int NOT NULL PRIMARY KEY IDENTITY(101, 1), --����� ������
	MatCode  int NOT NULL , -- ��� ��������
	UnitOfMeasurement VARCHAR(5), --������� ���������
	QuantityOfMatsInStock int NOT NULL check(QuantityOfMatsInStock>0), --���������� ��������� �� ������
	DateOfTheLastOperation DATE,
)

CREATE TABLE AccountingOfSuppliesOfMaterials 
(
    WarehouseNum int NOT NULL, --����� ������
	NumOfTheAdmisDoc int NOT NULL DEFAULT(001), --����� ��������� � ������
	ContractNum int NOT NULL, --����� ��������
	MatCode int NOT NULL, --��� ���������
	UnitOfMeasurement VARCHAR(5), --������� ���������
	QuantityOfMats int NOT NULL check(QuantityOfMats>0), --���������� ��������
	DateOfReceipt DATE, --���� �����������
	CONSTRAINT PK_AccOfSupOfMats PRIMARY KEY(WarehouseNum, ContractNum),
	CONSTRAINT FK_AvOfMats FOREIGN KEY(WarehouseNum) REFERENCES AvilabilityOfMaterials(WarehouseNum)
)

CREATE TABLE ContractualSuppliesOfMaterials 
(
    WarehouseNum int NOT NULL, --����� ������
	MatCode int NOT NULL DEFAULT (01), --��� ���������
	ContractNum int NOT NULL, --����� ��������
	UnitOfMeasurement VARCHAR(5), --������� ���������
	DeliveryStartDate DATE, --������ ��������
	DeliveryCompletionDate DATE, --���������� ��������
	DeliveryPlan int NOT NULL, -- ���� �������� (���-�� ������ ���������)
	ContractualPriceUnit int NOT NULL check(ContractualPriceUnit>0), --���������� ���� �� �������
	
	CONSTRAINT FK_ContrSupOfMatsAccOfSupOfMats FOREIGN KEY(WarehouseNum, ContractNum)
	REFERENCES AccountingOfSuppliesOfMaterials(WarehouseNum, ContractNum)
		on delete cascade on update cascade,

	CONSTRAINT PK_ContrSupOfMats PRIMARY KEY(ContractNum, MatCode, WarehouseNum)
)