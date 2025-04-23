defmodule Twix.Users.Follow do
  alias Twix.Repo
  alias Twix.Users.Follower
  alias Twix.Users.User

  @spec call(integer(), integer()) :: {:ok, Follower.t()} | {:error, :not_found}
  def call(user_id, follower_id) do
    with {:ok, _user} <- get_user(user_id),
         {:ok, _user_follower} <- get_user(follower_id) do
      create_follower(user_id, follower_id)
    end
  end

  defp get_user(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end

  defp create_follower(user_id, follower_id) do
    %{following_id: user_id, follower_id: follower_id}
    |> Follower.changeset()
    |> Repo.insert()
  end
end
