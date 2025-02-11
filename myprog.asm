
_myprog:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"

int main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 0c             	sub    $0xc,%esp
printf(1, "My first userprogram");
  11:	68 e0 06 00 00       	push   $0x6e0
  16:	6a 01                	push   $0x1
  18:	e8 a3 03 00 00       	call   3c0 <printf>
exit();
  1d:	e8 50 02 00 00       	call   272 <exit>
  22:	66 90                	xchg   %ax,%ax
  24:	66 90                	xchg   %ax,%ax
  26:	66 90                	xchg   %ax,%ax
  28:	66 90                	xchg   %ax,%ax
  2a:	66 90                	xchg   %ax,%ax
  2c:	66 90                	xchg   %ax,%ax
  2e:	66 90                	xchg   %ax,%ax

00000030 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  30:	55                   	push   %ebp
  31:	89 e5                	mov    %esp,%ebp
  33:	53                   	push   %ebx
  34:	8b 45 08             	mov    0x8(%ebp),%eax
  37:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  3a:	89 c2                	mov    %eax,%edx
  3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  40:	83 c1 01             	add    $0x1,%ecx
  43:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  47:	83 c2 01             	add    $0x1,%edx
  4a:	84 db                	test   %bl,%bl
  4c:	88 5a ff             	mov    %bl,-0x1(%edx)
  4f:	75 ef                	jne    40 <strcpy+0x10>
    ;
  return os;
}
  51:	5b                   	pop    %ebx
  52:	5d                   	pop    %ebp
  53:	c3                   	ret    
  54:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  5a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000060 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	56                   	push   %esi
  64:	53                   	push   %ebx
  65:	8b 55 08             	mov    0x8(%ebp),%edx
  68:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  6b:	0f b6 02             	movzbl (%edx),%eax
  6e:	0f b6 19             	movzbl (%ecx),%ebx
  71:	84 c0                	test   %al,%al
  73:	75 1e                	jne    93 <strcmp+0x33>
  75:	eb 29                	jmp    a0 <strcmp+0x40>
  77:	89 f6                	mov    %esi,%esi
  79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
  80:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  83:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
  86:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  89:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  8d:	84 c0                	test   %al,%al
  8f:	74 0f                	je     a0 <strcmp+0x40>
  91:	89 f1                	mov    %esi,%ecx
  93:	38 d8                	cmp    %bl,%al
  95:	74 e9                	je     80 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  97:	29 d8                	sub    %ebx,%eax
}
  99:	5b                   	pop    %ebx
  9a:	5e                   	pop    %esi
  9b:	5d                   	pop    %ebp
  9c:	c3                   	ret    
  9d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  a0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
  a2:	29 d8                	sub    %ebx,%eax
}
  a4:	5b                   	pop    %ebx
  a5:	5e                   	pop    %esi
  a6:	5d                   	pop    %ebp
  a7:	c3                   	ret    
  a8:	90                   	nop
  a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000000b0 <strlen>:

uint
strlen(const char *s)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  b6:	80 39 00             	cmpb   $0x0,(%ecx)
  b9:	74 12                	je     cd <strlen+0x1d>
  bb:	31 d2                	xor    %edx,%edx
  bd:	8d 76 00             	lea    0x0(%esi),%esi
  c0:	83 c2 01             	add    $0x1,%edx
  c3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
  c7:	89 d0                	mov    %edx,%eax
  c9:	75 f5                	jne    c0 <strlen+0x10>
    ;
  return n;
}
  cb:	5d                   	pop    %ebp
  cc:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
  cd:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
  cf:	5d                   	pop    %ebp
  d0:	c3                   	ret    
  d1:	eb 0d                	jmp    e0 <memset>
  d3:	90                   	nop
  d4:	90                   	nop
  d5:	90                   	nop
  d6:	90                   	nop
  d7:	90                   	nop
  d8:	90                   	nop
  d9:	90                   	nop
  da:	90                   	nop
  db:	90                   	nop
  dc:	90                   	nop
  dd:	90                   	nop
  de:	90                   	nop
  df:	90                   	nop

000000e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	57                   	push   %edi
  e4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  ea:	8b 45 0c             	mov    0xc(%ebp),%eax
  ed:	89 d7                	mov    %edx,%edi
  ef:	fc                   	cld    
  f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  f2:	89 d0                	mov    %edx,%eax
  f4:	5f                   	pop    %edi
  f5:	5d                   	pop    %ebp
  f6:	c3                   	ret    
  f7:	89 f6                	mov    %esi,%esi
  f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000100 <strchr>:

char*
strchr(const char *s, char c)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	53                   	push   %ebx
 104:	8b 45 08             	mov    0x8(%ebp),%eax
 107:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 10a:	0f b6 10             	movzbl (%eax),%edx
 10d:	84 d2                	test   %dl,%dl
 10f:	74 1d                	je     12e <strchr+0x2e>
    if(*s == c)
 111:	38 d3                	cmp    %dl,%bl
 113:	89 d9                	mov    %ebx,%ecx
 115:	75 0d                	jne    124 <strchr+0x24>
 117:	eb 17                	jmp    130 <strchr+0x30>
 119:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 120:	38 ca                	cmp    %cl,%dl
 122:	74 0c                	je     130 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 124:	83 c0 01             	add    $0x1,%eax
 127:	0f b6 10             	movzbl (%eax),%edx
 12a:	84 d2                	test   %dl,%dl
 12c:	75 f2                	jne    120 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 12e:	31 c0                	xor    %eax,%eax
}
 130:	5b                   	pop    %ebx
 131:	5d                   	pop    %ebp
 132:	c3                   	ret    
 133:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000140 <gets>:

char*
gets(char *buf, int max)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	57                   	push   %edi
 144:	56                   	push   %esi
 145:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 146:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 148:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 14b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 14e:	eb 29                	jmp    179 <gets+0x39>
    cc = read(0, &c, 1);
 150:	83 ec 04             	sub    $0x4,%esp
 153:	6a 01                	push   $0x1
 155:	57                   	push   %edi
 156:	6a 00                	push   $0x0
 158:	e8 2d 01 00 00       	call   28a <read>
    if(cc < 1)
 15d:	83 c4 10             	add    $0x10,%esp
 160:	85 c0                	test   %eax,%eax
 162:	7e 1d                	jle    181 <gets+0x41>
      break;
    buf[i++] = c;
 164:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 168:	8b 55 08             	mov    0x8(%ebp),%edx
 16b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 16d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 16f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 173:	74 1b                	je     190 <gets+0x50>
 175:	3c 0d                	cmp    $0xd,%al
 177:	74 17                	je     190 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 179:	8d 5e 01             	lea    0x1(%esi),%ebx
 17c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 17f:	7c cf                	jl     150 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 181:	8b 45 08             	mov    0x8(%ebp),%eax
 184:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 188:	8d 65 f4             	lea    -0xc(%ebp),%esp
 18b:	5b                   	pop    %ebx
 18c:	5e                   	pop    %esi
 18d:	5f                   	pop    %edi
 18e:	5d                   	pop    %ebp
 18f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 190:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 193:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 195:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 199:	8d 65 f4             	lea    -0xc(%ebp),%esp
 19c:	5b                   	pop    %ebx
 19d:	5e                   	pop    %esi
 19e:	5f                   	pop    %edi
 19f:	5d                   	pop    %ebp
 1a0:	c3                   	ret    
 1a1:	eb 0d                	jmp    1b0 <stat>
 1a3:	90                   	nop
 1a4:	90                   	nop
 1a5:	90                   	nop
 1a6:	90                   	nop
 1a7:	90                   	nop
 1a8:	90                   	nop
 1a9:	90                   	nop
 1aa:	90                   	nop
 1ab:	90                   	nop
 1ac:	90                   	nop
 1ad:	90                   	nop
 1ae:	90                   	nop
 1af:	90                   	nop

