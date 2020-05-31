# Custom Alfred iTerm Scripts

AppleScript for [iTerm2](https://iterm2.com/) [Alfred](https://www.alfredapp.com/) integration.

## Use

1. [Copy the script to your clipboard](#copy-the-script).
2. Open Alfred Preferences (call Alfred and press <kbd>⌘</kbd><kbd>,</kbd>).
3. Navigate to Features → Terminal → Custom.
4. Set `Application` to `Custom`.
4. Select the text in the box.
4. Paste.

## Optional property settings:

1. Set `open_in_new_window` to `true` to always open command in new window.
1. Set `new_session_on_startup` to `true` to always open a new session/tab if Alfred starts the app.
1. Set `always_activate` to `false` if you don't want to raise and switch keyboard focus to show output.

### Copy the script

To copy the script to your clipboard, run the following command.

```
curl --silent 'https://raw.githubusercontent.com/vitorgalvao/custom-alfred-iterm-scripts/master/custom_iterm_script.applescript' | pbcopy
```

#### Credits

Script written and maintained by [Vítor Galvão](https://github.com/vitorgalvao/). Previous versions by [Stuart Ryan](http://stuartryan.com).

#### License

The Unlicense (Public Domain, essentially)
