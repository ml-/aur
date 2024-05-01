# Maintainer: 1ridic <i at 8f dot al>
pkgname=lpac
pkgver=2.0.1
pkgrel=1
pkgdesc="C-based eUICC LPA"
arch=('any')
url="https://github.com/estkme-group/lpac"
license=('Custom')
makedepends=('cmake' 'gcc')
provides=("lpac")
conflicts=("lpac")
source=(
  "https://github.com/estkme-group/lpac/archive/refs/tags/v$pkgver.tar.gz"
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
