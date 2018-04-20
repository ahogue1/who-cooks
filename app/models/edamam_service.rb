class EdamamService
  include HTTParty
  base_uri 'https://api.edamam.com'

  def search(meal)
    response = self.class.get(
      "/search",
      query: {
        q: meal,
        app_id: ENV['EDAMAM_ID'],
        app_key: ENV['EDAMAM_SECRET'],
        excluded: "dessert",
      }
    )

    recipes = []

    response['hits'].each do |json_recipe|
      recipe = Recipe.new()

      recipe.edamam_id = json_recipe['recipe']['uri']
      recipe.label = json_recipe['recipe']['label']
      recipe.url = json_recipe['recipe']['url']
      recipe.image = json_recipe['recipe']['image']
      recipe.health_labels = json_recipe['recipe']['healthLabels'].join(', ')
      recipe.diet_labels = json_recipe['recipe']['dietLabels'].join(', ')
      recipe.calories = json_recipe['recipe']['calories']
      recipe.yield = json_recipe['recipe']['yield']
      recipe.source = json_recipe['recipe']['source']

      recipes << recipe
    end

    recipes
  end

  def find(recipe_id)
    response = self.class.get(
      "/search",
      query: {
        r: recipe_id,
        app_id: ENV['EDAMAM_ID'],
        app_key: ENV['EDAMAM_SECRET']
      }
    )

    recipe = Recipe.new(
      edamam_id: response.first['uri'],
      label: response.first['label'],
      url: response.first['url'],
      image: response.first['image'],
      source: response.first['source'],
      yield: response.first['yield'],
      calories: response.first['calories'],
      diet_labels: response.first['dietLabels'].join(', '),
      health_labels: response.first['healthLabels'].join(', ')
    )

    response.first['ingredientLines'].each do |ingredient_line|
      recipe.ingredients << Ingredient.new(name: ingredient_line)
    end

    recipe
  end

end
