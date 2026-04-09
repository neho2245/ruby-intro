require 'pry-byebug'

def merge (array1, array2)
  merged_array = []
  i = 0 # the itterator for the first array
  j = 0 # the itterator for the second array
  while i < array1.size && j < array2.size
    if array1[i] < array2[j]
      merged_array << array1[i]
      i += 1
    elsif array1[i] > array2[j]
      merged_array << array2[j]
      j += 1
    else
      merged_array << array1[i]
      merged_array << array2[j]
      i += 1
      j += 1
    end
  end

  merged_array << array1[i..array1.size] unless i == array1.size
  merged_array << array2[j..array2.size] unless j == array2.size

  merged_array.flatten!
end

def merge_sort (array)
  return array if array.size < 2
  return array.sort if array.size == 2

  first_half = merge_sort(array[0..(array.size / 2)])
  second_half = merge_sort(array[(array.size / 2 + 1)..array.size])

  merge(first_half, second_half)
end

# Steps:
# 1. Divide the array up into 2 subproblems
# 2. When the subproblem is 2 elements wide or 1 element wide, simply sort it from there
# 3. Merge together the 2 sorted arrays
# 4. Repeat and profit 😎

merged = merge [0, 1, 2, 3], [0, 1, 4, 7, 9]
p merged

p merge_sort([3, 2, 1, 13, 8, 5, 0, 1])
p merge_sort([105, 79, 100, 110])
p merge_sort([])