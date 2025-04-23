defmodule Twix.Posts.AddLike do
  alias Ecto.Changeset
  alias Twix.Posts.Post
  alias Twix.Repo

  @spec call(integer()) :: {:ok, Post.t()} | {:error, :not_found}
  def call(id) do
    case Repo.get(Post, id) do
      nil -> {:error, :not_found}
      post -> add_like(post)
    end
  end

  @spec add_like(Post.t()) :: {:ok, Post.t()}
  defp add_like(%Post{likes: likes} = post) do
    post
    |> Changeset.change(likes: likes + 1)
    |> Repo.update()
  end
end
