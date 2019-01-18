def first_anagram?(str1, str2)  #time_complexity = O(n! + n) == O(n!)
  all_perms = str2.chars.permutation.to_a

  all_perms.each do |sub|
    return true if str1.include?(sub.join(''))
  end

  false
end

p first_anagram?("gizmfgoaaa", "shgdflyaaaaa")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

def second_anagram?(str1, str2)
  str_to_arr = str2.chars
  
  str1.each_char.with_index do |char, i|
    idx = str_to_arr.find_index(char)
    unless idx.nil?
      str_to_arr = str_to_arr - [str_to_arr.delete_at(idx)]
    end
  end
  
  str_to_arr.empty?
end

p second_anagram?("gizmfgoaaa", "shgdflyaaaaa")    #=> false
# p second_anagram?("elvis", "lives") 
# p second_anagram?("gizmo", "sally")    #=> false

def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end

p third_anagram?("elvis", "lives")    #=> true
p third_anagram?("gizmo", "sally")    #=> false