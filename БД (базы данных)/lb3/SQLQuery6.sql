use K_MyBase;
ALTER table Products ADD Product_Description nvarchar(50);

ALTER table Products ADD  POL nvarchar(50);
ALTER table Products DROP column POL;