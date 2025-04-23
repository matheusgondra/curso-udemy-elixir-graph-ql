defmodule Twix.Posts.Post do
  use Ecto.Schema

  import Ecto.Changeset

  alias Twix.Users.User

  @required_params ~w(text user_id)a

  @type t :: %__MODULE__{
          id: integer(),
          text: String.t(),
          likes: integer(),
          user: User.t(),
          user_id: integer(),
          created_at: NaiveDateTime.t(),
          updated_at: NaiveDateTime.t()
        }

  schema "posts" do
    field :text, :string
    field :likes, :integer, default: 0

    belongs_to :user, User

    timestamps(inserted_at: :created_at)
  end

  def changeset(post \\ %__MODULE__{}, params) do
    post
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:text, min: 1, max: 300)
    |> foreign_key_constraint(:user_id)
    |> unique_constraint(:user_id)
  end
end
