
_test_mlfq:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	83 ec 40             	sub    $0x40,%esp
   a:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
  11:	00 
  12:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%esp)
  19:	00 
  1a:	c7 44 24 30 00 00 00 	movl   $0x0,0x30(%esp)
  21:	00 
  22:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  26:	7f 19                	jg     41 <main+0x41>
  28:	c7 44 24 04 e4 08 00 	movl   $0x8e4,0x4(%esp)
  2f:	00 
  30:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  37:	e8 dc 04 00 00       	call   518 <printf>
  3c:	e8 37 03 00 00       	call   378 <exit>
  41:	8b 45 0c             	mov    0xc(%ebp),%eax
  44:	83 c0 04             	add    $0x4,%eax
  47:	8b 00                	mov    (%eax),%eax
  49:	89 04 24             	mov    %eax,(%esp)
  4c:	e8 95 02 00 00       	call   2e6 <atoi>
  51:	89 44 24 38          	mov    %eax,0x38(%esp)
  55:	c7 44 24 3c 00 00 00 	movl   $0x0,0x3c(%esp)
  5c:	00 
  5d:	83 44 24 3c 01       	addl   $0x1,0x3c(%esp)
  62:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  67:	8b 4c 24 3c          	mov    0x3c(%esp),%ecx
  6b:	ba 59 17 b7 d1       	mov    $0xd1b71759,%edx
  70:	89 c8                	mov    %ecx,%eax
  72:	f7 e2                	mul    %edx
  74:	89 d0                	mov    %edx,%eax
  76:	c1 e8 0d             	shr    $0xd,%eax
  79:	69 c0 10 27 00 00    	imul   $0x2710,%eax,%eax
  7f:	29 c1                	sub    %eax,%ecx
  81:	89 c8                	mov    %ecx,%eax
  83:	85 c0                	test   %eax,%eax
  85:	0f 85 80 00 00 00    	jne    10b <main+0x10b>
  8b:	e8 98 03 00 00       	call   428 <getlev>
  90:	89 44 24 34          	mov    %eax,0x34(%esp)
  94:	8b 44 24 34          	mov    0x34(%esp),%eax
  98:	8b 44 84 28          	mov    0x28(%esp,%eax,4),%eax
  9c:	8d 50 01             	lea    0x1(%eax),%edx
  9f:	8b 44 24 34          	mov    0x34(%esp),%eax
  a3:	89 54 84 28          	mov    %edx,0x28(%esp,%eax,4)
  a7:	81 7c 24 3c 00 c2 eb 	cmpl   $0xbebc200,0x3c(%esp)
  ae:	0b 
  af:	76 49                	jbe    fa <main+0xfa>
  b1:	8b 5c 24 30          	mov    0x30(%esp),%ebx
  b5:	8b 4c 24 2c          	mov    0x2c(%esp),%ecx
  b9:	8b 54 24 28          	mov    0x28(%esp),%edx
  bd:	83 7c 24 38 00       	cmpl   $0x0,0x38(%esp)
  c2:	75 07                	jne    cb <main+0xcb>
  c4:	b8 11 09 00 00       	mov    $0x911,%eax
  c9:	eb 05                	jmp    d0 <main+0xd0>
  cb:	b8 19 09 00 00       	mov    $0x919,%eax
  d0:	89 5c 24 14          	mov    %ebx,0x14(%esp)
  d4:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  d8:	89 54 24 0c          	mov    %edx,0xc(%esp)
  dc:	89 44 24 08          	mov    %eax,0x8(%esp)
  e0:	c7 44 24 04 20 09 00 	movl   $0x920,0x4(%esp)
  e7:	00 
  e8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  ef:	e8 24 04 00 00       	call   518 <printf>
  f4:	90                   	nop
  f5:	e8 7e 02 00 00       	call   378 <exit>
  fa:	83 7c 24 38 00       	cmpl   $0x0,0x38(%esp)
  ff:	74 0a                	je     10b <main+0x10b>
 101:	e8 1a 03 00 00       	call   420 <yield>
 106:	e9 52 ff ff ff       	jmp    5d <main+0x5d>
 10b:	e9 4d ff ff ff       	jmp    5d <main+0x5d>

00000110 <stosb>:
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	57                   	push   %edi
 114:	53                   	push   %ebx
 115:	8b 4d 08             	mov    0x8(%ebp),%ecx
 118:	8b 55 10             	mov    0x10(%ebp),%edx
 11b:	8b 45 0c             	mov    0xc(%ebp),%eax
 11e:	89 cb                	mov    %ecx,%ebx
 120:	89 df                	mov    %ebx,%edi
 122:	89 d1                	mov    %edx,%ecx
 124:	fc                   	cld    
 125:	f3 aa                	rep stos %al,%es:(%edi)
 127:	89 ca                	mov    %ecx,%edx
 129:	89 fb                	mov    %edi,%ebx
 12b:	89 5d 08             	mov    %ebx,0x8(%ebp)
 12e:	89 55 10             	mov    %edx,0x10(%ebp)
 131:	5b                   	pop    %ebx
 132:	5f                   	pop    %edi
 133:	5d                   	pop    %ebp
 134:	c3                   	ret    

