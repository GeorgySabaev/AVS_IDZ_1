  .file  "program.c"
  .intel_syntax noprefix
  .text
  .section  .rodata
.LC0:
  .string  "%d"
  .text
  .globl  read_array
  .type  read_array, @function
read_array:
  endbr64
  push  rbp
  mov  rbp, rsp
  sub  rsp, 32
  mov  DWORD PTR -20[rbp], edi    # DWORD PTR -20[rbp] - n
  mov  eax, DWORD PTR -20[rbp]
  cdqe
  sal  rax, 2
  mov  rdi, rax
  call  malloc@PLT
  mov  QWORD PTR -16[rbp], rax    # QWORD PTR -16[rbp] - A
  mov  DWORD PTR -4[rbp], 0       # DWORD PTR -4[rbp] - i
  jmp  .L2
.L3:
  mov  eax, DWORD PTR -4[rbp]
  cdqe
  lea  rdx, 0[0+rax*4]
  mov  rax, QWORD PTR -16[rbp]
  add  rax, rdx
  mov  rsi, rax
  lea  rax, .LC0[rip]
  mov  rdi, rax
  mov  eax, 0
  call  __isoc99_scanf@PLT
  add  DWORD PTR -4[rbp], 1
.L2:
  mov  eax, DWORD PTR -4[rbp]
  cmp  eax, DWORD PTR -20[rbp]
  jl  .L3
  mov  rax, QWORD PTR -16[rbp]
  leave
  ret
  .size  read_array, .-read_array
  .section  .rodata
.LC1:
  .string  "%d "
  .text
  .globl  print_array
  .type  print_array, @function
print_array:
  endbr64
  push  rbp
  mov  rbp, rsp
  sub  rsp, 32
  mov  QWORD PTR -24[rbp], rdi    # QWORD PTR -24[rbp] - arr
  mov  DWORD PTR -28[rbp], esi    # DWORD PTR -28[rbp] - n
  mov  DWORD PTR -4[rbp], 0       # DWORD PTR -4[rbp] - i
  jmp  .L6
.L7:
  mov  eax, DWORD PTR -4[rbp]
  cdqe
  lea  rdx, 0[0+rax*4]
  mov  rax, QWORD PTR -24[rbp]
  add  rax, rdx
  mov  eax, DWORD PTR [rax]
  mov  esi, eax
  lea  rax, .LC1[rip]
  mov  rdi, rax
  mov  eax, 0
  call  printf@PLT
  add  DWORD PTR -4[rbp], 1
.L6:
  mov  eax, DWORD PTR -4[rbp]
  cmp  eax, DWORD PTR -28[rbp]
  jl  .L7
  nop
  nop
  leave
  ret
  .size  print_array, .-print_array
  .globl  main
  .type  main, @function
main:
  endbr64
  push  rbp
  mov  rbp, rsp
  sub  rsp, 32
  lea  rax, -28[rbp]               # DWORD PTR -28[rbp] - n
  mov  rsi, rax
  lea  rax, .LC0[rip]
  mov  rdi, rax
  mov  eax, 0
  call  __isoc99_scanf@PLT
  mov  eax, DWORD PTR -28[rbp]     
  mov  edi, eax
  call  read_array
  mov  QWORD PTR -16[rbp], rax     # QWORD PTR -16[rbp] - A
  mov  eax, DWORD PTR -28[rbp]
  cdqe
  sal  rax, 2
  mov  rdi, rax
  call  malloc@PLT
  mov  QWORD PTR -24[rbp], rax     # QWORD PTR -24[rbp] - B
  mov  DWORD PTR -4[rbp], 0        # DWORD PTR -4[rbp] - len_b
  lea  rax, -32[rbp]               # DWORD PTR -32[rbp] - x
  mov  rsi, rax
  lea  rax, .LC0[rip]
  mov  rdi, rax
  mov  eax, 0
  call  __isoc99_scanf@PLT
  mov  DWORD PTR -8[rbp], 0        # DWORD PTR -8[rbp] - i
  jmp  .L9
.L11:
  mov  eax, DWORD PTR -8[rbp]
  cdqe
  lea  rdx, 0[0+rax*4]
  mov  rax, QWORD PTR -16[rbp]
  add  rax, rdx
  mov  eax, DWORD PTR [rax]
  mov  ecx, DWORD PTR -32[rbp]
  cdq
  idiv  ecx
  mov  eax, edx
  test  eax, eax
  jne  .L10
  mov  eax, DWORD PTR -8[rbp]
  cdqe
  lea  rdx, 0[0+rax*4]
  mov  rax, QWORD PTR -16[rbp]
  add  rax, rdx
  mov  edx, DWORD PTR -4[rbp]
  movsx  rdx, edx
  lea  rcx, 0[0+rdx*4]
  mov  rdx, QWORD PTR -24[rbp]
  add  rdx, rcx
  mov  eax, DWORD PTR [rax]
  mov  DWORD PTR [rdx], eax
  add  DWORD PTR -4[rbp], 1
.L10:
  add  DWORD PTR -8[rbp], 1
.L9:
  mov  eax, DWORD PTR -28[rbp]
  cmp  DWORD PTR -8[rbp], eax
  jl  .L11
  mov  edx, DWORD PTR -4[rbp]
  mov  rax, QWORD PTR -24[rbp]
  mov  esi, edx
  mov  rdi, rax
  call  print_array
  mov  rax, QWORD PTR -16[rbp]
  mov  rdi, rax
  call  free@PLT
  mov  rax, QWORD PTR -24[rbp]
  mov  rdi, rax
  call  free@PLT
  mov  eax, 0
  leave
  ret
  .size  main, .-main
  .ident  "GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
  .section  .note.GNU-stack,"",@progbits
  .section  .note.gnu.property,"a"
  .align 8
  .long  1f - 0f
  .long  4f - 1f
  .long  5
0:
  .string  "GNU"
1:
  .align 8
  .long  0xc0000002
  .long  3f - 2f
2:
  .long  0x3
3:
  .align 8
4:
