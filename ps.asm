
_ps:     file format elf32-i386


Disassembly of section .text:

00000000 <ps>:
#include "types.h"

#include "user.h"

int ps()
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 08             	sub    $0x8,%esp

cps();
   6:	e8 e7 02 00 00       	call   2f2 <cps>
exit();
   b:	e8 42 02 00 00       	call   252 <exit>

00000010 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  10:	55                   	push   %ebp
  11:	89 e5                	mov    %esp,%ebp
  13:	53                   	push   %ebx
  14:	8b 45 08             	mov    0x8(%ebp),%eax
  17:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  1a:	89 c2                	mov    %eax,%edx
  1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  20:	83 c1 01             	add    $0x1,%ecx
  23:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  27:	83 c2 01             	add    $0x1,%edx
  2a:	84 db                	test   %bl,%bl
  2c:	88 5a ff             	mov    %bl,-0x1(%edx)
  2f:	75 ef                	jne    20 <strcpy+0x10>
    ;
  return os;
}
  31:	5b                   	pop    %ebx
  32:	5d                   	pop    %ebp
  33:	c3                   	ret    
  34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000040 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  40:	55                   	push   %ebp
  41:	89 e5                	mov    %esp,%ebp
  43:	56                   	push   %esi
  44:	53                   	push   %ebx
  45:	8b 55 08             	mov    0x8(%ebp),%edx
  48:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  4b:	0f b6 02             	movzbl (%edx),%eax
  4e:	0f b6 19             	movzbl (%ecx),%ebx
  51:	84 c0                	test   %al,%al
  53:	75 1e                	jne    73 <strcmp+0x33>
  55:	eb 29                	jmp    80 <strcmp+0x40>
  57:	89 f6                	mov    %esi,%esi
  59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
  60:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  63:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
  66:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  69:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  6d:	84 c0                	test   %al,%al
  6f:	74 0f                	je     80 <strcmp+0x40>
  71:	89 f1                	mov    %esi,%ecx
  73:	38 d8                	cmp    %bl,%al
  75:	74 e9                	je     60 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  77:	29 d8                	sub    %ebx,%eax
}
  79:	5b                   	pop    %ebx
  7a:	5e                   	pop    %esi
  7b:	5d                   	pop    %ebp
  7c:	c3                   	ret    
  7d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  80:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
  82:	29 d8                	sub    %ebx,%eax
}
  84:	5b                   	pop    %ebx
  85:	5e                   	pop    %esi
  86:	5d                   	pop    %ebp
  87:	c3                   	ret    
  88:	90                   	nop
  89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000090 <strlen>:

uint
strlen(const char *s)
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  96:	80 39 00             	cmpb   $0x0,(%ecx)
  99:	74 12                	je     ad <strlen+0x1d>
  9b:	31 d2                	xor    %edx,%edx
  9d:	8d 76 00             	lea    0x0(%esi),%esi
  a0:	83 c2 01             	add    $0x1,%edx
  a3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
  a7:	89 d0                	mov    %edx,%eax
  a9:	75 f5                	jne    a0 <strlen+0x10>
    ;
  return n;
}
  ab:	5d                   	pop    %ebp
  ac:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
  ad:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
  af:	5d                   	pop    %ebp
  b0:	c3                   	ret    
  b1:	eb 0d                	jmp    c0 <memset>
  b3:	90                   	nop
  b4:	90                   	nop
  b5:	90                   	nop
  b6:	90                   	nop
  b7:	90                   	nop
  b8:	90                   	nop
  b9:	90                   	nop
  ba:	90                   	nop
  bb:	90                   	nop
  bc:	90                   	nop
  bd:	90                   	nop
  be:	90                   	nop
  bf:	90                   	nop

000000c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	57                   	push   %edi
  c4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  ca:	8b 45 0c             	mov    0xc(%ebp),%eax
  cd:	89 d7                	mov    %edx,%edi
  cf:	fc                   	cld    
  d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  d2:	89 d0                	mov    %edx,%eax
  d4:	5f                   	pop    %edi
  d5:	5d                   	pop    %ebp
  d6:	c3                   	ret    
  d7:	89 f6                	mov    %esi,%esi
  d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000000e0 <strchr>:

