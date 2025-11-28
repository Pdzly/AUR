set -e

git clone ssh://aur@aur.archlinux.org/balena-etcher.git balena|| exit 1

cp PKGBUILD balena
cp etcher-util balena
cp skip-build-util.patch balena
cp balena-etcher.desktop balena

cd balena || exit 1
makepkg --printsrcinfo > .SRCINFO

current_version=$(grep "^pkgver=" PKGBUILD | cut -d'=' -f2)
current_pkgrel=$(grep "^pkgrel=" PKGBUILD | cut -d'=' -f2)


git add .
git commit -m "Updating package to ${current_version} - ${current_pkgrel}"
git push

cd ..

rm -rf balena
echo "Successfully published package to AUR with the version ${current_version} - ${current_pkgrel}"