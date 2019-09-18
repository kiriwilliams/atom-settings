fs = require 'fs'
module.exports =
  # Your config schema
  config:
    LightTheme:
      type: 'boolean'
      default: false
      description: 'Use a set of color suitable with a light theme (need to restart atom)'

atom.config.onDidChange 'atom-json.LightTheme', ({newValue, oldValue}) ->
   if(newValue)
     fs.createReadStream(atom.packages.getPackageDirPaths() + '/atom-json/styles/light-variables').pipe(fs.createWriteStream(atom.packages.getPackageDirPaths() + '/atom-json-color/styles/json-color-variables.less'));
   else
     fs.createReadStream(atom.packages.getPackageDirPaths() + '/atom-json/styles/dark-variables').pipe(fs.createWriteStream(atom.packages.getPackageDirPaths() + '/atom-json-color/styles/json-color-variables.less'));
