defmodule UrlboiWeb.RedirectController do
  use UrlboiWeb, :controller
  
  alias Urlboi.ShortUrls

  def index(conn, %{"shortpath" => shortpath}) do
    short_url = ShortUrls.get_short_url!(shortpath)
    redirect(conn, external: short_url.url)
    ShortUrls.increment_visits(short_url)
  end
end