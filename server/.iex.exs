global_settings = "~/.iex.exs"
if File.exists?(global_settings), do: Code.require_file(global_settings)

Application.put_env(:elixir, :ansi_enabled, true)

IEx.configure(
  colors: [
    eval_result: [:cyan, :bright],
    eval_error: [[:red, :bright, "\nbrrp\n"]],
    eval_info: [:yellow, :bright]
  ],
  default_prompt:
    [
      # cursor => column 1
      "\e[G",
      :blue,
      "%prefix",
      :yellow,
      "|",
      :blue,
      "%counter",
      " ",
      :yellow,
      "brrp",
      :magenta,
      " >",
      :reset
    ]
    |> IO.ANSI.format()
    |> IO.chardata_to_string()
)

IO.puts(
  [:blue, "\nbrrp from ", :magenta, "~/.iex.exs ", :cyan, "& ", :blue, "jstoobz\n"]
  |> IO.ANSI.format()
  |> IO.chardata_to_string()
)

alias Peek.{Events, Bookings}
alias Peek.Repo

import Ecto.Query

{_, ndt} = NaiveDateTime.new(2021, 11, 10, 10, 0, 0)

# Events.list_events
# Events.create_event(%{duration: 60, start: ndt, title: "Boat Tour"})
# Events.get_event(42)

# Bookings.create_booking(42, %{first_name: "James", last_name: "Stephens"})
# Bookings.create_booking(42, %{first_name: "Jaja", last_name: "Binks"})
# Bookings.create_booking(42, %{first_name: "John", last_name: "Doe"})
# Bookings.get_bookings(42)
