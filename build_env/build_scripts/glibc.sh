echo 
echo "Glibc"
echo
sleep 1

cd $LFS/sources

tar -xf glibc-2.40.tar.xz
cd glibc-2.40

ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64
ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64/ld-lsb-x86-64.so.3

patch -Np1 -i ../glibc-2.40-fhs-1.patch

mkdir -p build && cd build

../configure                             \
      --prefix=/usr                      \
      --host=$LFS_TGT                    \
      --build=$(../scripts/config.guess) \
      --enable-kernel=4.19               \
      --with-headers=$LFS/usr/include    \
      --disable-nscd                     \
      libc_cv_slibdir=/usr/lib
make

make DESTDIR=$LFS install
sleep 5

echo "TESTING Glibc"
echo

echo 'int main(){}' | $LFS_TGT-gcc -xc -
readelf -l a.out | grep ld-linux

sleep 5

$LFS/tools/libexec/gcc/$LFS_TGT/10.2.0/install-tools/mkheaders

cd $LFS/sources
rm -rf glibc-2.40