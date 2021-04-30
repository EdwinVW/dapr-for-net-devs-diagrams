# Diagrams for the "Dapr for .NET Developers" Book.

## Instructions

- Import `/diagrams/shape-library.xml` into your scratchpad in DrawIO to get the basic shapes.
- Create a folder for each chapter in the `/diagrams` folder.
- Create a separate `.drawio` file for each diagram in its corresponding `/diagrams/<chapter>` folder.
- Name every `.drawio` file as you want to generated PNG to be named (use kebab-casing).
- Run `/export-to-png.ps1` script to generate PNGs for all diagrams.

The export script assumes that you've installed the desktop version of draw.io in the default folder `C:\Program Files\draw.io`. Generating all PNGs can take some time. It starts a new instance of draw.io for every diagram (this is because some restrictions in the command-line export functionality).
