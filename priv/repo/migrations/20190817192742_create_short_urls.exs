defmodule Urlboi.Repo.Migrations.CreateShortUrls do
  use Ecto.Migration

  def change do
    create table(:short_urls) do
      add :url, :string
      add :shortpath, :string
      add :visits, :integer, default: 0

      timestamps()
    end

    create unique_index(:short_urls, [:shortpath])
  end
end
