defmodule UrlboiWeb.ShortUrlController do
  use UrlboiWeb, :controller

  alias Urlboi.ShortUrls
  alias Urlboi.ShortUrls.ShortUrl

  action_fallback UrlboiWeb.FallbackController

  def index(conn, _params) do
    short_urls = ShortUrls.list_short_urls()
    render(conn, "index.json", short_urls: short_urls)
  end

  def new(conn, %{"short_url" => short_url_params}) do
    with {:ok, %ShortUrl{} = short_url} <- ShortUrls.create_short_url(short_url_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.short_url_path(conn, :show, short_url))
      |> current_path
    end
  end

  def create(conn, %{"short_url" => short_url_params}) do
    with {:ok, %ShortUrl{} = short_url} <- ShortUrls.create_short_url(short_url_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.short_url_path(conn, :show, short_url))
      |> render("show.json", short_url: short_url)
    end
  end

  def show(conn, %{"id" => id}) do
    short_url = ShortUrls.get_short_url!(id)
    render(conn, "show.json", short_url: short_url)
  end

  def update(conn, %{"id" => id, "short_url" => short_url_params}) do
    short_url = ShortUrls.get_short_url!(id)

    with {:ok, %ShortUrl{} = short_url} <- ShortUrls.update_short_url(short_url, short_url_params) do
      render(conn, "show.json", short_url: short_url)
    end
  end

  def delete(conn, %{"id" => id}) do
    short_url = ShortUrls.get_short_url!(id)

    with {:ok, %ShortUrl{}} <- ShortUrls.delete_short_url(short_url) do
      send_resp(conn, :no_content, "")
    end
  end
end
