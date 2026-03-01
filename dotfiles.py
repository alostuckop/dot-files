import argparse
import os
import shutil

HOME_DIR_PATH = os.path.expanduser("~/")


def apply_config(config_name):
    """Apply config files to local disk."""
    config_path = os.path.expanduser(f"~/.config/{config_name}")
    repo_config_path = config_name

    if not os.path.exists(config_path):
        os.mkdir(repo_config_path)

    if config_name == "zsh":
        _apply_zsh()
    elif config_name == "bash":
        _apply_bash()
    else:
        shutil.rmtree(config_path)
        shutil.copytree(repo_config_path, config_path)


def _apply_zsh():
    shutil.copyfile(f"{repo_config_path}/.zshrc", f"{HOME_DIR_PATH}/.zshrc")
    shutil.copyfile(f"{repo_config_path}/.zsh_profile", f"{HOME_DIR_PATH}/.zsh_profile")


def _apply_bash():
    shutil.copyfile(f"{repo_config_path}/.bashrc", f"{HOME_DIR_PATH}/.bashrc")
    shutil.copyfile(
        f"{repo_config_path}/.bash_profile", f"{HOME_DIR_PATH}/.bash_profile"
    )


def update_git(config_name):
    """Update git repo with latest config files."""
    config_path = os.path.expanduser(f"~/.config/{config_name}")
    repo_config_path = config_name

    if not os.path.exists(repo_config_path):
        os.mkdir(repo_config_path)

    if config_name == "zsh":
        _update_zsh(repo_config_path)
    elif config_name == "bash":
        _update_bash(repo_config_path)
    else:
        shutil.rmtree(repo_config_path)
        shutil.copytree(config_path, repo_config_path)


def _update_zsh(repo_config_path):
    shutil.copyfile(f"{HOME_DIR_PATH}/.zshrc", repo_config_path)
    shutil.copyfile(f"{HOME_DIR_PATH}/.zsh_profile", repo_config_path)


def _update_bash(repo_config_path):
    shutil.copyfile(f"{HOME_DIR_PATH}/.bashrc", repo_config_path)
    shutil.copyfile(f"{HOME_DIR_PATH}/.bash_profile", repo_config_path)


def clean_nvim():

    paths = [
        "~/.config/nvim",
        "~/.local/share/nvim",
        "~/.local/state/nvim",
        "~/.cache/nvim",
    ]

    for path in paths:
        path = os.path.expanduser(path)

        if os.path.exists(path):
            shutil.rmtree(path)
            print(f"Cleaning {path}")

    config_nvim_path = os.path.expanduser("~/.config/nvim")
    os.makedirs(config_nvim_path, exist_ok=True)


def main():
    parser = argparse.ArgumentParser(description="Manage dot files")
    parser.add_argument(
        "config",
        type=str,
        help="The name of the config directory (e.g., nvim, waybar, sway)",
    )
    parser.add_argument(
        "--apply",
        action="store_true",
        help="Apply config from the repository to <config>",
    )
    parser.add_argument(
        "--update-git",
        action="store_true",
        help="Update the repository with the latest .config/<config>",
    )
    parser.add_argument(
        "-c",
        "--clean-nvim",
        action="store_true",
        help="Remove nvim configuration directories",
    )

    args = parser.parse_args()

    if args.apply:
        if args.clean_nvim:
            clean_nvim()
        apply_config(args.config)

    elif args.update_git:
        update_git(args.config)


if __name__ == "__main__":
    main()
