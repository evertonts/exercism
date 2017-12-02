use Bitwise

defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    result = []
    result = if (code &&& 1) == 1, do: ["wink" | result], else: result
    result = if (code &&& 2) == 2, do: ["double blink" | result], else: result
    result = if (code &&& 4) == 4, do: ["close your eyes" | result], else: result
    result = if (code &&& 8) == 8, do: ["jump" | result], else: result
    result = if (code &&& 16) == 16, do: Enum.reverse(result), else: result

    Enum.reverse(result)
  end
end

