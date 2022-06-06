<h1 align="center">TERRARIA SERVER</h1>
<center>

> A script for <i>lazy persons like me</i> to start a terraria server in aarch64.
</center>

## Prerequisites

- Any machine with `aarch64 architecture`, if you don't have one with this architecture.. What are you doing here?
- Install the zip package using `sudo apt install zip`.

- The required package is installed once and is included in the script.


## 0. How to use

Download the [Script](https://github.com/EvilG-MC/terraria-aarch64/blob/main/start-terraria.sh) and follow this steps:

> Navigate to the folder where you want the server and follow the next steps:
```sh
	0). mkdir Server
	1). cd Server
	2). wget https://terraria.org/api/download/pc-dedicated-server/terraria-server-1436.zip
	3). unzip terraria-server-1436.zip
	4). cd 1436
	5). cd Linux
```
<i>In this case, the version of the server are `1.4.3.6` which is the latest version as of the date I wrote this. (06/06/2022)</i>

## 1. Permissions

Give permissions to the server files using:
```sh
chmod +x TerrariaServer.bin.x86_64
chmod +x TerrariaServer.exe
```

Just in case:
```sh
chmod +x TerrariaServer
```

For the script:
```sh
chmod +x start-terraria.sh
```

## 2. Start server
```sh
sh start-terraria.sh
```

## 3. Done
```sh
There, if you did everything right, it should work.
```

_Made with ❤️ by [JustEvil](https://twitter.com/NewJustEvil)_
