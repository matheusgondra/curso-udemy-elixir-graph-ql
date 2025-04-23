defmodule Twix do
  alias Twix.Posts
  alias Twix.Posts.Post
  alias Twix.Users
  alias Twix.Users.User

  @spec create_post(map()) :: {:ok, Post.t()} | {:error, Ecto.Changeset.t()}
  defdelegate create_post(params), to: Posts.Create, as: :call

  @spec add_likes_to_post(integer()) :: {:ok, Post.t()} | {:error, :not_found}
  defdelegate add_likes_to_post(id), to: Posts.AddLike, as: :call

  @spec create_user(map()) :: {:ok, User.t()} | {:error, Ecto.Changeset.t()}
  defdelegate create_user(params), to: Users.Create, as: :call

  @spec get_user(integer()) :: {:ok, User.t()} | {:error, :not_found}
  defdelegate get_user(id), to: Users.Get, as: :call

  @spec update_user(map()) :: {:ok, User.t()} | {:error, :not_found}
  defdelegate update_user(params), to: Users.Update, as: :call
end
