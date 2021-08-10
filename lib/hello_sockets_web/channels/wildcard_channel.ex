defmodule HelloSocketsWeb.WildCardChannel do
  @moduledoc """
  Channel that looks very similar to our PingChannel but it has
  a conditional in the join/3 function which checks if the provided numbers are
  correct.
  """
  use Phoenix.Channel

  def join("wild:" <> numbers, _payload, socket) do
    if numbers_correct?(numbers) do
      {:ok, socket}
    else
      {:error, %{}}
    end
  end



  def handle_in("ping", _payload, socket) do
    {:reply, {:ok, %{ping: "pong"}}, socket}
  end

  defp numbers_correct?(numbers) do
    numbers
    |> String.split(":")
    |> Enum.map(&String.to_integer/1)
    |> case do
      [a, b] when b == a * 2 ->
        true

      _ ->
        false
    end
  end
end
