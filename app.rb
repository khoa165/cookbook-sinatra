require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry-byebug'
require 'better_errors'
set :bind, '0.0.0.0'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

require_relative 'cookbook'
require_relative 'recipe'

get '/testing' do
  @usernames = ['ssaunier', 'Papillard']
  erb :testing
end

get '/' do
  csv_file = File.join(__dir__, 'recipes.csv')
  cookbook = Cookbook.new(csv_file)
  @recipes = cookbook.all
  erb :index
end

get '/new' do
  erb :new
end

post '/recipes' do
  cookbook = Cookbook.new(File.join(__dir__, 'recipes.csv'))
  recipe = Recipe.new(params[:name], params[:description], params[:difficulty], params[:prep_time])
  cookbook.add_recipe(recipe)
  redirect to '/'
end

get '/recipes/:index' do
  cookbook = Cookbook.new(File.join(__dir__, 'recipes.csv'))
  cookbook.remove_recipe(params[:index].to_i)
  redirect to '/'
end
