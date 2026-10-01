{ variables, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = variables.gitUsername;
        email = variables.gitEmail;
      };
      credential."https://github.com".helper = "!gh auth git-credential";
    };
  };
}
