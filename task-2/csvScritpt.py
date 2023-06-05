#Import the library
import csv


#function definition
def fetch_top_departments(csv_file):
    # Read data from the CSV file
    with open(csv_file, 'r') as file:
        reader = csv.DictReader(file)
        data = list(reader)

    # Calculate average monthly salary for each department
    departments = {}
    for row in data:
        dept_name = row['DEPT_NAME']
        salary = float(row['MONTHLY_SALARY'])

        if dept_name in departments:
            departments[dept_name].append(salary)
        else:
            departments[dept_name] = [salary]

    # Calculate average monthly salary for each department
    avg_salaries = {}
    for dept_name, salaries in departments.items():
        avg_salary = sum(salaries) / len(salaries)
        avg_salaries[dept_name] = avg_salary

    # Sort departments based on average salary
    sorted_departments = sorted(avg_salaries.items(), key=lambda x: x[1], reverse=True)

    # Print top 3 departments along with their names and average monthly salary
    for dept, avg_salary in sorted_departments[:3]:
        print("DEPT_NAME:", dept)
        print("AVG_MONTHLY_SALARY (USD):", avg_salary)
        print()

# Usage example
csv_file = 'departments.csv'  # Replace with the actual path to your CSV file
fetch_top_departments(csv_file)




############################ Assumptions ##################################
# 1-> The data is stored in a CSV file with columns named "DEPT_NAME" and "AVG_MONTHLY_SALARY".
# 2-> The CSV file is located at the specified file path.


############################# Test Cases ###################################
# 1-> Prepare a CSV file with the required columns and sample data.
# 2-> Verify the results by checking the top 3 departments along with their average monthly salary.

############################# Instructions ##################################
# 1-> Save the provided data as a CSV file or create your own CSV file with the required columns.
# 2-> Update the 'csv_file' variable in the script with the path to the CSV file.
# 3-> Run the Python script to fetch the top 3 departments and display the report.