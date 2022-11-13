# ad-telescope-extensions.nvim

A set of telescope extensions, which build on [telescope-extension-maker](https://github.com/adoyle-h/telescope-extension-maker.nvim).

## Dependencies

- [telescope](https://github.com/nvim-telescope/telescope.nvim)
- [telescope-extension-maker.nvim](https://github.com/adoyle-h/telescope-extension-maker.nvim)

## Installation

### Using vim-plug

```lua
Plug 'nvim-telescope/telescope.nvim'
Plug 'adoyle-h/ad-telescope-extension-maker.nvim'
Plug 'adoyle-h/ad-telescope-extensions.nvim'
```

### Using packer.nvim

```lua
use { 'nvim-telescope/telescope.nvim' }
use { 'adoyle-h/telescope-extension-maker.nvim' }
use { 'adoyle-h/ad-telescope-extensions.nvim' }
```

### Using dein

```lua
call dein#add('nvim-telescope/telescope.nvim')
call dein#add('adoyle-h/telescope-extension-maker.nvim')
call dein#add('adoyle-h/ad-telescope-extensions.nvim')
```

## Usages

```lua
require('telescope').setup()
require('ad-telescope-extensions').setup {
  enable = 'all', -- 'all' or { 'extension-name' }
}
```

### Options

You can pass opts to each extension.

```lua
require('ad-telescope-extensions').setup {
  enable = 'all', -- 'all' or { 'extension-name' }
  env = {
    opts = { -- opts for "env" extension
      highlights = { --
        ADTelExt_env_key = { fg = '#93B11A' },
      },
    }
  }
}
```

### Alias

```lua
require('ad-telescope-extensions').setup {
  enable = 'all',
  floaterm = {
    alias = 'terminals' -- `:Telescope terminals` is available. `:Telescope floaterm` is unavailable.
  }
}
```

## Extensions

See [./lua/ad-telescope-extensions/exts/](./lua/ad-telescope-extensions/exts)

### changes

Print the change list.  A ">" character indicates the current position.
Press `<CR>` to move to this line.

![changes.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/ad-telescope-extensions.nvim/changes.png)

### colors

List color names and RGB values.

![colors.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/ad-telescope-extensions.nvim/colors.png)

### env

List environment variables.

![env.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/ad-telescope-extensions.nvim/env.png)

### floaterm

List [floaterm](https://github.com/voldikss/vim-floaterm). Press `<CR>` to toggle terminal window.

Item Format: `[<bufnr>:<floaterm-name>]: <buf-name>`

![floaterm.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/ad-telescope-extensions.nvim/floaterm.png)

### message

List messages.

![message.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/ad-telescope-extensions.nvim/message.png)

### packpath

List packpath.

![packpath.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/ad-telescope-extensions.nvim/packpath.png)

### query

Input a vimscript and view the output.

![query.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/ad-telescope-extensions.nvim/query.png)

### rtp

List rtp.

![rtp.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/ad-telescope-extensions.nvim/rtp.png)

### scriptnames

List scriptnames.

![scriptnames.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/ad-telescope-extensions.nvim/scriptnames.png)

### time

Show current date and time

![time.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/ad-telescope-extensions.nvim/time.png)

### windows

Show tabpages and windows. Press `<CR>` to goto the tabpage or window you choosed.

![windows.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/ad-telescope-extensions.nvim/windows.png)

### zk

List zk notes. Depends on [zk-nvim](https://github.com/mickael-menu/zk-nvim).

![zk.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/ad-telescope-extensions.nvim/zk.png)

## Suggestion, Bug Reporting, Contributing

Any suggestions and contributions are always welcome. Please open an [issue][] to contact with me.

If you want to submit a new feature, please open an [issue][] for feature request to talk about your design.

If you want to submit a bug fix, search related issues first, and then open a Pull Requst.

The git commit message must follow the [Conventional Commits v1.0.0](https://www.conventionalcommits.org/en/v1.0.0/).

## Versions

See [tags][].
The versions follows the rules of [SemVer 2.0.0](http://semver.org/).

## Copyright and License

Copyright 2022 ADoyle (adoyle.h@gmail.com) Some Rights Reserved.
The project is licensed under the **Apache License Version 2.0**.

See the [LICENSE][] file for the specific language governing permissions and limitations under the License.

See the [NOTICE][] file distributed with this work for additional information regarding copyright ownership.

## Other Projects

[Other lua projects](https://github.com/adoyle-h?tab=repositories&q=&type=source&language=lua&sort=stargazers) created by me.


<!-- Links -->

[LICENSE]: ./LICENSE
[NOTICE]: ./NOTICE
[tags]: https://github.com/adoyle-h/ad-telescope-extensions.nvim/tags
[issue]: https://github.com/adoyle-h/ad-telescope-extensions.nvim/issues
