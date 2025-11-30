git clone ssh://aur@aur.archlinux.org/marmite.git || exit 1

cp PKGBUILD marmite

cd marmite || exit 1
makepkg --printsrcinfo > .SRCINFO

current_version=$(grep "^pkgver=" PKGBUILD | cut -d'=' -f2)
current_pkgrel=$(grep "^pkgrel=" PKGBUILD | cut -d'=' -f2)


git add .
git commit -m "Updating package to ${current_version} - ${current_pkgrel}"
git push

cd ..

rm -rf marmite
echo "Successfully published package to AUR with the version ${current_version} - ${current_pkgrel}"