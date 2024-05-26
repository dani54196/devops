import pandas as pd
import mysql.connector
from mysql.connector import Error

# Configuration
excel_file_path = 'path_to_your_excel_file.xlsx'
mysql_host = 'your_mysql_host'
mysql_user = 'your_mysql_username'
mysql_password = 'your_mysql_password'
mysql_database = 'your_mysql_database'
mysql_table = 'your_mysql_table'

# Read Excel file
try:
    df = pd.read_excel(excel_file_path)
    print("Excel file read successfully.")
except Exception as e:
    print(f"Error reading Excel file: {e}")
    exit()

# Connect to MySQL database
try:
    connection = mysql.connector.connect(
        host=mysql_host,
        user=mysql_user,
        password=mysql_password,
        database=mysql_database
    )

    if connection.is_connected():
        print("Connected to MySQL database.")

        cursor = connection.cursor()

        # Insert data into MySQL table
        for index, row in df.iterrows():
            sql = f"INSERT INTO {mysql_table} (name, age, email) VALUES (%s, %s, %s)"
            cursor.execute(sql, tuple(row))

        connection.commit()
        print("Data inserted successfully.")

except Error as e:
    print(f"Error connecting to MySQL: {e}")
    exit()
finally:
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("MySQL connection closed.")
