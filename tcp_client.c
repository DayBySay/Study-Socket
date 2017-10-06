#include <stdio.h>
#include <arpa/inet.h>
#include <unistd.h>

int main() {
  struct sockaddr_in server;   
  int socket0;          
  char buf[32];         
  int n;

  socket0 = socket(AF_INET, SOCK_STREAM, 0);  

  server.sin_family = AF_INET;           
  server.sin_port = htons(10080);          
  server.sin_addr.s_addr = inet_addr("127.0.0.1");  

  connect(socket0, (struct sockaddr *)&server, sizeof(server)); 

  n = read(socket0, buf, sizeof(buf));       

  printf("read from server: %s\n", buf);       

  close(socket0);    

  return 0;       
}
