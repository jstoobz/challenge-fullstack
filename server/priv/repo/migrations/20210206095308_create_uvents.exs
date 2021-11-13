defmodule Calevents.Repo.Migrations.CreatePeekEvents do
  use Ecto.Migration

  def change do
    create table(:peek_events) do
      add :title, :string
      add :start, :naive_datetime
      add :duration, :integer

      timestamps()
    end
  end
end
