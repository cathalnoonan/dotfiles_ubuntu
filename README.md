# dotfiles (Ubuntu/Debian)
Sets up my Ubuntu/Debian environment for development.
> **Tested on**:
> - Ubuntu 20.04 (WSL)
> - Ubuntu 22.04 (WSL)
> - Debian 11 (WSL)


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

2. Run the following commands to add the dotfiles repo to `~/.bashrc` \
   **This allows the environment setup to persist between logouts/reboots**
   ```sh
   echo "" >> ~/.bashrc
   echo "# dotfiles" >> ~/.bashrc
   echo "if [ -f ~/.dotfiles/_env.sh ]; then" >> ~/.bashrc
   echo "  source ~/.dotfiles/_env.sh" >> ~/.bashrc
   echo "fi" >> ~/.bashrc
   echo "" >> ~/.bashrc
   ```

3. Load the setup file from `~/.dotfiles`
   ```sh
   source ~/.dotfiles/_env.sh
   ```
   > **Note**:
   > - There will be an error in the conosle after running this command.

4. Run initial setup
   ```sh
   dotfiles_install
   ```
   > **Note**:
   > - Setup will take a few minutes.
   > - The sudo password may be requested during this process.
   > - You will need to enter `Y` and press `ENTER` during the process.
   > - Docker setup will introduce one or two 20 second delays while running this command.

5. Reload config
   ```sh
   dotfiles_load
   ```
