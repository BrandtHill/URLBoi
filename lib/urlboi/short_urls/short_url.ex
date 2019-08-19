defmodule Urlboi.ShortUrls.ShortUrl do
  use Ecto.Schema
  import Ecto.Changeset

  schema "short_urls" do
    field :shortpath, :string
    field :url, :string
    field :visits, :integer, default: 0

    timestamps()
  end

  @doc false
  def changeset(short_url, attrs) do
    short_url
    |> cast(attrs, [:url, :shortpath, :visits])
    |> validate_required([:url, :shortpath])
    |> validate_format(:shortpath, ~r|^[0-9a-zA-Z_]*$|)
    |> validate_length(:shortpath, min: 3, max: 255, count: :bytes)
    |> unique_constraint(:shortpath)
  end
end
