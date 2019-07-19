class Recipe
  attr_reader :name, :description, :difficulty, :prep_time
  def initialize(attributes = {})
    @name = attributes[:name]
    @description = attributes[:description]
    @difficulty = attributes[:difficulty] || 'N/A'
    @prep_time = attributes[:prep_time] || 'N/A'
    @status = false
  end

  def cooked?
    @status
  end

  def mark_cook
    @status = true
  end
end
