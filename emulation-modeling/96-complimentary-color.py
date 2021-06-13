#!/usr/bin/env python

# Ask user for the color
color = input("Enter your color in HEX: ")

# Get RGB values from HEX color code
r = int(color[1:3], 16)
g = int(color[3:5], 16)
b = int(color[5:7], 16)

# Generate complimentary RGB values
rc = hex(255-r)[2:].zfill(2)
gc = hex(255-g)[2:].zfill(2)
bc = hex(255-b)[2:].zfill(2)

# Print the new color
print("Complimentary color: #" + str(rc) + str(gc) + str(bc))
