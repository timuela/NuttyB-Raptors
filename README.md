# Requirements

## 1. Runtime management

### Windows

install [scoop](https://github.com/ScoopInstaller/Scoop?tab=readme-ov-file#installation)

```cmd
scoop install vfox make
```

### Linux/Mac

install [asdf](https://asdf-vm.com/guide/getting-started.html)

## 2. dependencies

```cmd
make install
```

### Manual / If that doesn't work / troubleshooting:

### Windows

```
vfox install nodejs@23
vfox use nodejs@23 --project
```

### Linux/Mac

```sh
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs 22.9.0
```

### Both

```sh
npm install -g bun ts-node
bun install
```

# Usage

Several commands (targets) are in the [Makefile](Makefile)

Prepares the base64url tweaks from the [lua folder](lua) into the [base64url folder](base64url) and copies the spads commands to clipboard:

```shell
make luatob64
```

Converts base64url tweaks back into lua and tries format it somewhat similarly:

```shell
make b64tolua
```

# Release new version to [The Paste Machine Spreadsheet](https://docs.google.com/spreadsheets/d/1QSVsuAAMhBrhiZdTihVfSCwPzbbZWDLCtXWP23CU0ko)

1. Copy sheet (Meaning to make a new sheet within the spreadsheet. Using Google terminology one spreadsheet can have multiple sheets).
2. Execute `make luatob64` in the nuttyb repo (what is done above).
3. Paste your clipboard in an unoccupied area in the new sheet.
4. Cut the cell contents from that paste and replace the old ones. Tweakdefs3 on replacing tweakdefs3 etc.
5. Add the new version to the dropdowns sheet (v1.52 for example).
6. Update doc link in the top left cell of the first sheet.

# Todo

- Make release target to build/update paste machine web app
- Build historical json as a base64url archive. And for supporting the version dropdown feature.
