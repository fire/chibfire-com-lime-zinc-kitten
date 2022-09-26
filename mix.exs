defmodule LimeZincKitten.MixProject do
  use Mix.Project

  def project do
    [
      app: :lime_zinc_kitten,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:nx, "~> 0.3.0"},
      {:torchx, "~> 0.3.0"},
      {:benchee, "~> 1.1"},
    ]
  end
end
