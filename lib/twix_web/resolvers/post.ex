defmodule TwixWeb.Resolvers.Post do
  def create(%{input: params}, _context), do: Twix.create_post(params)

  def add_like(%{id: id}, _context), do: Twix.add_likes_to_post(id)
end
