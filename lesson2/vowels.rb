# frozen_string_literal: true

# Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1)

output = {}
('a'..'z').each_with_index do |letter, index|
  vowels = ['a', 'e', 'i', 'o', 'u']
  output[letter] = index + 1 if vowels.include?(letter)
end

puts output
