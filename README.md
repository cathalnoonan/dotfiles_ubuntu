# dotfiles (Ubuntu/Debian)
Sets up my Ubuntu/Debian environment for development.
> **Tested on**:
> - Ubuntu 20.04 (WSL)
> - Ubuntu 22.04 (WSL)
> - Debian 11 (WSL)

## GitHub Action checks
[![Test Quickstart](https://github.com/cathalnoonan/dotfiles_ubuntu-and-debian/actions/workflows/test_quickstart.yml/badge.svg)](https://github.com/cathalnoonan/dotfiles_ubuntu-and-debian/actions/workflows/test_quickstart.yml)

## Quick setup:
1. Install curl (might be installed already)
   ```sh
   sudo apt-get update && sudo apt-get -y install curl
   ```
   > **Note**:
   > - The sudo password might be requested during this process.

2. Run the following command in bash
   ```sh
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/cathalnoonan/dotfiles_ubuntu-and-debian/HEAD/setup.sh)"
   ```
   > **Note**:
   > - Setup will take a few minutes.
   > - The sudo password might be requested during this process.
   > - You will need to type `Y` and/or press `ENTER` during the process.
   > - Docker setup might introduce one or two 20 second delays while running this command.
3. Run the following command to reload the settings
   ```sh
   source ~/.dotfiles/_env.sh
   ```

---

## Manual install:
### Note:
- During the following steps, you will be asked to enter your sudo password.
- You will be asked to press enter to continue.
- Please read the command line if it appears to have stopped; it may be waiting for input or an intentional delay.

### Prerequisites:
1. Install git
   ```sh
   sudo apt-get update && sudo apt install -y git
   ```
   > **Note**:
   > - The sudo password will be requested at this point.

### Installation:
1. Clone this repository to your user profile in the `~/.dotfiles` folder
   ```sh
   git clone https://github.com/cathalnoonan/dotfiles_ubuntu-and-debian.git ~/.dotfiles
   ```

2. Run the following commands to add the dotfiles repo to `~/.bashrc` \
   **This allows the environment setup to persist between logouts/reboots**
   ```sh
   bashrc=~/.bashrc
   echo "" >> $bashrc
   echo "# dotfiles" >> $bashrc
   echo "if [ -f ~/.dotfiles/_env.sh ]; then" >> $bashrc
   echo "  source ~/.dotfiles/_env.sh" >> $bashrc
   echo "fi" >> $bashrc
   echo "" >> $bashrc
   ```

3. Load the setup file from `~/.dotfiles`
   ```sh
   source ~/.dotfiles/_env.sh
   ```

4. Run initial setup
   ```sh
   dotfiles_install
   ```
   > **Note**:
   > - Setup will take a few minutes.
   > - The sudo password may be requested during this process.
   > - You will need to type `Y` and/or press `ENTER` during the process.
   > - Docker setup might introduce one or two 20 second delays while running this command.

5. Reload config
   ```sh
   dotfiles_load
   ```
