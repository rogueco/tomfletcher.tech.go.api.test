GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o ./build/CreateProject/CreateProject -ldflags '-w' application/functions/CreateProject/createProject.go
GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o ./build/GetProject/GetProject -ldflags '-w' application/functions/GetProject/getProject.go
GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o ./build/GetProjects/GetProjects -ldflags '-w' application/functions/GetProjects/getProjects.go
GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o ./build/DeleteProject/DeleteProject -ldflags '-w' application/functions/DeleteProject/deleteProject.go
GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o ./build/UpdateProject/UpdateProject -ldflags '-w' application/functions/UpdateProject/updateProject.go
GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o ./build/UploadProjectImage/UploadProjectImage -ldflags '-w' application/functions/UploadProjectImage/UploadProjectImage.go
