
_test_stride:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#define LIFETIME        1000        // (ticks)
#define COUNT_PERIOD    1000000     // (iteration)

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 30             	sub    $0x30,%esp
  uint i;
  int cnt = 0;
   9:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
  10:	00 
  int cpu_share;
  uint start_tick;
  uint curr_tick;

  if (argc < 2) {
  11:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  15:	7f 19                	jg     30 <main+0x30>
    printf(1, "usage: sched_test_stride cpu_share(%)\n");
  17:	c7 44 24 04 c0 08 00 	movl   $0x8c0,0x4(%esp)
  1e:	00 
  1f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  26:	e8 c6 04 00 00       	call   4f1 <printf>
    exit();
  2b:	e8 21 03 00 00       	call   351 <exit>
  }

  cpu_share = atoi(argv[1]);
  30:	8b 45 0c             	mov    0xc(%ebp),%eax
  33:	83 c0 04             	add    $0x4,%eax
  36:	8b 00                	mov    (%eax),%eax
  38:	89 04 24             	mov    %eax,(%esp)
  3b:	e8 7f 02 00 00       	call   2bf <atoi>
  40:	89 44 24 24          	mov    %eax,0x24(%esp)

  // Register this process to the Stride scheduler
  if (set_cpu_share(cpu_share) < 0) {
  44:	8b 44 24 24          	mov    0x24(%esp),%eax
  48:	89 04 24             	mov    %eax,(%esp)
  4b:	e8 b9 03 00 00       	call   409 <set_cpu_share>
  50:	85 c0                	test   %eax,%eax
  52:	79 19                	jns    6d <main+0x6d>
    printf(1, "cannot set cpu share\n");
  54:	c7 44 24 04 e7 08 00 	movl   $0x8e7,0x4(%esp)
  5b:	00 
  5c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  63:	e8 89 04 00 00       	call   4f1 <printf>
    exit();
  68:	e8 e4 02 00 00       	call   351 <exit>
  }

  // Get start time
  start_tick = uptime();
  6d:	e8 77 03 00 00       	call   3e9 <uptime>
  72:	89 44 24 20          	mov    %eax,0x20(%esp)

  i = 0;
  76:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%esp)
  7d:	00 
  while (1) {
    i++;
  7e:	83 44 24 2c 01       	addl   $0x1,0x2c(%esp)

    // Prevent code optimization
    __sync_synchronize();
  83:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

    if (i == COUNT_PERIOD) {
  88:	81 7c 24 2c 40 42 0f 	cmpl   $0xf4240,0x2c(%esp)
  8f:	00 
  90:	75 55                	jne    e7 <main+0xe7>
      cnt++;
  92:	83 44 24 28 01       	addl   $0x1,0x28(%esp)

      // Get current time
      curr_tick = uptime();
  97:	e8 4d 03 00 00       	call   3e9 <uptime>
  9c:	89 44 24 1c          	mov    %eax,0x1c(%esp)

      if (curr_tick - start_tick > LIFETIME) {
  a0:	8b 44 24 20          	mov    0x20(%esp),%eax
  a4:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  a8:	29 c2                	sub    %eax,%edx
  aa:	89 d0                	mov    %edx,%eax
  ac:	3d e8 03 00 00       	cmp    $0x3e8,%eax
  b1:	76 2a                	jbe    dd <main+0xdd>
        // Terminate process
        printf(1, "STRIDE(%d%%), cnt: %d\n", cpu_share, cnt);
  b3:	8b 44 24 28          	mov    0x28(%esp),%eax
  b7:	89 44 24 0c          	mov    %eax,0xc(%esp)
  bb:	8b 44 24 24          	mov    0x24(%esp),%eax
  bf:	89 44 24 08          	mov    %eax,0x8(%esp)
  c3:	c7 44 24 04 fd 08 00 	movl   $0x8fd,0x4(%esp)
  ca:	00 
  cb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d2:	e8 1a 04 00 00       	call   4f1 <printf>
        break;
  d7:	90                   	nop
      }
      i = 0;
    }
  }

  exit();
  d8:	e8 74 02 00 00       	call   351 <exit>
      if (curr_tick - start_tick > LIFETIME) {
        // Terminate process
        printf(1, "STRIDE(%d%%), cnt: %d\n", cpu_share, cnt);
        break;
      }
      i = 0;
  dd:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%esp)
  e4:	00 
    }
  }
  e5:	eb 97                	jmp    7e <main+0x7e>
  e7:	eb 95                	jmp    7e <main+0x7e>

000000e9 <stosb>:
  e9:	55                   	push   %ebp
  ea:	89 e5                	mov    %esp,%ebp
  ec:	57                   	push   %edi
  ed:	53                   	push   %ebx
  ee:	8b 4d 08             	mov    0x8(%ebp),%ecx
  f1:	8b 55 10             	mov    0x10(%ebp),%edx
  f4:	8b 45 0c             	mov    0xc(%ebp),%eax
  f7:	89 cb                	mov    %ecx,%ebx
  f9:	89 df                	mov    %ebx,%edi
  fb:	89 d1                	mov    %edx,%ecx
  fd:	fc                   	cld    
  fe:	f3 aa                	rep stos %al,%es:(%edi)
 100:	89 ca                	mov    %ecx,%edx
 102:	89 fb                	mov    %edi,%ebx
 104:	89 5d 08             	mov    %ebx,0x8(%ebp)
 107:	89 55 10             	mov    %edx,0x10(%ebp)
 10a:	5b                   	pop    %ebx
 10b:	5f                   	pop    %edi
 10c:	5d                   	pop    %ebp
 10d:	c3                   	ret    

