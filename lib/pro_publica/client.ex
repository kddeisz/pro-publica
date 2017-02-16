defmodule ProPublica.Client do
  defstruct token: nil

  def new(token), do: %__MODULE__{token: token}
end
