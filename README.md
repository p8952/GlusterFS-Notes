# GlusterFS Notes

* [Environment](#environment)
	* [Nodes](#nodes)
	* [Network](#network)
* [Concepts](#concepts)
	* [Vagrant](#vagrant)
	* [GlusterFS](#glusterfs)
* [Installing GlusterFS](#installing-glusterfs)
* [Formatting and Mounting Bricks](#formatting-and-mounting-bricks)
* [Creating a Distributed Volume](#creating-a-distributed-volume)
* [Creating a Replicated Volume](#creating-a-replicated-volume)
* [Creating a Distributed Replicated Volume](#creating-a-distributed-replicated-volume)

## Environment

### Nodes

```
- gfs01
	- IP: 192.168.0.1
	- Role: Gluster Server & Client
- gfs02
	- IP: 192.168.0.2
	- Role: Gluster Server & Client
- gfs03
	- IP: 192.168.0.3
	- Role: Gluster Server
- gfs04
	- IP: 192.168.0.4
	- Role: Gluster Server
```

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

### Vagrant

### GlusterFS

## Installing GlusterFS

## Formatting and Mounting Bricks

## Creating a Distributed Volume

## Creating a Replicated Volume

## Creating a Distributed Replicated Volume
