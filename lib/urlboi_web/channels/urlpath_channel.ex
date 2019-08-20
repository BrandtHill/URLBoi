defmodule UrlboiWeb.UrlpathChannel do
  use Phoenix.Channel

  alias Urlboi.ShortUrls
  alias Urlboi.ShortUrls.ShortUrl

  def join("urlpath:" <> _user, _message, socket) do
    {:ok, socket}
  end

  def handle_in("test_query", %{"shortpath" => shortpath, "url" => url}, socket) do
    payload = cond do
      String.length(shortpath) < 3 ->
        %{msg: "URL too short", available: false}
      not Regex.match?(~r|^[0-9a-zA-Z_]*$|, shortpath) ->
        %{msg: "URL must be alphanumeric (underscores valid)", available: false}
      ShortUrls.get_short_url(shortpath) ->
        %{msg: "URL already taken", available: false}
      true ->
        %{msg: "URL is available", available: true}
    end
    
    push(socket, "test_result", payload)
    {:noreply, socket}
  end
end