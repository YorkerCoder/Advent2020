using DelimitedFiles

#load all of the data in 
data = readdlm("data.txt", String)

#get the passwords
pass = data[:,3]

#gather all of the letters 
letter = hcat(split.(data[:,2], ":")...)
letter = letter[1,:]

#split the strings and convert them into integers
position = parse.(Int64, hcat(split.(data[:,1], '-')...))

#make an array of arrays of the bounds
position = [position[:,i] for i = 1:size(position)[2]]


function check(password, letter, positions)
    #this will tell you how many times a letter appears in a valid position 
    count = 0

    #go through the possible positions 
    for i in positions
       #check if the position in the password is == to the letter
       if password[i] == letter[1]
            #add 1 to the count for it 
            count += 1
       end
    end

    #check if the count is anythign other than one
    if count == 1 
        return 1
    else 
        return 0
    end 
end

sum(check.(pass, letter, position))