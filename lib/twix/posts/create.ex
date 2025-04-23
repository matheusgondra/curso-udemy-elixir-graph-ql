defmodule Twix.Posts.Create do
  alias Twix.Repo
  alias Twix.Posts.Post

  @spec call(map()) :: {:ok, Post.t()} | {:error, Ecto.Changeset.t()}
  def call(params) do
    params
    |> Post.changeset()
    |> Repo.insert()
  end
end
