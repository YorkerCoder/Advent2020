using DelimitedFiles

data = readdlm("data.txt", String)
pass = data[:,3]

#gather all of the letters 
letter = hcat(split.(data[:,2], ":")...)
letter = letter[1,:]

#split the strings and convert them into integers
bounds = parse.(Int64, hcat(split.(data[:,1], '-')...))

#make an array of arrays of the bounds
bounds = [bounds[:,i] for i = 1:size(bounds)[2]]

function check(password, letter, bounds)
    #amount of times the letter shows up in the password
    count = 0
    
    #assign the bounds
    lower, upper = bounds 
    #go through each letter in the password
    for i in password
        #check if the current letter is = to the containing letter 
        if i == letter[1]
            #add to the count 
            count += 1
        end 
    end

    #check if the count is within the bounds, return one if it is and 0 if it's not
    if count >= lower && count <= upper
        return 1
    else 
        return 0 
    end
end

sum(check.(pass,letter,bounds))