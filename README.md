# dotfiles (Ubuntu/Debian)
Sets up my Ubuntu/Debian environment for development.
> **Tested on**:
> - Debian 10 (WSL and Docker)
> - Debian 11 (WSL and Docker)
> - Ubuntu 20.04 (WSL)
> - Ubuntu 22.04 (WSL and Docker)

## GitHub Action checks
[![Test Setup](https://github.com/cathalnoonan/dotfiles_ubuntu-and-debian/actions/workflows/test_setup.yml/badge.svg)](https://github.com/cathalnoonan/dotfiles_ubuntu-and-debian/actions/workflows/test_setup.yml)

---

## Setup:
### Prerequisites for running inside a docker container
- Install sudo
  ```sh
  apt-get update && apt-get -y install sudo
  ```

### General prerequisites
- Install curl (might be installed already)
  ```sh
  sudo apt-get update && sudo apt-get -y install curl
  ```

### Installation
1. Run the following command in bash
   ```sh
   /bin/bash -c "$( curl -fsSL https://raw.githubusercontent.com/cathalnoonan/dotfiles_ubuntu-and-debian/HEAD/setup.sh )"
   ```
   > **Note**:
   > - Setup will take a few minutes.
   > - The sudo password might be requested during this process.
   > - You will need to type `Y` and/or press `ENTER` during the process.
   > - Docker setup might introduce one or two 20 second delays while running this command.
2. Run the following command to reload the settings
   ```sh
   source ~/.dotfiles/src/_env.sh
   ```

---

## Manual Setup:
### Note:
- During the following steps, you will be asked to enter your sudo password.
- You will be asked to press enter to continue.
- Please read the command line if it appears to have stopped; it may be waiting for input or an intentional delay.

### Prerequisites:
- Install git
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
   echo "if [ -f ~/.dotfiles/src/_env.sh ]; then" >> $bashrc
   echo "  source ~/.dotfiles/src/_env.sh" >> $bashrc
   echo "fi" >> $bashrc
   echo "" >> $bashrc
   source ~/.bashrc
   ```

3. Run initial setup
   ```sh
   dotfiles_install
   ```
   > **Note**:
   > - Setup will take a few minutes.
   > - The sudo password may be requested during this process.
   > - You will need to type `Y` and/or press `ENTER` during the process.
   > - Docker setup might introduce one or two 20 second delays while running this command.

4. Reload config
   ```sh
   dotfiles_load
   ```