00000135 <strcpy>:
 135:	55                   	push   %ebp
 136:	89 e5                	mov    %esp,%ebp
 138:	83 ec 10             	sub    $0x10,%esp
 13b:	8b 45 08             	mov    0x8(%ebp),%eax
 13e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 141:	90                   	nop
 142:	8b 45 08             	mov    0x8(%ebp),%eax
 145:	8d 50 01             	lea    0x1(%eax),%edx
 148:	89 55 08             	mov    %edx,0x8(%ebp)
 14b:	8b 55 0c             	mov    0xc(%ebp),%edx
 14e:	8d 4a 01             	lea    0x1(%edx),%ecx
 151:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 154:	0f b6 12             	movzbl (%edx),%edx
 157:	88 10                	mov    %dl,(%eax)
 159:	0f b6 00             	movzbl (%eax),%eax
 15c:	84 c0                	test   %al,%al
 15e:	75 e2                	jne    142 <strcpy+0xd>
 160:	8b 45 fc             	mov    -0x4(%ebp),%eax
 163:	c9                   	leave  
 164:	c3                   	ret    

00000165 <strcmp>:
 165:	55                   	push   %ebp
 166:	89 e5                	mov    %esp,%ebp
 168:	eb 08                	jmp    172 <strcmp+0xd>
 16a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 16e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 172:	8b 45 08             	mov    0x8(%ebp),%eax
 175:	0f b6 00             	movzbl (%eax),%eax
 178:	84 c0                	test   %al,%al
 17a:	74 10                	je     18c <strcmp+0x27>
 17c:	8b 45 08             	mov    0x8(%ebp),%eax
 17f:	0f b6 10             	movzbl (%eax),%edx
 182:	8b 45 0c             	mov    0xc(%ebp),%eax
 185:	0f b6 00             	movzbl (%eax),%eax
 188:	38 c2                	cmp    %al,%dl
 18a:	74 de                	je     16a <strcmp+0x5>
 18c:	8b 45 08             	mov    0x8(%ebp),%eax
 18f:	0f b6 00             	movzbl (%eax),%eax
 192:	0f b6 d0             	movzbl %al,%edx
 195:	8b 45 0c             	mov    0xc(%ebp),%eax
 198:	0f b6 00             	movzbl (%eax),%eax
 19b:	0f b6 c0             	movzbl %al,%eax
 19e:	29 c2                	sub    %eax,%edx
 1a0:	89 d0                	mov    %edx,%eax
 1a2:	5d                   	pop    %ebp
 1a3:	c3                   	ret    

000001a4 <strlen>:
 1a4:	55                   	push   %ebp
 1a5:	89 e5                	mov    %esp,%ebp
 1a7:	83 ec 10             	sub    $0x10,%esp
 1aa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1b1:	eb 04                	jmp    1b7 <strlen+0x13>
 1b3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1b7:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1ba:	8b 45 08             	mov    0x8(%ebp),%eax
 1bd:	01 d0                	add    %edx,%eax
 1bf:	0f b6 00             	movzbl (%eax),%eax
 1c2:	84 c0                	test   %al,%al
 1c4:	75 ed                	jne    1b3 <strlen+0xf>
 1c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 1c9:	c9                   	leave  
 1ca:	c3                   	ret    

000001cb <memset>:
 1cb:	55                   	push   %ebp
 1cc:	89 e5                	mov    %esp,%ebp
 1ce:	83 ec 0c             	sub    $0xc,%esp
 1d1:	8b 45 10             	mov    0x10(%ebp),%eax
 1d4:	89 44 24 08          	mov    %eax,0x8(%esp)
 1d8:	8b 45 0c             	mov    0xc(%ebp),%eax
 1db:	89 44 24 04          	mov    %eax,0x4(%esp)
 1df:	8b 45 08             	mov    0x8(%ebp),%eax
 1e2:	89 04 24             	mov    %eax,(%esp)
 1e5:	e8 26 ff ff ff       	call   110 <stosb>
 1ea:	8b 45 08             	mov    0x8(%ebp),%eax
 1ed:	c9                   	leave  
 1ee:	c3                   	ret    

