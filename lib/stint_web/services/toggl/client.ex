defmodule Toggl.Client do
  defstruct auth: nil, endpoint: nil

  def new(auth, :nine) do
    %__MODULE__{auth: auth, endpoint: "https://www.toggl.com/api/v9"}
  end

  def new(auth, :eight) do
    %__MODULE__{auth: auth, endpoint: "https://www.toggl.com/api/v8"}
  end

end
