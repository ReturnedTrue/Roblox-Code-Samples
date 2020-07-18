# CONTRBITUING
To first get started clone and create a new branch in your terminal:
```
$ git clone https://github.com/ReturnedTrue/Roblox-Code-Samples.git
$ git branch my-new-sample
$ git checkout my-new-sample
```
Create your new sample, with the file naming scheme of Rojo (.server.lua for Scripts, .client.lua for LocalScripts, .module.lua for ModuleScripts) and place accordingly. You may use directories with the init file inside if necessary.
<br />
Be sure to add your comment detailsat the top of your file:
```lua
--[[
    Author: (Your Roblox username)
    Date Created:(dd/mm/yyyy)
    Name: (Sample name)
    Description: (Sample description)
--]]
```
<br />
<br />
Also, your sample must follow the layout of:
```
Options (given by the user of the sample)
Services
Instances
Modules
Constants
Variables
Functions
Setup
Connections
Invokes
```
Or for classes:
```
Options (given by the user of the sample)
Services
Instances
Modules
Constants
Variables
Class definition
Class constructor
Class methods
Init
```
Once done: add, commit, merge and push:
```
$ git add .
$ git commit -m "Add my new sample"
$ git merge my-new-sample
$ git push https://github.com/ReturnedTrue/Roblox-Code-Samples.git master
```
Be sure to pull if any new samples were added!