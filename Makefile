.EXPORT_ALL_VARIABLES:

BINARY=grpc_health_probe

VERSION=`git describe --abbrev=0`
BUILD=`git rev-parse --short HEAD`

LDFLAGS="-X main.Version=${VERSION} -X main.Build=${BUILD}"

FLAGS=-ldflags ${LDFLAGS}

default:
	@echo ""
	@echo "Targets:"
	@echo ""
	@echo "  params                 Print parameters"
	@echo "  build                  Build binaries"
	@echo "  clean                  CLean binaries and reports"
	@echo "  test                   Run tests"
	@echo ""

params:
	@echo "Binary: $(BINARY)"
	@echo "Version: ${VERSION}"
	@echo "Build: ${BUILD}"

build:
	go build -o ${BINARY} ${FLAGS} ./main.go

install:
	go install ${LDFLAGS}

clean-binary:
	if [ -f ${BINARY} ] ; then rm ${BINARY} ; fi

clean: clean-binary