000001b0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	56                   	push   %esi
 1b4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1b5:	83 ec 08             	sub    $0x8,%esp
 1b8:	6a 00                	push   $0x0
 1ba:	ff 75 08             	pushl  0x8(%ebp)
 1bd:	e8 f0 00 00 00       	call   2b2 <open>
  if(fd < 0)
 1c2:	83 c4 10             	add    $0x10,%esp
 1c5:	85 c0                	test   %eax,%eax
 1c7:	78 27                	js     1f0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 1c9:	83 ec 08             	sub    $0x8,%esp
 1cc:	ff 75 0c             	pushl  0xc(%ebp)
 1cf:	89 c3                	mov    %eax,%ebx
 1d1:	50                   	push   %eax
 1d2:	e8 f3 00 00 00       	call   2ca <fstat>
 1d7:	89 c6                	mov    %eax,%esi
  close(fd);
 1d9:	89 1c 24             	mov    %ebx,(%esp)
 1dc:	e8 b9 00 00 00       	call   29a <close>
  return r;
 1e1:	83 c4 10             	add    $0x10,%esp
 1e4:	89 f0                	mov    %esi,%eax
}
 1e6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1e9:	5b                   	pop    %ebx
 1ea:	5e                   	pop    %esi
 1eb:	5d                   	pop    %ebp
 1ec:	c3                   	ret    
 1ed:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 1f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1f5:	eb ef                	jmp    1e6 <stat+0x36>
 1f7:	89 f6                	mov    %esi,%esi
 1f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000200 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	53                   	push   %ebx
 204:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 207:	0f be 11             	movsbl (%ecx),%edx
 20a:	8d 42 d0             	lea    -0x30(%edx),%eax
 20d:	3c 09                	cmp    $0x9,%al
 20f:	b8 00 00 00 00       	mov    $0x0,%eax
 214:	77 1f                	ja     235 <atoi+0x35>
 216:	8d 76 00             	lea    0x0(%esi),%esi
 219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 220:	8d 04 80             	lea    (%eax,%eax,4),%eax
 223:	83 c1 01             	add    $0x1,%ecx
 226:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 22a:	0f be 11             	movsbl (%ecx),%edx
 22d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 230:	80 fb 09             	cmp    $0x9,%bl
 233:	76 eb                	jbe    220 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 235:	5b                   	pop    %ebx
 236:	5d                   	pop    %ebp
 237:	c3                   	ret    
 238:	90                   	nop
 239:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000240 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	56                   	push   %esi
 244:	53                   	push   %ebx
 245:	8b 5d 10             	mov    0x10(%ebp),%ebx
 248:	8b 45 08             	mov    0x8(%ebp),%eax
 24b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 24e:	85 db                	test   %ebx,%ebx
 250:	7e 14                	jle    266 <memmove+0x26>
 252:	31 d2                	xor    %edx,%edx
 254:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 258:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 25c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 25f:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 262:	39 da                	cmp    %ebx,%edx
 264:	75 f2                	jne    258 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 266:	5b                   	pop    %ebx
 267:	5e                   	pop    %esi
 268:	5d                   	pop    %ebp
 269:	c3                   	ret    

0000026a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 26a:	b8 01 00 00 00       	mov    $0x1,%eax
 26f:	cd 40                	int    $0x40
 271:	c3                   	ret    

00000272 <exit>:
SYSCALL(exit)
 272:	b8 02 00 00 00       	mov    $0x2,%eax
 277:	cd 40                	int    $0x40
 279:	c3                   	ret    

0000027a <wait>:
SYSCALL(wait)
 27a:	b8 03 00 00 00       	mov    $0x3,%eax
 27f:	cd 40                	int    $0x40
 281:	c3                   	ret    

00000282 <pipe>:
SYSCALL(pipe)
 282:	b8 04 00 00 00       	mov    $0x4,%eax
 287:	cd 40                	int    $0x40
 289:	c3                   	ret    

0000028a <read>:
SYSCALL(read)
 28a:	b8 05 00 00 00       	mov    $0x5,%eax
 28f:	cd 40                	int    $0x40
 291:	c3                   	ret    

00000292 <write>:
SYSCALL(write)
 292:	b8 10 00 00 00       	mov    $0x10,%eax
 297:	cd 40                	int    $0x40
 299:	c3                   	ret    

0000029a <close>:
SYSCALL(close)
 29a:	b8 15 00 00 00       	mov    $0x15,%eax
 29f:	cd 40                	int    $0x40
 2a1:	c3                   	ret    

000002a2 <kill>:
SYSCALL(kill)
 2a2:	b8 06 00 00 00       	mov    $0x6,%eax
 2a7:	cd 40                	int    $0x40
 2a9:	c3                   	ret    

