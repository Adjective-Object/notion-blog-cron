#!/usr/bin/env bash


TOKEN=$(cat ./token)

set -uex

TEMP=$(mktemp -d)

export PIPENV_VENV_IN_PROJECT=true
cp $(dirname $0)/sync-config.json "$TEMP/config.json"
cp $(dirname $0)/Pipfile* "$TEMP"
cd "$TEMP"

{
    set +x
    git clone "https://$TOKEN@github.com/Adjective-Object/blog.git"
    set -x
    pipenv install
    pipenv update
    pipenv run notion-sync --config "$TEMP/config.json"
    cd blog
    git status
    [[ `git status --porcelain` == "" ]] || {
	echo "found difference"
    	git add posts
	git commit -m "Auto-gen at $(date)"
	git push origin
    }

}

rm -rf "$TEMP"

