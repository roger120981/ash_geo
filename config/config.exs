import Config

config :ash, :use_all_identities_in_manage_relationship?, false

if Mix.env() == :dev do
  config :git_ops,
    mix_project: Mix.Project.get!(),
    changelog_file: "CHANGELOG.md",
    repository_url: "https://github.com/bcksl/ash_geo",
    manage_mix_version?: true,
    manage_readme_version: ["README.md"],
    version_tag_prefix: "v"
end

if Mix.env() == :test do
  config :logger, level: :warning

  config :geo_postgis, json_library: Jason

  config :ash_geo, AshGeo.Test.Repo,
    username: "postgres",
    database: "ash_geo_test",
    hostname: "localhost",
    # sobelow_skip ["Config.Secrets"]
    password: "postgres",
    pool: Ecto.Adapters.SQL.Sandbox

  config :ash_geo,
    ecto_repos: [AshGeo.Test.Repo],
    ash_domains: [AshGeo.Test.Domain]

  config :ash_geo, AshGeo.Test.Repo, migration_primary_key: [name: :id, type: :binary_id]

  config :ash_geo, ash_domains: [AshGeo.Test.Domain]

  # Ash: type shorthands
  config :ash, :custom_types,
    geometry: AshGeo.Geometry,
    geo_json: AshGeo.GeoJson,
    geo_wkt: AshGeo.GeoWkt,
    geo_wkb: AshGeo.GeoWkb,
    geo_any: AshGeo.GeoAny,
    point26918: AshGeo.GeoAny
end
