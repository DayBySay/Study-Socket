#include <stdio.h>
#include <arpa/inet.h>
#include <unistd.h>

int main() {
    int socket0;
    struct sockaddr_in address;
    struct sockaddr_in client;
    unsigned length;
    int tcp_socket;

    socket0 = socket(AF_INET, SOCK_STREAM, 0);

    address.sin_family = AF_INET;
    address.sin_port = htons(10080);
    address.sin_addr.s_addr = INADDR_ANY;
    bind(socket0, (struct sockaddr*)&address, sizeof(address));

    listen(socket0, 5);

    printf("Waiting TCP client... \n");
    length = sizeof(client);
    tcp_socket = accept(socket0, (struct sockaddr*)&client, &length);

    write(tcp_socket, "Received", 8);
    close(tcp_socket);
    close(socket0);
    printf("Done.");
    return 0;
}