0000010e <strcpy>:
 10e:	55                   	push   %ebp
 10f:	89 e5                	mov    %esp,%ebp
 111:	83 ec 10             	sub    $0x10,%esp
 114:	8b 45 08             	mov    0x8(%ebp),%eax
 117:	89 45 fc             	mov    %eax,-0x4(%ebp)
 11a:	90                   	nop
 11b:	8b 45 08             	mov    0x8(%ebp),%eax
 11e:	8d 50 01             	lea    0x1(%eax),%edx
 121:	89 55 08             	mov    %edx,0x8(%ebp)
 124:	8b 55 0c             	mov    0xc(%ebp),%edx
 127:	8d 4a 01             	lea    0x1(%edx),%ecx
 12a:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 12d:	0f b6 12             	movzbl (%edx),%edx
 130:	88 10                	mov    %dl,(%eax)
 132:	0f b6 00             	movzbl (%eax),%eax
 135:	84 c0                	test   %al,%al
 137:	75 e2                	jne    11b <strcpy+0xd>
 139:	8b 45 fc             	mov    -0x4(%ebp),%eax
 13c:	c9                   	leave  
 13d:	c3                   	ret    

0000013e <strcmp>:
 13e:	55                   	push   %ebp
 13f:	89 e5                	mov    %esp,%ebp
 141:	eb 08                	jmp    14b <strcmp+0xd>
 143:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 147:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 14b:	8b 45 08             	mov    0x8(%ebp),%eax
 14e:	0f b6 00             	movzbl (%eax),%eax
 151:	84 c0                	test   %al,%al
 153:	74 10                	je     165 <strcmp+0x27>
 155:	8b 45 08             	mov    0x8(%ebp),%eax
 158:	0f b6 10             	movzbl (%eax),%edx
 15b:	8b 45 0c             	mov    0xc(%ebp),%eax
 15e:	0f b6 00             	movzbl (%eax),%eax
 161:	38 c2                	cmp    %al,%dl
 163:	74 de                	je     143 <strcmp+0x5>
 165:	8b 45 08             	mov    0x8(%ebp),%eax
 168:	0f b6 00             	movzbl (%eax),%eax
 16b:	0f b6 d0             	movzbl %al,%edx
 16e:	8b 45 0c             	mov    0xc(%ebp),%eax
 171:	0f b6 00             	movzbl (%eax),%eax
 174:	0f b6 c0             	movzbl %al,%eax
 177:	29 c2                	sub    %eax,%edx
 179:	89 d0                	mov    %edx,%eax
 17b:	5d                   	pop    %ebp
 17c:	c3                   	ret    

0000017d <strlen>:
 17d:	55                   	push   %ebp
 17e:	89 e5                	mov    %esp,%ebp
 180:	83 ec 10             	sub    $0x10,%esp
 183:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 18a:	eb 04                	jmp    190 <strlen+0x13>
 18c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 190:	8b 55 fc             	mov    -0x4(%ebp),%edx
 193:	8b 45 08             	mov    0x8(%ebp),%eax
 196:	01 d0                	add    %edx,%eax
 198:	0f b6 00             	movzbl (%eax),%eax
 19b:	84 c0                	test   %al,%al
 19d:	75 ed                	jne    18c <strlen+0xf>
 19f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 1a2:	c9                   	leave  
 1a3:	c3                   	ret    

000001a4 <memset>:
 1a4:	55                   	push   %ebp
 1a5:	89 e5                	mov    %esp,%ebp
 1a7:	83 ec 0c             	sub    $0xc,%esp
 1aa:	8b 45 10             	mov    0x10(%ebp),%eax
 1ad:	89 44 24 08          	mov    %eax,0x8(%esp)
 1b1:	8b 45 0c             	mov    0xc(%ebp),%eax
 1b4:	89 44 24 04          	mov    %eax,0x4(%esp)
 1b8:	8b 45 08             	mov    0x8(%ebp),%eax
 1bb:	89 04 24             	mov    %eax,(%esp)
 1be:	e8 26 ff ff ff       	call   e9 <stosb>
 1c3:	8b 45 08             	mov    0x8(%ebp),%eax
 1c6:	c9                   	leave  
 1c7:	c3                   	ret    

