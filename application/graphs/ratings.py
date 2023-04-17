import mysql.connector
import matplotlib.pyplot as plt

def bar_chart(labels, values):
    plt.rcParams['font.family'] = 'Arial'
    fig, ax = plt.subplots(figsize=(8,6), facecolor='c')
    ax.bar(labels, values, color='#202020')
    ax.set_title('Sales Figures by the Ratings', fontsize=16, fontweight='bold')
    ax.set_xlabel('Agent ID', fontsize=12,  fontweight='semibold')
    ax.set_ylabel('Customer Rating', fontsize=12,   fontweight='semibold')
    ax.spines['right'].set_visible(False)
    ax.spines['top'].set_visible(False)
    plt.xticks(rotation=45, ha='right', fontsize=10)
    plt.tight_layout()
    plt.show()


# Connect to your SQL database
conn = mysql.connector.connect(host="localhost", database="RealEstate", user="root", password="sindhu23_")

# Create a cursor to execute SQL queries
cursor = conn.cursor()
query = "select agent_id as ID, rating from agent;"

# Execute the query and retrieve the data
cursor.execute(query)
results = cursor.fetchall()

# Extract the labels and values from the results
labels = [str(result[0]) for result in results]
values = [result[1] for result in results]

# Create the bar chart
bar_chart(labels, values)

