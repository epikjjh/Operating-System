
_test_master:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  {NAME_CHILD_MLFQ, "1", 0},
};

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int pid;
  int i;

  for (i = 0; i < CNT_CHILD; i++) {
   9:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
  10:	00 
  11:	e9 83 00 00 00       	jmp    99 <main+0x99>
    pid = fork();
  16:	e8 09 03 00 00       	call   324 <fork>
  1b:	89 44 24 18          	mov    %eax,0x18(%esp)
    if (pid > 0) {
  1f:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  24:	7e 07                	jle    2d <main+0x2d>
main(int argc, char *argv[])
{
  int pid;
  int i;

  for (i = 0; i < CNT_CHILD; i++) {
  26:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  2b:	eb 6c                	jmp    99 <main+0x99>
    pid = fork();
    if (pid > 0) {
      // parent
      continue;
    } else if (pid == 0) {
  2d:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  32:	75 4c                	jne    80 <main+0x80>
      // child
      exec(child_argv[i][0], child_argv[i]);
  34:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  38:	89 d0                	mov    %edx,%eax
  3a:	01 c0                	add    %eax,%eax
  3c:	01 d0                	add    %edx,%eax
  3e:	c1 e0 02             	shl    $0x2,%eax
  41:	8d 88 40 0b 00 00    	lea    0xb40(%eax),%ecx
  47:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  4b:	89 d0                	mov    %edx,%eax
  4d:	01 c0                	add    %eax,%eax
  4f:	01 d0                	add    %edx,%eax
  51:	c1 e0 02             	shl    $0x2,%eax
  54:	05 40 0b 00 00       	add    $0xb40,%eax
  59:	8b 00                	mov    (%eax),%eax
  5b:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  5f:	89 04 24             	mov    %eax,(%esp)
  62:	e8 fd 02 00 00       	call   364 <exec>
      printf(1, "exec failed!!\n");
  67:	c7 44 24 04 b8 08 00 	movl   $0x8b8,0x4(%esp)
  6e:	00 
  6f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  76:	e8 51 04 00 00       	call   4cc <printf>
      exit();
  7b:	e8 ac 02 00 00       	call   32c <exit>
    } else {
      printf(1, "fork failed!!\n");
  80:	c7 44 24 04 c7 08 00 	movl   $0x8c7,0x4(%esp)
  87:	00 
  88:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  8f:	e8 38 04 00 00       	call   4cc <printf>
      exit();
  94:	e8 93 02 00 00       	call   32c <exit>
main(int argc, char *argv[])
{
  int pid;
  int i;

  for (i = 0; i < CNT_CHILD; i++) {
  99:	83 7c 24 1c 03       	cmpl   $0x3,0x1c(%esp)
  9e:	0f 8e 72 ff ff ff    	jle    16 <main+0x16>
      printf(1, "fork failed!!\n");
      exit();
    }
  }
  
  for (i = 0; i < CNT_CHILD; i++) {
  a4:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
  ab:	00 
  ac:	eb 0a                	jmp    b8 <main+0xb8>
    wait();
  ae:	e8 81 02 00 00       	call   334 <wait>
      printf(1, "fork failed!!\n");
      exit();
    }
  }
  
  for (i = 0; i < CNT_CHILD; i++) {
  b3:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  b8:	83 7c 24 1c 03       	cmpl   $0x3,0x1c(%esp)
  bd:	7e ef                	jle    ae <main+0xae>
    wait();
  }

  exit();
  bf:	e8 68 02 00 00       	call   32c <exit>

000000c4 <stosb>:
  c4:	55                   	push   %ebp
  c5:	89 e5                	mov    %esp,%ebp
  c7:	57                   	push   %edi
  c8:	53                   	push   %ebx
  c9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  cc:	8b 55 10             	mov    0x10(%ebp),%edx
  cf:	8b 45 0c             	mov    0xc(%ebp),%eax
  d2:	89 cb                	mov    %ecx,%ebx
  d4:	89 df                	mov    %ebx,%edi
  d6:	89 d1                	mov    %edx,%ecx
  d8:	fc                   	cld    
  d9:	f3 aa                	rep stos %al,%es:(%edi)
  db:	89 ca                	mov    %ecx,%edx
  dd:	89 fb                	mov    %edi,%ebx
  df:	89 5d 08             	mov    %ebx,0x8(%ebp)
  e2:	89 55 10             	mov    %edx,0x10(%ebp)
  e5:	5b                   	pop    %ebx
  e6:	5f                   	pop    %edi
  e7:	5d                   	pop    %ebp
  e8:	c3                   	ret    

000000e9 <strcpy>:
  e9:	55                   	push   %ebp
  ea:	89 e5                	mov    %esp,%ebp
  ec:	83 ec 10             	sub    $0x10,%esp
  ef:	8b 45 08             	mov    0x8(%ebp),%eax
  f2:	89 45 fc             	mov    %eax,-0x4(%ebp)
  f5:	90                   	nop
  f6:	8b 45 08             	mov    0x8(%ebp),%eax
  f9:	8d 50 01             	lea    0x1(%eax),%edx
  fc:	89 55 08             	mov    %edx,0x8(%ebp)
  ff:	8b 55 0c             	mov    0xc(%ebp),%edx
 102:	8d 4a 01             	lea    0x1(%edx),%ecx
 105:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 108:	0f b6 12             	movzbl (%edx),%edx
 10b:	88 10                	mov    %dl,(%eax)
 10d:	0f b6 00             	movzbl (%eax),%eax
 110:	84 c0                	test   %al,%al
 112:	75 e2                	jne    f6 <strcpy+0xd>
 114:	8b 45 fc             	mov    -0x4(%ebp),%eax
 117:	c9                   	leave  
 118:	c3                   	ret    

00000119 <strcmp>:
 119:	55                   	push   %ebp
 11a:	89 e5                	mov    %esp,%ebp
 11c:	eb 08                	jmp    126 <strcmp+0xd>
 11e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 122:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 126:	8b 45 08             	mov    0x8(%ebp),%eax
 129:	0f b6 00             	movzbl (%eax),%eax
 12c:	84 c0                	test   %al,%al
 12e:	74 10                	je     140 <strcmp+0x27>
 130:	8b 45 08             	mov    0x8(%ebp),%eax
 133:	0f b6 10             	movzbl (%eax),%edx
 136:	8b 45 0c             	mov    0xc(%ebp),%eax
 139:	0f b6 00             	movzbl (%eax),%eax
 13c:	38 c2                	cmp    %al,%dl
 13e:	74 de                	je     11e <strcmp+0x5>
 140:	8b 45 08             	mov    0x8(%ebp),%eax
 143:	0f b6 00             	movzbl (%eax),%eax
 146:	0f b6 d0             	movzbl %al,%edx
 149:	8b 45 0c             	mov    0xc(%ebp),%eax
 14c:	0f b6 00             	movzbl (%eax),%eax
 14f:	0f b6 c0             	movzbl %al,%eax
 152:	29 c2                	sub    %eax,%edx
 154:	89 d0                	mov    %edx,%eax
 156:	5d                   	pop    %ebp
 157:	c3                   	ret    

00000158 <strlen>:
 158:	55                   	push   %ebp
 159:	89 e5                	mov    %esp,%ebp
 15b:	83 ec 10             	sub    $0x10,%esp
 15e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 165:	eb 04                	jmp    16b <strlen+0x13>
 167:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 16b:	8b 55 fc             	mov    -0x4(%ebp),%edx
 16e:	8b 45 08             	mov    0x8(%ebp),%eax
 171:	01 d0                	add    %edx,%eax
 173:	0f b6 00             	movzbl (%eax),%eax
 176:	84 c0                	test   %al,%al
 178:	75 ed                	jne    167 <strlen+0xf>
 17a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 17d:	c9                   	leave  
 17e:	c3                   	ret    

0000017f <memset>:
 17f:	55                   	push   %ebp
 180:	89 e5                	mov    %esp,%ebp
 182:	83 ec 0c             	sub    $0xc,%esp
 185:	8b 45 10             	mov    0x10(%ebp),%eax
 188:	89 44 24 08          	mov    %eax,0x8(%esp)
 18c:	8b 45 0c             	mov    0xc(%ebp),%eax
 18f:	89 44 24 04          	mov    %eax,0x4(%esp)
 193:	8b 45 08             	mov    0x8(%ebp),%eax
 196:	89 04 24             	mov    %eax,(%esp)
 199:	e8 26 ff ff ff       	call   c4 <stosb>
 19e:	8b 45 08             	mov    0x8(%ebp),%eax
 1a1:	c9                   	leave  
 1a2:	c3                   	ret    

000001a3 <strchr>:
 1a3:	55                   	push   %ebp
 1a4:	89 e5                	mov    %esp,%ebp
 1a6:	83 ec 04             	sub    $0x4,%esp
 1a9:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ac:	88 45 fc             	mov    %al,-0x4(%ebp)
 1af:	eb 14                	jmp    1c5 <strchr+0x22>
 1b1:	8b 45 08             	mov    0x8(%ebp),%eax
 1b4:	0f b6 00             	movzbl (%eax),%eax
 1b7:	3a 45 fc             	cmp    -0x4(%ebp),%al
 1ba:	75 05                	jne    1c1 <strchr+0x1e>
 1bc:	8b 45 08             	mov    0x8(%ebp),%eax
 1bf:	eb 13                	jmp    1d4 <strchr+0x31>
 1c1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1c5:	8b 45 08             	mov    0x8(%ebp),%eax
 1c8:	0f b6 00             	movzbl (%eax),%eax
 1cb:	84 c0                	test   %al,%al
 1cd:	75 e2                	jne    1b1 <strchr+0xe>
 1cf:	b8 00 00 00 00       	mov    $0x0,%eax
 1d4:	c9                   	leave  
 1d5:	c3                   	ret    

000001d6 <gets>:
 1d6:	55                   	push   %ebp
 1d7:	89 e5                	mov    %esp,%ebp
 1d9:	83 ec 28             	sub    $0x28,%esp
 1dc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 1e3:	eb 4c                	jmp    231 <gets+0x5b>
 1e5:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1ec:	00 
 1ed:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1f0:	89 44 24 04          	mov    %eax,0x4(%esp)
 1f4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1fb:	e8 44 01 00 00       	call   344 <read>
 200:	89 45 f0             	mov    %eax,-0x10(%ebp)
 203:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 207:	7f 02                	jg     20b <gets+0x35>
 209:	eb 31                	jmp    23c <gets+0x66>
 20b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 20e:	8d 50 01             	lea    0x1(%eax),%edx
 211:	89 55 f4             	mov    %edx,-0xc(%ebp)
 214:	89 c2                	mov    %eax,%edx
 216:	8b 45 08             	mov    0x8(%ebp),%eax
 219:	01 c2                	add    %eax,%edx
 21b:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 21f:	88 02                	mov    %al,(%edx)
 221:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 225:	3c 0a                	cmp    $0xa,%al
 227:	74 13                	je     23c <gets+0x66>
 229:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 22d:	3c 0d                	cmp    $0xd,%al
 22f:	74 0b                	je     23c <gets+0x66>
 231:	8b 45 f4             	mov    -0xc(%ebp),%eax
 234:	83 c0 01             	add    $0x1,%eax
 237:	3b 45 0c             	cmp    0xc(%ebp),%eax
 23a:	7c a9                	jl     1e5 <gets+0xf>
 23c:	8b 55 f4             	mov    -0xc(%ebp),%edx
 23f:	8b 45 08             	mov    0x8(%ebp),%eax
 242:	01 d0                	add    %edx,%eax
 244:	c6 00 00             	movb   $0x0,(%eax)
 247:	8b 45 08             	mov    0x8(%ebp),%eax
 24a:	c9                   	leave  
 24b:	c3                   	ret    

0000024c <stat>:
 24c:	55                   	push   %ebp
 24d:	89 e5                	mov    %esp,%ebp
 24f:	83 ec 28             	sub    $0x28,%esp
 252:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 259:	00 
 25a:	8b 45 08             	mov    0x8(%ebp),%eax
 25d:	89 04 24             	mov    %eax,(%esp)
 260:	e8 07 01 00 00       	call   36c <open>
 265:	89 45 f4             	mov    %eax,-0xc(%ebp)
 268:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 26c:	79 07                	jns    275 <stat+0x29>
 26e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 273:	eb 23                	jmp    298 <stat+0x4c>
 275:	8b 45 0c             	mov    0xc(%ebp),%eax
 278:	89 44 24 04          	mov    %eax,0x4(%esp)
 27c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 27f:	89 04 24             	mov    %eax,(%esp)
 282:	e8 fd 00 00 00       	call   384 <fstat>
 287:	89 45 f0             	mov    %eax,-0x10(%ebp)
 28a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 28d:	89 04 24             	mov    %eax,(%esp)
 290:	e8 bf 00 00 00       	call   354 <close>
 295:	8b 45 f0             	mov    -0x10(%ebp),%eax
 298:	c9                   	leave  
 299:	c3                   	ret    

0000029a <atoi>:
 29a:	55                   	push   %ebp
 29b:	89 e5                	mov    %esp,%ebp
 29d:	83 ec 10             	sub    $0x10,%esp
 2a0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 2a7:	eb 25                	jmp    2ce <atoi+0x34>
 2a9:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2ac:	89 d0                	mov    %edx,%eax
 2ae:	c1 e0 02             	shl    $0x2,%eax
 2b1:	01 d0                	add    %edx,%eax
 2b3:	01 c0                	add    %eax,%eax
 2b5:	89 c1                	mov    %eax,%ecx
 2b7:	8b 45 08             	mov    0x8(%ebp),%eax
 2ba:	8d 50 01             	lea    0x1(%eax),%edx
 2bd:	89 55 08             	mov    %edx,0x8(%ebp)
 2c0:	0f b6 00             	movzbl (%eax),%eax
 2c3:	0f be c0             	movsbl %al,%eax
 2c6:	01 c8                	add    %ecx,%eax
 2c8:	83 e8 30             	sub    $0x30,%eax
 2cb:	89 45 fc             	mov    %eax,-0x4(%ebp)
 2ce:	8b 45 08             	mov    0x8(%ebp),%eax
 2d1:	0f b6 00             	movzbl (%eax),%eax
 2d4:	3c 2f                	cmp    $0x2f,%al
 2d6:	7e 0a                	jle    2e2 <atoi+0x48>
 2d8:	8b 45 08             	mov    0x8(%ebp),%eax
 2db:	0f b6 00             	movzbl (%eax),%eax
 2de:	3c 39                	cmp    $0x39,%al
 2e0:	7e c7                	jle    2a9 <atoi+0xf>
 2e2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2e5:	c9                   	leave  
 2e6:	c3                   	ret    

000002e7 <memmove>:
 2e7:	55                   	push   %ebp
 2e8:	89 e5                	mov    %esp,%ebp
 2ea:	83 ec 10             	sub    $0x10,%esp
 2ed:	8b 45 08             	mov    0x8(%ebp),%eax
 2f0:	89 45 fc             	mov    %eax,-0x4(%ebp)
 2f3:	8b 45 0c             	mov    0xc(%ebp),%eax
 2f6:	89 45 f8             	mov    %eax,-0x8(%ebp)
 2f9:	eb 17                	jmp    312 <memmove+0x2b>
 2fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2fe:	8d 50 01             	lea    0x1(%eax),%edx
 301:	89 55 fc             	mov    %edx,-0x4(%ebp)
 304:	8b 55 f8             	mov    -0x8(%ebp),%edx
 307:	8d 4a 01             	lea    0x1(%edx),%ecx
 30a:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 30d:	0f b6 12             	movzbl (%edx),%edx
 310:	88 10                	mov    %dl,(%eax)
 312:	8b 45 10             	mov    0x10(%ebp),%eax
 315:	8d 50 ff             	lea    -0x1(%eax),%edx
 318:	89 55 10             	mov    %edx,0x10(%ebp)
 31b:	85 c0                	test   %eax,%eax
 31d:	7f dc                	jg     2fb <memmove+0x14>
 31f:	8b 45 08             	mov    0x8(%ebp),%eax
 322:	c9                   	leave  
 323:	c3                   	ret    

00000324 <fork>:
 324:	b8 01 00 00 00       	mov    $0x1,%eax
 329:	cd 40                	int    $0x40
 32b:	c3                   	ret    

0000032c <exit>:
 32c:	b8 02 00 00 00       	mov    $0x2,%eax
 331:	cd 40                	int    $0x40
 333:	c3                   	ret    

00000334 <wait>:
 334:	b8 03 00 00 00       	mov    $0x3,%eax
 339:	cd 40                	int    $0x40
 33b:	c3                   	ret    

0000033c <pipe>:
 33c:	b8 04 00 00 00       	mov    $0x4,%eax
 341:	cd 40                	int    $0x40
 343:	c3                   	ret    

00000344 <read>:
 344:	b8 05 00 00 00       	mov    $0x5,%eax
 349:	cd 40                	int    $0x40
 34b:	c3                   	ret    

0000034c <write>:
 34c:	b8 10 00 00 00       	mov    $0x10,%eax
 351:	cd 40                	int    $0x40
 353:	c3                   	ret    

00000354 <close>:
 354:	b8 15 00 00 00       	mov    $0x15,%eax
 359:	cd 40                	int    $0x40
 35b:	c3                   	ret    

0000035c <kill>:
 35c:	b8 06 00 00 00       	mov    $0x6,%eax
 361:	cd 40                	int    $0x40
 363:	c3                   	ret    

00000364 <exec>:
 364:	b8 07 00 00 00       	mov    $0x7,%eax
 369:	cd 40                	int    $0x40
 36b:	c3                   	ret    

0000036c <open>:
 36c:	b8 0f 00 00 00       	mov    $0xf,%eax
 371:	cd 40                	int    $0x40
 373:	c3                   	ret    

00000374 <mknod>:
 374:	b8 11 00 00 00       	mov    $0x11,%eax
 379:	cd 40                	int    $0x40
 37b:	c3                   	ret    

0000037c <unlink>:
 37c:	b8 12 00 00 00       	mov    $0x12,%eax
 381:	cd 40                	int    $0x40
 383:	c3                   	ret    

00000384 <fstat>:
 384:	b8 08 00 00 00       	mov    $0x8,%eax
 389:	cd 40                	int    $0x40
 38b:	c3                   	ret    

0000038c <link>:
 38c:	b8 13 00 00 00       	mov    $0x13,%eax
 391:	cd 40                	int    $0x40
 393:	c3                   	ret    

00000394 <mkdir>:
 394:	b8 14 00 00 00       	mov    $0x14,%eax
 399:	cd 40                	int    $0x40
 39b:	c3                   	ret    

0000039c <chdir>:
 39c:	b8 09 00 00 00       	mov    $0x9,%eax
 3a1:	cd 40                	int    $0x40
 3a3:	c3                   	ret    

000003a4 <dup>:
 3a4:	b8 0a 00 00 00       	mov    $0xa,%eax
 3a9:	cd 40                	int    $0x40
 3ab:	c3                   	ret    

000003ac <getpid>:
 3ac:	b8 0b 00 00 00       	mov    $0xb,%eax
 3b1:	cd 40                	int    $0x40
 3b3:	c3                   	ret    

000003b4 <sbrk>:
 3b4:	b8 0c 00 00 00       	mov    $0xc,%eax
 3b9:	cd 40                	int    $0x40
 3bb:	c3                   	ret    

000003bc <sleep>:
 3bc:	b8 0d 00 00 00       	mov    $0xd,%eax
 3c1:	cd 40                	int    $0x40
 3c3:	c3                   	ret    

000003c4 <uptime>:
 3c4:	b8 0e 00 00 00       	mov    $0xe,%eax
 3c9:	cd 40                	int    $0x40
 3cb:	c3                   	ret    

000003cc <my_syscall>:
 3cc:	b8 16 00 00 00       	mov    $0x16,%eax
 3d1:	cd 40                	int    $0x40
 3d3:	c3                   	ret    

000003d4 <yield>:
 3d4:	b8 17 00 00 00       	mov    $0x17,%eax
 3d9:	cd 40                	int    $0x40
 3db:	c3                   	ret    

000003dc <getlev>:
 3dc:	b8 18 00 00 00       	mov    $0x18,%eax
 3e1:	cd 40                	int    $0x40
 3e3:	c3                   	ret    

000003e4 <set_cpu_share>:
 3e4:	b8 19 00 00 00       	mov    $0x19,%eax
 3e9:	cd 40                	int    $0x40
 3eb:	c3                   	ret    

000003ec <putc>:
 3ec:	55                   	push   %ebp
 3ed:	89 e5                	mov    %esp,%ebp
 3ef:	83 ec 18             	sub    $0x18,%esp
 3f2:	8b 45 0c             	mov    0xc(%ebp),%eax
 3f5:	88 45 f4             	mov    %al,-0xc(%ebp)
 3f8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3ff:	00 
 400:	8d 45 f4             	lea    -0xc(%ebp),%eax
 403:	89 44 24 04          	mov    %eax,0x4(%esp)
 407:	8b 45 08             	mov    0x8(%ebp),%eax
 40a:	89 04 24             	mov    %eax,(%esp)
 40d:	e8 3a ff ff ff       	call   34c <write>
 412:	c9                   	leave  
 413:	c3                   	ret    

00000414 <printint>:
 414:	55                   	push   %ebp
 415:	89 e5                	mov    %esp,%ebp
 417:	56                   	push   %esi
 418:	53                   	push   %ebx
 419:	83 ec 30             	sub    $0x30,%esp
 41c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 423:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 427:	74 17                	je     440 <printint+0x2c>
 429:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 42d:	79 11                	jns    440 <printint+0x2c>
 42f:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
 436:	8b 45 0c             	mov    0xc(%ebp),%eax
 439:	f7 d8                	neg    %eax
 43b:	89 45 ec             	mov    %eax,-0x14(%ebp)
 43e:	eb 06                	jmp    446 <printint+0x32>
 440:	8b 45 0c             	mov    0xc(%ebp),%eax
 443:	89 45 ec             	mov    %eax,-0x14(%ebp)
 446:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 44d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 450:	8d 41 01             	lea    0x1(%ecx),%eax
 453:	89 45 f4             	mov    %eax,-0xc(%ebp)
 456:	8b 5d 10             	mov    0x10(%ebp),%ebx
 459:	8b 45 ec             	mov    -0x14(%ebp),%eax
 45c:	ba 00 00 00 00       	mov    $0x0,%edx
 461:	f7 f3                	div    %ebx
 463:	89 d0                	mov    %edx,%eax
 465:	0f b6 80 70 0b 00 00 	movzbl 0xb70(%eax),%eax
 46c:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 470:	8b 75 10             	mov    0x10(%ebp),%esi
 473:	8b 45 ec             	mov    -0x14(%ebp),%eax
 476:	ba 00 00 00 00       	mov    $0x0,%edx
 47b:	f7 f6                	div    %esi
 47d:	89 45 ec             	mov    %eax,-0x14(%ebp)
 480:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 484:	75 c7                	jne    44d <printint+0x39>
 486:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 48a:	74 10                	je     49c <printint+0x88>
 48c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 48f:	8d 50 01             	lea    0x1(%eax),%edx
 492:	89 55 f4             	mov    %edx,-0xc(%ebp)
 495:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 49a:	eb 1f                	jmp    4bb <printint+0xa7>
 49c:	eb 1d                	jmp    4bb <printint+0xa7>
 49e:	8d 55 dc             	lea    -0x24(%ebp),%edx
 4a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4a4:	01 d0                	add    %edx,%eax
 4a6:	0f b6 00             	movzbl (%eax),%eax
 4a9:	0f be c0             	movsbl %al,%eax
 4ac:	89 44 24 04          	mov    %eax,0x4(%esp)
 4b0:	8b 45 08             	mov    0x8(%ebp),%eax
 4b3:	89 04 24             	mov    %eax,(%esp)
 4b6:	e8 31 ff ff ff       	call   3ec <putc>
 4bb:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 4bf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4c3:	79 d9                	jns    49e <printint+0x8a>
 4c5:	83 c4 30             	add    $0x30,%esp
 4c8:	5b                   	pop    %ebx
 4c9:	5e                   	pop    %esi
 4ca:	5d                   	pop    %ebp
 4cb:	c3                   	ret    

000004cc <printf>:
 4cc:	55                   	push   %ebp
 4cd:	89 e5                	mov    %esp,%ebp
 4cf:	83 ec 38             	sub    $0x38,%esp
 4d2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 4d9:	8d 45 0c             	lea    0xc(%ebp),%eax
 4dc:	83 c0 04             	add    $0x4,%eax
 4df:	89 45 e8             	mov    %eax,-0x18(%ebp)
 4e2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 4e9:	e9 7c 01 00 00       	jmp    66a <printf+0x19e>
 4ee:	8b 55 0c             	mov    0xc(%ebp),%edx
 4f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4f4:	01 d0                	add    %edx,%eax
 4f6:	0f b6 00             	movzbl (%eax),%eax
 4f9:	0f be c0             	movsbl %al,%eax
 4fc:	25 ff 00 00 00       	and    $0xff,%eax
 501:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 504:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 508:	75 2c                	jne    536 <printf+0x6a>
 50a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 50e:	75 0c                	jne    51c <printf+0x50>
 510:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 517:	e9 4a 01 00 00       	jmp    666 <printf+0x19a>
 51c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 51f:	0f be c0             	movsbl %al,%eax
 522:	89 44 24 04          	mov    %eax,0x4(%esp)
 526:	8b 45 08             	mov    0x8(%ebp),%eax
 529:	89 04 24             	mov    %eax,(%esp)
 52c:	e8 bb fe ff ff       	call   3ec <putc>
 531:	e9 30 01 00 00       	jmp    666 <printf+0x19a>
 536:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 53a:	0f 85 26 01 00 00    	jne    666 <printf+0x19a>
 540:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 544:	75 2d                	jne    573 <printf+0xa7>
 546:	8b 45 e8             	mov    -0x18(%ebp),%eax
 549:	8b 00                	mov    (%eax),%eax
 54b:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 552:	00 
 553:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 55a:	00 
 55b:	89 44 24 04          	mov    %eax,0x4(%esp)
 55f:	8b 45 08             	mov    0x8(%ebp),%eax
 562:	89 04 24             	mov    %eax,(%esp)
 565:	e8 aa fe ff ff       	call   414 <printint>
 56a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 56e:	e9 ec 00 00 00       	jmp    65f <printf+0x193>
 573:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 577:	74 06                	je     57f <printf+0xb3>
 579:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 57d:	75 2d                	jne    5ac <printf+0xe0>
 57f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 582:	8b 00                	mov    (%eax),%eax
 584:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 58b:	00 
 58c:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 593:	00 
 594:	89 44 24 04          	mov    %eax,0x4(%esp)
 598:	8b 45 08             	mov    0x8(%ebp),%eax
 59b:	89 04 24             	mov    %eax,(%esp)
 59e:	e8 71 fe ff ff       	call   414 <printint>
 5a3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5a7:	e9 b3 00 00 00       	jmp    65f <printf+0x193>
 5ac:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 5b0:	75 45                	jne    5f7 <printf+0x12b>
 5b2:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5b5:	8b 00                	mov    (%eax),%eax
 5b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
 5ba:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5be:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5c2:	75 09                	jne    5cd <printf+0x101>
 5c4:	c7 45 f4 d6 08 00 00 	movl   $0x8d6,-0xc(%ebp)
 5cb:	eb 1e                	jmp    5eb <printf+0x11f>
 5cd:	eb 1c                	jmp    5eb <printf+0x11f>
 5cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5d2:	0f b6 00             	movzbl (%eax),%eax
 5d5:	0f be c0             	movsbl %al,%eax
 5d8:	89 44 24 04          	mov    %eax,0x4(%esp)
 5dc:	8b 45 08             	mov    0x8(%ebp),%eax
 5df:	89 04 24             	mov    %eax,(%esp)
 5e2:	e8 05 fe ff ff       	call   3ec <putc>
 5e7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 5eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5ee:	0f b6 00             	movzbl (%eax),%eax
 5f1:	84 c0                	test   %al,%al
 5f3:	75 da                	jne    5cf <printf+0x103>
 5f5:	eb 68                	jmp    65f <printf+0x193>
 5f7:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 5fb:	75 1d                	jne    61a <printf+0x14e>
 5fd:	8b 45 e8             	mov    -0x18(%ebp),%eax
 600:	8b 00                	mov    (%eax),%eax
 602:	0f be c0             	movsbl %al,%eax
 605:	89 44 24 04          	mov    %eax,0x4(%esp)
 609:	8b 45 08             	mov    0x8(%ebp),%eax
 60c:	89 04 24             	mov    %eax,(%esp)
 60f:	e8 d8 fd ff ff       	call   3ec <putc>
 614:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 618:	eb 45                	jmp    65f <printf+0x193>
 61a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 61e:	75 17                	jne    637 <printf+0x16b>
 620:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 623:	0f be c0             	movsbl %al,%eax
 626:	89 44 24 04          	mov    %eax,0x4(%esp)
 62a:	8b 45 08             	mov    0x8(%ebp),%eax
 62d:	89 04 24             	mov    %eax,(%esp)
 630:	e8 b7 fd ff ff       	call   3ec <putc>
 635:	eb 28                	jmp    65f <printf+0x193>
 637:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 63e:	00 
 63f:	8b 45 08             	mov    0x8(%ebp),%eax
 642:	89 04 24             	mov    %eax,(%esp)
 645:	e8 a2 fd ff ff       	call   3ec <putc>
 64a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 64d:	0f be c0             	movsbl %al,%eax
 650:	89 44 24 04          	mov    %eax,0x4(%esp)
 654:	8b 45 08             	mov    0x8(%ebp),%eax
 657:	89 04 24             	mov    %eax,(%esp)
 65a:	e8 8d fd ff ff       	call   3ec <putc>
 65f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 666:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 66a:	8b 55 0c             	mov    0xc(%ebp),%edx
 66d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 670:	01 d0                	add    %edx,%eax
 672:	0f b6 00             	movzbl (%eax),%eax
 675:	84 c0                	test   %al,%al
 677:	0f 85 71 fe ff ff    	jne    4ee <printf+0x22>
 67d:	c9                   	leave  
 67e:	c3                   	ret    

0000067f <free>:
 67f:	55                   	push   %ebp
 680:	89 e5                	mov    %esp,%ebp
 682:	83 ec 10             	sub    $0x10,%esp
 685:	8b 45 08             	mov    0x8(%ebp),%eax
 688:	83 e8 08             	sub    $0x8,%eax
 68b:	89 45 f8             	mov    %eax,-0x8(%ebp)
 68e:	a1 8c 0b 00 00       	mov    0xb8c,%eax
 693:	89 45 fc             	mov    %eax,-0x4(%ebp)
 696:	eb 24                	jmp    6bc <free+0x3d>
 698:	8b 45 fc             	mov    -0x4(%ebp),%eax
 69b:	8b 00                	mov    (%eax),%eax
 69d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6a0:	77 12                	ja     6b4 <free+0x35>
 6a2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6a5:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6a8:	77 24                	ja     6ce <free+0x4f>
 6aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ad:	8b 00                	mov    (%eax),%eax
 6af:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6b2:	77 1a                	ja     6ce <free+0x4f>
 6b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b7:	8b 00                	mov    (%eax),%eax
 6b9:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6bc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6bf:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6c2:	76 d4                	jbe    698 <free+0x19>
 6c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c7:	8b 00                	mov    (%eax),%eax
 6c9:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6cc:	76 ca                	jbe    698 <free+0x19>
 6ce:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6d1:	8b 40 04             	mov    0x4(%eax),%eax
 6d4:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6db:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6de:	01 c2                	add    %eax,%edx
 6e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e3:	8b 00                	mov    (%eax),%eax
 6e5:	39 c2                	cmp    %eax,%edx
 6e7:	75 24                	jne    70d <free+0x8e>
 6e9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ec:	8b 50 04             	mov    0x4(%eax),%edx
 6ef:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f2:	8b 00                	mov    (%eax),%eax
 6f4:	8b 40 04             	mov    0x4(%eax),%eax
 6f7:	01 c2                	add    %eax,%edx
 6f9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6fc:	89 50 04             	mov    %edx,0x4(%eax)
 6ff:	8b 45 fc             	mov    -0x4(%ebp),%eax
 702:	8b 00                	mov    (%eax),%eax
 704:	8b 10                	mov    (%eax),%edx
 706:	8b 45 f8             	mov    -0x8(%ebp),%eax
 709:	89 10                	mov    %edx,(%eax)
 70b:	eb 0a                	jmp    717 <free+0x98>
 70d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 710:	8b 10                	mov    (%eax),%edx
 712:	8b 45 f8             	mov    -0x8(%ebp),%eax
 715:	89 10                	mov    %edx,(%eax)
 717:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71a:	8b 40 04             	mov    0x4(%eax),%eax
 71d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 724:	8b 45 fc             	mov    -0x4(%ebp),%eax
 727:	01 d0                	add    %edx,%eax
 729:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 72c:	75 20                	jne    74e <free+0xcf>
 72e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 731:	8b 50 04             	mov    0x4(%eax),%edx
 734:	8b 45 f8             	mov    -0x8(%ebp),%eax
 737:	8b 40 04             	mov    0x4(%eax),%eax
 73a:	01 c2                	add    %eax,%edx
 73c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 73f:	89 50 04             	mov    %edx,0x4(%eax)
 742:	8b 45 f8             	mov    -0x8(%ebp),%eax
 745:	8b 10                	mov    (%eax),%edx
 747:	8b 45 fc             	mov    -0x4(%ebp),%eax
 74a:	89 10                	mov    %edx,(%eax)
 74c:	eb 08                	jmp    756 <free+0xd7>
 74e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 751:	8b 55 f8             	mov    -0x8(%ebp),%edx
 754:	89 10                	mov    %edx,(%eax)
 756:	8b 45 fc             	mov    -0x4(%ebp),%eax
 759:	a3 8c 0b 00 00       	mov    %eax,0xb8c
 75e:	c9                   	leave  
 75f:	c3                   	ret    

00000760 <morecore>:
 760:	55                   	push   %ebp
 761:	89 e5                	mov    %esp,%ebp
 763:	83 ec 28             	sub    $0x28,%esp
 766:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 76d:	77 07                	ja     776 <morecore+0x16>
 76f:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
 776:	8b 45 08             	mov    0x8(%ebp),%eax
 779:	c1 e0 03             	shl    $0x3,%eax
 77c:	89 04 24             	mov    %eax,(%esp)
 77f:	e8 30 fc ff ff       	call   3b4 <sbrk>
 784:	89 45 f4             	mov    %eax,-0xc(%ebp)
 787:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 78b:	75 07                	jne    794 <morecore+0x34>
 78d:	b8 00 00 00 00       	mov    $0x0,%eax
 792:	eb 22                	jmp    7b6 <morecore+0x56>
 794:	8b 45 f4             	mov    -0xc(%ebp),%eax
 797:	89 45 f0             	mov    %eax,-0x10(%ebp)
 79a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 79d:	8b 55 08             	mov    0x8(%ebp),%edx
 7a0:	89 50 04             	mov    %edx,0x4(%eax)
 7a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7a6:	83 c0 08             	add    $0x8,%eax
 7a9:	89 04 24             	mov    %eax,(%esp)
 7ac:	e8 ce fe ff ff       	call   67f <free>
 7b1:	a1 8c 0b 00 00       	mov    0xb8c,%eax
 7b6:	c9                   	leave  
 7b7:	c3                   	ret    

000007b8 <malloc>:
 7b8:	55                   	push   %ebp
 7b9:	89 e5                	mov    %esp,%ebp
 7bb:	83 ec 28             	sub    $0x28,%esp
 7be:	8b 45 08             	mov    0x8(%ebp),%eax
 7c1:	83 c0 07             	add    $0x7,%eax
 7c4:	c1 e8 03             	shr    $0x3,%eax
 7c7:	83 c0 01             	add    $0x1,%eax
 7ca:	89 45 ec             	mov    %eax,-0x14(%ebp)
 7cd:	a1 8c 0b 00 00       	mov    0xb8c,%eax
 7d2:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7d5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 7d9:	75 23                	jne    7fe <malloc+0x46>
 7db:	c7 45 f0 84 0b 00 00 	movl   $0xb84,-0x10(%ebp)
 7e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7e5:	a3 8c 0b 00 00       	mov    %eax,0xb8c
 7ea:	a1 8c 0b 00 00       	mov    0xb8c,%eax
 7ef:	a3 84 0b 00 00       	mov    %eax,0xb84
 7f4:	c7 05 88 0b 00 00 00 	movl   $0x0,0xb88
 7fb:	00 00 00 
 7fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
 801:	8b 00                	mov    (%eax),%eax
 803:	89 45 f4             	mov    %eax,-0xc(%ebp)
 806:	8b 45 f4             	mov    -0xc(%ebp),%eax
 809:	8b 40 04             	mov    0x4(%eax),%eax
 80c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 80f:	72 4d                	jb     85e <malloc+0xa6>
 811:	8b 45 f4             	mov    -0xc(%ebp),%eax
 814:	8b 40 04             	mov    0x4(%eax),%eax
 817:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 81a:	75 0c                	jne    828 <malloc+0x70>
 81c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 81f:	8b 10                	mov    (%eax),%edx
 821:	8b 45 f0             	mov    -0x10(%ebp),%eax
 824:	89 10                	mov    %edx,(%eax)
 826:	eb 26                	jmp    84e <malloc+0x96>
 828:	8b 45 f4             	mov    -0xc(%ebp),%eax
 82b:	8b 40 04             	mov    0x4(%eax),%eax
 82e:	2b 45 ec             	sub    -0x14(%ebp),%eax
 831:	89 c2                	mov    %eax,%edx
 833:	8b 45 f4             	mov    -0xc(%ebp),%eax
 836:	89 50 04             	mov    %edx,0x4(%eax)
 839:	8b 45 f4             	mov    -0xc(%ebp),%eax
 83c:	8b 40 04             	mov    0x4(%eax),%eax
 83f:	c1 e0 03             	shl    $0x3,%eax
 842:	01 45 f4             	add    %eax,-0xc(%ebp)
 845:	8b 45 f4             	mov    -0xc(%ebp),%eax
 848:	8b 55 ec             	mov    -0x14(%ebp),%edx
 84b:	89 50 04             	mov    %edx,0x4(%eax)
 84e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 851:	a3 8c 0b 00 00       	mov    %eax,0xb8c
 856:	8b 45 f4             	mov    -0xc(%ebp),%eax
 859:	83 c0 08             	add    $0x8,%eax
 85c:	eb 38                	jmp    896 <malloc+0xde>
 85e:	a1 8c 0b 00 00       	mov    0xb8c,%eax
 863:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 866:	75 1b                	jne    883 <malloc+0xcb>
 868:	8b 45 ec             	mov    -0x14(%ebp),%eax
 86b:	89 04 24             	mov    %eax,(%esp)
 86e:	e8 ed fe ff ff       	call   760 <morecore>
 873:	89 45 f4             	mov    %eax,-0xc(%ebp)
 876:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 87a:	75 07                	jne    883 <malloc+0xcb>
 87c:	b8 00 00 00 00       	mov    $0x0,%eax
 881:	eb 13                	jmp    896 <malloc+0xde>
 883:	8b 45 f4             	mov    -0xc(%ebp),%eax
 886:	89 45 f0             	mov    %eax,-0x10(%ebp)
 889:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88c:	8b 00                	mov    (%eax),%eax
 88e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 891:	e9 70 ff ff ff       	jmp    806 <malloc+0x4e>
 896:	c9                   	leave  
 897:	c3                   	ret    
