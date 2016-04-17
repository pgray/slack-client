# slack-client
Slack in a can! (ubuntu slack client in a docker container)

```
docker built -t slack .
./slack.sh
```

This is currently very ugly and sometimes crashes with the following messages:
```
Creating Slack Application
(electron) submitUrl is deprecated. Use submitURL instead.
(electron) ipc module is deprecated. Use require("electron").ipcMain instead.
[Error: Failed to get path]
(electron) loadUrl is deprecated. Use loadURL instead.
Failed to get crash dump id.
Report Id: 
Bus error (core dumped)
```

Pretty sure I need to add another device or two, but I'll leave it as is for now.

I'm running Arch so I didn't feel like unpacking the deb or installing apt.
