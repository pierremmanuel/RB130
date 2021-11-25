def step(start, ending, step)
  x = start
  while x <= ending
    yield(x)
    x += step
  end
  ending
end

p step(1, 10, 3) { |value| puts "value = #{value}" }
