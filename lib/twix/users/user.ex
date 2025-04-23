defmodule Twix.Users.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Twix.Posts.Post

  @required_params ~w(nickname email age)a

  @type t :: %__MODULE__{
          id: integer(),
          nickname: String.t(),
          email: String.t(),
          age: integer(),
          posts: list(Post.t()),
          created_at: NaiveDateTime.t(),
          updated_at: NaiveDateTime.t()
        }

  schema "users" do
    field :nickname
    field :email
    field :age, :integer

    has_many :posts, Post

    timestamps(inserted_at: :created_at)
  end

  def changeset(user \\ %__MODULE__{}, params) do
    user
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:nickname, min: 1)
    |> validate_number(:age, greater_than_or_equal_to: 18)
    |> unique_constraint(:nickname)
    |> unique_constraint(:email)
  end
end
