class CaesarCipher
  def initialize(key)
    @key = key
  end

  def encrypt(string)
    encrypted = string.chars.map(&:ord).map do |ascii_code|
      if (ascii_code > 64 && ascii_code < 91)
        if (ascii_code - @key) < 65
          ascii_code - @key + 26
        else
          ascii_code - @key
        end
      elsif (ascii_code > 96 && ascii_code < 123)
        if (ascii_code - @key) < 97
          ascii_code - @key + 26
        else
          ascii_code - @key
        end
      else
        ascii_code
      end
    end
    encrypted.map { |ascii_code| ascii_code.chr }.join
  end

  def decrypt(string)
    encrypted = string.chars.map(&:ord).map do |ascii_code|
      if (ascii_code > 64 && ascii_code < 91)
        if (ascii_code + @key) > 90
          ascii_code + @key - 26
        else
          ascii_code + @key
        end
      elsif (ascii_code > 96 && ascii_code < 123)
        if (ascii_code + @key) > 122
          ascii_code + @key - 26
        else
          ascii_code + @key
        end
      else
        ascii_code
      end
    end
    encrypted.map { |ascii_code| ascii_code.chr }.join
  end
end

if __FILE__==$0
  puts "Enter your key (Number of spaces to shift):"
  encrypter = CaesarCipher.new(gets.chomp.to_i)
  puts "Enter 1 to encrypt a message, or 2 to decrypt a message."
  choice = gets.chomp

  while true
    if choice == '1'
      puts "Enter your message:"
      message = gets.chomp
      puts "Encrypted message: " + encrypter.encrypt(message)
      break
    elsif choice == '2'
      puts "Enter your message:"
      message = gets.chomp
      puts "Decrypted message: " + encrypter.decrypt(message)
      break
    else
      puts "Please enter 1 or 2."
      choice = gets.chomp
    end
  end
end
