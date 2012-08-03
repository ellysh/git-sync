DEB_DIR=deb
DEBIAN_DIR=debian

all:

install:
	mkdir -p ${DESTDIR}/usr/bin
	cp *.sh ${DESTDIR}/usr/bin
	mkdir -p ${DESTDIR}/usr/share/git-sync
	cp src/*.sh ${DESTDIR}/usr/share/git-sync

deb: deb-clean
	mkdir -p ${DEB_DIR}
	dpkg-buildpackage -rfakeroot -b -us -uc
	mv -f ../*.changes ../*.deb ${DEB_DIR}

deb-clean:
	-rm -rf build-stamp install_manifest.txt configure-stamp
	find . -name "*.1" | xargs rm -f

	-rm -rf ${DEBIAN_DIR}/buildroot
	-rm -rf ${DEBIAN_DIR}/git-sync
	find ${DEBIAN_DIR} -name "*.log" | xargs rm -f
	find ${DEBIAN_DIR} -name "*.substvars" | xargs rm -f

	-rm -rf ${DEB_DIR}