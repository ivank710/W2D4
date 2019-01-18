require 'byebug'

#def my_min(list)
#   list.each_with_index do |el1, idx1|
#     min = true
#     list.each_with_index do |el2, idx2|
#       next if idx1 == idx2
#       min = false if el1 > el2
#     end
#     return el1 if min == true
#   end
# end

def my_min(list)  #time complexity = O(n^2)
  min = list[0] 
  
  list.each_with_index do |el1, idx1|
    list.each_with_index do |el2, idx2|
      next if idx1 == idx2
      if el1 < el2 && el1 < min
        min = el1
      elsif el2 < min
        min = el2
      end
    end
  end

  min
end

def my_min2(list) #time complexity = O(n)
  min = list[0]

  list.each do |el|
    min = el if el < min 
  end

  min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min2(list)  # =>  -5

# def largest_contiguous_subsum(list) #time complexity = O(n^2)
#   max = list.first

#   list.each_with_index do |el1, i|
#     sum = el1
#     max = el1 if el1 > max
#     ((i+1)...list.length).each do |j|
#       sum += list[j]
#       if max < sum
#         max = sum
#       end
#       # next if i == j
#       # if el1 + el2 > sum
#       #   sum = el1 + el2
#       # end
#     end
#   end

#   max
# end

def largest_contiguous_subsum(list)
  all_subs = []
  list.each_with_index do |el1, i|
    sum = el1
    (i+1..list.length).each do |j|
      sub_arr = list[i...j]
      all_subs << sub_arr
    end
  end
  
  max = all_subs.first.first

  all_subs.each do |sub|
    sum = 0
    sub.each do |val|
      sum += val
    end
    max = sum if max < sum
  end

  max
end

def largest_contiguous_subsum(list)
  max = list.first 
  sum = list.first 

  i = 0
  j = 0
  while i < list.length 
   #debugger
 
    sum = list[i] if sum == list[i]
   
    max = sum if max < sum
    j += 1 
    sum += list[j] 
      
    if j >= list.length - 1
      max = sum if max < sum
      i += 1
      j = i
      sum = list[i]
    end

    if i == (list.length - 1) 
      return max
    end
  end

  max
end

list = [5, 3, -7, 1]
p largest_contiguous_subsum(list) # => 8
list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])

