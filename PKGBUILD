pkgname=epsilon
pkgver=1.0.1
pkgrel=5
pkgdesc="AxOS pacman wrapper and AUR helper"
arch=('x86_64')
license=('GPL')
makedepends=('cargo' 'rust')
depends=('pacdiff-pacman-hook-git')
# sha256sums=('SKIP') 

build() {
  cd "${srcdir}"
  cargo build --release --locked
}


package() {
  cd "${srcdir}/"
  install -Dm755 "target/release/epsi" "${pkgdir}/usr/bin/epsi"
}
