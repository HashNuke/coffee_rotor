# CoffeeRotor

This is a [Rotor](https://github.com/HashNuke/rotor) to compile CoffeeScript files.


### Usage


The `CoffeeRotor` module provides the `coffee` rotor. And this is how you call it

```elixir
CoffeeRotor.coffee(files)
```

### Example config using the coffee rotor

```elixir
# This goes in the place you are configuring Rotor

import Rotor.BasicRotors
import CoffeeRotor

output_path = "priv/static/assets/app.js"
Rotor.watch :coffeescripts, ["priv/assets/javascripts/*.coffee"], fn(_changed_files, all_files)->
  read_files(all_files)
  |> coffee
  |> concat
  |> output_to(output_path)
end
```
