defmodule StintWeb.TestView do
  use StintWeb, :view

  def render("index.json", _other) do
    %{hello: "world"}
  end
end
