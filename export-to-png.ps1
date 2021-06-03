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
#
#----------------------------------------------------------------------------------------------
#
# The script assumes that you've installed the desktop version of draw.io in the # default 
# folder: C:\Program Files\draw.io. Generating all PNGs can take some time. It starts a new 
# instance of draw.io for every diagram (this is because some restrictions in the command-line 
# export functionality).
#
###############################################################################################
$format = "png"
$diagramsFolder = "./diagrams"
$outputFolder = "./$format"

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
        $outputFile = $diagram.name -replace ".drawio", ".$format"
        $inputPath = "$diagramsFolder/$chapter/$inputFile"
        $outputPath = "$outputFolder/$chapter/$outputFile"

        Start-process -filepath "C:\Program Files\draw.io\draw.io.exe" `
            -ArgumentList "-x -f $format -q 100 -s 1.5 -o `"$outputPath`" `"$inputPath`"" `
            -WindowStyle Hidden `
            -Wait
    }
}

