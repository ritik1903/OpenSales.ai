def compute(n):
    if n < 10:
        out = n ** 2
    elif n < 20:
        out = 1
        for i in range(1, n-9):  # Changed range limit from n-10 to n-9
            out *= i
    else:
        lim = n - 20
        out = lim * lim
        out = out + lim  # Changed subtraction to addition
        out = int(out / 2)  # Converted the result to an integer
    print(out)

n = int(input("Enter an integer: "))
compute(n)


########################### Bugs & Fixes ##########################
# Line 6: Changed range(1, n-10) to range(1, n-9) to include the upper limit in the loop.
# Line 11: Changed out = out - lim to out = out + lim to calculate the correct sum.
# Line 12: Added int() to convert the result to an integer.


########################### Test Cases ############################
# Test case 1: Enter 4 as the input. The script should output 16 since 4 is less than 10, and its square is 16.
# Test case 2: Enter 15 as the input. The script should output 120 since 15 is between 10 and 20, and its factorial (15 - 10)! is 120.
# Test case 3: Enter 25 as the input. The script should output 15 since 25 is greater than 20, and the sum of integers between 1 and (25 - 20) is 15.


############################ Instruction ###########################
# Save the corrected script as a Python file (e.g., script.py).
# Run the script in a Python environment.
# Enter an integer input when prompted and verify the outputs for the provided test cases and any additional test cases.