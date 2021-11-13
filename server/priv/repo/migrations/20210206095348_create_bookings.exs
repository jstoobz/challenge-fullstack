defmodule Calevents.Repo.Migrations.CreateBookings do
  use Ecto.Migration

  def change do
    create table(:bookings) do
      add :first_name, :string
      add :last_name, :string
      add :event_id, references(:peek_events, on_delete: :nothing)

      timestamps()
    end

    create index(:bookings, [:event_id])
  end
end
