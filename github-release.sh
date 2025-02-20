#!/bin/bash

printf "verify github auth status:\n"
gh auth status

if [[ $GITHUB_REF_TYPE == 'tag' ]]; then

    printf "create stable release %s (will fail if exists)\n" $GITHUB_REF_NAME

    RELEASE=$GITHUB_REF_NAME
    gh release create \
        -t $RELEASE \
        --verify-tag \
        $RELEASE

elif [[ $GITHUB_REF_TYPE == 'branch' ]]; then

    printf "create nightly release on branch %s (will delete old release if exists)\n" $GITHUB_REF_NAME

    RELEASE=nightly
    gh release delete \
        --cleanup-tag \
        --yes \
        "$RELEASE" \
    || gh release create \
        -t "Nightly-$(date -I)" \
        --target $GITHUB_REF \
        --latest false
        $RELEASE
fi

if [[ -e ./dist ]]; then
    printf "found ./dist folder => uploading artifacts to %s\n" $RELEASE
fi
