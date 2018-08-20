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

  ## `do` Examples

      iex> DoBlock.dumpMacro :doit, do: 1
      [did: 1]
      iex> DoBlock.dumpMacro :dont, do: 1
      [didnot: "1"]
      iex> DoBlock.dumpMacro :doit, do: DoBlock.hello()
      [did: :world]
      iex> DoBlock.dumpMacro :dont, do: DoBlock.hello()
      [didnot: "{{:., [line: 51], [{:__aliases__, [line: 51], [:DoBlock]}, :hello]}, [line: 51], []}"]
      iex> DoBlock.dumpMacro :doit do
      ...>   DoBlock.hello()
      ...> end
      [did: :world]
      iex> DoBlock.dumpMacro :dont do
      ...>   DoBlock.hello()
      ...> end
      [didnot: "{{:., [line: 52], [{:__aliases__, [line: 52], [:DoBlock]}, :hello]}, [line: 52], []}"]

  """
  defmacro dumpMacro(:doit, do: bloco) do
    quote do
      [did: unquote bloco]
    end
  end

  defmacro dumpMacro(:dont, do: bloco) do
    quote do
      [didnot: unquote(inspect(bloco))]
    end
  end

  def hello do
    :world
  end

end
