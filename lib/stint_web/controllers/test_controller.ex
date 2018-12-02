defmodule StintWeb.TestController do
  use StintWeb, :controller

  def index(conn, _params) do
    render(conn, "index.json")
  end

end
