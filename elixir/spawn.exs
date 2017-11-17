start = DateTime.utc_now

IO.puts "start"

1..10
|> Enum.map(fn _id ->
  spawn(fn ->
    :timer.sleep(:timer.seconds(1))
    IO.puts DateTime.diff(start,  DateTime.utc_now, :seconds)
  end)
end)

IO.puts "end"

:timer.sleep(:timer.seconds(2))

