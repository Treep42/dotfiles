#!/usr/bin/env python3

import os
from pathlib import Path

DEBUG = True
VERBOSE = True

if DEBUG or VERBOSE:
    print(f"DEBUG = {DEBUG}")
    print(f"VERBOSE = {VERBOSE}")

def move(path, target):
    if DEBUG or VERBOSE:
        print(f"    move: {path} --> {target}")
    if not DEBUG:
        path.move(target)

def backup(target):
    if target.is_symlink():
        if DEBUG or VERBOSE:
            print(f"    unlink target: {target}")
        if not DEBUG:
            target.unlink()
    elif target.exists():
        backup = Path(f"{str(target)}_backup")
        move(target, backup)

def copy(path, target):
    backup(target)
    if DEBUG or VERBOSE:
        print(f"    copy: {path} --> {target}")
    if not DEBUG:
        path.copy(target)

def symlink(path, target):
    backup(target)
    if DEBUG or VERBOSE:
        print(f"    symlink: {target} --> {path}")
    if not DEBUG:
        target.symlink_to(path, target_is_directory=path.is_dir())


basedir = Path(__file__).parent
for child in basedir.iterdir():
    print(f"FILE: {str(child)}")
    if child.name in ["setup.py", "README.md", "notes.txt", ".git", ".gitmodules"]:
        if VERBOSE: print("    skip\n")
        continue
    if child.suffix == ".desktop":
        target = Path(f"/usr/share/applications/{child.name}")
        copy(child, target)
    elif child.name == ".local":
        for localdir in child.iterdir():
            for localchild in localdir.iterdir():
                target = Path(f"~/.local/{localdir.stem}/{localchild.stem}").expanduser()
                symlink(localchild, target)
    else:
        target = Path(f"~/.config/{child.stem}").expanduser()
        symlink(child, target)
    if VERBOSE:
        print("")
print("done.")

