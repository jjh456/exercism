defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    convert(pling(number) <> plang(number) <> plong(number), number)
  end

  def convert(ppp_result, number) do
    if String.length(ppp_result) > 0 do
      ppp_result
    else
      Integer.to_string(number)
    end
  end

  def pling(number) do
    if rem(number, 3) === 0 do
      "Pling"
    else
      ""
    end
  end

  def plang(number) do
    if rem(number, 5) === 0 do
      "Plang"
    else
      ""
    end
  end

  def plong(number) do
    if rem(number, 7) === 0 do
      "Plong"
    else
      ""
    end
  end
end
