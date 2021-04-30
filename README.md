# Diagrams for the book "Dapr for .NET Developers"

This repository contains the diagrams used in the book: "Dapr for .NET Developers".

The book covers Dapr concepts and how to use Dapr. It describes how to use the Dapr API directly, as well as using the Dapr SDK for .NET. You can read it here: [Microsoft docs - Dapr for .NET Developers](https://docs.microsoft.com/en-us/dotnet/architecture/dapr-for-net-developers/) or download the [PDF](https://aka.ms/dapr-ebook).

## Instructions

- Import `/diagrams/shape-library.xml` into your scratchpad in DrawIO to get the basic shapes.
- Create a folder for each chapter in the `/diagrams` folder (use kebab-casing for the name).
- Create a separate `.drawio` file for each diagram in its corresponding `/diagrams/<chapter>` folder.
- Name every `.drawio` file as you want to generated PNG to be named (use kebab-casing).
- Run `/export-to-png.ps1` script to generate PNGs for all diagrams.

### Export

The export script assumes that you've installed the [desktop version of draw.io](https://github.com/jgraph/drawio-desktop/releases/) in the default folder `C:\Program Files\draw.io`. Generating all PNGs can take some time. It starts a new instance of draw.io for every diagram (this is because of some restrictions in the command-line export functionality).

Be aware that when you run the export script, some diagrams that have not been changed will still yield a new version of the PNG. You can push these new versions. It's probably because of compression that the file has changed when doing a byte-level compare. But they look the same.
