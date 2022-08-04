LDFLAGS = -X sky-city.me/project.Version=$(VERSION)
PREFIX ?= /usr/local
BINDIR = $(DESTDIR)$(PREFIX)/bin

all: project-client project-server

project-client:
	GOPATH=$(GOPATH) go build -ldflags "$(LDFLAGS)" git.sky-city.me/tony/project/cmd/project-client

project-server:
	GOPATH=$(GOPATH) go build -ldflags "$(LDFLAGS)" git.sky-city.me/tony/project/cmd/project-server

clean:
	rm -f project-client project-server 

install: all doc
	mkdir -p $(BINDIR)
	cp -f project-client project-server $(BINDIR)
	chmod 755 $(BINDIR)/govpn-client $(BINDIR)/govpn-server 