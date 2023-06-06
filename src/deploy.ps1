$env:GOOS = "linux"
$env:GOARCH = "amd64"
$env:CGO_ENABLED = "0"
$currentDir = $PWD.Path
$targetDir = "C:\path\to\directory"

# Create Project
$targetDir = ".\application\functions\createProject"
Set-Location -Path $targetDir
go build -o ../../../build/CreateProject/CreateProject -ldflags '-w' cmd/createProject.go
Set-Location -Path $currentDir

# Get Project
$targetDir = ".\application\functions\getProject"
Set-Location -Path $targetDir
go build -o ../../../build/GetProject/GetProject -ldflags '-w' cmd/getProject.go
Set-Location -Path $currentDir

# Get Projects
$targetDir = ".\application\functions\getProjects"
Set-Location -Path $targetDir
go build -o ../../../build/GetProjects/GetProjects -ldflags '-w' cmd/getProjects.go
Set-Location -Path $currentDir

# Update Project
$targetDir = ".\application\functions\updateProject"
Set-Location -Path $targetDir
go build -o ../../../build/UpdateProject/UpdateProject -ldflags '-w' cmd/updateProject.go
Set-Location -Path $currentDir

# Delete Project
$targetDir = ".\application\functions\deleteProject"
Set-Location -Path $targetDir
go build -o ../../../build/DeleteProject/DeleteProject -ldflags '-w' cmd/deleteProject.go
Set-Location -Path $currentDir

# Upload Project Image
$targetDir = ".\application\functions\uploadProjectImage"
Set-Location -Path $targetDir
go build -o ../../../build/UploadProjectImage/UploadProjectImage -ldflags '-w' cmd/uploadProjectImage.go
Set-Location -Path $currentDir


# Terraform apply --auto-approve
#terraform apply --auto-approve