format pe; console
 entry start
 include 'win32ax.inc'
 section '.code' code readable executable

start:
mov esi,[i]
 OuterLoop:
     mov edx,[size]
     sub edx,1
     cmp esi,edx
     jge endOuter
     mov edi,[j]
     IneerLoop:
     mov ecx,edx
     sub ecx,esi
     cmp edi,ecx
     jge endinner
     mov eax,[arr+4*edi]
     mov ebp,[arr+4*edi+4]
     cmp eax,ebp
     jg Swap
     inc edi
     jmp IneerLoop

Swap:
mov [arr+4*edi],ebp
mov [arr+4*edi+4],eax
inc edi
jmp IneerLoop







endinner:
inc esi ;i++
jmp OuterLoop


endOuter:
   startprintloop:
   mov esi,[z] ; z
   cmp esi,[size]
   jge exist
   cinvoke printf, f4,[arr+esi*4] ; arr[i]
   inc [z];z++
   jmp startprintloop


exist:
 cinvoke scanf, f4, vard
   invoke ExitProcess, 0






section '.data' data readable writeable
arr dd  5,8,7,4,1,9
size dd 6
i dd 0
j dd 0
z dd 0
vard dd ?
f4 db ' %d ',0


section '.idata' import data readable writeable
library msvcrt, 'msvcrt.dll', kernel32, 'kernel32.dll'
import msvcrt, printf, 'printf', getchar,'getchar', scanf,'scanf'
import kernel32, ExitProcess,'ExitProcess'