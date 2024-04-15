# Healthcare Data Cleaning/Analysis & PowerBI Dashboard 🏥⚕️
Welcome to my Healthcare porfolio project! PostgreSQL, Python, Docker, PowerBI

You can try interactive dashboard [Healthcare Dashboard](https://app.powerbi.com/view?r=eyJrIjoiZTU0OWFhNjQtMzBjNi00Mjc3LTk5MzgtNWNhZTNjY2YwOGIxIiwidCI6ImRmODY3OWNkLWE4MGUtNDVkOC05OWFjLWM4M2VkN2ZmOTVhMCJ9)

![image](https://github.com/FuadAnalyst/Portfolio-Poject-Healthcare/assets/156589453/f95358e5-99d5-4d5f-b9bc-e5373fdaf1af)

##### P.S: Change "Zoom level" to 65% or Click on the button "Fit to page"

![image](https://github.com/FuadAnalyst/Portfolio-Poject-Healthcare/assets/156589453/20b14123-83b2-4e5f-a9f7-cde019659481)

## Summary of Project
#### Description 📝: 
In this peoject i wanted to practice my basic Docker skills which i learned from DE ZoomCamp, PostgreSQL skils, data ingestion to load data into PostgreSQL database using Python (sqlalchemy) and practice PowerBI skills. I used Python (sqlalchemy) to load data into PostgreSQL database which was created using Docker, then cleaned and analyzed data in PgAdmin4 and connected PostgreSQL server to PowerBI and created dashboard.

#### Data Sources 📂:
`healthcare_dataset.csv`: The primary datatset that i used in this project. This dataset was downloaded from the `kaggle.com`. The dataset has 10.000 rows and contains information about patients. Dataset columns: Name, Age, Gender, Blood Type, Medical Condition, Date of Admission, Doctor, Hospital, Insurance Provider, Billing Amount, Room Number, Admission Type, Discharge Date, Medication, Test Results, Days in hospital (PostgreSQL db), Age group (PostgreSQL db)

#### Files 📁:
`docker-compose.yml`: This Docker Compose file, which will contain instructions, is required to start and configure services. Docker images: PostgreSQL server and PgAdmin4

`healthcare-ingest.py`: Python file which serves to load data `healthcare_dataset.csv` into the PostgreSQL database using `sqlalchemy` to connect to the database and load the data

`cleaning_exploration.sql`: This file contains SQL code to clean, analyze, add new columns to the loaded data

#### Skills 🎓: 
Docker-compose, PostgreSQL(cleaning, analyzing), Data ingestion(Python, sqlalchemy), basic Docker, PowerBI

#### Technologies ⚙️:
Docker, Python, PostgreSQL, PgAdmin4, PowerBI

#### Results 📈:
Practiced my basic knowledge of Docker, data ingestion and connecting PostgreSQL to PowerBI.