000001ef <strchr>:
 1ef:	55                   	push   %ebp
 1f0:	89 e5                	mov    %esp,%ebp
 1f2:	83 ec 04             	sub    $0x4,%esp
 1f5:	8b 45 0c             	mov    0xc(%ebp),%eax
 1f8:	88 45 fc             	mov    %al,-0x4(%ebp)
 1fb:	eb 14                	jmp    211 <strchr+0x22>
 1fd:	8b 45 08             	mov    0x8(%ebp),%eax
 200:	0f b6 00             	movzbl (%eax),%eax
 203:	3a 45 fc             	cmp    -0x4(%ebp),%al
 206:	75 05                	jne    20d <strchr+0x1e>
 208:	8b 45 08             	mov    0x8(%ebp),%eax
 20b:	eb 13                	jmp    220 <strchr+0x31>
 20d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 211:	8b 45 08             	mov    0x8(%ebp),%eax
 214:	0f b6 00             	movzbl (%eax),%eax
 217:	84 c0                	test   %al,%al
 219:	75 e2                	jne    1fd <strchr+0xe>
 21b:	b8 00 00 00 00       	mov    $0x0,%eax
 220:	c9                   	leave  
 221:	c3                   	ret    

00000222 <gets>:
 222:	55                   	push   %ebp
 223:	89 e5                	mov    %esp,%ebp
 225:	83 ec 28             	sub    $0x28,%esp
 228:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 22f:	eb 4c                	jmp    27d <gets+0x5b>
 231:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 238:	00 
 239:	8d 45 ef             	lea    -0x11(%ebp),%eax
 23c:	89 44 24 04          	mov    %eax,0x4(%esp)
 240:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 247:	e8 44 01 00 00       	call   390 <read>
 24c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 24f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 253:	7f 02                	jg     257 <gets+0x35>
 255:	eb 31                	jmp    288 <gets+0x66>
 257:	8b 45 f4             	mov    -0xc(%ebp),%eax
 25a:	8d 50 01             	lea    0x1(%eax),%edx
 25d:	89 55 f4             	mov    %edx,-0xc(%ebp)
 260:	89 c2                	mov    %eax,%edx
 262:	8b 45 08             	mov    0x8(%ebp),%eax
 265:	01 c2                	add    %eax,%edx
 267:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 26b:	88 02                	mov    %al,(%edx)
 26d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 271:	3c 0a                	cmp    $0xa,%al
 273:	74 13                	je     288 <gets+0x66>
 275:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 279:	3c 0d                	cmp    $0xd,%al
 27b:	74 0b                	je     288 <gets+0x66>
 27d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 280:	83 c0 01             	add    $0x1,%eax
 283:	3b 45 0c             	cmp    0xc(%ebp),%eax
 286:	7c a9                	jl     231 <gets+0xf>
 288:	8b 55 f4             	mov    -0xc(%ebp),%edx
 28b:	8b 45 08             	mov    0x8(%ebp),%eax
 28e:	01 d0                	add    %edx,%eax
 290:	c6 00 00             	movb   $0x0,(%eax)
 293:	8b 45 08             	mov    0x8(%ebp),%eax
 296:	c9                   	leave  
 297:	c3                   	ret    

00000298 <stat>:
 298:	55                   	push   %ebp
 299:	89 e5                	mov    %esp,%ebp
 29b:	83 ec 28             	sub    $0x28,%esp
 29e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2a5:	00 
 2a6:	8b 45 08             	mov    0x8(%ebp),%eax
 2a9:	89 04 24             	mov    %eax,(%esp)
 2ac:	e8 07 01 00 00       	call   3b8 <open>
 2b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
 2b4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2b8:	79 07                	jns    2c1 <stat+0x29>
 2ba:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2bf:	eb 23                	jmp    2e4 <stat+0x4c>
 2c1:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c4:	89 44 24 04          	mov    %eax,0x4(%esp)
 2c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2cb:	89 04 24             	mov    %eax,(%esp)
 2ce:	e8 fd 00 00 00       	call   3d0 <fstat>
 2d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
 2d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2d9:	89 04 24             	mov    %eax,(%esp)
 2dc:	e8 bf 00 00 00       	call   3a0 <close>
 2e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2e4:	c9                   	leave  
 2e5:	c3                   	ret    

000002e6 <atoi>:
 2e6:	55                   	push   %ebp
 2e7:	89 e5                	mov    %esp,%ebp
 2e9:	83 ec 10             	sub    $0x10,%esp
 2ec:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 2f3:	eb 25                	jmp    31a <atoi+0x34>
 2f5:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2f8:	89 d0                	mov    %edx,%eax
 2fa:	c1 e0 02             	shl    $0x2,%eax
 2fd:	01 d0                	add    %edx,%eax
 2ff:	01 c0                	add    %eax,%eax
 301:	89 c1                	mov    %eax,%ecx
 303:	8b 45 08             	mov    0x8(%ebp),%eax
 306:	8d 50 01             	lea    0x1(%eax),%edx
 309:	89 55 08             	mov    %edx,0x8(%ebp)
 30c:	0f b6 00             	movzbl (%eax),%eax
 30f:	0f be c0             	movsbl %al,%eax
 312:	01 c8                	add    %ecx,%eax
 314:	83 e8 30             	sub    $0x30,%eax
 317:	89 45 fc             	mov    %eax,-0x4(%ebp)
 31a:	8b 45 08             	mov    0x8(%ebp),%eax
 31d:	0f b6 00             	movzbl (%eax),%eax
 320:	3c 2f                	cmp    $0x2f,%al
 322:	7e 0a                	jle    32e <atoi+0x48>
 324:	8b 45 08             	mov    0x8(%ebp),%eax
 327:	0f b6 00             	movzbl (%eax),%eax
 32a:	3c 39                	cmp    $0x39,%al
 32c:	7e c7                	jle    2f5 <atoi+0xf>
 32e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 331:	c9                   	leave  
 332:	c3                   	ret    

