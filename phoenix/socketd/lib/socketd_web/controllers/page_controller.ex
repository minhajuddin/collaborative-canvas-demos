defmodule SocketdWeb.PageController do
  use SocketdWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  #def stats(conn, _params) do
    #render conn, "stats.html"
  #end
end
