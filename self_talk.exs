send self(), {:hell, "world"}

receive do
  {:hello, msg} -> msg
  {_, msg} -> {:other, msg}
end |> inspect |> IO.puts
