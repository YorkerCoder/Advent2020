using DelimitedFiles

function slopes(right, down)
    #This is the slope 
    slope = readdlm("day3.txt", String)

    #this is the count for how many spaces to the right have been taken
    #This value will constantly be reset once it hits the end of the slope 
    x = 1
    y = 1
    #this is a cound for how many spaces down have happened
    #check the max length before a repeat 
    maxlength = length(slope[1])

    #check the max lenght of the whole thing 
    ymax = length(slope)

    #holds a count for the amount of trees have been encountered
    count = 0



    while y < ymax

        #go to the right by by the amount specified 
        x += right
        #go down the specified amount
        y += down

        
        #check if x is out of bounds
        if x > maxlength
            #if it is get how far it is out of bounds 
            temp = x - maxlength
            #set the difference as the current grid point 
            x = temp
        end

        #check if there are any trees in the spot i'm in
        #where y is the current row and x is the colums 
        if slope[y][x] == '#'
            #if so add a count 
            count += 1
            #add an x on it 
        end
    end

    return count
end

r = [1,3,5,7,1]
d = [1,1,1,1,2]

answer = prod(slopes.(r,d))
