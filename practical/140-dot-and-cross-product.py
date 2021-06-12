x1 = input("Enter X of Vector 1: ")
y1 = input("Enter Y of Vector 1: ")
z1 = input("Enter Z of Vector 1: ")
print
x2 = input("Enter X of Vector 2: ")
y2 = input("Enter Y of Vector 2: ")
z2 = input("Enter Z of Vector 2: ")

# Dot product
dotp = x1*x2 + y1*y2 + z1*z2

# Cross product
cx = y1*z2 - z1*y2
cy = z1*x2 - x1*z2
cz = x1*y2 - y1*x2

print
print("Dot product: " +  str(dotp))
print("Cross product: (" + str(cx) + ", " + str(cy) + ", " + str(cz) + ")")
