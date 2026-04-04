END_UPPERCASE = 91;
END_LOWERCASE = 123;
LETTERS = 26;

def wrap(character, wrap_start)
    return (wrap_start - LETTERS) + (character % wrap_start) if character >= wrap_start
    character
end

def isupcase?(character)
  character == character.upcase
end

def isletter?(character)
  if (character.ord > (END_LOWERCASE - LETTERS - 1) and character.ord < END_LOWERCASE)
    return true
  end
  if (character.ord > (END_UPPERCASE - LETTERS - 1) and character.ord < END_UPPERCASE)
    return true
  end
  return false
end

def caesar_cypher(message, shift_amount)
    split_encoded_message = message.split('').map do |character| 
        if (isletter?(character))
          encoded_character = character.ord + shift_amount
          if (isupcase?(character))
            wrap(encoded_character, END_UPPERCASE).chr
          else
            wrap(encoded_character, END_LOWERCASE).chr
          end
        else
            character
        end
    end

    # merge the encoded message back into a single one
    split_encoded_message.reduce('') { | new_string, character | new_string << character}
end

# p('A'.ord())
# p(caesar_cypher("w", 5))
p(caesar_cypher("What a string!", 5))
# p(65.chr)
# p('w'.ord)
# p((123 - LETTERS).chr)
# p(wrap(65, 91));