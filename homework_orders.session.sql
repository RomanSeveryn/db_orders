DROP TABLE "customer"

CREATE TABLE "customer"(
  "id" serial PRIMARY KEY,
  "name" varchar(64) NOT NULL,
  "adress" varchar(64) NOT NULL,
  "telephone" varchar(12)
)

CREATE TABLE "order"(
  "id" serial PRIMARY KEY,
  "customer_id" int REFERENCES "customer"("id"),
  "contract_id" int REFERENCES "contract"("id"),
  "product_id" varchar REFERENCES "product"("id"),
  "recipient_id" varchar REFERENCES "reipient"("id"),
  "price" decimal(10, 2) NOT NULL CHECK ("price" > 0),
  "quantity" int NOT NULL CHECK("quantity" > 0)
)

CREATE TABLE "order_product"(
  "order_id" int REFERENCES "order"("id"),
  "product_id" int REFERENCES "product"("id"),
  PRIMARY KEY ("order_id", "product_id")
)

CREATE TABLE "product"(
  "id" serial PRIMARY KEY,
  "name" varchar(64) NOT NULL,
  "price" decimal(10, 2) NOT NULL CHECK ("price" > 0)
)

DROP TABLE "product"

CREATE TABLE "shipment"(
  "id" serial PRIMARY KEY,
  "order_id" REFERENCES "order"("id")
)

CREATE TABLE "contract"(
  "id" serial PRIMARY KEY,
  "date" date
)

DROP TABLE "contract"

CREATE TABLE "recipient"(
  "id" serial PRIMARY KEY,
  "name" varchar(64) NOT NULL
)

DROP TABLE "recipient"