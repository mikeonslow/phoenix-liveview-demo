defmodule LiveviewDemoWeb.PortfolioLive do
  use Phoenix.LiveView
  alias LiveviewDemoWeb.PortfolioView

  def mount(_session, socket) do
    {:ok, assign(socket, :val, 5)}
  end

  def handle_event("inc", _, socket) do
    {:noreply, update(socket, :val, &(&1 + 1))}
  end

  def handle_event("dec", _, socket) do
    {:noreply, update(socket, :val, &(&1 - 1))}
  end

  def render(assigns) do
    PortfolioView.render("index.html", assigns)
  end

end