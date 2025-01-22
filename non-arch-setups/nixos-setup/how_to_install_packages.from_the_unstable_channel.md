To see what channel you are currently on

```
sudo nix-channel --list
```

Add the unstable channel
```
sudo nix-channel --add https://nixos.org/channels/nixos-unstable unstable
sudo nix-channel --update
```

How to remove a channel:
```
sudo nix-channel --remove unstable
sudo nix-channel --update
```

Open your configuration.nix file

Find this line:

{ config, pkgs, ... }:

Add this underneath it:

```nix

let
  nixpkgs-unstable = import <unstable> {};
in

```

Then find this section:
and add the name of your package.

E.g. I want to install a package called `uv` from the unstable
channel 

```nix

  environment.systemPackages = with pkgs; [
    unstable.uv 
  ];

```

Then run the command:


```
sudo nixos-rebuild switch
```

