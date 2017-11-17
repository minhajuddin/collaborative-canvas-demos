defmodule SocketdWeb.InfoChannel do
  use SocketdWeb, :channel

  def join("info:" <> _subtopic, payload, socket) do
    send(self(), :emit_stats)
    {:ok, socket}
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("ping", payload, socket) do
    payload |> IO.inspect(label: "IN")
    push(socket, "pong", %{})
    {:reply, {:ok, payload}, socket}
  end

  def handle_info(:emit_stats, socket) do
    broadcast socket, "stats", stats()
    Process.send_after(self(), :emit_stats, 100)
    {:noreply, socket}
  end

  defp stats() do
    %{
      proc_count: length(Process.list)
    }
  end

end
