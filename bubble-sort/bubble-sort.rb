unsorted_array = [4,3,78,2,0,2]

def bubble_sort!(unsorted_array)
  count_swaps = 1
  while count_swaps > 0
      count_swaps = 0
      for i in 0..(unsorted_array.length - 2) do
        if (unsorted_array[i] > unsorted_array[i + 1])
          count_swaps += 1
          unsorted_array[i], unsorted_array[i + 1] = unsorted_array[i + 1], unsorted_array[i]
        end
      end
  end
end

bubble_sort!(unsorted_array)
p(unsorted_array)