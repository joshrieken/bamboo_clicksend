defmodule BambooClicksend.Mixfile do
  use Mix.Project

  @project_url "https://github.com/midas/bamboo_clicksend"
  @version     "0.2.0"

  def project do
    [
      app: :bamboo_clicksend,
      version: @version,
      source_url: @project_url,
      homepage_url: @project_url,
      elixir: "~> 1.5",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env == :prod,
      description: description(),
      docs: [
        main: "readme",
        extras: ["README.md"]
      ],
      package: package(),
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [
        :logger
      ]
    ]
  end

  defp description do
    """
    A ClickSend adapter for the Bamboo email app.
    """
  end

  defp package do
    [
      name: :bamboo_clicksend,
      files: [
        "config",
        "lib",
        "test",
        "mix.exs",
        "README*",
        "LICENSE*"
      ],
      maintainers: ["C. Jason Harrelson"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => @project_url,
        "Docs" => "https://hexdocs.pm/bamboo_clicksend/#{@version}"
      }
    ]
  end

  defp deps do
    [
      {:bamboo, "~> 1.0"},
      # {:click_send, "~> 0.1"},
      {:click_send, git: "https://github.com/joshrieken/click_send.git"},

      {:ex_doc, ">= 0.0.0", only: :dev},
    ]
  end

end
