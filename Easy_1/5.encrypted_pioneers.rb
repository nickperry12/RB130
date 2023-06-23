# Encrypted Pioneers

# The following list contains the names of individuals who are pioneers in the
# field of computing or that have had a significant influence on the field. The
# names are in an encrypted form, though, using a simple (and incredibly weak)
# form of encryption called Rot13.

# Nqn Ybirynpr
# Tenpr Ubccre
# Nqryr Tbyqfgvar
# Nyna Ghevat
# Puneyrf Onoontr
# Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
# Wbua Ngnanfbss
# Ybvf Unvog
# Pynhqr Funaaba
# Fgrir Wbof
# Ovyy Tngrf
# Gvz Orearef-Yrr
# Fgrir Jbmavnx
# Xbaenq Mhfr
# Fve Nagbal Ubner
# Zneiva Zvafxl
# Lhxvuveb Zngfhzbgb
# Unllvz Fybavzfxv
# Tregehqr Oynapu

=begin
P:

Need to write a method that deciphers the names; the names are encrypted using
ROT13 encryption - each letter is moved 13 spaces ahead in the alphabet.

Modeling:

Create an array filled with alphabetical chars => index position is char pos =>
if the char idx + 13 is greater than the arr length - 1, subtract it instead

['Nqn Ybirynpr',
'Tenpr Ubccre',
'Nqryr Tbyqfgvar',
'Nyna Ghevat']

Iterate and transform each string => ['Nqn Ybirynpr'] => break string into chars
=> ["N", "q", "n", " ", "Y", "b", "i", "r", "y", "n", "p", "r"] => iterate and
transform each char => return the char is the char is a space => if the char is
and upcased letter => replace the char with the char at the 13th position ahead
of it from UPCASE (13th before it if it exceeds the arr length) => repeat same
step for lowcased letters => join the string back together

=end

# Write a program that deciphers each name

encrypted_names = ['Nqn Ybirynpr',
'Tenpr Ubccre',
'Nqryr Tbyqfgvar',
'Nyna Ghevat',
'Puneyrf Onoontr',
'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
'Wbua Ngnanfbss',
'Ybvf Unvog',
'Pynhqr Funaaba',
'Fgrir Wbof',
'Ovyy Tngrf',
'Gvz Orearef-Yrr',
'Fgrir Jbmavnx',
'Xbaenq Mhfr',
'Fve Nagbal Ubner',
'Zneiva Zvafxl',
'Lhxvuveb Zngfhzbgb',
'Unllvz Fybavzfxv',
'Tregehqr Oynapu']

ALPHAS = ('a'..'z').to_a + ('A'..'Z').to_a


def decipher(str)
  str.tr('a-zA-Z', 'n-za-mN-ZA-M')
end

def decipher_alt(str)
  chars = str.chars

  chars.map!.with_index do |char, idx|
    if (char =~ /[a-z]/i) == nil
      char
    else
      i = ALPHAS.index(char)
      case ALPHAS.index(char)
      when 0..12
        ALPHAS[i + 13]
      when 13..25
        ALPHAS[i - 13]
      when 26..38
        ALPHAS[i + 13]
      when 39..51
        ALPHAS[i - 13]
      end
    end
  end.join
end

p encrypted_names.map { |name| decipher(name) }
encrypted_names.each { |name| puts decipher_alt(name) }
