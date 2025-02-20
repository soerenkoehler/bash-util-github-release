#!/bin/bash

printf "verify github auth status:\n"
gh auth status

if [[ $GITHUB_REF_TYPE == 'tag' ]]; then
    printf "create stable release %s (will fail if exists)\n" $GITHUB_REF_NAME
    gh release create --verify-tag $GITHUB_REF_NAME ./dist/*
elif [[ $GITHUB_REF_TYPE == 'branch' ]]; then
    printf "create nightly release (will delete old release if exists)\n"
    gh release delete --cleanup-tag --yes nightly ||\
    gh release create --target $GITHUB_REF_NAME nightly ./dist/*
fi
