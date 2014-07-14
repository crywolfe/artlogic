# require 'rspec'

# The following five methods 'convertRawEntry', 'make2Bytes', 'pack', 'makeEncodedHex', and 'encode' encode a decimal.


def convertRawEntry(num)
   @num = num
   if @num > 8192 || @num < -8192
      puts "Please enter a number between -8192 and 8192"
   else
      @num = @num + 8192
   end
   @num
end

def make2Bytes
   bit14 = @num.to_s(2)
   make(bit14, 7)
   @byte_1 = bit14.slice(7,15)
   @byte_2 = bit14.slice(0,7)
end

def pack
   byte_1_16 = "0" + @byte_1
   byte_2_16 = "0" + @byte_2
   @bytes_2 = byte_2_16 + byte_1_16
end

def makeEncodedHex
   @encoded_hex = @bytes_2.to_i(2).to_s(16)

   while @encoded_hex.length < 4
      @encoded_hex = "0" + @encoded_hex
   end
   @encoded_hex
end

def encode(num)
   convertRawEntry(num)
   make2Bytes
   pack
   makeEncodedHex
   puts "==================================="
   puts "Your Hex String is #{@encoded_hex}"
   puts "==================================="
   puts ""
end

# The following three methods 'decode' and 'convertHex' and 'make' decode a hex string.

def decode(hex_num)
   if hex_num.hex > 32639
      puts "Your hex string must be less than '7f7f'"
   else
      convertHex(hex_num)
   end
   puts "========================================"
   puts "Your decoded integer is #{@final_decimal}"
   puts "========================================"
   puts ""
end

def convertHex(hex_num)
   make(hex_num, 4)
   byte_1 = hex_num.slice(2,4).hex.to_s(2)
   byte_1 = make(byte_1, 7)

   byte_2 = hex_num.slice(0,2).hex.to_s(2)
   byte_2 = make(byte_2, 7)

   former_byte = "00" + byte_2 + byte_1
   @final_decimal = former_byte.to_i(2) - 8192
end

def make(byte, length)
   while byte.length < length
      byte = "0" + byte
   end
   byte
end

# The 'menu' method creates a text user interface menu

def menu
   puts "1. Encode integer between -8192 and 8192"
   puts "2. Decode hex string between '0000' and '7f7f'"
   puts "3. Quit"

   @response = gets.chomp

   while @response != "3"
      case @response
      when "1"
         print "Please enter your integer: "
         int_response = gets.chomp.to_i
         encode(int_response)
         menu
      when "2"
         print "Please enter your hex string: "
         hex_response = gets.chomp
         decode(hex_response)
         menu
      else
         puts "invalid option"
         menu
      end
   end
end

menu
