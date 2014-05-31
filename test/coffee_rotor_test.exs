defmodule CoffeeRotorTest do
  use ExUnit.Case

  import Rotor.Actions
  import CoffeeRotor

  test "should watch for changes and compile to javascript" do
    output_path = "test/samples/output.js"
    if File.exists?(output_path) do
      File.rm output_path
    end

    Rotor.add_group :coffeescripts, ["test/samples/*.coffee"], fn(files)->
      read_files(files)
      |> coffee
      |> concat
      |> output_to(output_path)
    end

    {:ok, contents} = File.read output_path
    assert Regex.match?(~r/foo/, contents) && Regex.match?(~r/bar/, contents) && Regex.match?(~r/function/, contents)

    Rotor.remove_group(:coffeescripts)
  end
end
