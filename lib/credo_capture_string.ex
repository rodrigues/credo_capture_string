defmodule CredoCaptureString do
  @moduledoc """
  Documentation for CredoCaptureString.
  """

  @doc """
  Hello world.

  ## Examples

      iex> CredoCaptureString.hello()
      :world

  """
  def hello(kind \\ :world) do
    kinds = %{world: "Mundo", bini: "Bini"}
    decorate = fn f -> "%% " <> f.(kind) <> " %%" end
    ## credo issue:
    decorate.(&"Ola #{kinds[&1]}")

    ## also credo issue:
    # decorate.(fn k -> "Ola #{kinds[k]}" end)

    ## below works, no credo issue:
    # decorate.(fn k -> "Ola " <> kinds[k] end)
  end
end
