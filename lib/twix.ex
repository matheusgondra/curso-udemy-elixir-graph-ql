defmodule Twix do
  alias Twix.Posts
  alias Twix.Posts.Post
  alias Twix.Users
  alias Twix.Users.Follower
  alias Twix.Users.Follow
  alias Twix.Users.User

  @spec create_post(map()) :: {:ok, Post.t()} | {:error, Ecto.Changeset.t()}
  defdelegate create_post(params), to: Posts.Create, as: :call

  @spec add_likes_to_post(integer()) :: {:ok, Post.t()} | {:error, :not_found}
  defdelegate add_likes_to_post(id), to: Posts.AddLike, as: :call

  @doc """
  Creates a new user in the database.

  ## Parameters

    - `nickname`: The nickname of the user.
    - `email`: The email of the user.
    - `age`: The age of the user.

  ## Example

      iex> params = %{"nickname" => "john", "email" => "john@mail.com", "age" => 20}
      iex> Twix.create_user(params)
      {:ok, %Twix.Users.User{
        __meta__: #Ecto.Schema.Metadata<:loaded, "users">,
        id: 1,
        nickname: "john",
        email: "john@mail.com",
        age: 20,
        posts: #Ecto.Association.NotLoaded<association :posts is not loaded>,
        created_at: ~N[2025-04-23 17:01:38],
        updated_at: ~N[2025-04-23 17:01:38]
      }}
  """
  @spec create_user(map()) :: {:ok, User.t()} | {:error, Ecto.Changeset.t()}
  defdelegate create_user(params), to: Users.Create, as: :call

  @spec get_user(integer()) :: {:ok, User.t()} | {:error, :not_found}
  defdelegate get_user(id), to: Users.Get, as: :call

  @spec update_user(map()) :: {:ok, User.t()} | {:error, :not_found}
  defdelegate update_user(params), to: Users.Update, as: :call

  @spec add_follower(integer(), integer()) :: {:ok, Follower.t()} | {:error, :not_found}
  defdelegate add_follower(user_id, follower_id), to: Follow, as: :call
end
