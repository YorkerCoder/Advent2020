using DelimitedFiles

#This is the slope 
slope = readdlm("day3.txt", String)

#this is the count for how many spaces to the right have been taken
#This value will constantly be reset once it hits the end of the slope 
xcount = 0

#check the max length before a repeat 
maxlength = length(slope[1])

