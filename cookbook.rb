require 'csv'
require_relative 'recipe'

class Cookbook
  attr_accessor :csv_file_path
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    parse_csv
  end

  def parse_csv
    CSV.foreach(@csv_file_path) do |row|
      new_recipe = Recipe.new(row[0], row[1], row[2], row[3])
      @recipes << new_recipe
    end
  end

  def store_to_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.difficulty, recipe.prep_time]
      end
    end
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    store_to_csv
  end

  def mark_recipe(recipe_index)
    @recipes[recipe_index].mark_cook
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    store_to_csv
  end
end