00000333 <memmove>:
 333:	55                   	push   %ebp
 334:	89 e5                	mov    %esp,%ebp
 336:	83 ec 10             	sub    $0x10,%esp
 339:	8b 45 08             	mov    0x8(%ebp),%eax
 33c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 33f:	8b 45 0c             	mov    0xc(%ebp),%eax
 342:	89 45 f8             	mov    %eax,-0x8(%ebp)
 345:	eb 17                	jmp    35e <memmove+0x2b>
 347:	8b 45 fc             	mov    -0x4(%ebp),%eax
 34a:	8d 50 01             	lea    0x1(%eax),%edx
 34d:	89 55 fc             	mov    %edx,-0x4(%ebp)
 350:	8b 55 f8             	mov    -0x8(%ebp),%edx
 353:	8d 4a 01             	lea    0x1(%edx),%ecx
 356:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 359:	0f b6 12             	movzbl (%edx),%edx
 35c:	88 10                	mov    %dl,(%eax)
 35e:	8b 45 10             	mov    0x10(%ebp),%eax
 361:	8d 50 ff             	lea    -0x1(%eax),%edx
 364:	89 55 10             	mov    %edx,0x10(%ebp)
 367:	85 c0                	test   %eax,%eax
 369:	7f dc                	jg     347 <memmove+0x14>
 36b:	8b 45 08             	mov    0x8(%ebp),%eax
 36e:	c9                   	leave  
 36f:	c3                   	ret    

00000370 <fork>:
 370:	b8 01 00 00 00       	mov    $0x1,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <exit>:
 378:	b8 02 00 00 00       	mov    $0x2,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <wait>:
 380:	b8 03 00 00 00       	mov    $0x3,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <pipe>:
 388:	b8 04 00 00 00       	mov    $0x4,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <read>:
 390:	b8 05 00 00 00       	mov    $0x5,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <write>:
 398:	b8 10 00 00 00       	mov    $0x10,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <close>:
 3a0:	b8 15 00 00 00       	mov    $0x15,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <kill>:
 3a8:	b8 06 00 00 00       	mov    $0x6,%eax
 3ad:	cd 40                	int    $0x40
 3af:	c3                   	ret    

000003b0 <exec>:
 3b0:	b8 07 00 00 00       	mov    $0x7,%eax
 3b5:	cd 40                	int    $0x40
 3b7:	c3                   	ret    

000003b8 <open>:
 3b8:	b8 0f 00 00 00       	mov    $0xf,%eax
 3bd:	cd 40                	int    $0x40
 3bf:	c3                   	ret    

000003c0 <mknod>:
 3c0:	b8 11 00 00 00       	mov    $0x11,%eax
 3c5:	cd 40                	int    $0x40
 3c7:	c3                   	ret    

000003c8 <unlink>:
 3c8:	b8 12 00 00 00       	mov    $0x12,%eax
 3cd:	cd 40                	int    $0x40
 3cf:	c3                   	ret    

000003d0 <fstat>:
 3d0:	b8 08 00 00 00       	mov    $0x8,%eax
 3d5:	cd 40                	int    $0x40
 3d7:	c3                   	ret    

000003d8 <link>:
 3d8:	b8 13 00 00 00       	mov    $0x13,%eax
 3dd:	cd 40                	int    $0x40
 3df:	c3                   	ret    

000003e0 <mkdir>:
 3e0:	b8 14 00 00 00       	mov    $0x14,%eax
 3e5:	cd 40                	int    $0x40
 3e7:	c3                   	ret    

000003e8 <chdir>:
 3e8:	b8 09 00 00 00       	mov    $0x9,%eax
 3ed:	cd 40                	int    $0x40
 3ef:	c3                   	ret    

000003f0 <dup>:
 3f0:	b8 0a 00 00 00       	mov    $0xa,%eax
 3f5:	cd 40                	int    $0x40
 3f7:	c3                   	ret    

000003f8 <getpid>:
 3f8:	b8 0b 00 00 00       	mov    $0xb,%eax
 3fd:	cd 40                	int    $0x40
 3ff:	c3                   	ret    

00000400 <sbrk>:
 400:	b8 0c 00 00 00       	mov    $0xc,%eax
 405:	cd 40                	int    $0x40
 407:	c3                   	ret    

00000408 <sleep>:
 408:	b8 0d 00 00 00       	mov    $0xd,%eax
 40d:	cd 40                	int    $0x40
 40f:	c3                   	ret    

00000410 <uptime>:
 410:	b8 0e 00 00 00       	mov    $0xe,%eax
 415:	cd 40                	int    $0x40
 417:	c3                   	ret    