char*
strchr(const char *s, char c)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	53                   	push   %ebx
  e4:	8b 45 08             	mov    0x8(%ebp),%eax
  e7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
  ea:	0f b6 10             	movzbl (%eax),%edx
  ed:	84 d2                	test   %dl,%dl
  ef:	74 1d                	je     10e <strchr+0x2e>
    if(*s == c)
  f1:	38 d3                	cmp    %dl,%bl
  f3:	89 d9                	mov    %ebx,%ecx
  f5:	75 0d                	jne    104 <strchr+0x24>
  f7:	eb 17                	jmp    110 <strchr+0x30>
  f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 100:	38 ca                	cmp    %cl,%dl
 102:	74 0c                	je     110 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 104:	83 c0 01             	add    $0x1,%eax
 107:	0f b6 10             	movzbl (%eax),%edx
 10a:	84 d2                	test   %dl,%dl
 10c:	75 f2                	jne    100 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 10e:	31 c0                	xor    %eax,%eax
}
 110:	5b                   	pop    %ebx
 111:	5d                   	pop    %ebp
 112:	c3                   	ret    
 113:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000120 <gets>:

char*
gets(char *buf, int max)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	57                   	push   %edi
 124:	56                   	push   %esi
 125:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 126:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 128:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 12b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 12e:	eb 29                	jmp    159 <gets+0x39>
    cc = read(0, &c, 1);
 130:	83 ec 04             	sub    $0x4,%esp
 133:	6a 01                	push   $0x1
 135:	57                   	push   %edi
 136:	6a 00                	push   $0x0
 138:	e8 2d 01 00 00       	call   26a <read>
    if(cc < 1)
 13d:	83 c4 10             	add    $0x10,%esp
 140:	85 c0                	test   %eax,%eax
 142:	7e 1d                	jle    161 <gets+0x41>
      break;
    buf[i++] = c;
 144:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 148:	8b 55 08             	mov    0x8(%ebp),%edx
 14b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 14d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 14f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 153:	74 1b                	je     170 <gets+0x50>
 155:	3c 0d                	cmp    $0xd,%al
 157:	74 17                	je     170 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 159:	8d 5e 01             	lea    0x1(%esi),%ebx
 15c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 15f:	7c cf                	jl     130 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 161:	8b 45 08             	mov    0x8(%ebp),%eax
 164:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 168:	8d 65 f4             	lea    -0xc(%ebp),%esp
 16b:	5b                   	pop    %ebx
 16c:	5e                   	pop    %esi
 16d:	5f                   	pop    %edi
 16e:	5d                   	pop    %ebp
 16f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 170:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 173:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 175:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 179:	8d 65 f4             	lea    -0xc(%ebp),%esp
 17c:	5b                   	pop    %ebx
 17d:	5e                   	pop    %esi
 17e:	5f                   	pop    %edi
 17f:	5d                   	pop    %ebp
 180:	c3                   	ret    
 181:	eb 0d                	jmp    190 <stat>
 183:	90                   	nop
 184:	90                   	nop
 185:	90                   	nop
 186:	90                   	nop
 187:	90                   	nop
 188:	90                   	nop
 189:	90                   	nop
 18a:	90                   	nop
 18b:	90                   	nop
 18c:	90                   	nop
 18d:	90                   	nop
 18e:	90                   	nop
 18f:	90                   	nop

00000190 <stat>:

