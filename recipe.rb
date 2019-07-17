class Recipe
  attr_reader :name, :description, :difficulty, :prep_time
  def initialize(name, description, difficulty = 'N/A', prep_time = 'N/A')
    @name = name
    @description = description
    @difficulty = difficulty
    @prep_time = prep_time
    @status = false
  end

  def cooked?
    @status
  end

  def mark_cook
    @status = true
  end
end