00000418 <my_syscall>:
 418:	b8 16 00 00 00       	mov    $0x16,%eax
 41d:	cd 40                	int    $0x40
 41f:	c3                   	ret    

00000420 <yield>:
 420:	b8 17 00 00 00       	mov    $0x17,%eax
 425:	cd 40                	int    $0x40
 427:	c3                   	ret    

00000428 <getlev>:
 428:	b8 18 00 00 00       	mov    $0x18,%eax
 42d:	cd 40                	int    $0x40
 42f:	c3                   	ret    

00000430 <set_cpu_share>:
 430:	b8 19 00 00 00       	mov    $0x19,%eax
 435:	cd 40                	int    $0x40
 437:	c3                   	ret    

00000438 <putc>:
 438:	55                   	push   %ebp
 439:	89 e5                	mov    %esp,%ebp
 43b:	83 ec 18             	sub    $0x18,%esp
 43e:	8b 45 0c             	mov    0xc(%ebp),%eax
 441:	88 45 f4             	mov    %al,-0xc(%ebp)
 444:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 44b:	00 
 44c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 44f:	89 44 24 04          	mov    %eax,0x4(%esp)
 453:	8b 45 08             	mov    0x8(%ebp),%eax
 456:	89 04 24             	mov    %eax,(%esp)
 459:	e8 3a ff ff ff       	call   398 <write>
 45e:	c9                   	leave  
 45f:	c3                   	ret    

00000460 <printint>:
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	56                   	push   %esi
 464:	53                   	push   %ebx
 465:	83 ec 30             	sub    $0x30,%esp
 468:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 46f:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 473:	74 17                	je     48c <printint+0x2c>
 475:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 479:	79 11                	jns    48c <printint+0x2c>
 47b:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
 482:	8b 45 0c             	mov    0xc(%ebp),%eax
 485:	f7 d8                	neg    %eax
 487:	89 45 ec             	mov    %eax,-0x14(%ebp)
 48a:	eb 06                	jmp    492 <printint+0x32>
 48c:	8b 45 0c             	mov    0xc(%ebp),%eax
 48f:	89 45 ec             	mov    %eax,-0x14(%ebp)
 492:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 499:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 49c:	8d 41 01             	lea    0x1(%ecx),%eax
 49f:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4a2:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4a5:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4a8:	ba 00 00 00 00       	mov    $0x0,%edx
 4ad:	f7 f3                	div    %ebx
 4af:	89 d0                	mov    %edx,%eax
 4b1:	0f b6 80 9c 0b 00 00 	movzbl 0xb9c(%eax),%eax
 4b8:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 4bc:	8b 75 10             	mov    0x10(%ebp),%esi
 4bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4c2:	ba 00 00 00 00       	mov    $0x0,%edx
 4c7:	f7 f6                	div    %esi
 4c9:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4cc:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4d0:	75 c7                	jne    499 <printint+0x39>
 4d2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4d6:	74 10                	je     4e8 <printint+0x88>
 4d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4db:	8d 50 01             	lea    0x1(%eax),%edx
 4de:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4e1:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 4e6:	eb 1f                	jmp    507 <printint+0xa7>
 4e8:	eb 1d                	jmp    507 <printint+0xa7>
 4ea:	8d 55 dc             	lea    -0x24(%ebp),%edx
 4ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4f0:	01 d0                	add    %edx,%eax
 4f2:	0f b6 00             	movzbl (%eax),%eax
 4f5:	0f be c0             	movsbl %al,%eax
 4f8:	89 44 24 04          	mov    %eax,0x4(%esp)
 4fc:	8b 45 08             	mov    0x8(%ebp),%eax
 4ff:	89 04 24             	mov    %eax,(%esp)
 502:	e8 31 ff ff ff       	call   438 <putc>
 507:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 50b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 50f:	79 d9                	jns    4ea <printint+0x8a>
 511:	83 c4 30             	add    $0x30,%esp
 514:	5b                   	pop    %ebx
 515:	5e                   	pop    %esi
 516:	5d                   	pop    %ebp
 517:	c3                   	ret    

