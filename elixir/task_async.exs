start = DateTime.utc_now

1..10
|> Task.async_stream(fn _id ->
  :timer.sleep(:timer.seconds(1))
  DateTime.diff(start,  DateTime.utc_now, :seconds)
end, max_concurrency: 10)
|> Enum.map(fn {:ok, result} ->
  result
end)
|> IO.inspect()
