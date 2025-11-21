set -e

git clone ssh://aur@aur.archlinux.org/cs-script.git || exit 1

cp PKGBUILD cs-script

cd cs-script || exit 1
makepkg --printsrcinfo > .SRCINFO

current_version=$(grep "^pkgver=" PKGBUILD | cut -d'=' -f2)
current_pkgrel=$(grep "^pkgrel=" PKGBUILD | cut -d'=' -f2)


git add .
git commit -m "Updating package to ${current_version} - ${current_pkgrel}"
git push

cd ..

rm -rf cs-script
echo "Successfully published package to AUR with the version ${current_version} - ${current_pkgrel}"