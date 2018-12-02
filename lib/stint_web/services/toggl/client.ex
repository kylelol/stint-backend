defmodule Toggl.Client do
  defstruct auth: nil, endpoint: nil

  def new(auth, :api) do
    %__MODULE__{auth: auth, endpoint: "https://www.toggl.com/api/v9"}
  end

end
