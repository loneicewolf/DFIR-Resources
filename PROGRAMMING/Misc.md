# Misc.

## Windows MSGBox C src
```c
// i686-w64-mingw32-gcc -o M msgbox.c
#include <stdio.h>
#include <windows.h>
int main(int argc, char *argv[]){
  if(argc != 3){
    printf("usage: %s  MESSAGE  TITLE",argv[0]);
  }
  // MessageBox function (winuser.h)
  //  Displays a modal dialog box that contains
  //    a system icon,
  //    a set of buttons,
  //    and a brief application-specific message,
  /// such as status or error information.
  /// The message box returns an integer value that indicates which button the user clicked.
  // ref https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-messagebox
  MessageBox(
              0,       /*   [in, optional] HWND    hWnd,      */
              argv[2], /*   [in, optional] LPCTSTR lpText,    */
              argv[1], /*   [in, optional] LPCTSTR lpCaption, */
              1        /*   [in]           UINT    uType      */
             );
  return 0;
}
```




### Internal Links
- https://gist.github.com/loneicewolf/c588f95287c55454ef6a5c28e8babd30
- 
- 



### External Links
- https://kernel.embedromix.ro/
- 
- 



