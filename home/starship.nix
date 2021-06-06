{
  enable = true;
  enableBashIntegration = false;

  # Docs at https://starship.rs/config/
  settings = {

    # Display the current Kubernetes context to prevent myself from
    # deploying shit to the wrong place.
    kubernetes = {
      disabled = false;
      symbol = "⎈ "; # K8s logo.
      style = "bold blue"; # Color for the k8s brand.
      context_aliases = {
        "docker-desktop" = "Docker.app";
      };
    };

    nix_shell = {
      symbol = "❄ ";
    };

    # Disable modules that only display the current version of some software.
    # Package versions should be pined by Nix anyway, so it's not an everyday
    # concern that I have to be constantly checking.
    cmake.disabled = true;
    crystal.disabled = true;
    dart.disabled = true;
    deno.disabled = true;
    dotnet.disabled = true;
    elixir.disabled = true;
    elm.disabled = true;
    erlang.disabled = true;
    golang.disabled = true;
    helm.disabled = true;
    java.disabled = true;
    julia.disabled = true;
    kotlin.disabled = true;
    lua.disabled = true;
    nim.disabled = true;
    nodejs.disabled = true;
    ocaml.disabled = true;
    package.disabled = true;
    perl.disabled = true;
    php.disabled = true;
    purescript.disabled = true;
    python.disabled = true;
    red.disabled = true;
    ruby.disabled = true;
    rust.disabled = true;
    scala.disabled = true;
    vagrant.disabled = true;
    vlang.disabled = true;
    zig.disabled = true;

  };
}
