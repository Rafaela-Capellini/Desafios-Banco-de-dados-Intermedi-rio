use Produtos

CREATE TABLE Production_ProductCategory
(
    IdCategoria INT PRIMARY KEY NOT NULL,
    Categoria VARCHAR(255) NOT NULL,
);

INSERT INTO Production_ProductCategory (IdCategoria, Categoria)
VALUES (1, 'clothing');
INSERT INTO Production_ProductCategory (IdCategoria, Categoria)
VALUES (2, 'things');


CREATE TABLE Production_Productinventory
(
    IdInventario INT PRIMARY KEY NOT NULL,
    Estoque INT NOT NULL,
    IdProduto INT NOT NULL,
    FOREIGN KEY (IdProduto) REFERENCES Producao_Produto(IdProduto)
);


INSERT INTO Production_ProductInventory (IdInventario, Estoque, IdProduto)
VALUES 
(1, 100, 1),  
(2, 50, 2),  
(3, 200, 3),  
(4, 150, 4), 
(5, 300, 5);  


SELECT 
    p.Nome AS NomeProduto,
    c.Categoria,
    i.Estoque
FROM 
    Producao_Produto p
JOIN 
    Production_ProductCategory c ON p.IdCategoria = c.IdCategoria
JOIN 
    Production_ProductInventory i ON p.IdProduto = i.IdProduto;


DELETE FROM 
    Production_ProductInventory
WHERE 
    IdProduto IN (
        SELECT IdProduto 
        FROM Producao_Produto 
        WHERE IdCategoria IN (
            SELECT IdCategoria 
            FROM Production_ProductCategory 
            WHERE Categoria = 'clothing'
        )
);

DELETE FROM 
    Producao_Produto
WHERE 
    IdCategoria IN (
        SELECT IdCategoria 
        FROM Production_ProductCategory 
        WHERE Categoria = 'clothing'
);

Select * from Producao_Produto



CREATE TABLE Clientes (
    Id INT PRIMARY KEY NOT NULL,
    Titulo VARCHAR(50),
    PrimeiroNome VARCHAR(255) NOT NULL,
    MeioNome VARCHAR(50),
    UltimoNome VARCHAR(255) NOT NULL
);

INSERT INTO Clientes (Id, Titulo, PrimeiroNome, MeioNome, UltimoNome)
VALUES 
(1, 'Sr.', 'Carlos', 'M.', 'Silva'),
(2, 'Sra.', 'Ana', 'B.', 'Souza'),
(3, 'Sr.', 'Ricardo', NULL, 'Oliveira'),
(4, NULL, 'Mariana', 'S.', 'Lima'),
(5, 'Dr.', 'Eduardo', NULL, 'Pereira');


SELECT DISTINCT
    CASE 
        WHEN c.Titulo IS NOT NULL THEN c.Titulo + ' '
        ELSE ''
    END +
    c.PrimeiroNome + ' ' +
    COALESCE(c.MeioNome + ' ', '') +
    c.UltimoNome AS NomeCompleto
FROM 
    Clientes c;  








	