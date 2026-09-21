# Agent Development Guide

Guidelines for AI coding agents working on `environments`, the Docker images Deepnote runs notebooks in.

## Documentation

These images are what users get by default, so a change here is usually a user-visible change. Before opening a pull request, check whether it makes any documentation stale, and update it in the same pull request:

- `python/readme.md` - the supported tags, what the images contain, and how to build on top of them. Keep the tag list accurate when versions are added or dropped.
- The nearest readme next to what you changed (`gpu/`, `ir/`, `python/*`)
- User-facing documentation is not in this repository: it lives as Markdown under `docs/` in the public [`deepnote`](https://github.com/deepnote/deepnote) repository and is published at https://deepnote.com/docs. Changes to Python versions, pre-installed packages, or the default environment need a matching pull request there (`docs/default-environment.md`, `docs/pre-installed-packages.md`, `docs/custom-environment.md`).

Update only the documentation your change actually affects.

## Pull Requests

Keep each pull request as simple and clean as possible: one purpose per pull request, the smallest diff that achieves it, and no unrelated dependency bumps riding along with a behavior change.
