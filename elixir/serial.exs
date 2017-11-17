start = DateTime.utc_now
[1, 2, 3]
|> Enum.map(fn _id ->
  :timer.sleep(:timer.seconds(1))
  DateTime.diff(start,  DateTime.utc_now, :seconds)
end)
|> IO.inspect(label: "SEQ")