000001c8 <strchr>:
 1c8:	55                   	push   %ebp
 1c9:	89 e5                	mov    %esp,%ebp
 1cb:	83 ec 04             	sub    $0x4,%esp
 1ce:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d1:	88 45 fc             	mov    %al,-0x4(%ebp)
 1d4:	eb 14                	jmp    1ea <strchr+0x22>
 1d6:	8b 45 08             	mov    0x8(%ebp),%eax
 1d9:	0f b6 00             	movzbl (%eax),%eax
 1dc:	3a 45 fc             	cmp    -0x4(%ebp),%al
 1df:	75 05                	jne    1e6 <strchr+0x1e>
 1e1:	8b 45 08             	mov    0x8(%ebp),%eax
 1e4:	eb 13                	jmp    1f9 <strchr+0x31>
 1e6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1ea:	8b 45 08             	mov    0x8(%ebp),%eax
 1ed:	0f b6 00             	movzbl (%eax),%eax
 1f0:	84 c0                	test   %al,%al
 1f2:	75 e2                	jne    1d6 <strchr+0xe>
 1f4:	b8 00 00 00 00       	mov    $0x0,%eax
 1f9:	c9                   	leave  
 1fa:	c3                   	ret    

000001fb <gets>:
 1fb:	55                   	push   %ebp
 1fc:	89 e5                	mov    %esp,%ebp
 1fe:	83 ec 28             	sub    $0x28,%esp
 201:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 208:	eb 4c                	jmp    256 <gets+0x5b>
 20a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 211:	00 
 212:	8d 45 ef             	lea    -0x11(%ebp),%eax
 215:	89 44 24 04          	mov    %eax,0x4(%esp)
 219:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 220:	e8 44 01 00 00       	call   369 <read>
 225:	89 45 f0             	mov    %eax,-0x10(%ebp)
 228:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 22c:	7f 02                	jg     230 <gets+0x35>
 22e:	eb 31                	jmp    261 <gets+0x66>
 230:	8b 45 f4             	mov    -0xc(%ebp),%eax
 233:	8d 50 01             	lea    0x1(%eax),%edx
 236:	89 55 f4             	mov    %edx,-0xc(%ebp)
 239:	89 c2                	mov    %eax,%edx
 23b:	8b 45 08             	mov    0x8(%ebp),%eax
 23e:	01 c2                	add    %eax,%edx
 240:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 244:	88 02                	mov    %al,(%edx)
 246:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 24a:	3c 0a                	cmp    $0xa,%al
 24c:	74 13                	je     261 <gets+0x66>
 24e:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 252:	3c 0d                	cmp    $0xd,%al
 254:	74 0b                	je     261 <gets+0x66>
 256:	8b 45 f4             	mov    -0xc(%ebp),%eax
 259:	83 c0 01             	add    $0x1,%eax
 25c:	3b 45 0c             	cmp    0xc(%ebp),%eax
 25f:	7c a9                	jl     20a <gets+0xf>
 261:	8b 55 f4             	mov    -0xc(%ebp),%edx
 264:	8b 45 08             	mov    0x8(%ebp),%eax
 267:	01 d0                	add    %edx,%eax
 269:	c6 00 00             	movb   $0x0,(%eax)
 26c:	8b 45 08             	mov    0x8(%ebp),%eax
 26f:	c9                   	leave  
 270:	c3                   	ret    

00000271 <stat>:
 271:	55                   	push   %ebp
 272:	89 e5                	mov    %esp,%ebp
 274:	83 ec 28             	sub    $0x28,%esp
 277:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 27e:	00 
 27f:	8b 45 08             	mov    0x8(%ebp),%eax
 282:	89 04 24             	mov    %eax,(%esp)
 285:	e8 07 01 00 00       	call   391 <open>
 28a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 28d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 291:	79 07                	jns    29a <stat+0x29>
 293:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 298:	eb 23                	jmp    2bd <stat+0x4c>
 29a:	8b 45 0c             	mov    0xc(%ebp),%eax
 29d:	89 44 24 04          	mov    %eax,0x4(%esp)
 2a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2a4:	89 04 24             	mov    %eax,(%esp)
 2a7:	e8 fd 00 00 00       	call   3a9 <fstat>
 2ac:	89 45 f0             	mov    %eax,-0x10(%ebp)
 2af:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2b2:	89 04 24             	mov    %eax,(%esp)
 2b5:	e8 bf 00 00 00       	call   379 <close>
 2ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2bd:	c9                   	leave  
 2be:	c3                   	ret    

000002bf <atoi>:
 2bf:	55                   	push   %ebp
 2c0:	89 e5                	mov    %esp,%ebp
 2c2:	83 ec 10             	sub    $0x10,%esp
 2c5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 2cc:	eb 25                	jmp    2f3 <atoi+0x34>
 2ce:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2d1:	89 d0                	mov    %edx,%eax
 2d3:	c1 e0 02             	shl    $0x2,%eax
 2d6:	01 d0                	add    %edx,%eax
 2d8:	01 c0                	add    %eax,%eax
 2da:	89 c1                	mov    %eax,%ecx
 2dc:	8b 45 08             	mov    0x8(%ebp),%eax
 2df:	8d 50 01             	lea    0x1(%eax),%edx
 2e2:	89 55 08             	mov    %edx,0x8(%ebp)
 2e5:	0f b6 00             	movzbl (%eax),%eax
 2e8:	0f be c0             	movsbl %al,%eax
 2eb:	01 c8                	add    %ecx,%eax
 2ed:	83 e8 30             	sub    $0x30,%eax
 2f0:	89 45 fc             	mov    %eax,-0x4(%ebp)
 2f3:	8b 45 08             	mov    0x8(%ebp),%eax
 2f6:	0f b6 00             	movzbl (%eax),%eax
 2f9:	3c 2f                	cmp    $0x2f,%al
 2fb:	7e 0a                	jle    307 <atoi+0x48>
 2fd:	8b 45 08             	mov    0x8(%ebp),%eax
 300:	0f b6 00             	movzbl (%eax),%eax
 303:	3c 39                	cmp    $0x39,%al
 305:	7e c7                	jle    2ce <atoi+0xf>
 307:	8b 45 fc             	mov    -0x4(%ebp),%eax
 30a:	c9                   	leave  
 30b:	c3                   	ret    

