# docker-dropbox

> **This container is no longer maintained. Please use something like [janeczku/dropbox](https://hub.docker.com/r/janeczku/dropbox/) instead**

docker-dropbox is a [Docker][1] container that runs the linux version of [Dropbox][2].

### Quick Start

1. Run the docker container:

    `docker run -d --name dropbox bennetimo/docker-dropbox`


2. The container will start running, but it is not yet linked to your dropbox account:

    Run `docker logs dropbox` and it will give you a link like:

    ```
    This computer isn't linked to any Dropbox account...
    Please visit https://www.dropbox.com/cli_link_nonce?nonce=xxx to link this device.
    ```

    Visit the link in a browser and sign it to your Dropbox account to complete the setup. 

3. Run `docker logs dropbox` again after a short while and you should see something like:

    `This computer is now linked to Dropbox. Welcome <Name>`

Done! The container is now running and linked to your Dropbox :)

### Dropbox folder location
The container Dropbox folder is:

`/root/Dropbox`

Any files placed in here will be synced.

### CLI
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
