defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    Enum.map_join(get_words(string), "", &(get_acronym_chars(&1)))
  end

  def get_words(string) do
    String.split(string, ~r/[^\w]/u)
  end

  def get_first_char(word) do
    if String.first(word) do
      String.upcase(String.first(word))
    else
      ""
    end
    
  end

  def get_tail([head | tail]) do
    tail
  end

  def get_tail([]) do
    []
  end

  def get_acronym_chars(word) do
    get_acronym_chars(get_tail(String.graphemes(word)), get_first_char(word))
  end

  def get_acronym_chars([head | tail], acc) do
    if head === String.upcase(head) do
      get_acronym_chars(tail, acc <> String.upcase(head))
    else
      get_acronym_chars(tail, acc)
    end
  end

  def get_acronym_chars([], acc) do
    acc
  end
end
