defmodule UrlboiWeb.PageController do
  use UrlboiWeb, :controller
  
  alias Urlboi.ShortUrls
  alias Urlboi.ShortUrls.ShortUrl
  
  def index(conn, _params) do
    changeset = ShortUrls.change_short_url(%ShortUrl{})
    render(conn, "index.html", changeset: changeset)
  end

  def create(conn, %{"short_url" => short_url_params}) do
    with {:ok, %ShortUrl{} = short_url} <- ShortUrls.create_short_url(short_url_params) do
      conn
      |> put_status(:created)
      |> put_flash(:info, "Short URL created by URLBoi at #{short_url.shortpath}")
      |> put_resp_header("location", Routes.short_url_path(conn, :show, short_url))
      |> render("index.html", changeset: ShortUrls.change_short_url(%ShortUrl{}))
    end
  end
end
