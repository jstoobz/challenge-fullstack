defmodule Peek.Bookings.Booking do
  @moduledoc """
  Auto-generated.
  """
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields ~w(first_name last_name event_id)a

  schema "bookings" do
    field :first_name, :string
    field :last_name, :string
    field :event_id, :id

    timestamps()
  end

  @doc false
  def changeset(booking, attrs) do
    booking
    |> cast(attrs, @required_fields)
    |> foreign_key_constraint(:event_id, name: :bookings_event_id_fkey)
    |> validate_required(@required_fields)
  end
end
