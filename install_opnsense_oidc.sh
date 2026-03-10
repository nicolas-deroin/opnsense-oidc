#!/bin/sh

plugins_path=/usr/plugins/devel
home_path="$(cd "$(dirname "$0")/.." && pwd)" # Current parent directory
project_name=opnsense-oidc
package_name=os-oidc
src_path=$home_path/$project_name
tgt_path=$plugins_path/$project_name

echo "Removing existing target path $tgt_path..."
rm -rf $tgt_path
echo "Done; uninstalling currently installed package $package_name..."
yes | pkg remove $package_name
echo "Done; copying source from '$src_path' to '$tgt_path'..."
cp -R $src_path $tgt_path
echo "Done; switching to $tgt_path..."
cd $tgt_path
echo "Done; making package..."
make package
echo "Done; installing package $tgt_path/work/pkg/*.pkg..."
pkg add $tgt_path/work/pkg/*.pkg
exit 0
