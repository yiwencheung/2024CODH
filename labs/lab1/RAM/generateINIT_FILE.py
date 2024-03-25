import random

# Define the number of lines and the file name
num_lines = 1024
file_name = "INIT_FILE.txt"

# Open the file for writing
with open(file_name, 'w') as file:
    # Generate and write 1024 lines of random 32-bit hexadecimal numbers
    for _ in range(num_lines):
        # Generate a random 32-bit number and convert it to a hexadecimal string
        hex_number = f"{random.getrandbits(32):08x}\n"
        # Write the hexadecimal number to the file
        file.write(hex_number)

print(f"Generated {file_name} with {num_lines} lines of random 32-bit hexadecimal numbers.")
