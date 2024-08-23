
-- Create Manufacturer table
CREATE TABLE Manufacturer (
    manufacturer_id INT PRIMARY KEY,
    manufacturer_name VARCHAR(100) NOT NULL,
    contact_person VARCHAR(100) NOT NULL
);

-- Create Swimsuits table
CREATE TABLE Swimsuits (
    swimsuit_id INT PRIMARY KEY,
    brand VARCHAR(100) NOT NULL,
    style VARCHAR(100) NOT NULL,
    gender varchar(11) NOT NULL,
    size INT NOT NULL,
    cost_price INT NOT NULL,
    retail_price INT NOT NULL,
    manufacturer_id INT NOT NULL,
    FOREIGN KEY (manufacturer_id) REFERENCES Manufacturer(manufacturer_id)
);

-- Create Price_History table
CREATE TABLE Price_History (
    price_history_id INT PRIMARY KEY,
    retail_price INT NOT NULL,
    date DATE NOT NULL,
    swimsuit_id INT NOT NULL,
    FOREIGN KEY (swimsuit_id) REFERENCES Swimsuits(swimsuit_id)
);

-- Add default constraint for charge per hour
ALTER TABLE Swimsuits
ALTER COLUMN retail_price SET DEFAULT 44.00;


-- Add NOT NULL constraints
ALTER TABLE Manufacturer
ALTER COLUMN manufacturer_name SET DATA TYPE VARCHAR(100),
ALTER COLUMN manufacturer_name SET NOT NULL,
ALTER COLUMN contact_person SET DATA TYPE VARCHAR(100),
ALTER COLUMN contact_person SET NOT NULL;

ALTER TABLE Swimsuits
ALTER COLUMN brand SET DATA TYPE VARCHAR(100) ,
ALTER COLUMN style SET DATA TYPE VARCHAR(100) ,
ALTER COLUMN gender SET DATA TYPE VARCHAR(10) ,
ALTER COLUMN size SET DATA TYPE INT ,
ALTER COLUMN cost_price SET DATA TYPE INT ,
ALTER COLUMN retail_price SET DATA TYPE INT ,
ALTER COLUMN manufacturer_id SET DATA TYPE INT,
ALTER COLUMN brand SET NOT NULL,
ALTER COLUMN style SET NOT NULL,
ALTER COLUMN gender SET NOT NULL,
ALTER COLUMN size SET NOT NULL,
ALTER COLUMN cost_price SET NOT NULL,
ALTER COLUMN retail_price SET NOT NULL,
ALTER COLUMN manufacturer_id SET NOT NULL;

-- Add foreign key constraints
ALTER TABLE Swimsuits
ADD CONSTRAINT fk_swimsuits_manufacturer
FOREIGN KEY (manufacturer_id) REFERENCES Manufacturer(manufacturer_id);

ALTER TABLE Price_History
ADD CONSTRAINT fk_price_history_swimsuits
FOREIGN KEY (swimsuit_id) REFERENCES Swimsuits(swimsuit_id);
