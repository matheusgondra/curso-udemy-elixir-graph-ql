defmodule Twix.Users.Get do
  alias Twix.Repo
  alias Twix.Users.User

  @spec call(integer()) :: {:ok, User.t()} | {:error, :not_found}
  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> {:ok, Repo.preload(user, :posts)}
    end
  end
end
