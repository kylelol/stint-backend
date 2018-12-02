defmodule StintWeb.Auth.RegistrationView do
  use StintWeb, :view

  def render("create.json", %{user: user}) do
    %{success: true}
  end

end
