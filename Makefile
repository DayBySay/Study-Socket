all: server client

server:
	gcc ./tcp_server.c -o tcp_server

client:
	gcc ./tcp_client.c -o tcp_client
