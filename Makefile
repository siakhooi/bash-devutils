clean:
	rm -rf target *.deb *.deb.sha256sum *.deb.sha512sum
build-deb:
	./scripts/build-deb.sh
set-version:
	scripts/set-version.sh
git-commit-and-push:
	scripts/git-commit-and-push.sh
create-release:
	scripts/create-release.sh

test-man:
	pandoc src/md/siakhooi-devutils.1.md -s -t man | man -l -

test-install:
	sudo apt install -f ./siakhooi-devutils_1.0.0_amd64.deb
	sudo apt remove -y siakhooi-devutils

delete-tags:
	git tag --delete 1.0.0
	git push --delete origin 1.0.0
