defmodule DiscUnion.Mixfile do
  use Mix.Project

  def project do
    [
      app: :disc_union,
      version: "0.2.0",
      elixir: "~> 1.2",
      description: "Discriminated unions for Elixir - for building algebraic data types",
      package: package,
      compilers: compilers,
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: ["coveralls": :test, "coveralls.html": :test, "coveralls.detail": :test, "coveralls.post": :test],
      consolidate_protocols: Mix.env != :test,
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps,
      elixirc_paths: elixirc_paths(Mix.env),\
      docs: docs
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:excoveralls, "~> 0.4", only: [:dev, :test]},
      {:dialyxir, "~> 0.3.3", only: [:dev]},
      {:ex_doc, "~> 0.11", only: [:dev]},
      {:earmark, "~> 0.1", only: [:dev]},
    ]
  end

  defp compilers do
    compilers(Mix.env)
  end
  defp compilers(_), do: Mix.compilers

  defp package do
    [ maintainers: ["X4lldux"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/X4lldux/disc_union"} ]
  end

  defp elixirc_paths(:test), do: ["lib", "test"]
  defp elixirc_paths(_), do: ["lib"]

  defp docs do
    [extras: ["README.md": [title: "README"]]]
  end
end
