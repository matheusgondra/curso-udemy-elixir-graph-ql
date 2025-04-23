defmodule Twix.Users.Update do
  alias Twix.Repo
  alias Twix.Users.User

  @spec call(map()) :: {:ok, User.t()} | {:error, :not_found}
  def call(%{id: id} = params) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> update(user, params)
    end
  end

  @spec update(User.t(), map()) :: {:ok, User.t()}
  defp update(user, params) do
    user
    |> User.changeset(params)
    |> Repo.update()
  end
end
