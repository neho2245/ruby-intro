def caesar_cypher(message, shift_amount)
    shift_amount = shift_amount % 26

    message.chars.map do |char|
        if (char.between?('a', 'z'))
            ((char.ord - 'a'.ord + shift_amount) % 26 + 'a'.ord).chr
        elsif (char.between?('A', 'Z'))
            ((char.ord - 'A'.ord + shift_amount) % 26 + 'A'.ord).chr
        else
            char
        end
    end.join

end

p(caesar_cypher("string", 25));
p("asd")