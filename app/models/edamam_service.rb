class EdamamService
  include HTTParty
  base_uri 'https://api.edamam.com'

  def search(meal)
    response = self.class.get(
      "/search",
      query: {
        q: meal,
        app_id: ENV['EDAMAM_ID'],
        app_key: ENV['EDAMAM_SECRET']
      }
    )

    recipes = []

    response['hits'].each do |json_recipe|
      recipe = Recipe.new()
      recipe.name = json_recipe['recipe']['label']
      recipe.url = json_recipe['recipe']['url']
      recipe.image = json_recipe['recipe']['image']
      recipe.ingredients = json_recipe['recipe']['ingredientLines']

      recipes << recipe
    end

    recipes
  end

end
