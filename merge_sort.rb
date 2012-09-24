def merge_sort(array)
  return array if array.size <= 1

  middle = array.size / 2

  left = merge_sort array[0..middle-1]
  right = merge_sort array[middle..array.size]

  return merge left, right
end

def merge(array1, array2)
  rval = []
  i = 0
  j = 0

  while i < array1.size or j < array2.size
    if i < array1.size and j < array2.size
      if array1[i] <= array2[j]
        rval << array1[i]
        i += 1
      else
        rval << array2[j]
        j += 1
      end
    elsif i < array1.size
      rval << array1[i]
      i += 1
    elsif j < array2.size
      rval << array2[j]
      j += 1
    end
  end

  rval
end


# Example: for input array [1,3,5,2,4,6]
# Result: [[1,2,3,4,5,6],3]
# counts number of inversion

def sort_and_count(array)
  return array, 0 if array.size == 1

  left_array, left_inv_count = sort_and_count array[0..array.size/2-1]
  right_array, right_inv_count = sort_and_count array[array.size/2..array.size]

  merge_array, merge_inv_count  = merge_and_count_split_inv left_array, right_array

  return merge_array, left_inv_count + right_inv_count + merge_inv_count
end

def merge_and_count_split_inv left_array, right_array
  rval = []
  i = 0
  j = 0
  inv_count = 0
  while i < left_array.size or j < right_array.size
    if i < left_array.size and j < right_array.size
      if left_array[i] <= right_array[j]
        rval << left_array[i]
        i += 1
      else
        rval << right_array[j]
        inv_count += left_array.size - i
        j += 1
      end
    elsif i < left_array.size
      rval << left_array[i]
      i += 1
    elsif j < right_array.size
      rval << right_array[j]
      j += 1
    end
  end
  return rval, inv_count
end
