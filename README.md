# Latte (work in progress)

Coffeescript compiler for Elixir Right now everything is a TODO.

But for now you can compile coffeescript like this:

    Latte.compile(your_coffeescript_code)

When you pass the coffeescript code as a string (erlang binary), it'll return you javascript. That easy :)

## Setup

Add this Elixir package to your `mix.exs`.

## TODO

* Support for Sprocket directives
* Support for sass
* Dynamo and Weber support
