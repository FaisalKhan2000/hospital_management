# Hospital Management System

A comprehensive system for managing hospital operations, patient records, and appointments.

## Features

- Patient Management
- Doctor Management
- Appointment Scheduling
- Medical Records Management
- Administrative Dashboard
- Reporting and Analytics

## Database Structure

The system uses a relational database with the following main tables:

- Patients
- Doctors
- Appointments
- Medical Records
- Specializations

## Query Documentation

The `sql/queries.sql` file contains various SQL queries categorized as follows:

1. Basic Queries (1-5)

   - Patient listing
   - Doctor listing
   - Appointment viewing
   - Search functionality

2. Patient-related Queries (6-10)

   - Appointment history
   - Age-based searches
   - Demographics

3. Doctor-related Queries (11-15)

   - Specialization-based listing
   - Schedule management
   - Performance metrics

4. Appointment-related Queries (16-20)

   - Status-based filtering
   - Date range viewing
   - Schedule management

5. Administrative Queries (21-25)

   - Statistics and metrics
   - Operational analysis

6. Analytical Queries (26-30)

   - Demographics analysis
   - Workload analysis
   - Booking patterns

7. Reporting Queries (31-35)
   - Monthly summaries
   - Performance reports
   - Analysis reports

## Repository

GitHub: [hospital_management](https://github.com/FaisalKhan2000/hospital_management)

## Project Structure

```
hospital_management/
├── sql/
│   ├── schema/
│   │   ├── tables.sql
│   │   └── constraints.sql
│   ├── queries.sql
│   └── seed/
│       └── initial_data.sql
├── docs/
│   └── ERD_diagram.png
└── README.md
```

## Setup Instructions

1. Create the database using the schema files in `sql/schema`
2. Import initial data using seed files
3. Configure database connection settings
4. Run the application

## Technical Requirements

- Database: MySQL 8.0+
- Git

## Installation

1. Clone the repository

```bash
git clone https://github.com/FaisalKhan2000/hospital_management.git
cd hospital_management
```

2. Set up the database

```bash
mysql -u your_username -p your_database < sql/schema/tables.sql
mysql -u your_username -p your_database < sql/schema/constraints.sql
mysql -u your_username -p your_database < sql/seed/initial_data.sql
```
