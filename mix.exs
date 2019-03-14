defmodule Excrypt.MixProject do
  use Mix.Project

  def project do
    [
      app: :excrypt,
      version: "0.1.0",
      elixir: "~> 1.7",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "Excrypt",
      source_url: "https://github.com/flatiron-labs/excrypt"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.14", only: :dev, runtime: false}
    ]
  end

  defp description() do
    "An encryption/decryption engine."
  end

  defp package do
    %{
      licenses: ["MIT License"],
      links: %{"Github" => "https://github.com/flatiron-labs/excrypt"}
    }
  end
end
