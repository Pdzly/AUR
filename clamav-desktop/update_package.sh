git clone ssh://aur@aur.archlinux.org/anytype-alpha-bin.git || exit 1

cp PKGBUILD anytype-alpha-bin

cd anytype-alpha-bin || exit 1
makepkg --printsrcinfo > .SRCINFO

current_version=$(grep "^pkgver=" PKGBUILD | cut -d'=' -f2)
current_pkgrel=$(grep "^pkgrel=" PKGBUILD | cut -d'=' -f2)


git add .
git commit -m "Updating package to ${current_version} - ${current_pkgrel}"
git push

cd ..

rm -rf anytype-alpha-bin
echo "Successfully published package to AUR with the version ${current_version} - ${current_pkgrel}"