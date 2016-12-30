defmodule Bob do
  def hey(input) do
    cond do
      is_questioned(input) -> "Sure."
      is_ignored(input) -> "Fine. Be that way!"
      is_yelling(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  def is_yelling(input) do
    String.upcase(input) == input and String.upcase(input) != String.downcase(input)
  end

  def is_questioned(input) do
    String.last(input) == "?"
  end

  def is_ignored(input) do
    String.length(String.trim(input)) == 0
  end
end