0000030c <memmove>:
 30c:	55                   	push   %ebp
 30d:	89 e5                	mov    %esp,%ebp
 30f:	83 ec 10             	sub    $0x10,%esp
 312:	8b 45 08             	mov    0x8(%ebp),%eax
 315:	89 45 fc             	mov    %eax,-0x4(%ebp)
 318:	8b 45 0c             	mov    0xc(%ebp),%eax
 31b:	89 45 f8             	mov    %eax,-0x8(%ebp)
 31e:	eb 17                	jmp    337 <memmove+0x2b>
 320:	8b 45 fc             	mov    -0x4(%ebp),%eax
 323:	8d 50 01             	lea    0x1(%eax),%edx
 326:	89 55 fc             	mov    %edx,-0x4(%ebp)
 329:	8b 55 f8             	mov    -0x8(%ebp),%edx
 32c:	8d 4a 01             	lea    0x1(%edx),%ecx
 32f:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 332:	0f b6 12             	movzbl (%edx),%edx
 335:	88 10                	mov    %dl,(%eax)
 337:	8b 45 10             	mov    0x10(%ebp),%eax
 33a:	8d 50 ff             	lea    -0x1(%eax),%edx
 33d:	89 55 10             	mov    %edx,0x10(%ebp)
 340:	85 c0                	test   %eax,%eax
 342:	7f dc                	jg     320 <memmove+0x14>
 344:	8b 45 08             	mov    0x8(%ebp),%eax
 347:	c9                   	leave  
 348:	c3                   	ret    

00000349 <fork>:
 349:	b8 01 00 00 00       	mov    $0x1,%eax
 34e:	cd 40                	int    $0x40
 350:	c3                   	ret    

00000351 <exit>:
 351:	b8 02 00 00 00       	mov    $0x2,%eax
 356:	cd 40                	int    $0x40
 358:	c3                   	ret    

00000359 <wait>:
 359:	b8 03 00 00 00       	mov    $0x3,%eax
 35e:	cd 40                	int    $0x40
 360:	c3                   	ret    

00000361 <pipe>:
 361:	b8 04 00 00 00       	mov    $0x4,%eax
 366:	cd 40                	int    $0x40
 368:	c3                   	ret    

00000369 <read>:
 369:	b8 05 00 00 00       	mov    $0x5,%eax
 36e:	cd 40                	int    $0x40
 370:	c3                   	ret    

00000371 <write>:
 371:	b8 10 00 00 00       	mov    $0x10,%eax
 376:	cd 40                	int    $0x40
 378:	c3                   	ret    

00000379 <close>:
 379:	b8 15 00 00 00       	mov    $0x15,%eax
 37e:	cd 40                	int    $0x40
 380:	c3                   	ret    

00000381 <kill>:
 381:	b8 06 00 00 00       	mov    $0x6,%eax
 386:	cd 40                	int    $0x40
 388:	c3                   	ret    

00000389 <exec>:
 389:	b8 07 00 00 00       	mov    $0x7,%eax
 38e:	cd 40                	int    $0x40
 390:	c3                   	ret    

00000391 <open>:
 391:	b8 0f 00 00 00       	mov    $0xf,%eax
 396:	cd 40                	int    $0x40
 398:	c3                   	ret    

00000399 <mknod>:
 399:	b8 11 00 00 00       	mov    $0x11,%eax
 39e:	cd 40                	int    $0x40
 3a0:	c3                   	ret    

000003a1 <unlink>:
 3a1:	b8 12 00 00 00       	mov    $0x12,%eax
 3a6:	cd 40                	int    $0x40
 3a8:	c3                   	ret    

000003a9 <fstat>:
 3a9:	b8 08 00 00 00       	mov    $0x8,%eax
 3ae:	cd 40                	int    $0x40
 3b0:	c3                   	ret    

000003b1 <link>:
 3b1:	b8 13 00 00 00       	mov    $0x13,%eax
 3b6:	cd 40                	int    $0x40
 3b8:	c3                   	ret    

000003b9 <mkdir>:
 3b9:	b8 14 00 00 00       	mov    $0x14,%eax
 3be:	cd 40                	int    $0x40
 3c0:	c3                   	ret    

000003c1 <chdir>:
 3c1:	b8 09 00 00 00       	mov    $0x9,%eax
 3c6:	cd 40                	int    $0x40
 3c8:	c3                   	ret    

000003c9 <dup>:
 3c9:	b8 0a 00 00 00       	mov    $0xa,%eax
 3ce:	cd 40                	int    $0x40
 3d0:	c3                   	ret    

000003d1 <getpid>:
 3d1:	b8 0b 00 00 00       	mov    $0xb,%eax
 3d6:	cd 40                	int    $0x40
 3d8:	c3                   	ret    

