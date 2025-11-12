# sql_assignment3_group_work

#  Airbnb Data Warehouse (BigQuery Project)

## Overview

This project demonstrates the design and implementation of a **data warehouse (DWH)** for Airbnb-style booking data using **Google BigQuery**.  
It simulates an end-to-end ETL process with **raw**, **staging**, **dimension**, **fact**, and **mart** layers to support **data cleaning**, **integration**, and **business analytics**.

---

##  Data Architecture

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
