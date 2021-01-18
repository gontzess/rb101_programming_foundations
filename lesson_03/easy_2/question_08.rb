# Shorten this sentence ...remove everything starting from "house".

advice = "Few things in life are as important as house training your pet dinosaur."

#advice.slice!("Few things in life are as important as ")

advice.slice!(0, advice.index('house'))
puts advice
