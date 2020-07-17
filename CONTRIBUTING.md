To first get started clone and create a new branch in your terminal:
```
$ git clone https://github.com/ReturnedTrue/Roblox-Code-Samples.git
$ git branch my-new-sample
$ git checkout my-new-sample
```
Create your new sample, with the naming scheme of Rojo files (.server.lua for Scripts, .client.lua for LocalScripts, .module.lua for ModuleScripts). 
<br />
Your sample must follow the layout of:
```
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
Services
Instances
Modules
Constants
Variables
Class definition
Class functions
Init
```
Once done, merge and push:
```
$ git merge my-new-sample
$ git push https://github.com/ReturnedTrue/Roblox-Code-Samples.git master
```