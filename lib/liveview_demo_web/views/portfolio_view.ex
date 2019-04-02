defmodule LiveviewDemoWeb.PortfolioView do
  use LiveviewDemoWeb, :view

  def get_categories(model) do
    model["portfolio"]["categories"]
  end

  def get_items(model) do
    model["portfolio"]["items"]
  end

  def selected_category_id?(model, categoryId) do
    model["selectedCategoryId"] == categoryId
  end

  def item_category_id?(model, categoryId) do
    model["selectedCategoryId"] == categoryId
  end

  def selected_item(model) do
    if model["selectedItemId"] != 0 do
      model["portfolio"]["items"]
      |> Enum.filter(&selected_item?(&1,  model["selectedCategoryId"],  model["selectedItemId"]))
    else
      []
    end
  end

  defp selected_item?(item, selectedCategoryId, selectedItemId) do
    item["id"] == selectedItemId and item["categoryId"] == selectedCategoryId
  end

  def get_selected_item_id(model) do
    model["selectedItemId"]
  end
end