int
stat(const char *n, struct stat *st)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	56                   	push   %esi
 194:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 195:	83 ec 08             	sub    $0x8,%esp
 198:	6a 00                	push   $0x0
 19a:	ff 75 08             	pushl  0x8(%ebp)
 19d:	e8 f0 00 00 00       	call   292 <open>
  if(fd < 0)
 1a2:	83 c4 10             	add    $0x10,%esp
 1a5:	85 c0                	test   %eax,%eax
 1a7:	78 27                	js     1d0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 1a9:	83 ec 08             	sub    $0x8,%esp
 1ac:	ff 75 0c             	pushl  0xc(%ebp)
 1af:	89 c3                	mov    %eax,%ebx
 1b1:	50                   	push   %eax
 1b2:	e8 f3 00 00 00       	call   2aa <fstat>
 1b7:	89 c6                	mov    %eax,%esi
  close(fd);
 1b9:	89 1c 24             	mov    %ebx,(%esp)
 1bc:	e8 b9 00 00 00       	call   27a <close>
  return r;
 1c1:	83 c4 10             	add    $0x10,%esp
 1c4:	89 f0                	mov    %esi,%eax
}
 1c6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1c9:	5b                   	pop    %ebx
 1ca:	5e                   	pop    %esi
 1cb:	5d                   	pop    %ebp
 1cc:	c3                   	ret    
 1cd:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 1d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1d5:	eb ef                	jmp    1c6 <stat+0x36>
 1d7:	89 f6                	mov    %esi,%esi
 1d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001e0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	53                   	push   %ebx
 1e4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 1e7:	0f be 11             	movsbl (%ecx),%edx
 1ea:	8d 42 d0             	lea    -0x30(%edx),%eax
 1ed:	3c 09                	cmp    $0x9,%al
 1ef:	b8 00 00 00 00       	mov    $0x0,%eax
 1f4:	77 1f                	ja     215 <atoi+0x35>
 1f6:	8d 76 00             	lea    0x0(%esi),%esi
 1f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 200:	8d 04 80             	lea    (%eax,%eax,4),%eax
 203:	83 c1 01             	add    $0x1,%ecx
 206:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 20a:	0f be 11             	movsbl (%ecx),%edx
 20d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 210:	80 fb 09             	cmp    $0x9,%bl
 213:	76 eb                	jbe    200 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 215:	5b                   	pop    %ebx
 216:	5d                   	pop    %ebp
 217:	c3                   	ret    
 218:	90                   	nop
 219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000220 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	56                   	push   %esi
 224:	53                   	push   %ebx
 225:	8b 5d 10             	mov    0x10(%ebp),%ebx
 228:	8b 45 08             	mov    0x8(%ebp),%eax
 22b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 22e:	85 db                	test   %ebx,%ebx
 230:	7e 14                	jle    246 <memmove+0x26>
 232:	31 d2                	xor    %edx,%edx
 234:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 238:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 23c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 23f:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 242:	39 da                	cmp    %ebx,%edx
 244:	75 f2                	jne    238 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 246:	5b                   	pop    %ebx
 247:	5e                   	pop    %esi
 248:	5d                   	pop    %ebp
 249:	c3                   	ret    

0000024a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 24a:	b8 01 00 00 00       	mov    $0x1,%eax
 24f:	cd 40                	int    $0x40
 251:	c3                   	ret    

00000252 <exit>:
SYSCALL(exit)
 252:	b8 02 00 00 00       	mov    $0x2,%eax
 257:	cd 40                	int    $0x40
 259:	c3                   	ret    

0000025a <wait>:
SYSCALL(wait)
 25a:	b8 03 00 00 00       	mov    $0x3,%eax
 25f:	cd 40                	int    $0x40
 261:	c3                   	ret    

00000262 <pipe>:
SYSCALL(pipe)
 262:	b8 04 00 00 00       	mov    $0x4,%eax
 267:	cd 40                	int    $0x40
 269:	c3                   	ret    

0000026a <read>:
SYSCALL(read)
 26a:	b8 05 00 00 00       	mov    $0x5,%eax
 26f:	cd 40                	int    $0x40
 271:	c3                   	ret    

00000272 <write>:
SYSCALL(write)
 272:	b8 10 00 00 00       	mov    $0x10,%eax
 277:	cd 40                	int    $0x40
 279:	c3                   	ret    

0000027a <close>:
SYSCALL(close)
 27a:	b8 15 00 00 00       	mov    $0x15,%eax
 27f:	cd 40                	int    $0x40
 281:	c3                   	ret    

00000282 <kill>:
SYSCALL(kill)
 282:	b8 06 00 00 00       	mov    $0x6,%eax
 287:	cd 40                	int    $0x40
 289:	c3                   	ret    

0000028a <exec>:
SYSCALL(exec)
 28a:	b8 07 00 00 00       	mov    $0x7,%eax
 28f:	cd 40                	int    $0x40
 291:	c3                   	ret    

00000292 <open>:
SYSCALL(open)
 292:	b8 0f 00 00 00       	mov    $0xf,%eax
 297:	cd 40                	int    $0x40
 299:	c3                   	ret    

0000029a <mknod>:
SYSCALL(mknod)
 29a:	b8 11 00 00 00       	mov    $0x11,%eax
 29f:	cd 40                	int    $0x40
 2a1:	c3                   	ret    

