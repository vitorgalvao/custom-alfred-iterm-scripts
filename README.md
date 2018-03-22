# custom-iterm-applescripts-for-alfred
This repository contains custom Applescripts that can be put into the Alfred --> Features --> Terminal --> Custom section to enable the correct operation of iTerm with Alfred.

Unfortunately as many people will know, when iTerm's Applescript functionality changes it can often break integration with Alfred.

### Note: Check your iTerm version (`iTerm2` → `About iTerm2`) and follow the instructions corresponding to your version below.

## How to install the scripts
### Video instructions
Check out the official YouTube video, it will give you a quick two and a half minute rundown.
[![ScreenShot](http://akamai.technicalnotebook.com/alfred-workflow-images/custom-iterm-applescripts/integrate_iterm_alfredapp_custom_terminal_script.png)](https://www.youtube.com/watch?v=_XlJFCbmVUs)

### Text instructions

1. Run one of these terminal commands to copy the Applescript for your iTerm2 version to your clipboard.
  
  + For `3.1.1`:

  ```bash
  curl --silent 'https://raw.githubusercontent.com/stuartcryan/custom-iterm-applescripts-for-alfred/master/custom_iterm_script_iterm_3.1.1.applescript' | pbcopy
  ```

  + For `2.9`:

  ```bash
  curl --silent 'https://raw.githubusercontent.com/stuartcryan/custom-iterm-applescripts-for-alfred/master/custom_iterm_script_iterm_2.9.applescript' | pbcopy
  ```

  + For `2.1.1`:

  ```bash
  curl --silent 'https://raw.githubusercontent.com/stuartcryan/custom-iterm-applescripts-for-alfred/master/custom_iterm_script_iterm_2.1.1.applescript' | pbcopy
  ```

2. Paste it under `Alfred Preferences` → `Features` → `Terminal / Shell` → `Application` → `Custom`.

![Copy to preferences gif](http://i.imgur.com/n3VDO8l.gif)

## Specific Version Notes

If you have iTerm in a location other than /Applications/iTerm.app make sure you update the Applescript templates to match that (see inline comments).

## Donations
If you would like to say thanks and donate which will give me ever more life giving caffeine Diet Coke, some Cake, or to put towards a shiny new gadget you can [donate to me via Paypal](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=JM6E65M2GLXHE). 

<a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=JM6E65M2GLXHE" target="_blank"><img src="https://www.paypalobjects.com/en_AU/i/btn/btn_donateCC_LG.gif" border="0" alt="PayPal — The safer, easier way to pay online."></a>


## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## Credits

Scripts created and maintained by [Stuart Ryan](http://stuartryan.com). If you would like to get into contact you can do so via:
* [@StuartCRyan on Twitter](http://twitter.com/stuartcryan)
* [Stuart Ryan on LinkedIn](https://au.linkedin.com/in/stuartcryan)
* [Technical Notebook Blog](http://technicalnotebook.com)

## License

Released under the GNU GENERAL PUBLIC LICENSE Version 2, June 1991