000002aa <exec>:
SYSCALL(exec)
 2aa:	b8 07 00 00 00       	mov    $0x7,%eax
 2af:	cd 40                	int    $0x40
 2b1:	c3                   	ret    

000002b2 <open>:
SYSCALL(open)
 2b2:	b8 0f 00 00 00       	mov    $0xf,%eax
 2b7:	cd 40                	int    $0x40
 2b9:	c3                   	ret    

000002ba <mknod>:
SYSCALL(mknod)
 2ba:	b8 11 00 00 00       	mov    $0x11,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <unlink>:
SYSCALL(unlink)
 2c2:	b8 12 00 00 00       	mov    $0x12,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <fstat>:
SYSCALL(fstat)
 2ca:	b8 08 00 00 00       	mov    $0x8,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <link>:
SYSCALL(link)
 2d2:	b8 13 00 00 00       	mov    $0x13,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <mkdir>:
SYSCALL(mkdir)
 2da:	b8 14 00 00 00       	mov    $0x14,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <chdir>:
SYSCALL(chdir)
 2e2:	b8 09 00 00 00       	mov    $0x9,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <dup>:
SYSCALL(dup)
 2ea:	b8 0a 00 00 00       	mov    $0xa,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <getpid>:
SYSCALL(getpid)
 2f2:	b8 0b 00 00 00       	mov    $0xb,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <sbrk>:
SYSCALL(sbrk)
 2fa:	b8 0c 00 00 00       	mov    $0xc,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <sleep>:
SYSCALL(sleep)
 302:	b8 0d 00 00 00       	mov    $0xd,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <uptime>:
SYSCALL(uptime)
 30a:	b8 0e 00 00 00       	mov    $0xe,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <cps>:
SYSCALL(cps)
 312:	b8 16 00 00 00       	mov    $0x16,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    
 31a:	66 90                	xchg   %ax,%ax
 31c:	66 90                	xchg   %ax,%ax
 31e:	66 90                	xchg   %ax,%ax

