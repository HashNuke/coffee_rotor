defmodule CoffeeRotor.Mixfile do
  use Mix.Project

  def project do
    [app: :coffee_rotor,
     version: "0.1.1",
     elixir: "~> 0.13.3",
     description: description,
     package: package,
     deps: deps]
  end


  def application do
    [
      applications: [:rotor, :erlang_js],
      mod: []
    ]
  end


  defp description do
    """
    A [rotor](https://github.com/HashNuke/rotor) to compile CoffeeScript files
    """
  end


  defp package do
    [
      contributors: ["Akash Manohar J"],
      links: %{ "GitHub" => "https://github.com/HashNuke/coffee_rotor" }
    ]
  end


  defp deps do
    [
      {:rotor, "~> 0.1.5"},
      {:erlang_js, github: "basho/erlang_js", tag: "1.3.0"}
    ]
  end
end
