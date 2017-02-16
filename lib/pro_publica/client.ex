defmodule ProPublica.Client do
  defstruct token: nil

  @type t :: %__MODULE__{token: binary}

  @spec new(binary) :: t
  def new(token), do: %__MODULE__{token: token}
end
