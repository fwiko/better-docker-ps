build:
	go generate ./...
	CGO_ENABLED=0 go build -o _out/pops ./cmd/pops

run: build
	./_out/pops

clean:
	go clean
	rm ./_out/*

package:
	@echo "Make sure you have updated file://$(shell pwd)/consts/version.go"
	@echo "Make sure you have created+pushed a matching tag"
	@read -p "Continue?"

	go clean
	rm -rf ./_out/*

	_data/package-data/sanitycheck.sh

	GOARCH=386   GOOS=linux   CGO_ENABLED=0 go build -o _out/pops_linux-386-static                     ./cmd/pops  # Linux - 32 bit
	GOARCH=amd64 GOOS=linux   CGO_ENABLED=0 go build -o _out/pops_linux-amd64-static                   ./cmd/pops  # Linux - 64 bit
	GOARCH=arm64 GOOS=linux   CGO_ENABLED=0 go build -o _out/pops_linux-arm64-static                   ./cmd/pops  # Linux - ARM
	GOARCH=386   GOOS=linux                 go build -o _out/pops_linux-386                            ./cmd/pops  # Linux - 32 bit
	GOARCH=amd64 GOOS=linux                 go build -o _out/pops_linux-amd64                          ./cmd/pops  # Linux - 64 bit
	GOARCH=arm64 GOOS=linux                 go build -o _out/pops_linux-arm64                          ./cmd/pops  # Linux - ARM
	GOARCH=arm   GOOS=linux   GOARM=5       go build -o _out/pops_linux-arm32v5                        ./cmd/pops  # Linux - ARM32 v5 (e.g. Raspberry 3)
	GOARCH=arm   GOOS=linux   GOARM=6       go build -o _out/pops_linux-arm32v6                        ./cmd/pops  # Linux - ARM32 v6
	GOARCH=arm   GOOS=linux   GOARM=7       go build -o _out/pops_linux-arm32v7                        ./cmd/pops  # Linux - ARM32 v7
	GOARCH=amd64 GOOS=openbsd               go build -o _out/pops_openbsd-amd64                        ./cmd/pops  # OpenBSD - 64 bit
	GOARCH=arm64 GOOS=openbsd               go build -o _out/pops_openbsd-arm64                        ./cmd/pops  # OpenBSD - ARM
	GOARCH=amd64 GOOS=freebsd               go build -o _out/pops_freebsd-amd64                        ./cmd/pops  # FreeBSD - 64 bit
	GOARCH=arm64 GOOS=freebsd               go build -o _out/pops_freebsd-arm64                        ./cmd/pops  # FreeBSD - ARM

	echo ""
	echo "[TODO]: create github release"
	echo ""
