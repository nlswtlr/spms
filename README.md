# spms - shorthand package manager scripts

## Problem

In various projects I have to use different node package manager: `npm`, `yarn` and `pnpm`.
Installing a node.js package with the wrong package manager and oops you just added e.g. a `package-lock.json` to the repo.

## Idea/Solution

Implement a script that does resolve the package manager command for you and provides shorthand syntax for common node.js scripts like `start`, `dev`, `build`, etc.

## Usage

1. clone the repo to your machine
2. add `export PATH="/path/to/the/repo:$PATH"` to your shell config e.g. `.bashrc`, `.zshrc`, etc.
3. use the script via `pm`: e.g. `pm i react`

### Script Mappings

```
s: "start"
d: "dev"
b: "build"
i: "install"
t: "test"
```
