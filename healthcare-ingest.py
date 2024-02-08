import pandas as pd 
from sqlalchemy import create_engine
from time import time

engine = create_engine('postgresql://root:root@localhost:5432/health')
engine.connect()

df = pd.read_csv('healthcare_dataset.csv', encoding = 'utf-8')
print(df.head())

df.to_sql(name='patient_data', con = engine, if_exists = 'append')
