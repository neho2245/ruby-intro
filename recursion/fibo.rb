def fibs (number)
  start = [0, 1]
  return start[0..number] if number < 2

  (3..number).each do
    start << start[-1] + start[-2]
  end
  start
end

def fibs_rec (number, sequence = [0, 1])
  return if number < 3

  sequence << sequence[-1] + sequence[-2]
  fibs_rec number - 1, sequence
end

p fibs 8

seq = [0, 1]
fibs_rec 8, seq
p seq

p other_fibs_rec 8
