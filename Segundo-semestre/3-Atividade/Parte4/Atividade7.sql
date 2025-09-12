create database Atividade7
use Atividade7

-- Tabela de Funcionários

CREATE TABLE Employees (

EmployeeID INT PRIMARY KEY,

LastName VARCHAR(255),

FirstName VARCHAR(255),

BirthDate DATETIME,

Notes TEXT

);


-- Tabela de Clientes

CREATE TABLE Customers (

CustomerID INT PRIMARY KEY,

CustomerName VARCHAR(255),

ContactName VARCHAR(255),

Address VARCHAR(255),

City VARCHAR(255),

Country VARCHAR(255)

);


-- Tabela de Fornecedores

CREATE TABLE Suppliers (

SupplierID INT PRIMARY KEY,

SupplierName VARCHAR(255),

ContactName VARCHAR(255),

Address VARCHAR(255),

City VARCHAR(255),

Country VARCHAR(255),

Phone VARCHAR(255)

);


-- Tabela de Categorias

CREATE TABLE Categories (

CategoryID INT PRIMARY KEY,

CategoryName VARCHAR(255),

Description VARCHAR(255)

);


-- Tabela de Produtos

CREATE TABLE Products (

ProductID INT PRIMARY KEY,

ProductName VARCHAR(255),

SupplierID INT,

CategoryID INT,

Unit VARCHAR(255),

Price DECIMAL(10,2),

FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),

FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)

);


-- Tabela de Transportadoras

CREATE TABLE Shippers (

ShipperID INT PRIMARY KEY,

ShipperName VARCHAR(255),

Phone VARCHAR(255)

);


-- Tabela de Pedidos

CREATE TABLE Orders (

OrderID INT PRIMARY KEY,

CustomerID INT,

EmployeeID INT,

OrderDate DATETIME,

ShipperID INT,

FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),

FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),

FOREIGN KEY (ShipperID) REFERENCES Shippers(ShipperID)

);


-- Tabela de Detalhes dos Pedidos

CREATE TABLE OrderDetails (

OrderDetailID INT PRIMARY KEY,

OrderID INT,

ProductID INT,

Quantity INT,

FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),

FOREIGN KEY (ProductID) REFERENCES Products(ProductID)

);



-- Employees

INSERT INTO Employees VALUES

(1, 'Silva', 'João', '19850315', 'Gerente de Vendas'),

(2, 'Oliveira', 'Maria', '19900722', 'Atendente');


-- Customers

INSERT INTO Customers VALUES

(1, 'TechStore', 'Carlos Pereira', 'Rua A, 123', 'São Paulo', 'Brasil'),

(2, 'Casa Nova', 'Ana Souza', 'Av. B, 456', 'Rio de Janeiro', 'Brasil');


-- Suppliers

INSERT INTO Suppliers VALUES

(1, 'Global Foods', 'John Smith', 'Av. Central, 99', 'New York', 'EUA', '555-1234'),

(2, 'Fresh Drinks', 'Emily Clark', 'Rua Verde, 55', 'Toronto', 'Canadá', '555-5678');


-- Categories

INSERT INTO Categories VALUES

(1, 'Bebidas', 'Refrigerantes, sucos, etc.'),

(2, 'Comidas', 'Produtos alimentícios');


-- Products

INSERT INTO Products VALUES

(1, 'Coca-Cola Lata', 2, 1, '350ml', 4.50),

(2, 'Suco de Laranja', 2, 1, '1L', 7.00),

(3, 'Arroz Tipo 1', 1, 2, '5kg', 25.00);


-- Shippers

INSERT INTO Shippers VALUES

(1, 'Correios', '3003-0100'),

(2, 'FedEx', '0800-555-222');


-- Orders (depois de Employees, Customers e Shippers já existirem)

INSERT INTO Orders VALUES

(1, 1, 1, '20230901', 1),

(2, 2, 2, '20230905', 2);

-- OrderDetails (depois de Orders e Products já existirem)

INSERT INTO OrderDetails VALUES

(1, 1, 1, 10), -- Pedido 1 -> Coca-Cola

(2, 1, 3, 2), -- Pedido 1 -> Arroz

(3, 2, 2, 5); -- Pedido 2 -> Suco

-----------------------------------------
--63
create view
	v_totalPedidos as
select
	o.orderId, o.orderDate, e.firstName, sum(od.quantity * p.price) as Total
from 
	Orders o
join
	Employees e on o.EmployeeID = e.EmployeeID
join
	OrderDetails od on o.OrderID = od.OrderID
join
	Products p on od.ProductID = p.ProductID
group by
	o.OrderID, o.OrderDate, e.FirstName

select * from v_totalPedidos
order by Total desc