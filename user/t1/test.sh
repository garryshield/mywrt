echo $GITHUB_ENV

echo '---'

cat $GITHUB_ENV
cat ${GITHUB_ENV}
echo -e "### VARIABLE LIST ###\n$(cat ${GITHUB_ENV})\n"

env

echo '222'