000003d9 <sbrk>:
 3d9:	b8 0c 00 00 00       	mov    $0xc,%eax
 3de:	cd 40                	int    $0x40
 3e0:	c3                   	ret    

000003e1 <sleep>:
 3e1:	b8 0d 00 00 00       	mov    $0xd,%eax
 3e6:	cd 40                	int    $0x40
 3e8:	c3                   	ret    

000003e9 <uptime>:
 3e9:	b8 0e 00 00 00       	mov    $0xe,%eax
 3ee:	cd 40                	int    $0x40
 3f0:	c3                   	ret    

000003f1 <my_syscall>:
 3f1:	b8 16 00 00 00       	mov    $0x16,%eax
 3f6:	cd 40                	int    $0x40
 3f8:	c3                   	ret    

000003f9 <yield>:
 3f9:	b8 17 00 00 00       	mov    $0x17,%eax
 3fe:	cd 40                	int    $0x40
 400:	c3                   	ret    

00000401 <getlev>:
 401:	b8 18 00 00 00       	mov    $0x18,%eax
 406:	cd 40                	int    $0x40
 408:	c3                   	ret    

00000409 <set_cpu_share>:
 409:	b8 19 00 00 00       	mov    $0x19,%eax
 40e:	cd 40                	int    $0x40
 410:	c3                   	ret    

00000411 <putc>:
 411:	55                   	push   %ebp
 412:	89 e5                	mov    %esp,%ebp
 414:	83 ec 18             	sub    $0x18,%esp
 417:	8b 45 0c             	mov    0xc(%ebp),%eax
 41a:	88 45 f4             	mov    %al,-0xc(%ebp)
 41d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 424:	00 
 425:	8d 45 f4             	lea    -0xc(%ebp),%eax
 428:	89 44 24 04          	mov    %eax,0x4(%esp)
 42c:	8b 45 08             	mov    0x8(%ebp),%eax
 42f:	89 04 24             	mov    %eax,(%esp)
 432:	e8 3a ff ff ff       	call   371 <write>
 437:	c9                   	leave  
 438:	c3                   	ret    

00000439 <printint>:
 439:	55                   	push   %ebp
 43a:	89 e5                	mov    %esp,%ebp
 43c:	56                   	push   %esi
 43d:	53                   	push   %ebx
 43e:	83 ec 30             	sub    $0x30,%esp
 441:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 448:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 44c:	74 17                	je     465 <printint+0x2c>
 44e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 452:	79 11                	jns    465 <printint+0x2c>
 454:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
 45b:	8b 45 0c             	mov    0xc(%ebp),%eax
 45e:	f7 d8                	neg    %eax
 460:	89 45 ec             	mov    %eax,-0x14(%ebp)
 463:	eb 06                	jmp    46b <printint+0x32>
 465:	8b 45 0c             	mov    0xc(%ebp),%eax
 468:	89 45 ec             	mov    %eax,-0x14(%ebp)
 46b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 472:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 475:	8d 41 01             	lea    0x1(%ecx),%eax
 478:	89 45 f4             	mov    %eax,-0xc(%ebp)
 47b:	8b 5d 10             	mov    0x10(%ebp),%ebx
 47e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 481:	ba 00 00 00 00       	mov    $0x0,%edx
 486:	f7 f3                	div    %ebx
 488:	89 d0                	mov    %edx,%eax
 48a:	0f b6 80 60 0b 00 00 	movzbl 0xb60(%eax),%eax
 491:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 495:	8b 75 10             	mov    0x10(%ebp),%esi
 498:	8b 45 ec             	mov    -0x14(%ebp),%eax
 49b:	ba 00 00 00 00       	mov    $0x0,%edx
 4a0:	f7 f6                	div    %esi
 4a2:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4a5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4a9:	75 c7                	jne    472 <printint+0x39>
 4ab:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4af:	74 10                	je     4c1 <printint+0x88>
 4b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4b4:	8d 50 01             	lea    0x1(%eax),%edx
 4b7:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4ba:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 4bf:	eb 1f                	jmp    4e0 <printint+0xa7>
 4c1:	eb 1d                	jmp    4e0 <printint+0xa7>
 4c3:	8d 55 dc             	lea    -0x24(%ebp),%edx
 4c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4c9:	01 d0                	add    %edx,%eax
 4cb:	0f b6 00             	movzbl (%eax),%eax
 4ce:	0f be c0             	movsbl %al,%eax
 4d1:	89 44 24 04          	mov    %eax,0x4(%esp)
 4d5:	8b 45 08             	mov    0x8(%ebp),%eax
 4d8:	89 04 24             	mov    %eax,(%esp)
 4db:	e8 31 ff ff ff       	call   411 <putc>
 4e0:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 4e4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4e8:	79 d9                	jns    4c3 <printint+0x8a>
 4ea:	83 c4 30             	add    $0x30,%esp
 4ed:	5b                   	pop    %ebx
 4ee:	5e                   	pop    %esi
 4ef:	5d                   	pop    %ebp
 4f0:	c3                   	ret    

