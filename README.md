[![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/banner2-direct.svg)](https://vshymanskyy.github.io/StandWithUkraine/)

# Docker Retro Proxy
[![build](https://github.com/danclough/docker-retro-proxy/actions/workflows/build.yaml/badge.svg)](https://github.com/danclough/docker-retro-proxy/actions/workflows/build.yaml)

A Docker image for [DrKylstein's retro-proxy](https://github.com/DrKylstein/retro-proxy), a vintage-friendly proxy service.

# Quick Start
Run this container from the command line:
```
docker run -it -e PORT=8080 -p 8080:8080/tcp ghcr.io/danclough/retro-proxy
```
Or as a docker-compose service:
```
version: '2.4'
services:
  retro-proxy:
    image: ghcr.io/danclough/retro-proxy
    volumes:
      # If you need to override the default list of allowed sites
      - ./allowed.txt:/proxy/allowed.txt
    ports:
      - 3000:3000/tcp
    restart: unless-stopped
```

By default, `retro-proxy` listens on port 3000.  This can be mapped to another port in Docker, or can be overridden using an environment variable as described below.

# Configuration
The `retro-proxy` service can be configured using environment variables.
* __IP__: The IP address to listen on
  * __default:__ any
* __PORT__: The port to listen on
  * __default:__ 3000
* __NO_CSS__: If true, CSS will be blocked from all sites, except those on the allowed list.
  * __default:__ true
* __NO_JS__: If true, JavaScript will be blocked from all sites, except those on the allowed list.
  * __default:__ true
* __RESIZE_TO__: Maximum image size in pixels to return to client browsers.  Any images greater than this resolution will be resized and compressed.  Mostly benefits small screens and systems with less RAM.
  * __default:__ 800
* __SCALE_TO__: Maximum image size on the rendered pages.  Any images greater than this resolution will be scaled to this size in the resulting HTML.  Recommended if you have __NO_CSS__ enabled, as many sites rely on CSS to scale images to fit the screen.
  * __default:__ 608
* __ALLOWLIST__: The list of sites that are excluded from any CSS/JS stripping.
  * __default:__ allowed.txt
