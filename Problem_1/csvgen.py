import csv
import random

def generate_csv(file_name, rows, columns, min_val=0, max_val=1):
    """
    Generate a CSV file with random integer values.

    Parameters:
        file_name (str): Name of the CSV file to generate.
        rows (int): Number of rows in the CSV file.
        columns (int): Number of columns in the CSV file.
        min_val (int): Minimum integer value (default is 0).
        max_val (int): Maximum integer value (default is 100).

    Returns:
        None
    """
    with open(file_name, mode='w', newline='') as file:
        writer = csv.writer(file)

        # Write rows with random integers
        for _ in range(rows):
            row = [random.randint(min_val, max_val) for _ in range(columns)]
            writer.writerow(row)

    print(f"CSV file '{file_name}' with {rows} rows and {columns} columns created successfully.")

# Example usage
if __name__ == "__main__":
    file_name = "mat1000x1000.csv"  # Name of the CSV file
    rows = 1000  # Number of rows
    columns = 1000  # Number of columns

    generate_csv(file_name, rows, columns)

    file_name = "mat1000x2000.csv"  # Name of the CSV file
    rows = 1000  # Number of rows
    columns = 2000  # Number of columns

    generate_csv(file_name, rows, columns)

    file_name = "mat2000x1000.csv"  # Name of the CSV file
    rows = 2000  # Number of rows
    columns = 1000  # Number of columns

    generate_csv(file_name, rows, columns)

    file_name = "mat2000x2000.csv"  # Name of the CSV file
    rows = 2000  # Number of rows
    columns = 2000  # Number of columns

    generate_csv(file_name, rows, columns)
