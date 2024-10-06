set -e

echo "Dist Root: ${DIST_ROOT:?}"
echo "LFS: ${LFS:?}"


if ! test $(whoami) == "bluebuilder" ; then
    echo "You Must Be the BlueBuilder"
    exit -1
fi

echo "Creating the build environment......."
cd $DIST_ROOT/build_env

bash -e /build_scripts/binutils-pass1.sh
bash -e /build_scripts/gcc-pass1.sh