00000320 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	57                   	push   %edi
 324:	56                   	push   %esi
 325:	53                   	push   %ebx
 326:	89 c6                	mov    %eax,%esi
 328:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 32b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 32e:	85 db                	test   %ebx,%ebx
 330:	74 7e                	je     3b0 <printint+0x90>
 332:	89 d0                	mov    %edx,%eax
 334:	c1 e8 1f             	shr    $0x1f,%eax
 337:	84 c0                	test   %al,%al
 339:	74 75                	je     3b0 <printint+0x90>
    neg = 1;
    x = -xx;
 33b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 33d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 344:	f7 d8                	neg    %eax
 346:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 349:	31 ff                	xor    %edi,%edi
 34b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 34e:	89 ce                	mov    %ecx,%esi
 350:	eb 08                	jmp    35a <printint+0x3a>
 352:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 358:	89 cf                	mov    %ecx,%edi
 35a:	31 d2                	xor    %edx,%edx
 35c:	8d 4f 01             	lea    0x1(%edi),%ecx
 35f:	f7 f6                	div    %esi
 361:	0f b6 92 fc 06 00 00 	movzbl 0x6fc(%edx),%edx
  }while((x /= base) != 0);
 368:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 36a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 36d:	75 e9                	jne    358 <printint+0x38>
  if(neg)
 36f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 372:	8b 75 c0             	mov    -0x40(%ebp),%esi
 375:	85 c0                	test   %eax,%eax
 377:	74 08                	je     381 <printint+0x61>
    buf[i++] = '-';
 379:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 37e:	8d 4f 02             	lea    0x2(%edi),%ecx
 381:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 385:	8d 76 00             	lea    0x0(%esi),%esi
 388:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 38b:	83 ec 04             	sub    $0x4,%esp
 38e:	83 ef 01             	sub    $0x1,%edi
 391:	6a 01                	push   $0x1
 393:	53                   	push   %ebx
 394:	56                   	push   %esi
 395:	88 45 d7             	mov    %al,-0x29(%ebp)
 398:	e8 f5 fe ff ff       	call   292 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 39d:	83 c4 10             	add    $0x10,%esp
 3a0:	39 df                	cmp    %ebx,%edi
 3a2:	75 e4                	jne    388 <printint+0x68>
    putc(fd, buf[i]);
}
 3a4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3a7:	5b                   	pop    %ebx
 3a8:	5e                   	pop    %esi
 3a9:	5f                   	pop    %edi
 3aa:	5d                   	pop    %ebp
 3ab:	c3                   	ret    
 3ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 3b0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3b2:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 3b9:	eb 8b                	jmp    346 <printint+0x26>
 3bb:	90                   	nop
 3bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003c0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	57                   	push   %edi
 3c4:	56                   	push   %esi
 3c5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3c6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3c9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3cc:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3cf:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3d2:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3d5:	0f b6 1e             	movzbl (%esi),%ebx
 3d8:	83 c6 01             	add    $0x1,%esi
 3db:	84 db                	test   %bl,%bl
 3dd:	0f 84 b0 00 00 00    	je     493 <printf+0xd3>
 3e3:	31 d2                	xor    %edx,%edx
 3e5:	eb 39                	jmp    420 <printf+0x60>
 3e7:	89 f6                	mov    %esi,%esi
 3e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 3f0:	83 f8 25             	cmp    $0x25,%eax
 3f3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 3f6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 3fb:	74 18                	je     415 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 3fd:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 400:	83 ec 04             	sub    $0x4,%esp
 403:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 406:	6a 01                	push   $0x1
 408:	50                   	push   %eax
 409:	57                   	push   %edi
 40a:	e8 83 fe ff ff       	call   292 <write>
 40f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 412:	83 c4 10             	add    $0x10,%esp
 415:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 418:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 41c:	84 db                	test   %bl,%bl
 41e:	74 73                	je     493 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 420:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 422:	0f be cb             	movsbl %bl,%ecx
 425:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 428:	74 c6                	je     3f0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 42a:	83 fa 25             	cmp    $0x25,%edx
 42d:	75 e6                	jne    415 <printf+0x55>
      if(c == 'd'){
 42f:	83 f8 64             	cmp    $0x64,%eax
 432:	0f 84 f8 00 00 00    	je     530 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 438:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 43e:	83 f9 70             	cmp    $0x70,%ecx
 441:	74 5d                	je     4a0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 443:	83 f8 73             	cmp    $0x73,%eax
 446:	0f 84 84 00 00 00    	je     4d0 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 44c:	83 f8 63             	cmp    $0x63,%eax
 44f:	0f 84 ea 00 00 00    	je     53f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 455:	83 f8 25             	cmp    $0x25,%eax
 458:	0f 84 c2 00 00 00    	je     520 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 45e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 461:	83 ec 04             	sub    $0x4,%esp
 464:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 468:	6a 01                	push   $0x1
 46a:	50                   	push   %eax
 46b:	57                   	push   %edi
 46c:	e8 21 fe ff ff       	call   292 <write>
 471:	83 c4 0c             	add    $0xc,%esp
 474:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 477:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 47a:	6a 01                	push   $0x1
 47c:	50                   	push   %eax
 47d:	57                   	push   %edi
 47e:	83 c6 01             	add    $0x1,%esi
 481:	e8 0c fe ff ff       	call   292 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 486:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 48a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 48d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 48f:	84 db                	test   %bl,%bl
 491:	75 8d                	jne    420 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 493:	8d 65 f4             	lea    -0xc(%ebp),%esp
 496:	5b                   	pop    %ebx
 497:	5e                   	pop    %esi
 498:	5f                   	pop    %edi
 499:	5d                   	pop    %ebp
 49a:	c3                   	ret    
 49b:	90                   	nop
 49c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 4a0:	83 ec 0c             	sub    $0xc,%esp
 4a3:	b9 10 00 00 00       	mov    $0x10,%ecx
 4a8:	6a 00                	push   $0x0
 4aa:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 4ad:	89 f8                	mov    %edi,%eax
 4af:	8b 13                	mov    (%ebx),%edx
 4b1:	e8 6a fe ff ff       	call   320 <printint>
        ap++;
 4b6:	89 d8                	mov    %ebx,%eax
 4b8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4bb:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 4bd:	83 c0 04             	add    $0x4,%eax
 4c0:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4c3:	e9 4d ff ff ff       	jmp    415 <printf+0x55>
 4c8:	90                   	nop
 4c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 4d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 4d3:	8b 18                	mov    (%eax),%ebx
        ap++;
 4d5:	83 c0 04             	add    $0x4,%eax
 4d8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
 4db:	b8 f5 06 00 00       	mov    $0x6f5,%eax
 4e0:	85 db                	test   %ebx,%ebx
 4e2:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
 4e5:	0f b6 03             	movzbl (%ebx),%eax
 4e8:	84 c0                	test   %al,%al
 4ea:	74 23                	je     50f <printf+0x14f>
 4ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4f0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4f3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 4f6:	83 ec 04             	sub    $0x4,%esp
 4f9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 4fb:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4fe:	50                   	push   %eax
 4ff:	57                   	push   %edi
 500:	e8 8d fd ff ff       	call   292 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 505:	0f b6 03             	movzbl (%ebx),%eax
 508:	83 c4 10             	add    $0x10,%esp
 50b:	84 c0                	test   %al,%al
 50d:	75 e1                	jne    4f0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 50f:	31 d2                	xor    %edx,%edx
 511:	e9 ff fe ff ff       	jmp    415 <printf+0x55>
 516:	8d 76 00             	lea    0x0(%esi),%esi
 519:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 520:	83 ec 04             	sub    $0x4,%esp
 523:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 526:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 529:	6a 01                	push   $0x1
 52b:	e9 4c ff ff ff       	jmp    47c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 530:	83 ec 0c             	sub    $0xc,%esp
 533:	b9 0a 00 00 00       	mov    $0xa,%ecx
 538:	6a 01                	push   $0x1
 53a:	e9 6b ff ff ff       	jmp    4aa <printf+0xea>
 53f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 542:	83 ec 04             	sub    $0x4,%esp
 545:	8b 03                	mov    (%ebx),%eax
 547:	6a 01                	push   $0x1
 549:	88 45 e4             	mov    %al,-0x1c(%ebp)
 54c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 54f:	50                   	push   %eax
 550:	57                   	push   %edi
 551:	e8 3c fd ff ff       	call   292 <write>
 556:	e9 5b ff ff ff       	jmp    4b6 <printf+0xf6>
 55b:	66 90                	xchg   %ax,%ax
 55d:	66 90                	xchg   %ax,%ax
 55f:	90                   	nop

00000560 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 560:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 561:	a1 94 09 00 00       	mov    0x994,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 566:	89 e5                	mov    %esp,%ebp
 568:	57                   	push   %edi
 569:	56                   	push   %esi
 56a:	53                   	push   %ebx
 56b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 56e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 570:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 573:	39 c8                	cmp    %ecx,%eax
 575:	73 19                	jae    590 <free+0x30>
 577:	89 f6                	mov    %esi,%esi
 579:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 580:	39 d1                	cmp    %edx,%ecx
 582:	72 1c                	jb     5a0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 584:	39 d0                	cmp    %edx,%eax
 586:	73 18                	jae    5a0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 588:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 58a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 58c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 58e:	72 f0                	jb     580 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 590:	39 d0                	cmp    %edx,%eax
 592:	72 f4                	jb     588 <free+0x28>
 594:	39 d1                	cmp    %edx,%ecx
 596:	73 f0                	jae    588 <free+0x28>
 598:	90                   	nop
 599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 5a0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5a3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5a6:	39 d7                	cmp    %edx,%edi
 5a8:	74 19                	je     5c3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 5aa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5ad:	8b 50 04             	mov    0x4(%eax),%edx
 5b0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5b3:	39 f1                	cmp    %esi,%ecx
 5b5:	74 23                	je     5da <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5b7:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5b9:	a3 94 09 00 00       	mov    %eax,0x994
}
 5be:	5b                   	pop    %ebx
 5bf:	5e                   	pop    %esi
 5c0:	5f                   	pop    %edi
 5c1:	5d                   	pop    %ebp
 5c2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 5c3:	03 72 04             	add    0x4(%edx),%esi
 5c6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5c9:	8b 10                	mov    (%eax),%edx
 5cb:	8b 12                	mov    (%edx),%edx
 5cd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 5d0:	8b 50 04             	mov    0x4(%eax),%edx
 5d3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5d6:	39 f1                	cmp    %esi,%ecx
 5d8:	75 dd                	jne    5b7 <free+0x57>
    p->s.size += bp->s.size;
 5da:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 5dd:	a3 94 09 00 00       	mov    %eax,0x994
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 5e2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5e5:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5e8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 5ea:	5b                   	pop    %ebx
 5eb:	5e                   	pop    %esi
 5ec:	5f                   	pop    %edi
 5ed:	5d                   	pop    %ebp
 5ee:	c3                   	ret    
 5ef:	90                   	nop

