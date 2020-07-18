# CONTRIBUTING
To first get started add a remote for the repo, clone and create a new branch in your terminal:
```
$ git remote add rcs https://github.com/ReturnedTrue/Roblox-Code-Samples.git
$ git clone rcs
$ git branch my-new-sample
$ git checkout my-new-sample
```

Create your new sample, with the file naming scheme of Rojo (.server.lua for Scripts, .client.lua for LocalScripts, .module.lua for ModuleScripts) and place accordingly. You may use directories with the init file inside if necessary.
<br />
<br />
Be sure to add your comment details at the top of your file:

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
Tweens
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
Tweens
Class definition
Class constructor
Class methods
Init
```

Once done: add, commit and push to your branch:

```
$ git add .
$ git commit -m "Add my new sample"
$ git push rcs my-new-sample
```

Be sure to pull beforehand if any new samples were added!

```
$ git pull rcs master
```

Now on GitHub, start a PR and we'll get back to you shortly.