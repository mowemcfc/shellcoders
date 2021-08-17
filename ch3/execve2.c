// gcc -o execve2 execve2.c -z execstack

char shellcode[] = "\x50\x48\x31\xd2\x48\x31\xf6\x48\xbb\x2f\x62\x69\x6e\x2f"
		   "\x2f\x73\x68\x53\x54\x5f\xb0\x3b\x0f\x05";

int main(void)
{

  long *ret;
  ret = (char *)&ret + 24;
  //char *p = (char *)ret; // this local pushes the ret addr back by 1-byte
  ret = (long *) ret;
  (*ret) = (long)shellcode;

}

