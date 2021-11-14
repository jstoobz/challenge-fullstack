defmodule Peek.Bookings do
  @moduledoc false

  import Ecto.Query, warn: false
  alias Peek.Repo

  alias Peek.Bookings.Booking
  alias Peek.Events

  def list_bookings do
    Repo.all(Booking)
  end

  def get_bookings(event_id) do
    query =
      Booking
      |> where(event_id: ^event_id)

    {:ok, Repo.all(query)}
  end

  def create_booking(event_id, attrs \\ %{}) do
    event = Events.get_event(event_id)

    case event do
      nil ->
        {:error, "event not found"}

      _ ->
        attrs = Map.put(attrs, :event_id, event.id)

        %Booking{}
        |> Booking.changeset(attrs)
        |> Repo.insert()
    end
  end
end
