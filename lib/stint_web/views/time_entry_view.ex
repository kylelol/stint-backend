defmodule StintWeb.TimeEntryView do
  use StintWeb, :view

  def render("start.json", %{time_entry: time_entry}) do
    %{success: true, id: time_entry[:id]}
  end

  def render("stop.json", _opts) do
    %{success: true}
  end

end
