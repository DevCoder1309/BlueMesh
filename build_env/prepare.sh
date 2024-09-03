echo "Dist Root: ${DIST_ROOT:?}"
echo "LFS: ${LFS:?}"

ls -ls $LFS/

mkdir -p $LFS/sources

for f in $(cat $DIST_ROOT/build_env/build_env_list)
do
    echo $f
    
done;