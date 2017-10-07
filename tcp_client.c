#include <stdio.h>
#include <stdlib.h>
#include <arpa/inet.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
  struct sockaddr_in server;   
  int socket0;          
  char buf[32];         
  int n;


  socket0 = socket(AF_INET, SOCK_STREAM, 0);  

  server.sin_family = AF_INET;           
  server.sin_addr.s_addr = inet_addr(argv[1]);  
  server.sin_port = htons(atoi(argv[2]));          

  connect(socket0, (struct sockaddr *)&server, sizeof(server)); 

  n = read(socket0, buf, sizeof(buf));       

  printf("read from server: %s\n", buf);       

  close(socket0);    

  return 0;       
}
