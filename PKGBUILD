pkgname=epsilon
pkgver=0.1.0
pkgrel=1
pkgdesc="AxOS pacman wrapper and AUR helper"
arch=('x86_64')
license=('GPL')
makedepends=('cargo' 'rust')
# sha256sums=('SKIP') 

build() {
  cd "${srcdir}"
  cargo build --release --locked
}


package() {
  cd "${srcdir}/"
  install -Dm755 "target/release/epsi" "${pkgdir}/usr/bin/${pkgname}"
}
