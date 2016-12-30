defmodule Words do
  def remove_punctuation(sentence) do
    String.replace(sentence, ~r/[^\w\s_-]/u, "")
  end

  def get_words(sentence) do
    String.split(remove_punctuation(sentence), ~r{[\s_]}, trim: true)    
  end

  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    count(get_words(String.downcase(sentence)), %{})
  end

  @spec count([String], Map) :: map
  def count([head | tail], acc) do
    count(tail, Map.put(acc, head, Map.get(acc, head, 0) + 1))
  end

  def count([], acc) do
    acc
  end
end
