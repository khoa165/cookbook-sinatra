require 'nokogiri'
require 'open-uri'

class Service
  def initialize(keyword)
    @keyword = keyword
  end

  def call
    url = "http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=#{@keyword}"
    html_content = open(url).read
    doc = Nokogiri::HTML(html_content)
    scrape_recipe(doc)
  end

  def scrape_recipe(doc)
    imported_recipes = []
    doc.search('.m_contenu_resultat').first(5).each do |element|
      name = element.at_css('.m_titre_resultat').text.strip
      description = element.at_css('.m_texte_resultat').text.strip
      difficulty = element.at_css('.m_detail_recette').text.strip.split('-')[2].strip
      temp = element.search('.m_prep_time').first
      prep_time = temp.nil? ? 'N/A' : temp.parent.text.strip
      imported_recipes << Recipe.new(name, description, difficulty, prep_time)
    end
    imported_recipes
  end
end
