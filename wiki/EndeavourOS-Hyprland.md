# EndeavourOS with Hyprland.

> :warning: This document is not completed.

## Dependencies

- Installed by default:
  - `firefox`.
  - `git`.
  - `grub`.
  - `pipwire` and `wireplumber`.
- `hyprland`.
- `sddm` and its dependencies:
  - `qt5-quickcontrols2`.
  - `qt5-svg`.
  - `qt5-graphicaleffects`.
- `dunst`: a notification daemon.
- `xdg-desktop-portal-hyprland` and `xdg-desktop-portal-gtk`: XDG Desktop Portal.
- `polkit-kde-agent`: Authentication popup UI.
- `qt6-wayland` and `qt5-wayland`: QT Wayland support.
- `waybar-hyprland`: a status bar.
- `kitty`.
- `ranger`.
- `neovim`, with dependencies:
  - `ripgrep`.
  - `fd`.
  - `xclip`: enable the usage of system clipboard.
- `visual-studio-code-bin`.
- `tmux`.
- `zip`.
- `starship`.
- `gitui`.
- `btop`.
- `syncthing`.
- `inkscape`: vector graphic editor.
- `gimp`: GNU Image Manipulation Program.
- `libreoffice-fresh`.
- `nodejs` and `npm` (for installing `prettier` in `mason` in `neovim`).
- `foliate`: ebooks reader.
- `wine`: for running Windows application.
- MetaTraders 5.
- TradingView.
- `noto-fonts-emoji`.
- `plymouth` (disabled, not install).

## Installation

```bash
sudo pacman -S hyprland sddm qt5-quickcontrols2 qt5-svg qt5-graphicaleffects dunst xdg-desktop-portal-hyprland xdg-desktop-portal-gtk polkit-kde-agent qt6-wayland qt5-wayland kitty ranger neovim ripgrep fd xclip tmux zip starship gitui btop syncthing inkscape gimp libreoffice-fresh nodejs npm foliate wine noto-fonts-emoji
```

```bash
yay -S visual-studio-code-bin tradingview waybar-hyprland
```

## Setting up

- Run `eos-welcome` and do after install steps.

- Install the repository: `git clone https://github.com/haruki-nguyen/.dotfiles.git ~/.dotfiles`.

- First, install a Nerd font on <https://www.nerdfonts.com/font-downloads> to `/usr/share/fonts/` and set it up for the terminal emulator. For example: Iosevka.

  ```bash
  cd ~/Downloads && wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Iosevka.zip" -O Iosevka.zip
  sudo unzip Iosevka.zip -d /usr/share/fonts/Iosevka
  rm Iosevka.zip && cd -
  ```

- Then, setting up emoji font: `fc-cache -fv`, this command will rebuild the font cache.

- Kitty

  ```bash
  rm -rf ~/.config/kitty/
  ln -s ~/.dotfiles/configs/kitty/ ~/.config/
  ```

- Neovim.

  - Install NvChad.

    ```bash
    git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
    ```

  - Setup my custom NvChad configs:

    ```bash
    rm -rf ~/.config/nvim/lua/custom/
    ln -s ~/.dotfiles/configs/neovim ~/.config/nvim/lua/custom
    ```

- Tmux.

  - Install Tmux Plugin Manager:

    ```bash
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    ```

    ```bash
    mkdir ~/.config/tmux
    ln -s ~/.dotfiles/configs/tmux/tmux.conf ~/.config/tmux
    ```

  - Then reload Tmux with `tmux source ~/.config/tmux/tmux.conf` and install the plugins with `<prefix> + I`.

- Hyprland

  ```bash
  rm -rf ~/.config/hypr/
  ln -s ~/.dotfiles/configs/hypr/ ~/.config/
  ```

- SDDM

  Download the `sugar-dark` theme file from <https://www.opendesktop.org/p/1272122> to `~/Downloads/`.

  ```bash
  sudo systemctl enable sddm.service
  sudo tar -xzvf ~/Downloads/sugar-dark.tar.tar -C /usr/share/sddm/themes
  sudo mkdir /etc/sddm.conf.d
  sudo cp ~/.dotfiles/configs/sddm/sddm.conf /etc/sddm.conf.d/
  rm ~/Downloads/sugar-dark.tar.tar
  ```

- GRUB.

  ```bash
  sudo cp -r ~/.dotfiles/configs/grub/catppuccin-mocha-grub-theme/ /usr/share/grub/themes/
  ```

  Uncomment and edit following line in `/etc/default/grub` to selected theme:

  ```bash
  GRUB_THEME="/usr/share/grub/themes/catppuccin-mocha-grub-theme/theme.txt"
  ```

  Update GRUB:

  ```bash
  sudo grub-mkconfig -o /boot/grub/grub.cfg
  ```

- Dunst.

  ```bash
  ln -s ~/.dotfiles/configs/dunst/ ~/.config/
  ```

- Waybar

  ```bash
  ln -s ~/.dotfiles/configs/waybar/ ~/.config/
  ```

- Ranger

  ```bash
  rm -rf ~/.config/ranger
  ln -s ~/.dotfiles/configs/ranger/ ~/.config/
  ```

- Firefox:

  - Login to sync Bookmarks, Settings, and Add-ons.
  - Setting up add-ons:
    - Simple Translate.
    - DuckDuckGo Privacy Essentials.
    - <https://github.com/catppuccin/firefox>.

- Starship

  ```bash
  ln -s ~/.dotfiles/configs/starship/starship.toml ~/.config
  ```

- Bash.

  ```bash
  echo -e "\nsource ~/.dotfiles/configs/bash/bashrc_custom.sh" >> ~/.bashrc
  source ~/.bashrc
  ```

- Git.

  ```bash
  ln -s ~/.dotfiles/configs/git/.gitconfig ~/
  ```

- GitUI.

  ```bash
  rm -rf ~/.config/gitui
  ln -s ~/.dotfiles/configs/gitui ~/.config
  ```

- GitHub SSH.

  - Setting up SSH key on your device.

    ```bash
    ssh-keygen -t ed25519 -C "your_email@example.com"
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519
    ```

  - Then on your GitHub account: <https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account>.
  - Update remove URL: `git remote set-url origin <URL>`.

- Btop.

  ```bash
  ln -s ~/.dotfiles/configs/btop ~/.config
  ```

- Foliate.

  ```bash
  ln -s ~/.dotfiles/configs/foliate ~/.config/com.github.johnfactotum.Foliate
  ```

- MetaTraders.

  ```bash
  cd ~/Downloads && wget "https://download.mql5.com/cdn/web/metaquotes.software.corp/mt5/mt5setup.exe?utm_source=web.installer&utm_campaign=mql5.welcome.open" -O mt5setup.exe
  wine mt5setup.exe
  ```

  After that, remove the setup file.

## Disabled

- Plymouth (disabled).

  Edit `/etc/default/grub` and append the kernel options between the quotes in the `GRUB_CMDLINE_LINUX_DEFAULT` line:

  ```txt
  GRUB_CMDLINE_LINUX_DEFAULT="... quiet splash"
  ```

  And then automatically re-generate the grub.cfg file with:

  ```txt
  sudo grub-mkconfig -o /boot/grub/grub.cfg
  ```

  Force dracut to include Plymouth by adding the following line to the dracut configuration at `/etc/dracut.conf.d/example.conf`:

  ```conf
  add_dracutmodules+=" plymouth "
  ```

  ```bash
  sudo cp -r ~/.dotfiles/configs/plymouth/catppuccin-mocha/ /usr/share/plymouth/themes/
  sudo plymouth-set-default-theme -R catppuccin-mocha
  ```
