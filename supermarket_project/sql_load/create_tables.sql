--ALDI table
CREATE TABLE public.aldi
(
    category TEXT,
    prices NUMERIC,
    prices_unit NUMERIC,
    unit VARCHAR (2),
    product TEXT,
    date DATE,
    own_brand BOOLEAN,
    supermarket TEXT
);
--ASDA
CREATE TABLE public.asda
(
    category TEXT,
    prices NUMERIC,
    prices_unit NUMERIC,
    unit VARCHAR (2),
    product TEXT,
    date DATE,
    own_brand BOOLEAN,
    supermarket TEXT
);
--Morisons
CREATE TABLE public.morrisons
(
    category TEXT,
    prices NUMERIC,
    prices_unit NUMERIC,
    unit VARCHAR (2),
    product TEXT,
    date DATE,
    own_brand BOOLEAN,
    supermarket TEXT
);
--Sainsbury's
CREATE TABLE public.sainsbury
(
    category TEXT,
    prices NUMERIC,
    prices_unit NUMERIC,
    unit VARCHAR (2),
    product TEXT,
    date DATE,
    own_brand BOOLEAN,
    supermarket TEXT
);
--TESCO
CREATE TABLE public.tesco
(
    category TEXT,
    prices NUMERIC,
    prices_unit NUMERIC,
    unit VARCHAR (2),
    product TEXT,
    date DATE,
    own_brand BOOLEAN,
    supermarket TEXT
);

--setting ownership
ALTER TABLE public.aldi OWNER to postgres;
ALTER TABLE public.asda OWNER to postgres;
ALTER TABLE public.morrisons OWNER to postgres;
ALTER TABLE public.sainsbury OWNER to postgres;
ALTER TABLE public.tesco OWNER to postgres;

