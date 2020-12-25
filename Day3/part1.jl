using DelimitedFiles

#This is the slope 
slope = readdlm("day3.txt", String)

#this is the count for how many spaces to the right have been taken
#This value will constantly be reset once it hits the end of the slope 
x = 1

#check the max length before a repeat 
maxlength = length(slope[1])

#holds a count for the amount of trees have been encountered
count = 0

# a = [".#..",
#      "#.##",
#      ".##."]

# #check the max length before a repeat 
# maxlength = length(a[1])

#you need to take 3 right and 1 down
for y in slope
    #check if there are any trees in the spot i'm in
    #this accounts for the 1 move down
    if y[x] == '#'
        #if so add a count 
        count += 1
        #add an x on it 
    end

    #go to the right by 3 
    x += 3
    
    #check if x is out of bounds
    if x > maxlength
        #if it is get how far it is out of bounds 
        temp = x - maxlength
        #set the difference as the current grid point 
        x = temp
    end
end