000004f1 <printf>:
 4f1:	55                   	push   %ebp
 4f2:	89 e5                	mov    %esp,%ebp
 4f4:	83 ec 38             	sub    $0x38,%esp
 4f7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 4fe:	8d 45 0c             	lea    0xc(%ebp),%eax
 501:	83 c0 04             	add    $0x4,%eax
 504:	89 45 e8             	mov    %eax,-0x18(%ebp)
 507:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 50e:	e9 7c 01 00 00       	jmp    68f <printf+0x19e>
 513:	8b 55 0c             	mov    0xc(%ebp),%edx
 516:	8b 45 f0             	mov    -0x10(%ebp),%eax
 519:	01 d0                	add    %edx,%eax
 51b:	0f b6 00             	movzbl (%eax),%eax
 51e:	0f be c0             	movsbl %al,%eax
 521:	25 ff 00 00 00       	and    $0xff,%eax
 526:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 529:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 52d:	75 2c                	jne    55b <printf+0x6a>
 52f:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 533:	75 0c                	jne    541 <printf+0x50>
 535:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 53c:	e9 4a 01 00 00       	jmp    68b <printf+0x19a>
 541:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 544:	0f be c0             	movsbl %al,%eax
 547:	89 44 24 04          	mov    %eax,0x4(%esp)
 54b:	8b 45 08             	mov    0x8(%ebp),%eax
 54e:	89 04 24             	mov    %eax,(%esp)
 551:	e8 bb fe ff ff       	call   411 <putc>
 556:	e9 30 01 00 00       	jmp    68b <printf+0x19a>
 55b:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 55f:	0f 85 26 01 00 00    	jne    68b <printf+0x19a>
 565:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 569:	75 2d                	jne    598 <printf+0xa7>
 56b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 56e:	8b 00                	mov    (%eax),%eax
 570:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 577:	00 
 578:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 57f:	00 
 580:	89 44 24 04          	mov    %eax,0x4(%esp)
 584:	8b 45 08             	mov    0x8(%ebp),%eax
 587:	89 04 24             	mov    %eax,(%esp)
 58a:	e8 aa fe ff ff       	call   439 <printint>
 58f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 593:	e9 ec 00 00 00       	jmp    684 <printf+0x193>
 598:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 59c:	74 06                	je     5a4 <printf+0xb3>
 59e:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5a2:	75 2d                	jne    5d1 <printf+0xe0>
 5a4:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5a7:	8b 00                	mov    (%eax),%eax
 5a9:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5b0:	00 
 5b1:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5b8:	00 
 5b9:	89 44 24 04          	mov    %eax,0x4(%esp)
 5bd:	8b 45 08             	mov    0x8(%ebp),%eax
 5c0:	89 04 24             	mov    %eax,(%esp)
 5c3:	e8 71 fe ff ff       	call   439 <printint>
 5c8:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5cc:	e9 b3 00 00 00       	jmp    684 <printf+0x193>
 5d1:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 5d5:	75 45                	jne    61c <printf+0x12b>
 5d7:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5da:	8b 00                	mov    (%eax),%eax
 5dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
 5df:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5e3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5e7:	75 09                	jne    5f2 <printf+0x101>
 5e9:	c7 45 f4 14 09 00 00 	movl   $0x914,-0xc(%ebp)
 5f0:	eb 1e                	jmp    610 <printf+0x11f>
 5f2:	eb 1c                	jmp    610 <printf+0x11f>
 5f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5f7:	0f b6 00             	movzbl (%eax),%eax
 5fa:	0f be c0             	movsbl %al,%eax
 5fd:	89 44 24 04          	mov    %eax,0x4(%esp)
 601:	8b 45 08             	mov    0x8(%ebp),%eax
 604:	89 04 24             	mov    %eax,(%esp)
 607:	e8 05 fe ff ff       	call   411 <putc>
 60c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 610:	8b 45 f4             	mov    -0xc(%ebp),%eax
 613:	0f b6 00             	movzbl (%eax),%eax
 616:	84 c0                	test   %al,%al
 618:	75 da                	jne    5f4 <printf+0x103>
 61a:	eb 68                	jmp    684 <printf+0x193>
 61c:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 620:	75 1d                	jne    63f <printf+0x14e>
 622:	8b 45 e8             	mov    -0x18(%ebp),%eax
 625:	8b 00                	mov    (%eax),%eax
 627:	0f be c0             	movsbl %al,%eax
 62a:	89 44 24 04          	mov    %eax,0x4(%esp)
 62e:	8b 45 08             	mov    0x8(%ebp),%eax
 631:	89 04 24             	mov    %eax,(%esp)
 634:	e8 d8 fd ff ff       	call   411 <putc>
 639:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 63d:	eb 45                	jmp    684 <printf+0x193>
 63f:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 643:	75 17                	jne    65c <printf+0x16b>
 645:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 648:	0f be c0             	movsbl %al,%eax
 64b:	89 44 24 04          	mov    %eax,0x4(%esp)
 64f:	8b 45 08             	mov    0x8(%ebp),%eax
 652:	89 04 24             	mov    %eax,(%esp)
 655:	e8 b7 fd ff ff       	call   411 <putc>
 65a:	eb 28                	jmp    684 <printf+0x193>
 65c:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 663:	00 
 664:	8b 45 08             	mov    0x8(%ebp),%eax
 667:	89 04 24             	mov    %eax,(%esp)
 66a:	e8 a2 fd ff ff       	call   411 <putc>
 66f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 672:	0f be c0             	movsbl %al,%eax
 675:	89 44 24 04          	mov    %eax,0x4(%esp)
 679:	8b 45 08             	mov    0x8(%ebp),%eax
 67c:	89 04 24             	mov    %eax,(%esp)
 67f:	e8 8d fd ff ff       	call   411 <putc>
 684:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 68b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 68f:	8b 55 0c             	mov    0xc(%ebp),%edx
 692:	8b 45 f0             	mov    -0x10(%ebp),%eax
 695:	01 d0                	add    %edx,%eax
 697:	0f b6 00             	movzbl (%eax),%eax
 69a:	84 c0                	test   %al,%al
 69c:	0f 85 71 fe ff ff    	jne    513 <printf+0x22>
 6a2:	c9                   	leave  
 6a3:	c3                   	ret    

