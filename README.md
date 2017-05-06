# Travel Trip

Training skills in Haskell in a small program for calculating travel segments.

## Getting Started

Downloads - https://www.haskell.org/downloads

There are three widely used ways to install the Haskell toolchain on supported platforms. These are:

Minimal installers: Just GHC (the compiler), and build tools (primarily Cabal and Stack) are installed globally on your system, using your system's package manager.

Stack: Installs the stack command globally: a project-centric build tool to automatically download and manage Haskell dependencies on a project-by-project basis.

Haskell Platform: Installs GHC, Cabal, and some other tools, along with a starter set of libraries in a global location on your system.

These options make different choices as to what is installed globally on your system and what is maintained in project-specific environments. Global installations allow more sharing across users and projects, but at the cost of potential conflicts between projects. To avoid these conflicts, each option has a lightweight sandboxing feature that creates largely self-contained, per-project environments. With Minimal you can optionally sandbox the libraries, avoiding most conflicts. Stack sandboxes the compiler, tools and libraries, so avoids nearly all kinds of conflicts between projects. With Platform you can also optionally sandbox libraries, but not the globally installed platform libraries.
Haskell IDEs & other distributions

In addition to the generic, cross-platform Haskell toolchain described above, there are also easy-to-use, platform-specific distributions and IDEs. The Haskell Wiki contains a list of the most popular ones.
Minimal installers
What they are

Minimal installers provide centrally the GHC compiler and the Cabal and Stack tools for installing packages. Some may install further build tools (i.e. for parsing and lexing) as well.
What you get

    Only the core libraries necessary for each platform are included.
    Cabal or Stack must be used to download and install packages after installation.

How to get them

    Linux
    OS X (via the minimal platform)
    Windows (via the minimal platform)

