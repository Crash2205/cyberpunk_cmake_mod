# Cyberpunk CMake Mod Template

This repo demonstrates the full capabilities of [Cyberpunk CMake](https://github.com/jackhumbert/cyberpunk_cmake) - a collection of CMake scripts & tools to aid in Cyberpunk 2077 mod creation.

## Features of this particular repo:

*See Cyberpunk CMake for full toolset features*

* [Github Actions workflow for building with game_dir artifact upload](.github/workflows/cmake.yml)
* [`.redscript-ide`](.redscript-ide) with `redscript_dir` allows other/duplicate redscript files to exist in `game_dir`/repo without linting breaking
* VS Code integration [configure, build & install tasks](.vscode\tasks.json) and `CMake: Project Outline` support

## Usage

1. Click "Use this template" on the [Github page](https://github.com/jackhumbert/cyberpunk_cmake_mod) to create a new repo that uses this as the base.
2. Recursively clone the repo with `git clone --recurse-submodules <repo>` - this will clone the cyberpunk_cmake repo, along with the RED4ext.SDK (currently Jack's branch)
3. Open the [cyberpunk_cmake_mod.code-workspace](cyberpunk_cmake_mod.code-workspace) file (or rename it first) in VS Code
4. Install the recommended extensions, as well as [redscript-ide-vscode from the .vsix](https://github.com/jac3km4/redscript-ide-vscode/releases)
5. Click the CMake icon on the left side (you can drag this to be in the same panel as your file explorer to access it more easily)
6. Customize the project via [`CMakeLists.txt`](CMakeLists.txt)
6. Configure the project in one of the following ways:
    a. Click the "Configure All Projects" at the top of the CMake panel
    b. Run the "Configure" task
    c. Run `cmake -B build` in the terminal
    d. Save the `CMakeLists.txt` to automatically trigger a reconfigure
7. Build the project in one of the following ways:
    a. Click the "Build" button next to the `ALL_BUILD` or `project_slug` targets to build the entire project (or select a particular target to build just that and its dependencies)
    b. Run the "Build" task
    c. Run `cmake --build build`
        * `cmake --build build --target <target>` can be used to specify a target
8. Commit & push your changes to your Github repo, and a CI build will be triggered, where a zip of the game_dir will be available for you to download