defmodule LimeZincKitten do
  @moduledoc """
  Documentation for `LimeZincKitten`.
  """

  @doc """
  Benchmark nx.

  See https://github.com/elixir-nx/nx/blob/main/exla/bench/softmax.exs.

  ## Examples

      iex> LimeZincKitten.bench()
      :world

  """
  def bench do
    size = 1_000_000
    rand = for(_ <- 1..size, do: :rand.uniform())
    t64 = Nx.tensor(rand, type: {:f, 64})
    t32 = Nx.tensor(rand, type: {:f, 32})
    t64_torchx = Nx.tensor(rand, type: {:f, 64}, backend: Torchx.Backend)
    t32_torchx = Nx.tensor(rand, type: {:f, 32}, backend: Torchx.Backend)


    # We call |> Nx.add(1) to force the computation results to be loaded
    benches = %{
      "elixir f32" => fn -> Softmax.softmax(t32) |> Nx.add(1) end,
      "elixir f64" => fn -> Softmax.softmax(t64) |> Nx.add(1) end,
      "elixir f32 torchx" => fn -> Softmax.softmax(t32_torchx) |> Nx.add(1) end,
      "elixir f64 torchx" => fn -> Softmax.softmax(t64_torchx) |> Nx.add(1) end,
    }

    Benchee.run(
      benches,
      time: 10,
      memory_time: 2
    )
  end
end

defmodule Softmax do
  import Nx.Defn
  defn softmax(n), do: Nx.exp(n) / Nx.sum(Nx.exp(n))
end
