char shellcode[] = "\x48\x31\xff\x00\x00"           

                   "\xb0\x3c\x00\x00\x00"                  

                   "\x0f\x05";                  



int main()

{
  long *ret;
  ret = (long *)&ret;
  (*ret) = (long)shellcode;
}
