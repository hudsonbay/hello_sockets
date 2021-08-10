defmodule HelloSocketsWeb.PingChannel do
  @moduledoc """
  Channel that allows any connection to succeed by not implementing any
  join logic. This is acceptable for topics that we want to be fully public. It is not
  acceptable to have an empty join function if we wanted our Channel to be
  private and only accessible to certain types of clients. In this case, we need
  to use authentication.
  """
  use Phoenix.Channel

  def join(_topic, _payload, socket) do
    {:ok, socket}
  end

  @doc """
  Receives an event, payload, and the state of the current Socket.
  """
  def handle_in("ping", _payload, socket) do
    {:reply, {:ok, %{ping: "pong"}}, socket}
  end
end
