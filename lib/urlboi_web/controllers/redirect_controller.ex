defmodule UrlboiWeb.RedirectController do
  use UrlboiWeb, :controller
  import Urlboi.ShortUrls

  action_fallback UrlboiWeb.FallbackController

  def index(conn, %{"shortpath" => shortpath}) do
    redirect(conn, external: get_short_url!(shortpath).url)
  end
end