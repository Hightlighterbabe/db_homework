use Materials;


DELETE FROM AvilabilityOfMaterials
DELETE FROM AccountingOfSuppliesOfMaterials
DELETE FROM ContractualSuppliesOfMaterials

GO
INSERT INTO AvilabilityOfMaterials(WarehouseNum, MatCode, UnitOfMeasurement, QuantityOfMatsInStock, DateOfTheLastOperation) VALUES
     (0001, 14365, '�', 135, '03.11.2021'),
	 (0001, 13255, '��', 40, '04.11.2021'),
	 (0002, 24266, '�', 1, '15.10.2021'),
	 (0002, 12658, '��', 98, '25.10.2021'),
	 (0003, 19257, '�', 110, '16.10.2021')
SET IDENTITY_INSERT AvilabilityOfMaterials ON

GO
INSERT INTO AccountingOfSuppliesOfMaterials(WarehouseNum, NumOfTheAdmisDoc, ContractNum, MatCode, UnitOfMeasurement, QuantityOfMats, DateOfReceipt) VALUES
     (1001, 016, 687, 14543, '�', 345, '04.09.2021'),
	 (1001, 015, 375, 73669, '��', 46,'07.08.2021'),
	 (1002, 016, 398, 36542, '�', 4,'15.10.2021'),
	 (1002, 013, 875, 43657, '��', 496,'25.11.2021'),
	 (1003, 121, 876, 36532, '�', 12,'16.11.2021')

GO
INSERT INTO ContractualSuppliesOfMaterials(WarehouseNum, MatCode, ContractNum, UnitOfMeasurement, DeliveryStartDate, DeliveryCompletionDate, DeliveryPlan, ContractualPriceUnit) VALUES
     (3001, 23246, '�', 126, '01.09.2021','24.09.2021', 5, 499),
	 (3001, 36745, '��', 126, '17.08.2021','23.09.2021', 5, 1899),
	 (3002, 24547, '�', 126, '15.11.2021','05.12.2021', 5, 249),
	 (3002, 67372, '��', 126, '23.09.2021', '02.10.2021', 5, 159),
	 (3003, 25727, '�', 126, '04.09.2021', '15.09.2021', 5, 3699)