defmodule DoBlock do
  @moduledoc """
  Documentation for DoBlock.
  """

  @doc """
  Dump keyword arguments.

  ## Examples

      iex> DoBlock.dumpFn([{:a, 1}])
      [a: 1]
      iex> DoBlock.dumpFn([a: 1])
      [a: 1]
      iex> DoBlock.dumpFn [a: 1]
      [a: 1]
      iex> DoBlock.dumpFn a: 1
      [a: 1]
      iex> DoBlock.dumpFn a: 1, do: DoBlock.hello()
      [a: 1, do: :world]
      iex> DoBlock.dumpFn do: DoBlock.hello()
      [do: :world]
      iex> DoBlock.dumpFn do DoBlock.hello() end
      [do: :world]
      iex> DoBlock.dumpFn do
      ...>   DoBlock.hello()
      ...> end
      [do: :world]
      iex> DoBlock.dumpFn do
      ...>   IO.puts("Hello")
      ...>   DoBlock.hello()
      ...> end
      [do: :world]
      iex> DoBlock.dumpFn do
      ...>   IO.puts("Hello")
      ...>   DoBlock.hello()
      ...>   IO.puts("!")
      ...> end
      [do: :ok]

  """
  def dumpFn(arg) do
    arg
  end

  @doc """
  Dump keyword arguments.

  ## Examples

      iex> DoBlock.dumpMacro do: 1
      [do: 1]
      iex> DoBlock.dumpMacro do
      ...>   DoBlock.hello()
      ...> end
      [do: :world]
  """
  defmacro dumpMacro(do: bloco) do
    quote do
      [do: unquote bloco]
    end
  end



  def hello do
    :world
  end

end
