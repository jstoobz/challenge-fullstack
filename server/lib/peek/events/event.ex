defmodule Peek.Events.Event do
  @moduledoc """
  Auto-generated.
  """
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields ~w(title start duration)a

  schema "peek_events" do
    field :title, :string
    field :start, :naive_datetime
    field :duration, :integer

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