000002a2 <unlink>:
SYSCALL(unlink)
 2a2:	b8 12 00 00 00       	mov    $0x12,%eax
 2a7:	cd 40                	int    $0x40
 2a9:	c3                   	ret    

000002aa <fstat>:
SYSCALL(fstat)
 2aa:	b8 08 00 00 00       	mov    $0x8,%eax
 2af:	cd 40                	int    $0x40
 2b1:	c3                   	ret    

000002b2 <link>:
SYSCALL(link)
 2b2:	b8 13 00 00 00       	mov    $0x13,%eax
 2b7:	cd 40                	int    $0x40
 2b9:	c3                   	ret    

000002ba <mkdir>:
SYSCALL(mkdir)
 2ba:	b8 14 00 00 00       	mov    $0x14,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <chdir>:
SYSCALL(chdir)
 2c2:	b8 09 00 00 00       	mov    $0x9,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <dup>:
SYSCALL(dup)
 2ca:	b8 0a 00 00 00       	mov    $0xa,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <getpid>:
SYSCALL(getpid)
 2d2:	b8 0b 00 00 00       	mov    $0xb,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <sbrk>:
SYSCALL(sbrk)
 2da:	b8 0c 00 00 00       	mov    $0xc,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <sleep>:
SYSCALL(sleep)
 2e2:	b8 0d 00 00 00       	mov    $0xd,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <uptime>:
SYSCALL(uptime)
 2ea:	b8 0e 00 00 00       	mov    $0xe,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <cps>:
SYSCALL(cps)
 2f2:	b8 16 00 00 00       	mov    $0x16,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    
 2fa:	66 90                	xchg   %ax,%ax
 2fc:	66 90                	xchg   %ax,%ax
 2fe:	66 90                	xchg   %ax,%ax

