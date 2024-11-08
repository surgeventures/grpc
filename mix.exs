defmodule GRPC.Mixfile do
  use Mix.Project

  def project do
    [
      app: :grpc,
      version: "0.6.6",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env()),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: "The Elixir implementation of gRPC",
      docs: [
        extras: ["README.md"],
        main: "readme",
        source_ref: "v0.6.0",
        source_url: "https://github.com/surgeventures/grpc"
      ],
      dialyzer: [
        plt_add_apps: [:mix, :iex]
      ],
      xref: [exclude: [IEx]]
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:protobuf, ">= 0.5.0 and < 0.10.0"},
      {:cowboy, "~> 2.7"},
      {:gun, "~> 2.0"},
      {:ex_doc, "~> 0.23", only: :dev},
      {:inch_ex, "~> 2.0", only: [:dev, :test]},
      {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false},
      {:junit_formatter, "~> 3.1", only: [:test]},
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false}
    ]
  end

  defp package do
    %{
      name: :grpc_fresha,
      licenses: ["Apache 2"],
      links: %{"GitHub" => "https://github.com/surgeventures/grpc"},
      files: ~w(mix.exs README.md lib src config LICENSE .formatter.exs)
    }
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]
end
