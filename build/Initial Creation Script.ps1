# Set variables for project name and root directory
$projectName = "SolidInventoryApp"
$rootDir = "$(Split-Path -Path $MyInvocation.MyCommand.Path -Parent)\.."

# Create root directory if it doesn't exist
if (!(Test-Path -Path $rootDir -PathType Container)) {
    New-Item -Path $rootDir -ItemType Directory
}

# Create solution file
$solutionFile = "$rootDir\$projectName.sln"
dotnet new sln -n $projectName -o $rootDir

# Create project directories
$srcDir = "$rootDir\$projectName"
$modelsDir = "$srcDir\DataModel"
$dataAccessDir = "$srcDir\DataAccess"
$webApiDir = "$srcDir\WebApi"

New-Item -Path $modelsDir -ItemType Directory
New-Item -Path $dataAccessDir -ItemType Directory
New-Item -Path $webApiDir -ItemType Directory

# Create project files
cd $srcDir
dotnet new classlib -n "$projectName.DataModel" -o $modelsDir
dotnet new classlib -n "$projectName.DataAccess" -o $dataAccessDir
dotnet new webapi -n "$projectName.WebApi" -o $webApiDir

# Add projects to solution
cd $rootDir
dotnet sln add $modelsDir\$projectName.DataModel.csproj $dataAccessDir\$projectName.DataAccess.csproj $webApiDir\$projectName.WebApi.csproj

Write-Host "Project created successfully."