# bash-util-github-release

## What

An example project for creating Github releases with artifacts.

## How

1.  Create a Github workflow that produces release assets in the dir `./dist`.
2.  Copy `github-release.sh` and run it as in the deploy-step of the example
    workflow.
3.  Trigger the workflow:

    *   **Pushing to a branch:**  
        The script will create (or replace) a _nightly_ release.

    *   **Create a tag _tag name_ in git and push it to Github:**  
        The script will create the respective _tag name_ release in Github.

    *   **Creating a release in Github:**  
        The script will reuse the release created in Github.

    In all cases the script uploads the asset files to the release.
