defmodule UrlboiWeb.ShortUrlView do
  use UrlboiWeb, :view
  alias UrlboiWeb.ShortUrlView

  def render("index.json", %{short_urls: short_urls}) do
    render_many(short_urls, ShortUrlView, "short_url.json")
  end

  def render("show.json", %{short_url: short_url}) do
    render_one(short_url, ShortUrlView, "short_url.json")
  end

  def render("short_url.json", %{short_url: short_url}) do
    %{
      id: short_url.id,
      url: short_url.url,
      shortpath: short_url.shortpath,
      visits: short_url.visits
    }
  end
end
