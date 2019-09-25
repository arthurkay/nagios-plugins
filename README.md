# Crystaline Server Monitoring

The purpose of this document is to serve as a reference to what is monitored on each server maintained by Crystaline Technologies LTD.

*DISCLAIMER* Eventhough all services monitored have been include in this document, only scripts that use Nagios Remote Protocal Executor (NRPE) to talk to a remote server are documented.

### Mandatory Services

    • Web Server Apache/Httpd/Nginx etc)
    • Database (MySQL/MariaDB)
    • CPU
    • RAM
    • STORAGE
    • HTTP
    • SSH

### Optional Services  Monitored

    • VPN (Strongswan)
    • SMS Gateway (Kannel)

## Scripts Used

### Systemd Daemon Monitoring

Most of our servers are running on new architecture with systemd as the main daemon manager.
To this effect, we have a single script that monitors all systemd daemons.
All that needs to be done is passing the daemon name as an argument to [check-systemd-daemon.sh](check-systemd-daemon.sh) as shown below:

```bash
./check-systemd-daemon.sh httpd
```

The above command will monitor the HTTPD (apache for RHEL) status.

*NOTE*  `httpd`  can be replaced with any daemon managed by systemd.

The output translates to:

>OK active

>WARN failed

>CRITICAL inactive

### CPU

[cpu-utility.sh](cpu-utility.sh) is for monitoring CPU usage. Parameters are passed as percenatge values, e.g.

```bash
./cpu-utility.sh 40 60 90
```

The above command means:

>OK <= 40%

>WARN >= 60%

>CRITICAL >= 90%


### STORAGE

The disk storage is monitored by [check-storage.sh](check-storage.sh). Parameters are passed as percentage values e.g.

```bash
./check_storage.sh 60 80 90
```

The above command translates to:

>OK <= 60

>WARN >= 80

>CRITICAL > 90


### RAM

The computer memory is monitored by [check-custom-mem.sh](check-custom-mem.sh) script.
This script takes memory values in KB's as parameters of the monitoring thresholds e.g (A node with 8GB)

```bash
./check-custom-mem.sh 4000 6000 7000
```

The above translates to:

>OK <= 4000 KB

>WARN >= 6000 KB

>CRITICAL > 7000 KB


:Joy: Strive to keep up with time, uptime is the SysAdmin's currency.
>[`Arthur Kalikiti`](https://github.com/arthurkay)
