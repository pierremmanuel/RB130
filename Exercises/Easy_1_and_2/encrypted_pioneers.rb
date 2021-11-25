# LS Solution:

# ENCRYPTED_PIONEERS = [
#   'Nqn Ybirynpr',
#   'Tenpr Ubccre',
#   'Nqryr Tbyqfgvar',
#   'Nyna Ghevat',
#   'Puneyrf Onoontr',
#   'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
#   'Wbua Ngnanfbss',
#   'Ybvf Unvog',
#   'Pynhqr Funaaba',
#   'Fgrir Wbof',
#   'Ovyy Tngrf',
#   'Gvz Orearef-Yrr',
#   'Fgrir Jbmavnx',
#   'Xbaenq Mhfr',
#   'Fve Nagbal Ubner',
#   'Zneiva Zvafxl',
#   'Lhxvuveb Zngfhzbgb',
#   'Unllvz Fybavzfxv',
#   'Tregehqr Oynapu'
# ].freeze
#
# def rot13(encrypted_text)
#   encrypted_text.each_char.reduce('') do |result, encrypted_char|
#     result + decipher_character(encrypted_char)
#   end
# end
#
# def decipher_character(encrypted_char)
#   case encrypted_char
#   when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
#   when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
#   else                         encrypted_char
#   end
# end
#
# ENCRYPTED_PIONEERS.each do |encrypted_name|
#   puts rot13(encrypted_name)
# end

def rot13(text)
  alphabet = ("a".."z").to_a

  text.chars.map do |chr|
    case chr
    when /[A-Z]/ then alphabet.rotate(13)[alphabet.index(chr.downcase)].upcase
    when /[a-z]/ then alphabet.rotate(13)[alphabet.index(chr)]
    else chr
    end
  end.join
end



p rot13("Nqn Ybirynpr")
p rot13("Tenpr Ubccre")
p rot13("Nqryr Tbyqfgvar")
p rot13("Nyna Ghevat")
p rot13("Puneyrf Onoontr")
p rot13("Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv")
p rot13("Wbua Ngnanfbss")