00000518 <printf>:
 518:	55                   	push   %ebp
 519:	89 e5                	mov    %esp,%ebp
 51b:	83 ec 38             	sub    $0x38,%esp
 51e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 525:	8d 45 0c             	lea    0xc(%ebp),%eax
 528:	83 c0 04             	add    $0x4,%eax
 52b:	89 45 e8             	mov    %eax,-0x18(%ebp)
 52e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 535:	e9 7c 01 00 00       	jmp    6b6 <printf+0x19e>
 53a:	8b 55 0c             	mov    0xc(%ebp),%edx
 53d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 540:	01 d0                	add    %edx,%eax
 542:	0f b6 00             	movzbl (%eax),%eax
 545:	0f be c0             	movsbl %al,%eax
 548:	25 ff 00 00 00       	and    $0xff,%eax
 54d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 550:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 554:	75 2c                	jne    582 <printf+0x6a>
 556:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 55a:	75 0c                	jne    568 <printf+0x50>
 55c:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 563:	e9 4a 01 00 00       	jmp    6b2 <printf+0x19a>
 568:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 56b:	0f be c0             	movsbl %al,%eax
 56e:	89 44 24 04          	mov    %eax,0x4(%esp)
 572:	8b 45 08             	mov    0x8(%ebp),%eax
 575:	89 04 24             	mov    %eax,(%esp)
 578:	e8 bb fe ff ff       	call   438 <putc>
 57d:	e9 30 01 00 00       	jmp    6b2 <printf+0x19a>
 582:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 586:	0f 85 26 01 00 00    	jne    6b2 <printf+0x19a>
 58c:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 590:	75 2d                	jne    5bf <printf+0xa7>
 592:	8b 45 e8             	mov    -0x18(%ebp),%eax
 595:	8b 00                	mov    (%eax),%eax
 597:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 59e:	00 
 59f:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 5a6:	00 
 5a7:	89 44 24 04          	mov    %eax,0x4(%esp)
 5ab:	8b 45 08             	mov    0x8(%ebp),%eax
 5ae:	89 04 24             	mov    %eax,(%esp)
 5b1:	e8 aa fe ff ff       	call   460 <printint>
 5b6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5ba:	e9 ec 00 00 00       	jmp    6ab <printf+0x193>
 5bf:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 5c3:	74 06                	je     5cb <printf+0xb3>
 5c5:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5c9:	75 2d                	jne    5f8 <printf+0xe0>
 5cb:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5ce:	8b 00                	mov    (%eax),%eax
 5d0:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5d7:	00 
 5d8:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5df:	00 
 5e0:	89 44 24 04          	mov    %eax,0x4(%esp)
 5e4:	8b 45 08             	mov    0x8(%ebp),%eax
 5e7:	89 04 24             	mov    %eax,(%esp)
 5ea:	e8 71 fe ff ff       	call   460 <printint>
 5ef:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5f3:	e9 b3 00 00 00       	jmp    6ab <printf+0x193>
 5f8:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 5fc:	75 45                	jne    643 <printf+0x12b>
 5fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
 601:	8b 00                	mov    (%eax),%eax
 603:	89 45 f4             	mov    %eax,-0xc(%ebp)
 606:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 60a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 60e:	75 09                	jne    619 <printf+0x101>
 610:	c7 45 f4 4e 09 00 00 	movl   $0x94e,-0xc(%ebp)
 617:	eb 1e                	jmp    637 <printf+0x11f>
 619:	eb 1c                	jmp    637 <printf+0x11f>
 61b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 61e:	0f b6 00             	movzbl (%eax),%eax
 621:	0f be c0             	movsbl %al,%eax
 624:	89 44 24 04          	mov    %eax,0x4(%esp)
 628:	8b 45 08             	mov    0x8(%ebp),%eax
 62b:	89 04 24             	mov    %eax,(%esp)
 62e:	e8 05 fe ff ff       	call   438 <putc>
 633:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 637:	8b 45 f4             	mov    -0xc(%ebp),%eax
 63a:	0f b6 00             	movzbl (%eax),%eax
 63d:	84 c0                	test   %al,%al
 63f:	75 da                	jne    61b <printf+0x103>
 641:	eb 68                	jmp    6ab <printf+0x193>
 643:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 647:	75 1d                	jne    666 <printf+0x14e>
 649:	8b 45 e8             	mov    -0x18(%ebp),%eax
 64c:	8b 00                	mov    (%eax),%eax
 64e:	0f be c0             	movsbl %al,%eax
 651:	89 44 24 04          	mov    %eax,0x4(%esp)
 655:	8b 45 08             	mov    0x8(%ebp),%eax
 658:	89 04 24             	mov    %eax,(%esp)
 65b:	e8 d8 fd ff ff       	call   438 <putc>
 660:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 664:	eb 45                	jmp    6ab <printf+0x193>
 666:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 66a:	75 17                	jne    683 <printf+0x16b>
 66c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 66f:	0f be c0             	movsbl %al,%eax
 672:	89 44 24 04          	mov    %eax,0x4(%esp)
 676:	8b 45 08             	mov    0x8(%ebp),%eax
 679:	89 04 24             	mov    %eax,(%esp)
 67c:	e8 b7 fd ff ff       	call   438 <putc>
 681:	eb 28                	jmp    6ab <printf+0x193>
 683:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 68a:	00 
 68b:	8b 45 08             	mov    0x8(%ebp),%eax
 68e:	89 04 24             	mov    %eax,(%esp)
 691:	e8 a2 fd ff ff       	call   438 <putc>
 696:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 699:	0f be c0             	movsbl %al,%eax
 69c:	89 44 24 04          	mov    %eax,0x4(%esp)
 6a0:	8b 45 08             	mov    0x8(%ebp),%eax
 6a3:	89 04 24             	mov    %eax,(%esp)
 6a6:	e8 8d fd ff ff       	call   438 <putc>
 6ab:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 6b2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 6b6:	8b 55 0c             	mov    0xc(%ebp),%edx
 6b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6bc:	01 d0                	add    %edx,%eax
 6be:	0f b6 00             	movzbl (%eax),%eax
 6c1:	84 c0                	test   %al,%al
 6c3:	0f 85 71 fe ff ff    	jne    53a <printf+0x22>
 6c9:	c9                   	leave  
 6ca:	c3                   	ret    

