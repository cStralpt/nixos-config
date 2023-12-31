/*

Search Terms:

  !hdw -> Hardware (A device.)

*/



{
  description = "Oglo's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
    };

    hyprwm-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    ...
  }: {
    nixosConfigurations = let
      fullname = "Jackson Novak";
      username = "jackson";
      editor = "hx";
      browser = "brave";
    in {

      # !hdw smallguy
      smallguy = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";

        specialArgs = {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs;
          inherit system;
          inherit username fullname;
          inherit editor browser;
        };

        modules = [
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${username} = {
                home = {
                  username = username;
                  homeDirectory = "/home/${username}";
                  # do not change this value
                  stateVersion = "23.05";
                };

                # Let Home Manager install and manage itself.
                programs.home-manager.enable = true;
              };
            };
          }
          ./machines/smallguy/config.nix
        ];
      };

      # !hdw pongo
      pongo = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";

        specialArgs = {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs;
          inherit system;
          inherit username fullname;
          inherit editor browser;
        };

        modules = [
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${username} = {
                home = {
                  username = username;
                  homeDirectory = "/home/${username}";
                  # do not change this value
                  stateVersion = "23.05";
                };

                # Let Home Manager install and manage itself.
                programs.home-manager.enable = true;
              };
            };
          }
          ./machines/pongo/config.nix
        ];
      };

      # !hdw colossus
      colossus = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";

        specialArgs = {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs;
          inherit system;
          inherit username fullname;
          inherit editor browser;
        };

        modules = [
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${username} = {
                home = {
                  username = username;
                  homeDirectory = "/home/${username}";
                  # do not change this value
                  stateVersion = "23.05";
                };

                # Let Home Manager install and manage itself.
                programs.home-manager.enable = true;
              };
            };
          }
          ./machines/colossus/config.nix
        ];
      };

      # !hdw qemu-vm
      qemu-vm = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";

        specialArgs = {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs;
          inherit system;
          inherit username fullname;
          inherit editor browser;
        };

        modules = [
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${username} = {
                home = {
                  username = username;
                  homeDirectory = "/home/${username}";
                  # do not change this value
                  stateVersion = "23.05";
                };

                # Let Home Manager install and manage itself.
                programs.home-manager.enable = true;
              };
            };
          }
          ./machines/qemu-vm/config.nix
        ];
      };

    };
  };
}
