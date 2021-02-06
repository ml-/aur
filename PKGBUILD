# Maintainer: ml <ml AT visu.li>
pkgname=vt-cli
pkgver=0.9.0
pkgrel=1
pkgdesc='VirusTotal Command Line Interface'
arch=('i686' 'x86_64')
url='https://github.com/VirusTotal/vt-cli'
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ec418c60697d03fd859bbf3a36abe4f30d59111651e3065de6cd581040a19027')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw -mod=readonly'
  go build -o build/vt -ldflags "-linkmode=external -X github.com/VirusTotal/vt-cli/cmd.Version=${pkgver}" ./vt
  #grep -Fqwm1 "$pkgver" build/vt
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755  build/vt -t "${pkgdir}/usr/bin"
  build/vt completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/vt"
  build/vt completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_vt"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" doc/*
}
