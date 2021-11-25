class Clock
  attr_reader :hours, :minutes

  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
  end

  def self.at(hours, minutes = 0)
    self.new(hours, minutes)
  end

  def +(integer)
    variation_hours, variation_minutes = time_variations(integer)

    new_minutes = @minutes + variation_minutes
    new_hours = @hours + variation_hours

    if new_minutes >= 60 ; new_hours += 1 ; new_minutes -= 60 ; end
    new_hours -= 24 if new_hours >= 24

    self.class.new(new_hours, new_minutes)
  end

  def -(integer)
    variation_hours, variation_minutes = time_variations(integer)

    new_minutes = @minutes - variation_minutes
    new_hours = @hours - variation_hours

    if new_minutes <= 0 ; new_hours -= 1 ; new_minutes += 60 ; end
    new_hours += 24 if new_hours < 0

    self.class.new(new_hours, new_minutes)
  end

  def ==(other_clock)
    hours == other_clock.hours && minutes == other_clock.minutes
  end

  def to_s
    sprintf("%02d:%02d", hours, minutes)
  end

  private

  def time_variations(integer)
    hours, minutes = integer.divmod(60)
    hours %= 24 if hours > 24
    [hours, minutes]
  end
end

# clock = Clock.at(23, 59)
# puts clock
# clock = clock + 1
# puts clock
# clock = clock - 1
# puts clock
