def encrypt_with_caesar(ciphertext, key_number)
  upalphabets = Array('A'..'Z')
  lowalphabets = Array('a'..'z')
  digit = Array('0'..'9')
  other = ["+","=","/"]
  ciphertext.each_char.inject('') do |decrypted_string, char|
    if !other.include?(char) then
      if  upalphabets.include?(char) then
        index = (upalphabets.index(char) + key_number) % upalphabets.length
        decrypted_string << upalphabets[index]
      elsif lowalphabets.include?(char) then
        index = (lowalphabets.index(char) + key_number) % lowalphabets.length
        decrypted_string << lowalphabets[index]
      elsif digit.include?(char) then
        index = (digit.index(char) + key_number) % digit.length
        decrypted_string << digit[index]
      end
    else
      decrypted_string << char
    end
  end
end
