# KiBot CI/CD template repository

This repository provides a ready-to-go CI/CD workflow for KiCad with GitHub actions.

## Features of this repository template

1. Integration with GitHub releases to automatically produce documentation and
   fabrication files on every GitHub release, including automatic date and version
   stamping of schematics and PCBs.
2. KiBot preflighting on every pull request (ERC/DRC checks disabled by default).
3. VSCode dev container and default build task for easy local testing of KiBot scripts.

## Creating your GitHub repo and KiCad project

To create a KiCad project using this GitHub template:

1. Hit the _Use this template_ button then follow the steps from GitHub to create a copy of the repo. **The repository name must exactly match the name of the KiCad project.
   Do not use spaces in either the repository or the project name.**
2. Clone the new repo locally.
3. Go to _File_ > _New_ > _Project..._ in KiCad.
4. Name the project the exact same name as the GitHub repository name.
5. Uncheck the _Create a new directory for this project_ option. **This is very important!**
6. Save the project into the top level of the folder for the GitHub repository.

Do not use spaces in the GitHub repository or KiCad project name. Use underscores or hyphens instead, for example `TBM930_De-Ice_-_Panel` or `Collins-FMS-3000`.

If you've done all the steps correctly the folder structure will look similar like this:

![image](https://user-images.githubusercontent.com/9524118/141387864-0186e1e1-1664-40d0-ad56-1dc864ee5bc3.png)

Notice that the folder name (which is also the GitHub repo name) and project name are exactly the same and there are no spaces.

## Setting up date and version number replacement

The GitHub automation can automatically set the date and version number in the generated schematic and PCBs. Before using this make sure
to set the timezone to your local timezone in the `.github\workflows\documentation-only.yml` and `.github\workflows\release.yml` files.

Version number and date replacement is done on the `%%version%%` and `%%date%%` string wherever they appear in your `.sch` and `.kicad_pcb` files.
Typically you will use them in the _Page settings_ dialog for the schematic and as text in silkscreen and/or copper layers on your board:

![image](https://user-images.githubusercontent.com/9524118/141394083-3256b935-c1fa-4eb7-b1ac-9275c82f4f2f.png)

![image](https://user-images.githubusercontent.com/9524118/141394283-d06194a0-80f0-4f5a-8f30-010f23b23d94.png)

## Documentation generated

The following documents are generated on every release build:

- cad/
   - dxf/
      - AutoCAD - DXF
   - boardview - BRD
   - 3D render - STEP
- docs/
   - bom/
      - Interactive BOM - HTML
      - Octopart list - CSV
      - KiCost - XLSX
   - Schematic - PDF
- img/
   - pcb/
      - PCB front - SVG
      - PCB back - SVG
   - Schematic - SVG
- gerbers - ZIP

These documents can also be generated by manually running the `KiBot - Generate documentation` action on GitHub.

## Fabrication files generated

The following fabrication files are generated on every release build:

- JLCPCB gerbers and drill files, with BOM and placement files for SMT service
- PCBWay gerbers and drill files
- Oshpark gerbers and drill files

The fabrication files can also be generated by manually running the `KiBot - Release` action on GitHub.

## How this works

A complete CodeTour is included in this repository that walks through all the components
of how KiBot scripts and GitHub actions work. [Use github.dev to view the CodeTour](https://github.dev/nerdyscout/KiBot-CICD-Template)!

## Running builds locally

This repository template includes the files necessary to run in a VSCode dev container,
which dramatically reduces the effort required to use KiBot on Windows machines.

Never used VSCode remote containers before on Windows? Here's how to get set up:

1. From a PowerShell install WSL2 with this command: `wsl --install`
2. Install [Visual Studio Code](https://code.visualstudio.com/Download) and Docker Desktop(https://www.docker.com/products/docker-desktop)
3. Install the [Remote Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension for VSCode

When installing Docker Desktop you may be told you have to enable virtualization in your computer's BIOS. Setting that up
is outside the scope of this readme but isn't hard. Just do a web search for your motherboard for how to enter the BIOS
and what the exact name of the setting is, then turn it on.
