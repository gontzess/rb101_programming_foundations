##Capitalize every second letter of every third word

def to_weird_case(sentence)
  new_sentence_ary = sentence.split(' ').map.with_index do |word, word_idx|
    if (word_idx + 1) % 3 == 0
      new_word_ary = word.split('').map.with_index do |char, char_idx|
        if (char_idx + 1) % 2 == 0
          char.capitalize
        else
          char
        end
      end
      new_word_ary.join('')
    else
      word
    end
  end
  new_sentence_ary.join(' ')
end

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') == 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case('It is a long established fact that a reader will be distracted') == 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case('Miss Mary Poppins word is supercalifragilisticexpialidocious') == 'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

p to_weird_case('Lorem Ipsum is simply dummy text of the printing')
p to_weird_case('It is a long established fact that a reader will be distracted')
p to_weird_case('aaA bB c')
p to_weird_case('Miss Mary Poppins word is supercalifragilisticexpialidocious')
