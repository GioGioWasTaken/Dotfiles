# bmks
browser independent bookmark manager

It's a fork of the
[suckless bmks dmenu script](https://tools.suckless.org/dmenu/scripts/)

## Usage

type `bmks help` for instructions on how to use.

### Example keybindings

using [sxhkd](https://github.com/baskerville/sxhkd) config.

```
# opens the default ${BROWSER} with the default ${PREFERED_LAUNCHER}
# firefox and dmenu
super + b; b
	bmks

# opens the chosen url with chromium using the default ${PREFERED_LAUNCHER}
super + b; n
	BROWSER=chromium bmks

# opens hidden links (links you don't visit often) using the default settings
super + b; v
	HIDDEN=1 bmks

# copies the url to clipboard and paste it if a text area is selected
super + b; c
	bmks clip
```


# urls file

[example bookmarks file](./urls)

## license
i don't really know what license the original code uses since it's not
mentioned on suckless' site, so i will assume it was public domain.

[Unlicense](./LICENSE)
