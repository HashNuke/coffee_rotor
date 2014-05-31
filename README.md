# CoffeeRotor

[Rotor](https://github.com/HashNuke/rotor) action to compile CoffeeScript files.


### Usage


The `CoffeeRotor` module provides the `coffee` rotor. And this is how you call it

```
CoffeeRotor.coffee(files)
```

### Example Rotor config using the coffee rotor

```
# This goes in the place you are configuring Rotor

import Rotor.BasicRotors
import CoffeeRotor

output_path = "priv/static/assets/app.js"
Rotor.add_group :coffeescripts, ["priv/assets/javascripts/*.coffee"], fn(files)->
  read_files(files)
  |> coffee
  |> concat
  |> output_to(output_path)
end
```
