iterations = 200_000
randoms_per_run = 100

combo_arr = Array.new(randoms_per_run, 0)
iteration = 1

iterations.times do
  print "Iteration #{iteration}\r"
  arr = Array.new(2, 0)
  randoms_per_run.times do
    random_num = rand(0..1)
    arr[random_num] += 1
  end

  result = arr.fetch(0)
  # "folds" the results because a 51 is the same as a 49 and a 52 is the same as a 48...
  result = 50 - (result - 50) if result > 50
  combo_arr[result] += 1
  iteration += 1
end

combo_arr.to_enum.with_index.reverse_each do |val, index|
  next unless val > 0

  inverse = 100 - index
  percent = (val.to_f / iterations * 100).round(2)
  puts "#{index}-#{inverse}: #{val}, #{percent}%"
end
