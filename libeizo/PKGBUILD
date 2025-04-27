# Maintainer: ml <ml-aur@ransomware.download>
pkgname=libeizo
pkgver=r174.716ab43
pkgrel=1
pkgdesc='Userspace utility to control EIZO FlexScan EV monitors'
arch=(x86_64)
url=https://github.com/markbolhuis/libeizo
license=(LGPL-3.0-only)
depends=(gcc-libs glibc systemd-libs)
makedepends=(git meson)
provides=(libeizo.so eizoctl)
source=("$pkgname"::git+"$url")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    arch-meson "$pkgname" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -vDm 644 "$pkgname"/udev/70-eizo.rules -t "$pkgdir"/usr/lib/udev/rules.d
}
