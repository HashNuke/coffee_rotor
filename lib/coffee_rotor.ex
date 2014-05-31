defmodule CoffeeRotor do
  use Application

  # See http://elixir-lang.org/docs/stable/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Define workers and child supervisors to be supervised
      # worker(CoffeeRotor.Worker, [arg1, arg2, arg3])
    ]

    # See http://elixir-lang.org/docs/stable/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CoffeeRotor.Supervisor]
    Supervisor.start_link(children, opts)
  end


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
