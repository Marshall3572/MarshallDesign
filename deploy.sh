rm -rf dist &&
yarn build &&
cd dist &&
git init &&
git config user.name Marshall3572 &&
git config user.email 944797458@qq.com &&
git add . &&
git commit -m "update" &&
git branch -M main &&
git remote add origin git@github.com:Marshall3572/MarshallDesign-website.git &&
git push -f -u origin main &&
cd - &&
echo https://marshall3572.github.io/MarshallDesign-website/index.html#/
