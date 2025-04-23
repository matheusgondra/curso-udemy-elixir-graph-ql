defmodule Twix.Users.Create do
  alias Twix.Repo
  alias Twix.Users.User

  @spec call(map()) :: {:ok, User.t()} | {:error, Ecto.Changeset.t()}
  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
