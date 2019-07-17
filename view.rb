class View
  def ask_recipe_name
    puts "Which recipe do you want to add?"
    gets.chomp
  end

  def ask_recipe_description
    puts "Please provide the description of the recipe."
    gets.chomp
  end

  def display(recipes)
    puts "-----------------------------------------"
    recipes.each_with_index do |recipe, index|
      status = recipe.cooked? ? 'X' : ' '
      puts "#{index + 1}. [#{status}] #{recipe.name} (#{recipe.prep_time}) (#{recipe.difficulty})"
      # " --- #{recipe.description}"
    end
    puts "-----------------------------------------"
  end

  def ask_recipe_index_to_mark
    puts "What is the index of recipe you want to mark?"
    gets.chomp.to_i - 1
  end

  def ask_recipe_index_to_delete
    puts "What is the index of recipe you want to delete?"
    gets.chomp.to_i - 1
  end

  def ask_ingredient_for_search
    puts "What ingredient would you like a recipe for?"
    gets.chomp
  end

  def display_and_ask_index(ingredient_search, imported_recipes)
    puts "Looking for \"#{ingredient_search}\" on LetsCookFrench..."
    imported_recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name}"
    end
    puts "Which recipe would you like to import? (enter index)"
    recipe_index = gets.chomp.to_i - 1
    puts "Importing \"#{imported_recipes[recipe_index].name}\"..."
    recipe_index
  end
end
