pid = spawn(fn ->

  receive do
    {:add, op1, op2} ->
      IO.puts("Sum of #{op1} and #{op2} is #{op1 + op2}")
    {:sub, op1, op2} ->
      IO.puts("Subtraction of #{op1} and #{op2} is #{op1 - op2}")
    oops ->
      IO.puts("Unknown message #{inspect oops}")
  end

end)

send(pid, "foobar")

:timer.sleep(:timer.seconds(1))
