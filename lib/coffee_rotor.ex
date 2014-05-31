defmodule CoffeeRotor do

  def coffee(files) do
    {ok, js} = :js_driver.new()
    {:ok, coffee_compiler} = File.read "vendor/coffee-script.js"
    :ok = :js.define(js, coffee_compiler)

    files = Enum.map files, fn(file)->
      {:ok, contents} = :js.call(js, "CoffeeScript.compile", [file.contents])
      %{file | :contents => contents}
    end

    true = :js_driver.destroy(js)
    files
  end

end
