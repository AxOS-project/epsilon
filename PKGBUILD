pkgname=epsilon
pkgver=1.3
pkgrel=1
pkgdesc="AxOS pacman wrapper and AUR helper"
arch=('x86_64')
license=('GPL')
makedepends=('cargo' 'rust')
depends=('pacdiff-pacman-hook-git' 'timeshift')
# sha256sums=('SKIP')

build() {
  cd "${srcdir}"
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS='-Clinker-plugin-lto -Clinker=clang -Clink-arg=-fuse-ld=lld'
  export CC=clang
  cargo build --frozen --release
}


package() {
  install -Dm755 "${srcdir}/target/release/epsi" "${pkgdir}/usr/bin/epsi"
  # install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
