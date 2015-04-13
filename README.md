# GlusterFS Notes

## Environment

### Nodes

- Node 01:
    -  Hostname: gfs01
    -  RAM: 512MB
    -  eth0: DHCP
    -  eth1: 192.168.0.1
- Node 02:
    -  Hostname: gfs02
    -  RAM: 512MB
    -  eth0: DHCP
    -  eth1: 192.168.0.2
- Node 03:
    -  Hostname: gfs03
    -  RAM: 512MB
    -  eth0: DHCP
    -  eth1: 192.168.0.3
- Node 04:
    -  Hostname: gfs04
    -  RAM: 512MB
    -  eth0: DHCP
    -  eth1: 192.168.0.4

### Network

```
      +-------------------------------+
      | 10.0.2.0/24 (VBOX NET)        |
      +-------------------------------+
             ^       ^       ^       ^
             |       |       |       |
 eth0:  DHCP |  DHCP |  DHCP |  DHCP |
             |       |       |       |
       +-----+ +-----+ +-----+ +-----+
       |gfs01| |gfs02| |gfs03| |gfs04|
       +-----+ +-----+ +-----+ +-----+
             |       |       |       |
 eth1:   .01 |   .02 |   .03 |   .04 |
             |       |       |       |
             v       v       v       v
      +-------------------------------+
      | 192.168.100.0/24 (GFS NET)    |
      +-------------------------------+
```

## Concepts

## Configuring DNS Entries

## Installing GlusterFS

## Formatting and Mounting Bricks

## Creating a Distributed Volume

## Creating a Replicated Volume

## Creating a Distributed Replicated Volume
