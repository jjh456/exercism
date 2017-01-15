defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) when is_binary(string) do
    encode(String.codepoints(string))
  end

  def encode(list) do
    if List.first(list) do
      encode(list, "", 0, "")
    else
      ""
    end
  end

  def encode([current | tail], prev, count, result) do
    cond do
      prev == "" || current == prev ->
        encode(tail, current, count+1, result)
      true ->
        encode(tail, current, 1, result <> Integer.to_string(count) <> prev)
    end
  end

  def encode([], prev, count, result) do
    result <> Integer.to_string(count) <> prev
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    
  end
end
