defmodule Twix.Users.Follower do
  use Ecto.Schema

  import Ecto.Changeset

  alias Twix.Users.User

  @primary_key false
  @required_params ~w(follower_id following_id)a

  @type t() :: %__MODULE__{
          follower_id: integer(),
          following_id: integer()
        }

  schema "followers" do
    belongs_to :follower, User
    belongs_to :following, User
  end

  @spec changeset(map()) :: Ecto.Changeset.t()
  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> unique_constraint(@required_params)
  end
end
