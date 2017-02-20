File.exists?(".token") && !System.get_env("TOKEN") &&
  System.put_env("TOKEN", File.read!(".token") |> String.trim)

ExUnit.start
