# sql_assignment3_group_work

#  Airbnb Data Warehouse (BigQuery Project)

## Overview

This project demonstrates the design and implementation of a **data warehouse (DWH)** for Airbnb-style booking data using **Google BigQuery**.  
It simulates an end-to-end ETL process with **raw**, **staging**, **dimension**, **fact**, and **mart** layers to support **data cleaning**, **integration**, and **business analytics**.

---

##  Data Architecture
https://mermaidchart.com/play?utm_source=mermaid_live_editor&utm_medium=share#pako:eNqFVm1vmzoU_iuW79cma0hIFquqRJtQTWu3Ko00bcsVcsAhaGAjY5bmVv3v1y-AcdJu4ovPOc95zuPjg-EFxiwhEMHBYLChMaO7LEUbCkCOj6wWCCQ45UQ5xJ4UBAFKasFxriGM_UJgj2my4PhAN1Rz7HJ2iPeYC7C-Uaiq3qYcl3u1uFOLy58buMIHcI-PhG_gvwoEQJJxEouM0SYNgFXwLbq9_7T8slYJ0ojzjFBR6RQLCR6D1fpBop4aGC5l8aJDtrjH4HsfVeJj4bARmpjFmeCRTHkSOM1o-lfRT-s7K_ppHdwt35CtQI5sA3xDuEL2hBucI_1Pwj2Z8qBO4j3V9yvjWXx6sKqvttfKbmRffdheX235h2tjR1kCHj9rB8UF0Ytyz6hZxaymgh_NmpMkE1GMedJVVrxfv31ZrmwZdqCE2yrafKvIe3ROHxtO28iOt3P1uONMGKk44aSq3PqhwXDGiojWhTYK_ByVhJU56Vwlz2LSCQqD23X0dbVYrho12sF44mxRmT0ZCRZEmidNDj-DwbU8qqI9iGEXOxXaAk0rh23kfN8Wajs07CN0imAC55HemDmCuojSmlSicjrSm9FgHd187x-sdm2PRtHJ2doTbduvCjQ9svU5-U1obZD4d9ooOB15e0eAgdyafftksI3bCekw1tWC2pesg7QOU8cSa4B9X9rgSZFu0Bsd70BcHf2yGtIbJxXXXEaPFfAWsKv-XvBEioNQmJ6jaUjviA0kznFVLcgOVKzmManALstz9E8YLv2lf1EJzn4RZfrz2cfGHByyROyRVz63jgRX8kvB8RH5wHdZm_u2ZQ0nfVY_mHrjM1aHQE55k7z0ljdh2CVPgmkY-H9O3uFYdKUX4V82NFbZ7jQihJq-2Ihtej_qjt9pnp07FTE9OZ-n81ifr424cyMjskXOtLguh77x9-ZCOlWXTMHedHR-eAFTniUQCV6TC1gQXmBlwhc9y1D_T2wgksuE7HCdiw3c0FeZVmL6Q14ybSZndbqHkjWvpFWX6r5cZPK3BFuIvBAIv1VfH4hGY2-iSSB6gc8QzUdD3_Mm48vpbDyajuXgwCNEA386HPv-fDQZzedTf-xPXi_gf7rsaOhN5eNNJv7l7HI2nc1e_wfoavX5 
### Data Flow Overview
## Layers Description

### 1. Raw Layer

**Purpose:**  
Stores the **original source data** (unprocessed).  
Data might include missing values, inconsistent field names, or invalid entries.

**Example Tables:**
- `tanny.apartmentss`
- `tanny.clients`
- `tanny.payments`

 These tables represent the **initial ingestion point** before cleaning or transformations.

---

### 2. Stage Layer

**Purpose:**  
Clean, filter, and validate the data before loading it into dimensional or fact tables.

**Operations:**
- Remove null or incomplete rows
- Standardize field formats
- Validate relationships between entities

---
### 3. Mart Layer

Purpose:
Store descriptive attributes about entities.
Dimension tables are used to enrich fact tables with contextual information.

Dimension Tables:

Table	Description
**tanny.dim_owners**	Unique list of owners and their payment info
**tanny.dim_apartments**	Apartment details: city, address, capacity, owner
**tanny.dim_clients**	Client details: name, country, phone, and card info

Fact table

Purpose:
Contains transactional data — core measurable events (bookings, payments).
Fact tables link to dimension tables via foreign keys.
