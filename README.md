Proximate/Proxy
===

Introduction
---

This is a Dockerised PHP record-playback HTTP proxy server with support for HTTPS sites, based on
[Proximate/Requester](https://github.com/halfer/proximate-requester). The components of this
system are intended to be modular so you can pick and choose which pieces you want.

Usage
---

The Dockerised version of the proxy listens on an internal IP address, which is exposed on
the host machine as localhost:8081. The internal cache folder is mapped to ./cache relative
to the current working directory. To launch the proxy, simply run:

    ./host-start.sh

If you want to listen on a different address/port on the host, then this can be customised in
the above shell command.
