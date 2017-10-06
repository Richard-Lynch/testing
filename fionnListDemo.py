#!/usr/bin/python

lads = [ "Fionn", "Richie", "Soundy Poundy", "T-Rex" ]
print (lads)

new_lads = []
for lad in lads:
    new_lad = lad.upper()
    new_lads.append(new_lad)
print (new_lads)

better_lads = [ lad.lower() for lad in lads ]
print (better_lads)

print (lads)
lads_no_copy = lads
lads_no_copy[0] = "stoopid face"
print (lads)
print (lads_no_copy)

lads_copy = lads[:]
lads_copy[0] = "nah hes sound"
print (lads)
print (lads_copy)
