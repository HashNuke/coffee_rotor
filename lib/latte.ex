defmodule Latte do
  use Application.Behaviour

  # See http://elixir-lang.org/docs/stable/Application.Behaviour.html
  # for more information on OTP Applications
  def start(_type, _args) do
    Latte.Supervisor.start_link
  end


  def compile(coffee_str) do
    {ok, js} = :js_driver.new()
    {:ok, coffee} = File.read "lib/latte/coffee-script.js"
    :ok = :js.define(js, coffee)
    javascript = :js.call(js, "CoffeeScript.compile", [coffee_str])
    true = :js_driver.destroy(js)
    javascript
  end
end
