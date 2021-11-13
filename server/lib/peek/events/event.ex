defmodule Peek.Events.Event do
  @moduledoc """
  Auto-generated.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "peek_events" do
    field :title, :string
    field :start, :naive_datetime
    field :duration, :integer

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    required_files = [:title, :start, :duration]

    event
    |> cast(attrs, required_files)
    |> validate_required(required_files)
  end
end