000006cb <free>:
 6cb:	55                   	push   %ebp
 6cc:	89 e5                	mov    %esp,%ebp
 6ce:	83 ec 10             	sub    $0x10,%esp
 6d1:	8b 45 08             	mov    0x8(%ebp),%eax
 6d4:	83 e8 08             	sub    $0x8,%eax
 6d7:	89 45 f8             	mov    %eax,-0x8(%ebp)
 6da:	a1 b8 0b 00 00       	mov    0xbb8,%eax
 6df:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6e2:	eb 24                	jmp    708 <free+0x3d>
 6e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e7:	8b 00                	mov    (%eax),%eax
 6e9:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6ec:	77 12                	ja     700 <free+0x35>
 6ee:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6f1:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6f4:	77 24                	ja     71a <free+0x4f>
 6f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f9:	8b 00                	mov    (%eax),%eax
 6fb:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6fe:	77 1a                	ja     71a <free+0x4f>
 700:	8b 45 fc             	mov    -0x4(%ebp),%eax
 703:	8b 00                	mov    (%eax),%eax
 705:	89 45 fc             	mov    %eax,-0x4(%ebp)
 708:	8b 45 f8             	mov    -0x8(%ebp),%eax
 70b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 70e:	76 d4                	jbe    6e4 <free+0x19>
 710:	8b 45 fc             	mov    -0x4(%ebp),%eax
 713:	8b 00                	mov    (%eax),%eax
 715:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 718:	76 ca                	jbe    6e4 <free+0x19>
 71a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 71d:	8b 40 04             	mov    0x4(%eax),%eax
 720:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 727:	8b 45 f8             	mov    -0x8(%ebp),%eax
 72a:	01 c2                	add    %eax,%edx
 72c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 72f:	8b 00                	mov    (%eax),%eax
 731:	39 c2                	cmp    %eax,%edx
 733:	75 24                	jne    759 <free+0x8e>
 735:	8b 45 f8             	mov    -0x8(%ebp),%eax
 738:	8b 50 04             	mov    0x4(%eax),%edx
 73b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 73e:	8b 00                	mov    (%eax),%eax
 740:	8b 40 04             	mov    0x4(%eax),%eax
 743:	01 c2                	add    %eax,%edx
 745:	8b 45 f8             	mov    -0x8(%ebp),%eax
 748:	89 50 04             	mov    %edx,0x4(%eax)
 74b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 74e:	8b 00                	mov    (%eax),%eax
 750:	8b 10                	mov    (%eax),%edx
 752:	8b 45 f8             	mov    -0x8(%ebp),%eax
 755:	89 10                	mov    %edx,(%eax)
 757:	eb 0a                	jmp    763 <free+0x98>
 759:	8b 45 fc             	mov    -0x4(%ebp),%eax
 75c:	8b 10                	mov    (%eax),%edx
 75e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 761:	89 10                	mov    %edx,(%eax)
 763:	8b 45 fc             	mov    -0x4(%ebp),%eax
 766:	8b 40 04             	mov    0x4(%eax),%eax
 769:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 770:	8b 45 fc             	mov    -0x4(%ebp),%eax
 773:	01 d0                	add    %edx,%eax
 775:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 778:	75 20                	jne    79a <free+0xcf>
 77a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 77d:	8b 50 04             	mov    0x4(%eax),%edx
 780:	8b 45 f8             	mov    -0x8(%ebp),%eax
 783:	8b 40 04             	mov    0x4(%eax),%eax
 786:	01 c2                	add    %eax,%edx
 788:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78b:	89 50 04             	mov    %edx,0x4(%eax)
 78e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 791:	8b 10                	mov    (%eax),%edx
 793:	8b 45 fc             	mov    -0x4(%ebp),%eax
 796:	89 10                	mov    %edx,(%eax)
 798:	eb 08                	jmp    7a2 <free+0xd7>
 79a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79d:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7a0:	89 10                	mov    %edx,(%eax)
 7a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a5:	a3 b8 0b 00 00       	mov    %eax,0xbb8
 7aa:	c9                   	leave  
 7ab:	c3                   	ret    

