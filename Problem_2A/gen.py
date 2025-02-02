import numpy as np
import pandas as pd

# Define matrix sizes
sizes = [(10, 10), (20, 20), (10, 20), (20, 10)]

file_paths = []
for rows, cols in sizes:
    matrix = np.random.randint(1, 11, size=(rows, cols))  # Random values between 1 and 10
    df = pd.DataFrame(matrix)
    file_path = f"matrix_{rows}x{cols}.csv"
    df.to_csv(file_path, index=False, header=False)
    file_paths.append(file_path)

file_paths
