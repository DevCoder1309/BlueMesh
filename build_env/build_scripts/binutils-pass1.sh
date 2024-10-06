cd $LFS/sources

tar -xf binutils-2.43.1.tar.xz

cd binutils-2.43.1

bad_command_name

mkdir -v build
cd       build

../configure --prefix=$LFS/tools \
             --with-sysroot=$LFS \
             --target=$LFS_TGT   \
             --disable-nls       \
             --enable-gprofng=no \
             --disable-werror    \
             --enable-new-dtags  \
             --enable-default-hash-style=gnu

make
make install

cd $LFS/sources

rm -rf binutils-2.43.1