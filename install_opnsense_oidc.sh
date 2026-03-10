#!/bin/sh

plugins_path=/usr/plugins/devel
home_path=/home/nicolasderoin
project_name=opnsense-oidc
package_name=os-oidc
src_path=$home_path/$project_name
tgt_path=$plugins_path/$project_name


rm -rf $tgt_path
yes | pkg remove $package_name
cp -R $src_path $tgt_path
cd $tgt_path
make package
pkg add $tgt_path/work/pkg/*.pkg
exit 0
