clean:
	rm -rf target *.deb
build:
	./build.sh

test-man:
	pandoc src/md/siakhooi-devutils.1.md -s -t man | man -l -

test-install:
	sudo apt install -f ./siakhooi-devutils_1.0.0_amd64.deb 
	sudo apt remove -y siakhooi-devutils

delete-tags:
	git tag --delete 1.0.0
	git push --delete origin 1.0.0

docker-ubuntu-bash:
	docker run --rm -it -w /working -v $$(pwd):/working ubuntu bash
#	. in-container-init.sh

docker-debian-bash:
	docker run --rm -it -w /working -v $$(pwd):/working debian bash
#	. in-container-init.sh
