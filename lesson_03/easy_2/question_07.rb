flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
#flintstones << "Dino"

# How can we add multiple items to our array? (Dino and Hoppy)

flintstones.concat(%w(Dino Hoppy))
p flintstones

# OR
# flintstones.push("Dino").push("Hoppy")