000006a4 <free>:
 6a4:	55                   	push   %ebp
 6a5:	89 e5                	mov    %esp,%ebp
 6a7:	83 ec 10             	sub    $0x10,%esp
 6aa:	8b 45 08             	mov    0x8(%ebp),%eax
 6ad:	83 e8 08             	sub    $0x8,%eax
 6b0:	89 45 f8             	mov    %eax,-0x8(%ebp)
 6b3:	a1 7c 0b 00 00       	mov    0xb7c,%eax
 6b8:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6bb:	eb 24                	jmp    6e1 <free+0x3d>
 6bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c0:	8b 00                	mov    (%eax),%eax
 6c2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6c5:	77 12                	ja     6d9 <free+0x35>
 6c7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ca:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6cd:	77 24                	ja     6f3 <free+0x4f>
 6cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d2:	8b 00                	mov    (%eax),%eax
 6d4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6d7:	77 1a                	ja     6f3 <free+0x4f>
 6d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6dc:	8b 00                	mov    (%eax),%eax
 6de:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6e1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6e4:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6e7:	76 d4                	jbe    6bd <free+0x19>
 6e9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ec:	8b 00                	mov    (%eax),%eax
 6ee:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6f1:	76 ca                	jbe    6bd <free+0x19>
 6f3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6f6:	8b 40 04             	mov    0x4(%eax),%eax
 6f9:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 700:	8b 45 f8             	mov    -0x8(%ebp),%eax
 703:	01 c2                	add    %eax,%edx
 705:	8b 45 fc             	mov    -0x4(%ebp),%eax
 708:	8b 00                	mov    (%eax),%eax
 70a:	39 c2                	cmp    %eax,%edx
 70c:	75 24                	jne    732 <free+0x8e>
 70e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 711:	8b 50 04             	mov    0x4(%eax),%edx
 714:	8b 45 fc             	mov    -0x4(%ebp),%eax
 717:	8b 00                	mov    (%eax),%eax
 719:	8b 40 04             	mov    0x4(%eax),%eax
 71c:	01 c2                	add    %eax,%edx
 71e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 721:	89 50 04             	mov    %edx,0x4(%eax)
 724:	8b 45 fc             	mov    -0x4(%ebp),%eax
 727:	8b 00                	mov    (%eax),%eax
 729:	8b 10                	mov    (%eax),%edx
 72b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 72e:	89 10                	mov    %edx,(%eax)
 730:	eb 0a                	jmp    73c <free+0x98>
 732:	8b 45 fc             	mov    -0x4(%ebp),%eax
 735:	8b 10                	mov    (%eax),%edx
 737:	8b 45 f8             	mov    -0x8(%ebp),%eax
 73a:	89 10                	mov    %edx,(%eax)
 73c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 73f:	8b 40 04             	mov    0x4(%eax),%eax
 742:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 749:	8b 45 fc             	mov    -0x4(%ebp),%eax
 74c:	01 d0                	add    %edx,%eax
 74e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 751:	75 20                	jne    773 <free+0xcf>
 753:	8b 45 fc             	mov    -0x4(%ebp),%eax
 756:	8b 50 04             	mov    0x4(%eax),%edx
 759:	8b 45 f8             	mov    -0x8(%ebp),%eax
 75c:	8b 40 04             	mov    0x4(%eax),%eax
 75f:	01 c2                	add    %eax,%edx
 761:	8b 45 fc             	mov    -0x4(%ebp),%eax
 764:	89 50 04             	mov    %edx,0x4(%eax)
 767:	8b 45 f8             	mov    -0x8(%ebp),%eax
 76a:	8b 10                	mov    (%eax),%edx
 76c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 76f:	89 10                	mov    %edx,(%eax)
 771:	eb 08                	jmp    77b <free+0xd7>
 773:	8b 45 fc             	mov    -0x4(%ebp),%eax
 776:	8b 55 f8             	mov    -0x8(%ebp),%edx
 779:	89 10                	mov    %edx,(%eax)
 77b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 77e:	a3 7c 0b 00 00       	mov    %eax,0xb7c
 783:	c9                   	leave  
 784:	c3                   	ret    

