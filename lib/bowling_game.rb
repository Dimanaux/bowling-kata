class BowlingGame
  def rolls(rolls)
    @rolls = rolls
    self
  end

  def score
    total = 0
    i = 0
    while i < @rolls.size
      if @rolls[i] == 10 # strike
        total += 10
        if i < @rolls.size - 3 # not last frame
          total += @rolls[i + 1] + @rolls[i + 2]
        end
        i += 1
      elsif i < @rolls.size - 1 && @rolls[i] + @rolls[i + 1] == 10 # spare
        total += 10
        if i < @rolls.size - 3 # not last frame
          total += @rolls[i + 2]
        end
        i += 2
      else
        total += @rolls[i] + (@rolls[i + 1] || 0)
        i += 2
      end
    end
    total
  end
end
