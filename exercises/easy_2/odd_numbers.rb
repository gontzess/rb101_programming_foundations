# Print all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

(0..99).each { |x| puts x if x.odd? }

(0..99).select { |x| puts x if x.odd? }
