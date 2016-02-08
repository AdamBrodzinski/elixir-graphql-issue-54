defmodule Graphissue.PageController do
  use Graphissue.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