000005f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 5f0:	55                   	push   %ebp
 5f1:	89 e5                	mov    %esp,%ebp
 5f3:	57                   	push   %edi
 5f4:	56                   	push   %esi
 5f5:	53                   	push   %ebx
 5f6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 5f9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 5fc:	8b 15 94 09 00 00    	mov    0x994,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 602:	8d 78 07             	lea    0x7(%eax),%edi
 605:	c1 ef 03             	shr    $0x3,%edi
 608:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 60b:	85 d2                	test   %edx,%edx
 60d:	0f 84 a3 00 00 00    	je     6b6 <malloc+0xc6>
 613:	8b 02                	mov    (%edx),%eax
 615:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 618:	39 cf                	cmp    %ecx,%edi
 61a:	76 74                	jbe    690 <malloc+0xa0>
 61c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 622:	be 00 10 00 00       	mov    $0x1000,%esi
 627:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 62e:	0f 43 f7             	cmovae %edi,%esi
 631:	ba 00 80 00 00       	mov    $0x8000,%edx
 636:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 63c:	0f 46 da             	cmovbe %edx,%ebx
 63f:	eb 10                	jmp    651 <malloc+0x61>
 641:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 648:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 64a:	8b 48 04             	mov    0x4(%eax),%ecx
 64d:	39 cf                	cmp    %ecx,%edi
 64f:	76 3f                	jbe    690 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 651:	39 05 94 09 00 00    	cmp    %eax,0x994
 657:	89 c2                	mov    %eax,%edx
 659:	75 ed                	jne    648 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 65b:	83 ec 0c             	sub    $0xc,%esp
 65e:	53                   	push   %ebx
 65f:	e8 96 fc ff ff       	call   2fa <sbrk>
  if(p == (char*)-1)
 664:	83 c4 10             	add    $0x10,%esp
 667:	83 f8 ff             	cmp    $0xffffffff,%eax
 66a:	74 1c                	je     688 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 66c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 66f:	83 ec 0c             	sub    $0xc,%esp
 672:	83 c0 08             	add    $0x8,%eax
 675:	50                   	push   %eax
 676:	e8 e5 fe ff ff       	call   560 <free>
  return freep;
 67b:	8b 15 94 09 00 00    	mov    0x994,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 681:	83 c4 10             	add    $0x10,%esp
 684:	85 d2                	test   %edx,%edx
 686:	75 c0                	jne    648 <malloc+0x58>
        return 0;
 688:	31 c0                	xor    %eax,%eax
 68a:	eb 1c                	jmp    6a8 <malloc+0xb8>
 68c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 690:	39 cf                	cmp    %ecx,%edi
 692:	74 1c                	je     6b0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 694:	29 f9                	sub    %edi,%ecx
 696:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 699:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 69c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 69f:	89 15 94 09 00 00    	mov    %edx,0x994
      return (void*)(p + 1);
 6a5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6ab:	5b                   	pop    %ebx
 6ac:	5e                   	pop    %esi
 6ad:	5f                   	pop    %edi
 6ae:	5d                   	pop    %ebp
 6af:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 6b0:	8b 08                	mov    (%eax),%ecx
 6b2:	89 0a                	mov    %ecx,(%edx)
 6b4:	eb e9                	jmp    69f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 6b6:	c7 05 94 09 00 00 98 	movl   $0x998,0x994
 6bd:	09 00 00 
 6c0:	c7 05 98 09 00 00 98 	movl   $0x998,0x998
 6c7:	09 00 00 
    base.s.size = 0;
 6ca:	b8 98 09 00 00       	mov    $0x998,%eax
 6cf:	c7 05 9c 09 00 00 00 	movl   $0x0,0x99c
 6d6:	00 00 00 
 6d9:	e9 3e ff ff ff       	jmp    61c <malloc+0x2c>
