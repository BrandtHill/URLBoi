defmodule UrlboiWeb.UrlpathChannel do
  use Phoenix.Channel

  alias Urlboi.ShortUrls

  def join("urlpath:" <> _user, _message, socket) do
    {:ok, socket}
  end

  def handle_in("test_query", %{"value" => short_path}, socket) do
    IO.puts("Handling message #{short_path}")
    short_url = ShortUrls.get_short_url(short_path)
    IO.inspect(short_url)
    if short_url do
      push(socket, "test_result", %{msg: "Short URL already taken", available: false})  
    else
      push(socket, "test_result", %{msg: "Short URL is not taken", available: true})
    end
    {:noreply, socket}
  end
end