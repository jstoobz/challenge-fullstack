defmodule PeekWeb.Resolvers.BookingResolver do
  alias Peek.Bookings
  alias Peek.Schema.ChangesetErrors

  def bookings(_, _, _) do
    {:ok, Bookings.list_bookings()}
  end

  def get_bookings(_, %{id: id}, _) do
    Bookings.get_bookings(id)
  end

  def create_booking(_, %{event_id: event_id, first_name: first_name, last_name: last_name}, _) do
    case Bookings.create_booking(event_id, %{
           first_name: first_name,
           last_name: last_name
         }) do
      {:ok, booking} ->
        {:ok, booking}

      {:error, "event not found"} ->
        {:error, "event not found"}

      {:error, changeset} ->
        {:error,
         message: "Could not create booking", details: ChangesetErrors.error_details(changeset)}
    end
  end
end
