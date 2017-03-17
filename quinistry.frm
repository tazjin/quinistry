inputs:
  "/":
    type: "tar"
    hash: "uJRF46th6rYHt0zt_n3fcDuBfGFVPS6lzRZla5hv6iDoh5DVVzxUTMMzENfPoboL"
    silo: "http+ca://repeatr.s3.amazonaws.com/assets/"
  "/app/go/":
    type: "tar"
    hash: "UoY1amg4W8_JVQJ6tg6I4BQm1Mlw3ngT_kutZNr6XfFvvWAZfGrwDxDcQD2TzOVz"
    silo: "https://storage.googleapis.com/golang/go1.8.linux-amd64.tar.gz"
  "/go/src/github.com/tazjin/quinistry/":
    type: "git"
    hash: "6e7262763ca7d0d94324477907161bd3907c9c1e"
    silo: "https://github.com/tazjin/quinistry.git"
action:
  command:
    - "/bin/bash"
    - "-c"
    - |
      #!/bin/bash
      set -ue
      export PATH=$PATH:/app/go/go/bin
      export GOROOT=/app/go/go
      export GOPATH=/go
      mkdir out
      go build -tags netgo -o out/quinistry
  cwd: "/go/src/github.com/tazjin/quinistry/"
outputs:
  "executable":
    type: "tar"
    mount: "/go/src/github.com/tazjin/quinistry/out"
    silo: "file://quinistry.tar.gz"
