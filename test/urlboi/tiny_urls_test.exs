defmodule Urlboi.TinyUrlsTest do
  use Urlboi.DataCase

  alias Urlboi.TinyUrls

  describe "tiny_urls" do
    alias Urlboi.TinyUrls.TinyUrl

    @valid_attrs %{tinypath: "some tinypath", url: "some url"}
    @update_attrs %{tinypath: "some updated tinypath", url: "some updated url"}
    @invalid_attrs %{tinypath: nil, url: nil}

    def tiny_url_fixture(attrs \\ %{}) do
      {:ok, tiny_url} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TinyUrls.create_tiny_url()

      tiny_url
    end

    test "list_tiny_urls/0 returns all tiny_urls" do
      tiny_url = tiny_url_fixture()
      assert TinyUrls.list_tiny_urls() == [tiny_url]
    end

    test "get_tiny_url!/1 returns the tiny_url with given id" do
      tiny_url = tiny_url_fixture()
      assert TinyUrls.get_tiny_url!(tiny_url.id) == tiny_url
    end

    test "create_tiny_url/1 with valid data creates a tiny_url" do
      assert {:ok, %TinyUrl{} = tiny_url} = TinyUrls.create_tiny_url(@valid_attrs)
      assert tiny_url.tinypath == "some tinypath"
      assert tiny_url.url == "some url"
    end

    test "create_tiny_url/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TinyUrls.create_tiny_url(@invalid_attrs)
    end

    test "update_tiny_url/2 with valid data updates the tiny_url" do
      tiny_url = tiny_url_fixture()
      assert {:ok, %TinyUrl{} = tiny_url} = TinyUrls.update_tiny_url(tiny_url, @update_attrs)
      assert tiny_url.tinypath == "some updated tinypath"
      assert tiny_url.url == "some updated url"
    end

    test "update_tiny_url/2 with invalid data returns error changeset" do
      tiny_url = tiny_url_fixture()
      assert {:error, %Ecto.Changeset{}} = TinyUrls.update_tiny_url(tiny_url, @invalid_attrs)
      assert tiny_url == TinyUrls.get_tiny_url!(tiny_url.id)
    end

    test "delete_tiny_url/1 deletes the tiny_url" do
      tiny_url = tiny_url_fixture()
      assert {:ok, %TinyUrl{}} = TinyUrls.delete_tiny_url(tiny_url)
      assert_raise Ecto.NoResultsError, fn -> TinyUrls.get_tiny_url!(tiny_url.id) end
    end

    test "change_tiny_url/1 returns a tiny_url changeset" do
      tiny_url = tiny_url_fixture()
      assert %Ecto.Changeset{} = TinyUrls.change_tiny_url(tiny_url)
    end
  end
end
