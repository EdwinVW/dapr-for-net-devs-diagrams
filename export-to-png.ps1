###############################################################################################
# This script recursively iterates all the folders in the $diagramsFolder and generates a .png 
# file in the $outputFolder for every diagram file (.drawio) found.
#
# The folder-structure in $outputFolder mimics the folder-structure in the $diagramsFolder.
#
# Each .png will be created with the following properties:
# - Quality 100%
# - No transparancy
# - Scale 150%
###############################################################################################

$diagramsFolder = "./diagrams"
$outputFolder = "./png"

if (Test-Path $outputFolder)
{
    Remove-Item -Path $outputFolder -Force -Recurse -ErrorAction Continue
}

$chapters = Get-ChildItem $diagramsFolder

foreach ($chapter in $chapters) 
{ 
    mkdir $outputFolder/$chapter > $null

    $diagrams = Get-ChildItem $diagramsFolder/$chapter/*.drawio
    foreach ($diagram in $diagrams) {
        $inputFile = $diagram.name
        $outputFile = $diagram.name -replace ".drawio", ".png"
        $inputPath = "$diagramsFolder/$chapter/$inputFile"
        $outputPath = "$outputFolder/$chapter/$outputFile"

        Write-Host "$inputPath --> $outputPath"

        & draw.io.exe -x -f png -q 100 -s 1.5 -o $outputPath $inputPath > $null
    }
}

