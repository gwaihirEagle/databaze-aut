-- Exported from QuickDBD: https://www.quickdatatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/schema/XiWLSJy-5kK8mWhajcJHJg
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify the code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "manufacturers" (
    "id_manufacturer" int  NOT NULL ,
    "name" varchar  NOT NULL ,
    CONSTRAINT "pk_manufacturers" PRIMARY KEY (
        "id_manufacturer"
    )
)

GO

CREATE TABLE "cars" (
    "id_car" int  NOT NULL ,
    "id_manufacturer" int  NOT NULL ,
    "model" varchar  NOT NULL ,
    "prod_year" int  NOT NULL ,
    "type" varchar  NOT NULL ,
    "color" varchar  NOT NULL ,
    "price" int  NOT NULL ,
    "day_price" int  NOT NULL ,
    CONSTRAINT "pk_cars" PRIMARY KEY (
        "id_car"
    )
)

GO

CREATE TABLE "customers" (
    "id_customer" int  NOT NULL ,
    "name" varchar  NOT NULL ,
    "surname" varchar  NOT NULL ,
    "address" varchar  NOT NULL ,
    "phone" int  NOT NULL ,
    CONSTRAINT "pk_customers" PRIMARY KEY (
        "id_customer"
    )
)

GO

CREATE TABLE "rents" (
    "id" int  NOT NULL ,
    "id_customer" int  NOT NULL ,
    "id_car" int  NOT NULL ,
    "id_employee" int  NOT NULL ,
    "from" date  NOT NULL ,
    "to" date  NOT NULL ,
    CONSTRAINT "pk_rents" PRIMARY KEY (
        "id"
    )
)

GO

CREATE TABLE "comments" (
    "id_comment" int  NOT NULL ,
    "id_car" int  NOT NULL ,
    "id_visitor" int  NOT NULL ,
    "comment" text  NOT NULL )

GO

CREATE TABLE "employees" (
    "id" int  NOT NULL ,
    "name" varchar  NOT NULL ,
    "surname" varchar  NOT NULL ,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "id"
    )
)

GO

CREATE TABLE "visitors" (
    "id_visitor" int  NOT NULL ,
    "id_comment" int  NOT NULL ,
    "name" varchar  NOT NULL ,
    "surname" varchar  NOT NULL ,
    "e-mail" varchar  NOT NULL ,
    CONSTRAINT "pk_visitors" PRIMARY KEY (
        "id_visitor"
    )
)

GO

ALTER TABLE "cars" ADD CONSTRAINT "fk_cars_id_manufacturer" FOREIGN KEY("id_manufacturer")
REFERENCES "manufacturers" ("id_manufacturer")
GO

ALTER TABLE "rents" ADD CONSTRAINT "fk_rents_id_customer" FOREIGN KEY("id_customer")
REFERENCES "customers" ("id_customer")
GO

ALTER TABLE "rents" ADD CONSTRAINT "fk_rents_id_car" FOREIGN KEY("id_car")
REFERENCES "cars" ("id_car")
GO

ALTER TABLE "rents" ADD CONSTRAINT "fk_rents_id_employee" FOREIGN KEY("id_employee")
REFERENCES "employees" ("id")
GO

ALTER TABLE "comments" ADD CONSTRAINT "fk_comments_id_car" FOREIGN KEY("id_car")
REFERENCES "cars" ("id_car")
GO

ALTER TABLE "comments" ADD CONSTRAINT "fk_comments_id_visitor" FOREIGN KEY("id_visitor")
REFERENCES "visitors" ("id_visitor")
GO