00000785 <morecore>:
 785:	55                   	push   %ebp
 786:	89 e5                	mov    %esp,%ebp
 788:	83 ec 28             	sub    $0x28,%esp
 78b:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 792:	77 07                	ja     79b <morecore+0x16>
 794:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
 79b:	8b 45 08             	mov    0x8(%ebp),%eax
 79e:	c1 e0 03             	shl    $0x3,%eax
 7a1:	89 04 24             	mov    %eax,(%esp)
 7a4:	e8 30 fc ff ff       	call   3d9 <sbrk>
 7a9:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7ac:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7b0:	75 07                	jne    7b9 <morecore+0x34>
 7b2:	b8 00 00 00 00       	mov    $0x0,%eax
 7b7:	eb 22                	jmp    7db <morecore+0x56>
 7b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7bc:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7c2:	8b 55 08             	mov    0x8(%ebp),%edx
 7c5:	89 50 04             	mov    %edx,0x4(%eax)
 7c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7cb:	83 c0 08             	add    $0x8,%eax
 7ce:	89 04 24             	mov    %eax,(%esp)
 7d1:	e8 ce fe ff ff       	call   6a4 <free>
 7d6:	a1 7c 0b 00 00       	mov    0xb7c,%eax
 7db:	c9                   	leave  
 7dc:	c3                   	ret    

000007dd <malloc>:
 7dd:	55                   	push   %ebp
 7de:	89 e5                	mov    %esp,%ebp
 7e0:	83 ec 28             	sub    $0x28,%esp
 7e3:	8b 45 08             	mov    0x8(%ebp),%eax
 7e6:	83 c0 07             	add    $0x7,%eax
 7e9:	c1 e8 03             	shr    $0x3,%eax
 7ec:	83 c0 01             	add    $0x1,%eax
 7ef:	89 45 ec             	mov    %eax,-0x14(%ebp)
 7f2:	a1 7c 0b 00 00       	mov    0xb7c,%eax
 7f7:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7fa:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 7fe:	75 23                	jne    823 <malloc+0x46>
 800:	c7 45 f0 74 0b 00 00 	movl   $0xb74,-0x10(%ebp)
 807:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80a:	a3 7c 0b 00 00       	mov    %eax,0xb7c
 80f:	a1 7c 0b 00 00       	mov    0xb7c,%eax
 814:	a3 74 0b 00 00       	mov    %eax,0xb74
 819:	c7 05 78 0b 00 00 00 	movl   $0x0,0xb78
 820:	00 00 00 
 823:	8b 45 f0             	mov    -0x10(%ebp),%eax
 826:	8b 00                	mov    (%eax),%eax
 828:	89 45 f4             	mov    %eax,-0xc(%ebp)
 82b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 82e:	8b 40 04             	mov    0x4(%eax),%eax
 831:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 834:	72 4d                	jb     883 <malloc+0xa6>
 836:	8b 45 f4             	mov    -0xc(%ebp),%eax
 839:	8b 40 04             	mov    0x4(%eax),%eax
 83c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 83f:	75 0c                	jne    84d <malloc+0x70>
 841:	8b 45 f4             	mov    -0xc(%ebp),%eax
 844:	8b 10                	mov    (%eax),%edx
 846:	8b 45 f0             	mov    -0x10(%ebp),%eax
 849:	89 10                	mov    %edx,(%eax)
 84b:	eb 26                	jmp    873 <malloc+0x96>
 84d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 850:	8b 40 04             	mov    0x4(%eax),%eax
 853:	2b 45 ec             	sub    -0x14(%ebp),%eax
 856:	89 c2                	mov    %eax,%edx
 858:	8b 45 f4             	mov    -0xc(%ebp),%eax
 85b:	89 50 04             	mov    %edx,0x4(%eax)
 85e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 861:	8b 40 04             	mov    0x4(%eax),%eax
 864:	c1 e0 03             	shl    $0x3,%eax
 867:	01 45 f4             	add    %eax,-0xc(%ebp)
 86a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 86d:	8b 55 ec             	mov    -0x14(%ebp),%edx
 870:	89 50 04             	mov    %edx,0x4(%eax)
 873:	8b 45 f0             	mov    -0x10(%ebp),%eax
 876:	a3 7c 0b 00 00       	mov    %eax,0xb7c
 87b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 87e:	83 c0 08             	add    $0x8,%eax
 881:	eb 38                	jmp    8bb <malloc+0xde>
 883:	a1 7c 0b 00 00       	mov    0xb7c,%eax
 888:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 88b:	75 1b                	jne    8a8 <malloc+0xcb>
 88d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 890:	89 04 24             	mov    %eax,(%esp)
 893:	e8 ed fe ff ff       	call   785 <morecore>
 898:	89 45 f4             	mov    %eax,-0xc(%ebp)
 89b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 89f:	75 07                	jne    8a8 <malloc+0xcb>
 8a1:	b8 00 00 00 00       	mov    $0x0,%eax
 8a6:	eb 13                	jmp    8bb <malloc+0xde>
 8a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ab:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b1:	8b 00                	mov    (%eax),%eax
 8b3:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8b6:	e9 70 ff ff ff       	jmp    82b <malloc+0x4e>
 8bb:	c9                   	leave  
 8bc:	c3                   	ret    
