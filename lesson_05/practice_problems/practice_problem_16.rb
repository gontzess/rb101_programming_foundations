# A UUID is a type of identifier often used as a way to uniquely identify items...which may not all be created by the same system. That is, without any form of synchronization, two or more separate computer systems can create new items and label them with a UUID with no significant chance of stepping on each other's toes.

# It accomplishes this feat through massive randomization. The number of possible UUID values is approximately 3.4 X 10E38.

# Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.

# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# Write a method that returns one UUID when called with no parameters.

HEX_DIGITS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'a', 'b', 'c', 'd', 'e', 'f']
DEC_DIGITS = (0..15)
HEX_CHARACTERS_V2 = ('0'..'9').to_a + ('a'..'f').to_a

def to_hex(int)
  return 'error' unless DEC_DIGITS.include?(int)
  HEX_DIGITS[int]
end

def get_uuid_segment(seg_length)
  uuid_segment = ''
  seg_length.times do
    digit = to_hex(rand(DEC_DIGITS))
    uuid_segment << digit.to_s
  end
  uuid_segment
end

def get_uuid_segment_v2(seg_length)
  uuid_segment = ''
  seg_length.times do
    character = HEX_CHARACTERS_V2.sample
    uuid_segment << character
  end
  uuid_segment
end

def get_uuid_v4
  uuid = ''
  sections = [8, 4, 4, 4, 12]
  sections.each do |section|
    section.times { uuid << HEX_CHARACTERS_V2.sample }
    uuid << '-' unless uuid.count("\-") == sections.length - 1
  end
  uuid
end

def get_uuid_v3
  uuid = ''
  sections = [8, 4, 4, 4, 12]
  sections.each do |section|
    uuid << get_uuid_segment_v2(section)
    uuid << '-' unless uuid.count("\-") == sections.length - 1
  end
  uuid
end

def get_uuid_v2
  uuid_1 = get_uuid_segment(8)
  uuid_2 = get_uuid_segment(4)
  uuid_3 = get_uuid_segment(4)
  uuid_4 = get_uuid_segment(4)
  uuid_5 = get_uuid_segment(12)

  "#{uuid_1}-#{uuid_2}-#{uuid_3}-#{uuid_4}-#{uuid_5}"
end

def get_uuid_v1
  uuid_1 = ''
  8.times do
    digit = to_hex(rand(DEC_DIGITS))
    uuid_1 << digit.to_s
  end
  uuid_2 = ''
  4.times do
    digit = to_hex(rand(DEC_DIGITS))
    uuid_2 << digit.to_s
  end
  uuid_3 = ''
  4.times do
    digit = to_hex(rand(DEC_DIGITS))
    uuid_3 << digit.to_s
  end
  uuid_4 = ''
  4.times do
    digit = to_hex(rand(DEC_DIGITS))
    uuid_4 << digit.to_s
  end
  uuid_5 = ''
  12.times do
    digit = to_hex(rand(DEC_DIGITS))
    uuid_5 << digit.to_s
  end
  #puts "#{uuid_1}-#{uuid_2}-#{uuid_3}-#{uuid_4}-#{uuid_5}"
  format("%8s\-%4s\-%4s\-%4s\-%12s", uuid_1, uuid_2, uuid_3, uuid_4, uuid_5)
end

#LS solution:
def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end

puts get_uuid_v1
puts get_uuid_v2
puts generate_UUID
puts get_uuid_v3
puts get_uuid_v4
