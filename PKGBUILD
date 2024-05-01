# Maintainer: 1ridic <i at 8f dot al>
pkgname=lpac
pkgver=2.0.1
pkgrel=1
pkgdesc="C-based eUICC LPA"
arch=('x86_64')
url="https://github.com/estkme-group/lpac"
license=('AGPL-3.0-only' 'LGPL-2.1-only')
makedepends=('cmake' 'gcc')
depends=('curl' 'pcsclite')
provides=("lpac")
conflicts=("lpac")
source=(
  lpac-v$pkgver.tar.gz::https://github.com/estkme-group/lpac/archive/refs/tags/v$pkgver.tar.gz
)
sha256sums=(
  "SKIP"
)

build() {
  cd $srcdir/lpac-$pkgver
  cmake .
  make -j
}

package() {
  # Install the executables
  install -d "$pkgdir"/usr/bin/
  cd $srcdir/lpac-$pkgver
  install -m 755 ./output/lpac "$pkgdir"/usr/bin/
}
