defmodule CoffeeRotor.Mixfile do
  use Mix.Project

  def project do
    [app: :coffee_rotor,
     version: "0.1.0",
     elixir: "~> 0.13.3",
     description: description,
     package: package,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:rotor, :erlang_js],
     mod: {CoffeeRotor, []}]
  end


  defp description do
    """
    A [rotor](https://github.com/HashNuke/rotor) to compile CoffeeScript files
    """
  end


  defp package do
    [
      contributors: ["Akash Manohar J"],
      links: %{ "GitHub" => "https://github.com/HashNuke/coffee-rotor" }
    ]
  end


  # Dependencies can be hex.pm packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:rotor, "~> 0.1.5"},
      {:erlang_js, github: "basho/erlang_js", tag: "1.3.0"}
    ]
  end
end
