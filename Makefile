
# set the version number. you should not need to do this
# for the majority of scenarios.
ifeq ($(origin VERSION), undefined)
VERSION := $(shell git describe --dirty="-dev" --always --tags | sed 's/-/./2' | sed 's/-/./2' )
endif
export VERSION

image:
	podman build -t swr.troila.com/library/dex-login:$(VERSION) .
	podman push swr.troila.com/library/dex-login:$(VERSION) --creds admin:Harbor12345
	kubectl set image deployment dex-login dex-login=swr.troila.com/library/dex-login:$(VERSION) -n kube-system
