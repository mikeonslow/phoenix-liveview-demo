defmodule LiveviewDemoWeb.PortfolioLive do
  use Phoenix.LiveView
  alias LiveviewDemoWeb.PortfolioView

  def mount(_session, socket) do
    {code, portfolio} = LiveviewDemo.Portfolio.Server.get()

    initialModel =
      {200,
       %{
         "errorMessage" => "",
         "portfolio" => portfolio,
         "selectedCategoryId" => map_default_selected_category_id(portfolio["categories"]),
         "selectedItemId" => 0
       }}

    initialModel
    |> map_assigns(socket)
  end

  def handle_event("select_category", selectedCategoryId, socket) do
    {:noreply, assign(socket, update_selected_category_id(socket, selectedCategoryId))}
  end

  def handle_event("select_item", data, socket) do
    {:noreply, update(socket, :selectedItemId, data)}
  end

  def render(assigns) do
    PortfolioView.render("index.html", assigns)
  end

  def map_assigns({200, model}, socket) do
    newSocket = socket |> assign(:model, model)
    {:ok, newSocket}
  end

  defp update_selected_category_id(
         %{assigns: %{model: model} = assigns} = socket,
         selectedCategoryId
       ) do
    %{
      assigns
      | model: %{model | "selectedCategoryId" => selectedCategoryId |> String.to_integer()}
    }
  end

  defp map_default_selected_category_id([]), do: 0
  defp map_default_selected_category_id([hd | _rest]), do: hd["id"]
end
