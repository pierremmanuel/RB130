class Robot

  @@used_names = []

  def name
    return @name if @name
    @name = generate_name
  end

  def reset
    @@used_names.delete(@name)
    @name = nil
  end

  private

  def generate_name
    name = ""
    loop do
      name = ""
      name << ("AA".."ZZ").to_a.sample
      name << format("%03d" ,(0..999).to_a.sample)
      break unless @@used_names.include?(name)
    end
    @@used_names << name
    name
  end
end

# bob = Robot.new
# a = bob.name
# bob.reset
# p a
# p bob.name
