defmodule StintWeb.TimeEntryView do
  use StintWeb, :view

  def render("start.json", time_entry) do
    %{success: true}
  end

end
