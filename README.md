# dotfiles (Ubuntu)
Sets up my Ubuntu dev environment.
> **Note**:
> - Tested on 20.04 (WSL) and 22.04 (WSL).


## Note:
During the following steps, you will be asked to enter your sudo password.

You will be asked to press enter to continue.

Please read the command line if it appears to have stopped; it may be waiting for input or an intentional delay.

## Prerequisites:
1. Install git
   ```sh
   sudo apt-get update && sudo apt install git
   ```
   > **Note**:
   > - The sudo password will be requested at this point.

## How to use:
1. Clone this repository to your user profile in the `~/.dotfiles` folder
   ```sh
   git clone https://github.com/cathalnoonan/dotfiles_ubuntu.git ~/.dotfiles
   ```

2. Add the following to `~/.bashrc` \
   **This allows the environment setup to persist between logouts/reboots**
   ```sh
   if [ -f ~/.dotfiles/_env.sh ]; then
     source ~/.dotfiles/_env.sh
   fi
   ```

3. Load the setup file from `~/.dotfiles`
   ```sh
   source ~/.dotfiles/_env.sh
   ```
   > **Note**:
   > - There will be errors in the conosle after running this command.

4. Run initial setup
   ```sh
   dotfiles_install
   ```
   > **Note**:
   > - The sudo password may be requested during this process.
   > - Docker setup will introduce one or two 20 second delays while running this command.
   > - Homebrew will also prompt to press ENTER.

5. Reload config
   ```sh
   dotfiles_load
   ```
