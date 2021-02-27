##Capitalize every second letter of every third word

def to_weird_case(string)

end

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') == 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case('It is a long established fact that a reader will be distracted') == 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case('Miss Mary Poppins word is supercalifragilisticexpialidocious') == 'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

p to_weird_case('Lorem Ipsum is simply dummy text of the printing')
p to_weird_case('It is a long established fact that a reader will be distracted')
p to_weird_case('aaA bB c')
p to_weird_case('Miss Mary Poppins word is supercalifragilisticexpialidocious')
