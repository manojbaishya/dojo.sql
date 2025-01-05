-- **Identifying Backordered Items**: Write a query to list all customer orders that include backordered items. For each order, display the order ID, customer name, order date, and the names of the backordered items.

SELECT TOP (1000) [Orders].[OrderID]
      ,[Orders].[OrderDate]
      ,[Customers].[CustomerName]
      ,[StockItems].StockItemName
  FROM [WideWorldImporters].[Sales].[Orders] AS Orders
  INNER JOIN [WideWorldImporters].[Sales].[Customers] AS Customers ON Customers.CustomerID = Orders.CustomerID
  INNER JOIN [WideWorldImporters].[Sales].[OrderLines] AS OrderLines ON OrderLines.OrderID = Orders.OrderID
  INNER JOIN [WideWorldImporters].[Warehouse].[StockItems] AS StockItems ON StockItems.StockItemID = OrderLines.StockItemID
  WHERE [BackorderOrderID] IS NOT NULL
  ORDER BY OrderDate DESC;