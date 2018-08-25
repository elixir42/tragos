parent = self()
IO.puts("parent: #{inspect(parent)}")
spawn fn -> send(parent, {:hello, self()}) end
receive do
  {:hello, pid} -> "Got hello from #{inspect pid}"
end |> inspect |> IO.puts
