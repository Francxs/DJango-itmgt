# To learn more about how to use Nix to configure your environment
# see: https://firebase.google.com/docs/studio/customize-workspace
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-24.11"; # or "unstable"

  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.python312  # Your Python version
    pkgs.python312Packages.pip # You might not strictly need this if you declare all dependencies
    pkgs.python312Packages.django
    pkgs.python312Packages.pymysql
    pkgs.mysql84
    # Add other Python dependencies here, e.g.,
    # pkgs.python312Packages.djangorestframework
  ];

  # Sets environment variables in the workspace
  env = {};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      # "vscodevim.vim"
    ];

    # Enable previews
    previews = {
      enable = true;
      previews = {
        # web = {
          # Example: run "python manage.py runserver 0.0.0.0:$PORT"
          # command = ["python" "manage.py" "runserver" "0.0.0.0:$PORT"];
          # manager = "web";
          # env = {
          #   PYTHONPATH = ./.;
          # };
        # };
      };
    };

    # Workspace lifecycle hooks
    workspace = {
      # Runs when a workspace is first created
      onCreate = {
        # You likely don't need to run pip install here anymore
        # install-python-deps = "pip install -r /home/user/DJango-itmgt/requirements.txt";
      };
      # Runs when the workspace is (re)started
      onStart = {
        # You can add commands to run when the workspace starts here
      };
    };
  };
}