000007ac <morecore>:
 7ac:	55                   	push   %ebp
 7ad:	89 e5                	mov    %esp,%ebp
 7af:	83 ec 28             	sub    $0x28,%esp
 7b2:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7b9:	77 07                	ja     7c2 <morecore+0x16>
 7bb:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
 7c2:	8b 45 08             	mov    0x8(%ebp),%eax
 7c5:	c1 e0 03             	shl    $0x3,%eax
 7c8:	89 04 24             	mov    %eax,(%esp)
 7cb:	e8 30 fc ff ff       	call   400 <sbrk>
 7d0:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7d3:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7d7:	75 07                	jne    7e0 <morecore+0x34>
 7d9:	b8 00 00 00 00       	mov    $0x0,%eax
 7de:	eb 22                	jmp    802 <morecore+0x56>
 7e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e3:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7e9:	8b 55 08             	mov    0x8(%ebp),%edx
 7ec:	89 50 04             	mov    %edx,0x4(%eax)
 7ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7f2:	83 c0 08             	add    $0x8,%eax
 7f5:	89 04 24             	mov    %eax,(%esp)
 7f8:	e8 ce fe ff ff       	call   6cb <free>
 7fd:	a1 b8 0b 00 00       	mov    0xbb8,%eax
 802:	c9                   	leave  
 803:	c3                   	ret    

00000804 <malloc>:
 804:	55                   	push   %ebp
 805:	89 e5                	mov    %esp,%ebp
 807:	83 ec 28             	sub    $0x28,%esp
 80a:	8b 45 08             	mov    0x8(%ebp),%eax
 80d:	83 c0 07             	add    $0x7,%eax
 810:	c1 e8 03             	shr    $0x3,%eax
 813:	83 c0 01             	add    $0x1,%eax
 816:	89 45 ec             	mov    %eax,-0x14(%ebp)
 819:	a1 b8 0b 00 00       	mov    0xbb8,%eax
 81e:	89 45 f0             	mov    %eax,-0x10(%ebp)
 821:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 825:	75 23                	jne    84a <malloc+0x46>
 827:	c7 45 f0 b0 0b 00 00 	movl   $0xbb0,-0x10(%ebp)
 82e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 831:	a3 b8 0b 00 00       	mov    %eax,0xbb8
 836:	a1 b8 0b 00 00       	mov    0xbb8,%eax
 83b:	a3 b0 0b 00 00       	mov    %eax,0xbb0
 840:	c7 05 b4 0b 00 00 00 	movl   $0x0,0xbb4
 847:	00 00 00 
 84a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 84d:	8b 00                	mov    (%eax),%eax
 84f:	89 45 f4             	mov    %eax,-0xc(%ebp)
 852:	8b 45 f4             	mov    -0xc(%ebp),%eax
 855:	8b 40 04             	mov    0x4(%eax),%eax
 858:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 85b:	72 4d                	jb     8aa <malloc+0xa6>
 85d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 860:	8b 40 04             	mov    0x4(%eax),%eax
 863:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 866:	75 0c                	jne    874 <malloc+0x70>
 868:	8b 45 f4             	mov    -0xc(%ebp),%eax
 86b:	8b 10                	mov    (%eax),%edx
 86d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 870:	89 10                	mov    %edx,(%eax)
 872:	eb 26                	jmp    89a <malloc+0x96>
 874:	8b 45 f4             	mov    -0xc(%ebp),%eax
 877:	8b 40 04             	mov    0x4(%eax),%eax
 87a:	2b 45 ec             	sub    -0x14(%ebp),%eax
 87d:	89 c2                	mov    %eax,%edx
 87f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 882:	89 50 04             	mov    %edx,0x4(%eax)
 885:	8b 45 f4             	mov    -0xc(%ebp),%eax
 888:	8b 40 04             	mov    0x4(%eax),%eax
 88b:	c1 e0 03             	shl    $0x3,%eax
 88e:	01 45 f4             	add    %eax,-0xc(%ebp)
 891:	8b 45 f4             	mov    -0xc(%ebp),%eax
 894:	8b 55 ec             	mov    -0x14(%ebp),%edx
 897:	89 50 04             	mov    %edx,0x4(%eax)
 89a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 89d:	a3 b8 0b 00 00       	mov    %eax,0xbb8
 8a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a5:	83 c0 08             	add    $0x8,%eax
 8a8:	eb 38                	jmp    8e2 <malloc+0xde>
 8aa:	a1 b8 0b 00 00       	mov    0xbb8,%eax
 8af:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8b2:	75 1b                	jne    8cf <malloc+0xcb>
 8b4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8b7:	89 04 24             	mov    %eax,(%esp)
 8ba:	e8 ed fe ff ff       	call   7ac <morecore>
 8bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8c2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8c6:	75 07                	jne    8cf <malloc+0xcb>
 8c8:	b8 00 00 00 00       	mov    $0x0,%eax
 8cd:	eb 13                	jmp    8e2 <malloc+0xde>
 8cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d2:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d8:	8b 00                	mov    (%eax),%eax
 8da:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8dd:	e9 70 ff ff ff       	jmp    852 <malloc+0x4e>
 8e2:	c9                   	leave  
 8e3:	c3                   	ret    
