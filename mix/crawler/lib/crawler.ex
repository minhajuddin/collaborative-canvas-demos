defmodule Crawler do
  def run do
    {:ok, resp} = HTTPoison.get("http://icanhazip.com")
    IO.inspect resp
    IO.puts resp.body
  end
end
