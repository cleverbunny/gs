# Gs

**TODO: Add description**

## Installation

1. Generate Google API key. (.json file)
2. Add package to your dependencies
3. Add .json file into a config/ folder within your project
4. Add to config/config.exs:
```
config :goth,
  json: "config/gs_config.json" |> Path.expand |> File.read!
```
5. Add permissions to the google spreadsheet you want to post. Settings -> add collaborator with edit permissions -> paste email address from .json file "client_email" 
6. Usage:
```
row = %Gs.Row{spreadsheet_id: val, range: val, values: []}
Gs.append(row)
Gs.append(values)
```


If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `gs` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:gs, "~> 0.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/gs](https://hexdocs.pm/gs).
