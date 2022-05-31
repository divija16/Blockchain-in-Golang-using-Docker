
# Blockchain in Golang using Docker

The link to the medium article explaining the code is [here](https://divijaswetha.medium.com/blockchain-in-golang-using-docker-f610178a449b)

# Installation and Usage


## Dependencies
Install [Go](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04)

Install [Docker](https://docs.docker.com/get-docker/)


### Set up the server and run the blockchain

Run the following commands in a new terminal. 
Clone this repository:
```
$ git clone https://github.com/divija-swetha/Blockchain-in-Golang-using-Docker.git
$ cd Blockchain-in-Golang-using-Docker
$ go run Blockchain-in-Golang-using-Docker.go
Server listening on localhost:5000.

```

### Blockchain
Running the blockchain on the server
```
$ curl localhost:5000/chain
```

### Mining Blocks
To see the mining process on the selectedserver address, run the following command
```
$ curl localhost:5000/mine
```

### Adding a New Transaction
To add a new transaction on blockchain, we need the block content i.e., the sender address, the receiver address and the amount sent from sender to the receiver. A new transaction can be added in a block mined by a miner at a perticular server address.
```
$ curl -X POST -H "Content-Type: application/json" -d '{
"sender": "66ad49fc75114203-8db2c886c13339ea",
"recipient": "98c438146f674768a1bb0e225a75311f",
"amount": 50
}' localhost:5000/transactions/new
```

### Adding a new node into the network
The new server addresses need to be registered to the previous address to form a network.
```
$ curl -X POST -H "Content-Type: application/json" -d '{
"nodes": ["http://localhost:5001","http://localhost:5002"]
}' localhost:5000/nodes/register
```

### Resolve nodes
If there are more than one nodes, then, run the following command to resolve nodes.
```
$ curl localhost:5000/nodes/resolve 
```

# Adding more instances

We can add more instances to the blockchain network using the following commands.
```
$ go run blockchain.go -p 5001
$ go run blockchain.go -p 5002
$ go run blockchain.go -p 5003
``` 

# Docker
The code can be executed using Docker using the following commands.

```
$ docker build -t blockchain .
$ docker run --rm -p 9000:5000 blockchain
$ docker run --rm -p 9001:5000 blockchain
$ docker run --rm -p 9002:5000 blockchain
```
<!-- 
# Contributors

- Divija Swetha Gadiraju <dgadiraj@purdue.edu> -->

# License
[MIT LICENSE](LICENSE)

