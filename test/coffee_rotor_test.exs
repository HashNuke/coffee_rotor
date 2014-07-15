defmodule CoffeeRotorTest do
  use ExUnit.Case

  import Rotor.BasicRotors
  import CoffeeRotor

  test "should watch for changes and compile to javascript" do
    output_path = "test/samples/output.js"
    if File.exists?(output_path) do
      File.rm output_path
    end

    Rotor.watch :coffeescripts, ["test/samples/*.coffee"], fn(_changed_files, all_files) ->
      read_files(all_files)
      |> coffee
      |> concat
      |> output_to(output_path)
    end
    Rotor.run(:coffeescripts)
    Rotor.stop_watching(:coffeescripts)

    {:ok, contents} = File.read output_path
    assert Regex.match?(~r/foo/, contents) && Regex.match?(~r/bar/, contents) && Regex.match?(~r/function/, contents)

  end
end
