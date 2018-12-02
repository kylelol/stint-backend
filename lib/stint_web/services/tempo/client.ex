defmodule Tempo.Client do
  defstruct auth: nil, endpoint: nil

  def new(auth) do
    %__MODULE__{auth: auth, endpoint: "https://api.tempo.io/2"}
  end

end
