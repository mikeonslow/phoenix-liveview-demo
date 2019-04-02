defmodule LiveviewDemoWeb.PortfolioView do
  use LiveviewDemoWeb, :view

  def get_categories(model) do
    model["portfolio"]["categories"]
  end

  def get_items(model) do
    model["portfolio"]["items"]
  end

  def selected_category_id?(model, categoryId) do
    IO.puts("Cat matches")
    IO.inspect({model["selectedCategoryId"], categoryId})
    model["selectedCategoryId"] == categoryId |> IO.inspect()
  end

  def get_selected_item_id(model) do
    model["selectedItemId"]
  end
end
