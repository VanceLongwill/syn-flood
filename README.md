# Denial of Service (DoS) attack example using IP spoofing and SYN flooding

This is a self contained example using docker-compose to orchestrate.

#### Machines (containers) involved

- `attacker_1` performs the SYN flooding, spoofing the IP of `victim_2` to give the appearance that `victim_2` is the attacker
- `victim_1` is the main victim of the DoS attack
- `victim_2` is the second victim and receives the reply packets from `victim_1`

##### Prerequisites

- Docker

### Run the attack

```bash
docker-compose up -d # start all the containers and begin the attack
```

### Monitor the attack by tailing the output

1. From the attacker's perspective

```bash
docker logs -f attacker
```

The logs show the output of the [hping3](https://tools.kali.org/information-gathering/hping3) command, used here to perform the SYN flooding

2. From the recipient of the SYN packets

```bash
docker logs -f victim_1
```

The `victim_1` container runs a [tshark](https://www.wireshark.org/docs/wsug_html_chunked/AppToolstshark.html) command which captures all TCP packets on the eth0 interface

3. From the second victim, to which the first victim replies

```bash
docker logs -f victim_2
```

### Shutdown the attack (and containers)

```bash
docker-compose down
```

### Change the type of attack / do it manually

Edit the `command` field in the `docker-compose.yml` file for each service. If it is removed entirely you will still be able to run commands 
by interacting with the container directly.

### Interact with containers

Open a bash shell on any of the containers using the below command (replacing $container_name with the actual name of the container e.g. `victim_1`)

```bash
docker exec -it $container_name
```

