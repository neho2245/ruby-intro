dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def count_occurences (string, substring)
  windows_size = substring.length - 1
  count = 0
  start_win = 0
  end_win = windows_size

  while end_win < string.length
    window = string[start_win..end_win]
    p(window)
    if window == substring
      count += 1
    end
    end_win += 1
    start_win += 1
  end

  return count
end

def substrings (string, dictionary)
  dictionary.reduce(Hash.new(0)) do |count, substring|
    count[substring] += count_occurences(string.downcase, substring)
    count
  end
end


# result = substrings("below", dictionary)
result = substrings("Howdy partner, sit down! How's it going?", dictionary)
p(result)

# p(count_occurences("Howdy partner, sit down! How's it going?".downcase, "how"))
