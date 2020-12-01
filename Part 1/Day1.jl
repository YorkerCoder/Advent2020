using DelimitedFiles

Report = readdlm("Day1 Data.txt", Int)

#Part 1
function part1(Report)
    for i = 1:length(Report) for j = i:(length(Report))
        if (Report[i] + Report[j]) == 2020
            println("The part 1 answer is : $(Report[i]*Report[j])")
            return nothing
        end
    end end
end

part1(Report)

#Part 2
function part2(Report)
    for i in Report for j in Report for k in Report
        if (i+j+k) == 2020
            println("The part 2 answer is $(i*j*k)")
            return nothing
        end
    end end end
end

part2(Report)
