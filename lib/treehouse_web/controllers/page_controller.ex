defmodule TreehouseWeb.PageController do
  use TreehouseWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
