defmodule DoBlock do
  @moduledoc """
  Documentation for DoBlock.
  """

  @doc """
  Dump keyword arguments.

  ## Examples

      iex> DoBlock.dumpFn(:doit, [{:a, 1}])
      [a: 1]
      iex> DoBlock.dumpFn(:doit, [a: 1])
      [a: 1]
      iex> DoBlock.dumpFn :doit, [a: 1]
      [a: 1]
      iex> DoBlock.dumpFn :doit, a: 1
      [a: 1]
      iex> DoBlock.dumpFn :doit, do: DoBlock.hello()
      [do: :world]
      iex> DoBlock.dumpFn :doit, do: DoBlock.hello()
      [do: :world]
      iex> DoBlock.dumpFn :doit do DoBlock.hello() end
      [do: :world]
      iex> DoBlock.dumpFn :doit do
      ...>   DoBlock.hello()
      ...> end
      [do: :world]
      iex> DoBlock.dumpFn :doit do
      ...>   IO.puts("Hello")
      ...>   DoBlock.hello()
      ...> end
      [do: :world]
      iex> DoBlock.dumpFn :doit do
      ...>   IO.puts("Hello")
      ...>   DoBlock.hello()
      ...>   IO.puts("!")
      ...> end
      [do: :ok]

  """
  def dumpFn(:doit, arg) do
    arg
  end

  def dumpFn(:dont, arg) do
    inspect(arg)
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
      [didnot: "{{:., [line: 55], [{:__aliases__, [line: 55], [:DoBlock]}, :hello]}, [line: 55], []}"]
      iex> DoBlock.dumpMacro :doit do
      ...>   DoBlock.hello()
      ...> end
      [did: :world]
      iex> DoBlock.dumpMacro :dont do
      ...>   DoBlock.hello()
      ...> end
      [didnot: "{{:., [line: 56], [{:__aliases__, [line: 56], [:DoBlock]}, :hello]}, [line: 56], []}"]

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