00000300 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	57                   	push   %edi
 304:	56                   	push   %esi
 305:	53                   	push   %ebx
 306:	89 c6                	mov    %eax,%esi
 308:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 30b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 30e:	85 db                	test   %ebx,%ebx
 310:	74 7e                	je     390 <printint+0x90>
 312:	89 d0                	mov    %edx,%eax
 314:	c1 e8 1f             	shr    $0x1f,%eax
 317:	84 c0                	test   %al,%al
 319:	74 75                	je     390 <printint+0x90>
    neg = 1;
    x = -xx;
 31b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 31d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 324:	f7 d8                	neg    %eax
 326:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 329:	31 ff                	xor    %edi,%edi
 32b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 32e:	89 ce                	mov    %ecx,%esi
 330:	eb 08                	jmp    33a <printint+0x3a>
 332:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 338:	89 cf                	mov    %ecx,%edi
 33a:	31 d2                	xor    %edx,%edx
 33c:	8d 4f 01             	lea    0x1(%edi),%ecx
 33f:	f7 f6                	div    %esi
 341:	0f b6 92 c8 06 00 00 	movzbl 0x6c8(%edx),%edx
  }while((x /= base) != 0);
 348:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 34a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 34d:	75 e9                	jne    338 <printint+0x38>
  if(neg)
 34f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 352:	8b 75 c0             	mov    -0x40(%ebp),%esi
 355:	85 c0                	test   %eax,%eax
 357:	74 08                	je     361 <printint+0x61>
    buf[i++] = '-';
 359:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 35e:	8d 4f 02             	lea    0x2(%edi),%ecx
 361:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 365:	8d 76 00             	lea    0x0(%esi),%esi
 368:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 36b:	83 ec 04             	sub    $0x4,%esp
 36e:	83 ef 01             	sub    $0x1,%edi
 371:	6a 01                	push   $0x1
 373:	53                   	push   %ebx
 374:	56                   	push   %esi
 375:	88 45 d7             	mov    %al,-0x29(%ebp)
 378:	e8 f5 fe ff ff       	call   272 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 37d:	83 c4 10             	add    $0x10,%esp
 380:	39 df                	cmp    %ebx,%edi
 382:	75 e4                	jne    368 <printint+0x68>
    putc(fd, buf[i]);
}
 384:	8d 65 f4             	lea    -0xc(%ebp),%esp
 387:	5b                   	pop    %ebx
 388:	5e                   	pop    %esi
 389:	5f                   	pop    %edi
 38a:	5d                   	pop    %ebp
 38b:	c3                   	ret    
 38c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 390:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 392:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 399:	eb 8b                	jmp    326 <printint+0x26>
 39b:	90                   	nop
 39c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003a0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	57                   	push   %edi
 3a4:	56                   	push   %esi
 3a5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3a6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3a9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3ac:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3af:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3b2:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3b5:	0f b6 1e             	movzbl (%esi),%ebx
 3b8:	83 c6 01             	add    $0x1,%esi
 3bb:	84 db                	test   %bl,%bl
 3bd:	0f 84 b0 00 00 00    	je     473 <printf+0xd3>
 3c3:	31 d2                	xor    %edx,%edx
 3c5:	eb 39                	jmp    400 <printf+0x60>
 3c7:	89 f6                	mov    %esi,%esi
 3c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 3d0:	83 f8 25             	cmp    $0x25,%eax
 3d3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 3d6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 3db:	74 18                	je     3f5 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 3dd:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 3e0:	83 ec 04             	sub    $0x4,%esp
 3e3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 3e6:	6a 01                	push   $0x1
 3e8:	50                   	push   %eax
 3e9:	57                   	push   %edi
 3ea:	e8 83 fe ff ff       	call   272 <write>
 3ef:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 3f2:	83 c4 10             	add    $0x10,%esp
 3f5:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3f8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 3fc:	84 db                	test   %bl,%bl
 3fe:	74 73                	je     473 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 400:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 402:	0f be cb             	movsbl %bl,%ecx
 405:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 408:	74 c6                	je     3d0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 40a:	83 fa 25             	cmp    $0x25,%edx
 40d:	75 e6                	jne    3f5 <printf+0x55>
      if(c == 'd'){
 40f:	83 f8 64             	cmp    $0x64,%eax
 412:	0f 84 f8 00 00 00    	je     510 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 418:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 41e:	83 f9 70             	cmp    $0x70,%ecx
 421:	74 5d                	je     480 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 423:	83 f8 73             	cmp    $0x73,%eax
 426:	0f 84 84 00 00 00    	je     4b0 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 42c:	83 f8 63             	cmp    $0x63,%eax
 42f:	0f 84 ea 00 00 00    	je     51f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 435:	83 f8 25             	cmp    $0x25,%eax
 438:	0f 84 c2 00 00 00    	je     500 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 43e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 441:	83 ec 04             	sub    $0x4,%esp
 444:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 448:	6a 01                	push   $0x1
 44a:	50                   	push   %eax
 44b:	57                   	push   %edi
 44c:	e8 21 fe ff ff       	call   272 <write>
 451:	83 c4 0c             	add    $0xc,%esp
 454:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 457:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 45a:	6a 01                	push   $0x1
 45c:	50                   	push   %eax
 45d:	57                   	push   %edi
 45e:	83 c6 01             	add    $0x1,%esi
 461:	e8 0c fe ff ff       	call   272 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 466:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 46a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 46d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 46f:	84 db                	test   %bl,%bl
 471:	75 8d                	jne    400 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 473:	8d 65 f4             	lea    -0xc(%ebp),%esp
 476:	5b                   	pop    %ebx
 477:	5e                   	pop    %esi
 478:	5f                   	pop    %edi
 479:	5d                   	pop    %ebp
 47a:	c3                   	ret    
 47b:	90                   	nop
 47c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 480:	83 ec 0c             	sub    $0xc,%esp
 483:	b9 10 00 00 00       	mov    $0x10,%ecx
 488:	6a 00                	push   $0x0
 48a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 48d:	89 f8                	mov    %edi,%eax
 48f:	8b 13                	mov    (%ebx),%edx
 491:	e8 6a fe ff ff       	call   300 <printint>
        ap++;
 496:	89 d8                	mov    %ebx,%eax
 498:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 49b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 49d:	83 c0 04             	add    $0x4,%eax
 4a0:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4a3:	e9 4d ff ff ff       	jmp    3f5 <printf+0x55>
 4a8:	90                   	nop
 4a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 4b0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 4b3:	8b 18                	mov    (%eax),%ebx
        ap++;
 4b5:	83 c0 04             	add    $0x4,%eax
 4b8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
 4bb:	b8 c0 06 00 00       	mov    $0x6c0,%eax
 4c0:	85 db                	test   %ebx,%ebx
 4c2:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
 4c5:	0f b6 03             	movzbl (%ebx),%eax
 4c8:	84 c0                	test   %al,%al
 4ca:	74 23                	je     4ef <printf+0x14f>
 4cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4d0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4d3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 4d6:	83 ec 04             	sub    $0x4,%esp
 4d9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 4db:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4de:	50                   	push   %eax
 4df:	57                   	push   %edi
 4e0:	e8 8d fd ff ff       	call   272 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 4e5:	0f b6 03             	movzbl (%ebx),%eax
 4e8:	83 c4 10             	add    $0x10,%esp
 4eb:	84 c0                	test   %al,%al
 4ed:	75 e1                	jne    4d0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4ef:	31 d2                	xor    %edx,%edx
 4f1:	e9 ff fe ff ff       	jmp    3f5 <printf+0x55>
 4f6:	8d 76 00             	lea    0x0(%esi),%esi
 4f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 500:	83 ec 04             	sub    $0x4,%esp
 503:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 506:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 509:	6a 01                	push   $0x1
 50b:	e9 4c ff ff ff       	jmp    45c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 510:	83 ec 0c             	sub    $0xc,%esp
 513:	b9 0a 00 00 00       	mov    $0xa,%ecx
 518:	6a 01                	push   $0x1
 51a:	e9 6b ff ff ff       	jmp    48a <printf+0xea>
 51f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 522:	83 ec 04             	sub    $0x4,%esp
 525:	8b 03                	mov    (%ebx),%eax
 527:	6a 01                	push   $0x1
 529:	88 45 e4             	mov    %al,-0x1c(%ebp)
 52c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 52f:	50                   	push   %eax
 530:	57                   	push   %edi
 531:	e8 3c fd ff ff       	call   272 <write>
 536:	e9 5b ff ff ff       	jmp    496 <printf+0xf6>
 53b:	66 90                	xchg   %ax,%ax
 53d:	66 90                	xchg   %ax,%ax
 53f:	90                   	nop

00000540 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 540:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 541:	a1 58 09 00 00       	mov    0x958,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 546:	89 e5                	mov    %esp,%ebp
 548:	57                   	push   %edi
 549:	56                   	push   %esi
 54a:	53                   	push   %ebx
 54b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 54e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 550:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 553:	39 c8                	cmp    %ecx,%eax
 555:	73 19                	jae    570 <free+0x30>
 557:	89 f6                	mov    %esi,%esi
 559:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 560:	39 d1                	cmp    %edx,%ecx
 562:	72 1c                	jb     580 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 564:	39 d0                	cmp    %edx,%eax
 566:	73 18                	jae    580 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 568:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 56a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 56c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 56e:	72 f0                	jb     560 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 570:	39 d0                	cmp    %edx,%eax
 572:	72 f4                	jb     568 <free+0x28>
 574:	39 d1                	cmp    %edx,%ecx
 576:	73 f0                	jae    568 <free+0x28>
 578:	90                   	nop
 579:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 580:	8b 73 fc             	mov    -0x4(%ebx),%esi
 583:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 586:	39 d7                	cmp    %edx,%edi
 588:	74 19                	je     5a3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 58a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 58d:	8b 50 04             	mov    0x4(%eax),%edx
 590:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 593:	39 f1                	cmp    %esi,%ecx
 595:	74 23                	je     5ba <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 597:	89 08                	mov    %ecx,(%eax)
  freep = p;
 599:	a3 58 09 00 00       	mov    %eax,0x958
}
 59e:	5b                   	pop    %ebx
 59f:	5e                   	pop    %esi
 5a0:	5f                   	pop    %edi
 5a1:	5d                   	pop    %ebp
 5a2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 5a3:	03 72 04             	add    0x4(%edx),%esi
 5a6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5a9:	8b 10                	mov    (%eax),%edx
 5ab:	8b 12                	mov    (%edx),%edx
 5ad:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 5b0:	8b 50 04             	mov    0x4(%eax),%edx
 5b3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5b6:	39 f1                	cmp    %esi,%ecx
 5b8:	75 dd                	jne    597 <free+0x57>
    p->s.size += bp->s.size;
 5ba:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 5bd:	a3 58 09 00 00       	mov    %eax,0x958
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 5c2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5c5:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5c8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 5ca:	5b                   	pop    %ebx
 5cb:	5e                   	pop    %esi
 5cc:	5f                   	pop    %edi
 5cd:	5d                   	pop    %ebp
 5ce:	c3                   	ret    
 5cf:	90                   	nop

