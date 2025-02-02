# # # Define the output file name
# # filename = "in.txt"

# # # Open the file in write mode and write 10,000 'a' characters
# # count = 1000000000000000000000000000000000000000
# # with open(filename, "w") as file:
# #     file.write("a" * 1000000)

# # print(f"File '{filename}' created with {count} 'a' characters.")

# import os

# def create_large_text_file(filename="input_text_1000mb.txt", size_mb=1000):
#     size_bytes = int(size_mb * 1024 * 1024)  # Convert MB to bytes
#     chunk = "A" * 1024 * 1024  # 1MB chunk of 'A'
#     with open(filename, "w") as f:
#         for _ in range(size_bytes // len(chunk)):
#             f.write(chunk)
#         remaining_bytes = size_bytes % len(chunk)
#         if remaining_bytes:
#             f.write("A" * remaining_bytes)
#     print(f"File '{filename}' created with size {size_mb}MB")

# create_large_text_file(size_mb=1)
# create_large_text_file(size_mb=10)
# create_large_text_file(size_mb=100)
# create_large_text_file(size_mb=1000)

import os

def create_abc_file(filename="abc_text.txt", size_mb=1):
    size_bytes = int(size_mb * 1024 * 1024)  # Convert MB to bytes
    chunk = "ABC\n" * (size_bytes // 4)  # Each "ABC\n" is 4 bytes
    with open(filename, "w") as f:
        f.write(chunk)
    print(f"File '{filename}' created with size {size_mb}MB")

# Create files with different sizes
create_abc_file("input_text_17.198mb.txt", size_mb=17.198)
create_abc_file("input_text_34.396mb.txt", size_mb=34.396)
create_abc_file("input_text_79.156mb.txt", size_mb=79.156)
create_abc_file("input_text_178.789mb.txt", size_mb=178.789)
