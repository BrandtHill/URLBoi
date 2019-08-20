defmodule Urlboi.ShortUrls do
  @moduledoc """
  The ShortUrls context.
  """

  import Ecto.Query, warn: false
  alias Urlboi.Repo

  alias Urlboi.ShortUrls.ShortUrl

  def list_short_urls, do: Repo.all(ShortUrl)

  def get_short_url!(id), do: Repo.get_by!(ShortUrl, shortpath: id)

  def create_short_url(attrs \\ %{}) do
    %ShortUrl{}
    |> ShortUrl.changeset(attrs)
    |> Repo.insert()
  end

  def update_short_url(%ShortUrl{} = short_url, attrs) do
    short_url
    |> ShortUrl.changeset(attrs)
    |> Repo.update()
  end

  def delete_short_url(%ShortUrl{} = short_url), do: Repo.delete(short_url)

  def change_short_url(%ShortUrl{} = short_url), do: ShortUrl.changeset(short_url, %{})

  def increment_visits(%ShortUrl{} = short_url) do
    from(s in ShortUrl, where: s.id == ^short_url.id, update: [inc: [visits: 1]])
    |> Repo.update_all([])
  end

end