000005d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 5d0:	55                   	push   %ebp
 5d1:	89 e5                	mov    %esp,%ebp
 5d3:	57                   	push   %edi
 5d4:	56                   	push   %esi
 5d5:	53                   	push   %ebx
 5d6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 5d9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 5dc:	8b 15 58 09 00 00    	mov    0x958,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 5e2:	8d 78 07             	lea    0x7(%eax),%edi
 5e5:	c1 ef 03             	shr    $0x3,%edi
 5e8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 5eb:	85 d2                	test   %edx,%edx
 5ed:	0f 84 a3 00 00 00    	je     696 <malloc+0xc6>
 5f3:	8b 02                	mov    (%edx),%eax
 5f5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 5f8:	39 cf                	cmp    %ecx,%edi
 5fa:	76 74                	jbe    670 <malloc+0xa0>
 5fc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 602:	be 00 10 00 00       	mov    $0x1000,%esi
 607:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 60e:	0f 43 f7             	cmovae %edi,%esi
 611:	ba 00 80 00 00       	mov    $0x8000,%edx
 616:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 61c:	0f 46 da             	cmovbe %edx,%ebx
 61f:	eb 10                	jmp    631 <malloc+0x61>
 621:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 628:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 62a:	8b 48 04             	mov    0x4(%eax),%ecx
 62d:	39 cf                	cmp    %ecx,%edi
 62f:	76 3f                	jbe    670 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 631:	39 05 58 09 00 00    	cmp    %eax,0x958
 637:	89 c2                	mov    %eax,%edx
 639:	75 ed                	jne    628 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 63b:	83 ec 0c             	sub    $0xc,%esp
 63e:	53                   	push   %ebx
 63f:	e8 96 fc ff ff       	call   2da <sbrk>
  if(p == (char*)-1)
 644:	83 c4 10             	add    $0x10,%esp
 647:	83 f8 ff             	cmp    $0xffffffff,%eax
 64a:	74 1c                	je     668 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 64c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 64f:	83 ec 0c             	sub    $0xc,%esp
 652:	83 c0 08             	add    $0x8,%eax
 655:	50                   	push   %eax
 656:	e8 e5 fe ff ff       	call   540 <free>
  return freep;
 65b:	8b 15 58 09 00 00    	mov    0x958,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 661:	83 c4 10             	add    $0x10,%esp
 664:	85 d2                	test   %edx,%edx
 666:	75 c0                	jne    628 <malloc+0x58>
        return 0;
 668:	31 c0                	xor    %eax,%eax
 66a:	eb 1c                	jmp    688 <malloc+0xb8>
 66c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 670:	39 cf                	cmp    %ecx,%edi
 672:	74 1c                	je     690 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 674:	29 f9                	sub    %edi,%ecx
 676:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 679:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 67c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 67f:	89 15 58 09 00 00    	mov    %edx,0x958
      return (void*)(p + 1);
 685:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 688:	8d 65 f4             	lea    -0xc(%ebp),%esp
 68b:	5b                   	pop    %ebx
 68c:	5e                   	pop    %esi
 68d:	5f                   	pop    %edi
 68e:	5d                   	pop    %ebp
 68f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 690:	8b 08                	mov    (%eax),%ecx
 692:	89 0a                	mov    %ecx,(%edx)
 694:	eb e9                	jmp    67f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 696:	c7 05 58 09 00 00 5c 	movl   $0x95c,0x958
 69d:	09 00 00 
 6a0:	c7 05 5c 09 00 00 5c 	movl   $0x95c,0x95c
 6a7:	09 00 00 
    base.s.size = 0;
 6aa:	b8 5c 09 00 00       	mov    $0x95c,%eax
 6af:	c7 05 60 09 00 00 00 	movl   $0x0,0x960
 6b6:	00 00 00 
 6b9:	e9 3e ff ff ff       	jmp    5fc <malloc+0x2c>
