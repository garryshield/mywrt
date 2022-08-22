source ${GITHUB_ENV}

echo 'echo $GITHUB_ENV'
echo $GITHUB_ENV

echo 'cat $GITHUB_ENV'
cat $GITHUB_ENV

echo 'env---'
env

test1() {
    source ${GITHUB_ENV}

    echo 'echo $GITHUB_ENV'
    echo $GITHUB_ENV

    echo 'cat $GITHUB_ENV'
    cat $GITHUB_ENV

    echo 'env---'
    env
}
