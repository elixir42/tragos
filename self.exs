me = inspect(self())
IO.puts("main: #{me}")
spawn fn ->
  me = inspect(self())
  IO.puts("\tsub: #{me}")
end
