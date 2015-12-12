# docker-dropbox

docker-dropbox is a [Docker][1] container that runs the linux version of [Dropbox][2].

## Quick Start

*Step 1*
Clone, cd to the directory, then build the container with:
`docker build -t dropbox .`

*Step 2*
Run the docker container non-daemonised:

`docker run -t --name my-dropbox dropbox`

The container will start running and output a link to connect it to your Dropbox account.

```
This computer isn't linked to any Dropbox account...
Please visit https://www.dropbox.com/cli_link_nonce?nonce=xxx to link this device.
```

Visit the link in a browser and sign it to your Dropbox account to complete the link. You should now see the output change to:
`This computer is now linked to Dropbox. Welcome <Name>`

Hit Ctrl^C to exit the interactive session.

*Step 3*
The container is now running and linked to your Dropbox. 

## Dropbox folder location
The container Dropbox folder is:

`/root/Dropbox`

Any files placed in here will be sycned.

## CLI
The [CLI][3] is available at /bin/dropbox.py

For example:

> View sync status

`docker exec my-dropbox /bin/dropbox.py status`

> Selective Sync (exclude a folder from sync)

`docker exec my-dropbox /bin/dropbox.py exclude add /root/Docker/excludeme`

> See all commands

`docker exec my-dropbox /bin/dropbox.py help`

You can also connect to the docker container to run commands:
`docker exec -it my-dropbox /bin/bash`

 [1]: https://www.docker.com/
 [2]: https://www.dropbox.com/
 [3]: http://www.dropboxwiki.com/tips-and-tricks/using-the-official-dropbox-command-line-interface-cli
