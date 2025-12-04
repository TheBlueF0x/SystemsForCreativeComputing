https://medium.com/@datajournal/web-scraping-with-jupyter-f493293effbb

```
pip install jupyter
python -m venv scraper
```

```
import requests  
# URL of the target website  
url = 'https://www.worldometers.info/co2-emissions/us-co2-emissions/'  
# Send a GET request to the website  
response = requests.get(url)  
# Check if the request was successful  
if response.status_code == 200:  
print('Successfully fetched the webpage!')  
else:  
print('Failed to retrieve the page')
```

```
from bs4 import BeautifulSoup  
# Parse the HTML content  
soup = BeautifulSoup(response.text, 'html.parser')  
# Find the table containing the CO2 emissions data  
table = soup.find('table')
```

```
# Extract the table headers  
headers = [header.text.strip() for header in table.find_all('th')]  
# Extract the rows of data  
rows = []  
for row in table.find_all('tr')[1:]: # Skip the header row  
cells = row.find_all('td')  
row_data = [cell.text.strip() for cell in cells]  
rows.append(row_data)  
# Print the headers and first row to check the data  
print(headers)  
print(rows[0])
```

```
import csv  
# Define the output CSV file  
csv_file = 'co2_emissions.csv'  
# Write the data to the CSV file  
with open(csv_file, mode='w', newline='', encoding='utf-8') as file:  
writer = csv.writer(file)  
writer.writerow(headers) # Write headers  
writer.writerows(rows) # Write rows  
print(f"Data has been saved to {csv_file}")
```

```
import pandas as pd  
# Load the data into a pandas DataFrame  
df = pd.read_csv(csv_file)  
# Display the first few rows of the data  
df.head()
```

```
import seaborn as sns  
import matplotlib.pyplot as plt  
# Convert 'Fossil CO2 Emissions' column to numeric  
df['Fossil CO2 Emissions (tons)'] = df['Fossil CO2 Emissions (tons)'].str.replace(',', '').astype(float)  
# Ensure the 'Year' column is numeric  
df['Year'] = pd.to_numeric(df['Year'], errors='coerce')  
# Sort the data by year  
df = df.sort_values(by='Year')  
# Create a line plot of CO2 emissions over the years  
plt.figure(figsize=(10, 6))  
sns.lineplot(data=df, x='Year', y='Fossil CO2 Emissions (tons)', marker='o')  
plt.title('CO2 Emissions in the U.S. Over the Years', fontsize=16)  
plt.xlabel('Year', fontsize=12)  
plt.ylabel('Fossil CO2 Emissions (tons)', fontsize=12)  
plt.grid(True)  
plt.show()
```