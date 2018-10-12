defmodule Gs.Mixfile do
  use Mix.Project

  def project do
    [app: :gs,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     package: package(),
     description: description(),
     deps: deps(),
     docs: docs(),
     source_url: "https://github.com/cleverbunny/gs"
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:goth]]
  end

  defp package() do
    [
      maintainers: ["Tetiana12345678", "ktec"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/cleverbunny/gs"}
    ]
  end

  defp description() do
    "Post a row of data to a google spreadsheet"
  end

  defp docs do
    [main: "GS",
     logo: "Bunny5.4.png"
    ]
  end

  defp deps do
    [
      {:earmark, "~> 1.2", only: :dev},
      {:ex_doc, "~> 0.14", only: :dev, runtime: false},
      {:poison, "~> 3.1"},
      {:httpoison, "~> 1.0"},
      {:goth, "~> 0.11.0"}
    ]
  end
end
