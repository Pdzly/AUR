set -e

git clone ssh://aur@aur.archlinux.org/thrive-launcher-bin.git || exit 1

cp PKGBUILD thrive-launcher-bin

cd thrive-launcher-bin || exit 1
makepkg --printsrcinfo > .SRCINFO || exit 1

current_version=$(grep "^pkgver=" PKGBUILD | cut -d'=' -f2)
current_pkgrel=$(grep "^pkgrel=" PKGBUILD | cut -d'=' -f2)


git add .  || exit 1
git commit -m "Updating package to ${current_version} - ${current_pkgrel}"  || exit 1
git push || exit 1

cd ..

rm -rf thrive-launcher-bin
echo "Successfully published package to AUR with the version ${current_version} - ${current_pkgrel}"