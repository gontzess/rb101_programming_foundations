ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

# add ages for Marilyn and Spot to the existing has

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

additional_ages.each { |k, v| ages[k] = v }
p ages

# LS Solution:
# ages.merge!(additional_ages)
