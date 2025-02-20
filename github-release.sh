#!/bin/bash

printf "verify github auth status:\n"
gh auth status

# VERSION="v$(grep -E '^version = "(.+)"' Cargo.toml | sed 's/.\+"\(.\+\)"/\1/')"
# gh release create "$VERSION"

printf "\ntrigger action:\n%s\n%s\n%s\n" \
    $GITHUB_REF \
    $GITHUB_REF_NAME \
    $GITHUB_REF_TYPE

if [[ $GITHUB_REF_TYPE == 'tag' ]]; then
    printf "TODO: create stable release\n"
elif [[ $GITHUB_REF_TYPE == 'branch' ]]; then
    printf "TODO: create nightly release\n"
fi

printf "TODO: upload artifacts\n"
