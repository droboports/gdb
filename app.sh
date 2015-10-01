CFLAGS="${CFLAGS:-} -ffunction-sections -fdata-sections"
LDFLAGS="${LDFLAGS:-} -Wl,--gc-sections"

### GDB ###
_build_gdb() {
local VERSION="7.10"
local FOLDER="gdb-${VERSION}"
local FILE="${FOLDER}.tar.xz"
local URL="http://ftp.gnu.org/gnu/gdb/${FILE}"

# sudo apt-get install texinfo

_download_xz "${FILE}" "${URL}" "${FOLDER}"
pushd "target/${FOLDER}"
./configure --host="${HOST}" --prefix="${DEST}" --mandir="${DEST}/man"
make
make install
popd
}

_build() {
  _build_gdb
  _package
}
