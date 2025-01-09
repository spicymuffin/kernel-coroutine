
apl:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 d9 2f 00 00 	mov    0x2fd9(%rip),%rax        # 3fe8 <__gmon_start__@Base>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	ret    

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 2a 2f 00 00    	push   0x2f2a(%rip)        # 3f50 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 2b 2f 00 00 	bnd jmp *0x2f2b(%rip)        # 3f58 <_GLOBAL_OFFSET_TABLE_+0x10>
    102d:	0f 1f 00             	nopl   (%rax)
    1030:	f3 0f 1e fa          	endbr64 
    1034:	68 00 00 00 00       	push   $0x0
    1039:	f2 e9 e1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    103f:	90                   	nop
    1040:	f3 0f 1e fa          	endbr64 
    1044:	68 01 00 00 00       	push   $0x1
    1049:	f2 e9 d1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    104f:	90                   	nop
    1050:	f3 0f 1e fa          	endbr64 
    1054:	68 02 00 00 00       	push   $0x2
    1059:	f2 e9 c1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    105f:	90                   	nop
    1060:	f3 0f 1e fa          	endbr64 
    1064:	68 03 00 00 00       	push   $0x3
    1069:	f2 e9 b1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    106f:	90                   	nop
    1070:	f3 0f 1e fa          	endbr64 
    1074:	68 04 00 00 00       	push   $0x4
    1079:	f2 e9 a1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    107f:	90                   	nop
    1080:	f3 0f 1e fa          	endbr64 
    1084:	68 05 00 00 00       	push   $0x5
    1089:	f2 e9 91 ff ff ff    	bnd jmp 1020 <_init+0x20>
    108f:	90                   	nop
    1090:	f3 0f 1e fa          	endbr64 
    1094:	68 06 00 00 00       	push   $0x6
    1099:	f2 e9 81 ff ff ff    	bnd jmp 1020 <_init+0x20>
    109f:	90                   	nop
    10a0:	f3 0f 1e fa          	endbr64 
    10a4:	68 07 00 00 00       	push   $0x7
    10a9:	f2 e9 71 ff ff ff    	bnd jmp 1020 <_init+0x20>
    10af:	90                   	nop
    10b0:	f3 0f 1e fa          	endbr64 
    10b4:	68 08 00 00 00       	push   $0x8
    10b9:	f2 e9 61 ff ff ff    	bnd jmp 1020 <_init+0x20>
    10bf:	90                   	nop
    10c0:	f3 0f 1e fa          	endbr64 
    10c4:	68 09 00 00 00       	push   $0x9
    10c9:	f2 e9 51 ff ff ff    	bnd jmp 1020 <_init+0x20>
    10cf:	90                   	nop
    10d0:	f3 0f 1e fa          	endbr64 
    10d4:	68 0a 00 00 00       	push   $0xa
    10d9:	f2 e9 41 ff ff ff    	bnd jmp 1020 <_init+0x20>
    10df:	90                   	nop
    10e0:	f3 0f 1e fa          	endbr64 
    10e4:	68 0b 00 00 00       	push   $0xb
    10e9:	f2 e9 31 ff ff ff    	bnd jmp 1020 <_init+0x20>
    10ef:	90                   	nop
    10f0:	f3 0f 1e fa          	endbr64 
    10f4:	68 0c 00 00 00       	push   $0xc
    10f9:	f2 e9 21 ff ff ff    	bnd jmp 1020 <_init+0x20>
    10ff:	90                   	nop
    1100:	f3 0f 1e fa          	endbr64 
    1104:	68 0d 00 00 00       	push   $0xd
    1109:	f2 e9 11 ff ff ff    	bnd jmp 1020 <_init+0x20>
    110f:	90                   	nop
    1110:	f3 0f 1e fa          	endbr64 
    1114:	68 0e 00 00 00       	push   $0xe
    1119:	f2 e9 01 ff ff ff    	bnd jmp 1020 <_init+0x20>
    111f:	90                   	nop

Disassembly of section .plt.got:

0000000000001120 <__cxa_finalize@plt>:
    1120:	f3 0f 1e fa          	endbr64 
    1124:	f2 ff 25 cd 2e 00 00 	bnd jmp *0x2ecd(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    112b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

0000000000001130 <puts@plt>:
    1130:	f3 0f 1e fa          	endbr64 
    1134:	f2 ff 25 25 2e 00 00 	bnd jmp *0x2e25(%rip)        # 3f60 <puts@GLIBC_2.2.5>
    113b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001140 <clock@plt>:
    1140:	f3 0f 1e fa          	endbr64 
    1144:	f2 ff 25 1d 2e 00 00 	bnd jmp *0x2e1d(%rip)        # 3f68 <clock@GLIBC_2.2.5>
    114b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001150 <fclose@plt>:
    1150:	f3 0f 1e fa          	endbr64 
    1154:	f2 ff 25 15 2e 00 00 	bnd jmp *0x2e15(%rip)        # 3f70 <fclose@GLIBC_2.2.5>
    115b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001160 <__stack_chk_fail@plt>:
    1160:	f3 0f 1e fa          	endbr64 
    1164:	f2 ff 25 0d 2e 00 00 	bnd jmp *0x2e0d(%rip)        # 3f78 <__stack_chk_fail@GLIBC_2.4>
    116b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001170 <srand@plt>:
    1170:	f3 0f 1e fa          	endbr64 
    1174:	f2 ff 25 05 2e 00 00 	bnd jmp *0x2e05(%rip)        # 3f80 <srand@GLIBC_2.2.5>
    117b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001180 <fgets@plt>:
    1180:	f3 0f 1e fa          	endbr64 
    1184:	f2 ff 25 fd 2d 00 00 	bnd jmp *0x2dfd(%rip)        # 3f88 <fgets@GLIBC_2.2.5>
    118b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001190 <strtol@plt>:
    1190:	f3 0f 1e fa          	endbr64 
    1194:	f2 ff 25 f5 2d 00 00 	bnd jmp *0x2df5(%rip)        # 3f90 <strtol@GLIBC_2.2.5>
    119b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000011a0 <time@plt>:
    11a0:	f3 0f 1e fa          	endbr64 
    11a4:	f2 ff 25 ed 2d 00 00 	bnd jmp *0x2ded(%rip)        # 3f98 <time@GLIBC_2.2.5>
    11ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000011b0 <malloc@plt>:
    11b0:	f3 0f 1e fa          	endbr64 
    11b4:	f2 ff 25 e5 2d 00 00 	bnd jmp *0x2de5(%rip)        # 3fa0 <malloc@GLIBC_2.2.5>
    11bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000011c0 <__isoc99_sscanf@plt>:
    11c0:	f3 0f 1e fa          	endbr64 
    11c4:	f2 ff 25 dd 2d 00 00 	bnd jmp *0x2ddd(%rip)        # 3fa8 <__isoc99_sscanf@GLIBC_2.7>
    11cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000011d0 <__printf_chk@plt>:
    11d0:	f3 0f 1e fa          	endbr64 
    11d4:	f2 ff 25 d5 2d 00 00 	bnd jmp *0x2dd5(%rip)        # 3fb0 <__printf_chk@GLIBC_2.3.4>
    11db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000011e0 <fopen@plt>:
    11e0:	f3 0f 1e fa          	endbr64 
    11e4:	f2 ff 25 cd 2d 00 00 	bnd jmp *0x2dcd(%rip)        # 3fb8 <fopen@GLIBC_2.2.5>
    11eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000011f0 <perror@plt>:
    11f0:	f3 0f 1e fa          	endbr64 
    11f4:	f2 ff 25 c5 2d 00 00 	bnd jmp *0x2dc5(%rip)        # 3fc0 <perror@GLIBC_2.2.5>
    11fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001200 <__fprintf_chk@plt>:
    1200:	f3 0f 1e fa          	endbr64 
    1204:	f2 ff 25 bd 2d 00 00 	bnd jmp *0x2dbd(%rip)        # 3fc8 <__fprintf_chk@GLIBC_2.3.4>
    120b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001210 <rand@plt>:
    1210:	f3 0f 1e fa          	endbr64 
    1214:	f2 ff 25 b5 2d 00 00 	bnd jmp *0x2db5(%rip)        # 3fd0 <rand@GLIBC_2.2.5>
    121b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

0000000000001220 <main>:
    1220:	f3 0f 1e fa          	endbr64 
    1224:	41 57                	push   %r15
    1226:	41 56                	push   %r14
    1228:	41 55                	push   %r13
    122a:	41 54                	push   %r12
    122c:	55                   	push   %rbp
    122d:	53                   	push   %rbx
    122e:	48 89 f3             	mov    %rsi,%rbx
    1231:	48 83 ec 28          	sub    $0x28,%rsp
    1235:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    123c:	00 00 
    123e:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    1243:	31 c0                	xor    %eax,%eax
    1245:	83 ff 02             	cmp    $0x2,%edi
    1248:	0f 8e 9a 05 00 00    	jle    17e8 <main+0x5c8>
    124e:	83 ff 03             	cmp    $0x3,%edi
    1251:	0f 85 d9 01 00 00    	jne    1430 <main+0x210>
    1257:	8b 15 07 2e 00 00    	mov    0x2e07(%rip),%edx        # 4064 <ONLY_BENCHMARK>
    125d:	85 d2                	test   %edx,%edx
    125f:	0f 84 66 05 00 00    	je     17cb <main+0x5ab>
    1265:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
    1269:	48 8d 35 61 0e 00 00 	lea    0xe61(%rip),%rsi        # 20d1 <_IO_stdin_used+0xd1>
    1270:	e8 6b ff ff ff       	call   11e0 <fopen@plt>
    1275:	48 89 05 44 52 01 00 	mov    %rax,0x15244(%rip)        # 164c0 <file>
    127c:	49 89 c4             	mov    %rax,%r12
    127f:	48 85 c0             	test   %rax,%rax
    1282:	0f 84 d2 06 00 00    	je     195a <main+0x73a>
    1288:	bf 00 10 00 00       	mov    $0x1000,%edi
    128d:	e8 1e ff ff ff       	call   11b0 <malloc@plt>
    1292:	48 89 05 b7 2d 00 00 	mov    %rax,0x2db7(%rip)        # 4050 <head>
    1299:	48 85 c0             	test   %rax,%rax
    129c:	0f 84 a2 06 00 00    	je     1944 <main+0x724>
    12a2:	4c 89 e2             	mov    %r12,%rdx
    12a5:	be 00 04 00 00       	mov    $0x400,%esi
    12aa:	48 8d 3d 0f 4e 01 00 	lea    0x14e0f(%rip),%rdi        # 160c0 <line>
    12b1:	e8 ca fe ff ff       	call   1180 <fgets@plt>
    12b6:	48 85 c0             	test   %rax,%rax
    12b9:	74 19                	je     12d4 <main+0xb4>
    12bb:	ba 0a 00 00 00       	mov    $0xa,%edx
    12c0:	31 f6                	xor    %esi,%esi
    12c2:	48 8d 3d f7 4d 01 00 	lea    0x14df7(%rip),%rdi        # 160c0 <line>
    12c9:	e8 c2 fe ff ff       	call   1190 <strtol@plt>
    12ce:	89 05 8c 2d 00 00    	mov    %eax,0x2d8c(%rip)        # 4060 <N_BLOCKS>
    12d4:	48 8b 15 e5 51 01 00 	mov    0x151e5(%rip),%rdx        # 164c0 <file>
    12db:	be 00 04 00 00       	mov    $0x400,%esi
    12e0:	48 8d 3d d9 4d 01 00 	lea    0x14dd9(%rip),%rdi        # 160c0 <line>
    12e7:	e8 94 fe ff ff       	call   1180 <fgets@plt>
    12ec:	48 85 c0             	test   %rax,%rax
    12ef:	74 19                	je     130a <main+0xea>
    12f1:	ba 0a 00 00 00       	mov    $0xa,%edx
    12f6:	31 f6                	xor    %esi,%esi
    12f8:	48 8d 3d c1 4d 01 00 	lea    0x14dc1(%rip),%rdi        # 160c0 <line>
    12ff:	e8 8c fe ff ff       	call   1190 <strtol@plt>
    1304:	89 05 52 2d 00 00    	mov    %eax,0x2d52(%rip)        # 405c <N_FREE>
    130a:	48 63 3d 4f 2d 00 00 	movslq 0x2d4f(%rip),%rdi        # 4060 <N_BLOCKS>
    1311:	48 c1 e7 0c          	shl    $0xc,%rdi
    1315:	e8 96 fe ff ff       	call   11b0 <malloc@plt>
    131a:	48 89 05 27 2d 00 00 	mov    %rax,0x2d27(%rip)        # 4048 <list>
    1321:	48 85 c0             	test   %rax,%rax
    1324:	0f 84 04 06 00 00    	je     192e <main+0x70e>
    132a:	4c 8b 25 1f 2d 00 00 	mov    0x2d1f(%rip),%r12        # 4050 <head>
    1331:	45 31 f6             	xor    %r14d,%r14d
    1334:	48 8d 2d 85 4d 01 00 	lea    0x14d85(%rip),%rbp        # 160c0 <line>
    133b:	45 89 f5             	mov    %r14d,%r13d
    133e:	eb 17                	jmp    1357 <main+0x137>
    1340:	31 f6                	xor    %esi,%esi
    1342:	ba 0a 00 00 00       	mov    $0xa,%edx
    1347:	48 89 ef             	mov    %rbp,%rdi
    134a:	e8 41 fe ff ff       	call   1190 <strtol@plt>
    134f:	85 c0                	test   %eax,%eax
    1351:	0f 85 a9 00 00 00    	jne    1400 <main+0x1e0>
    1357:	48 8b 15 62 51 01 00 	mov    0x15162(%rip),%rdx        # 164c0 <file>
    135e:	be 00 04 00 00       	mov    $0x400,%esi
    1363:	48 89 ef             	mov    %rbp,%rdi
    1366:	e8 15 fe ff ff       	call   1180 <fgets@plt>
    136b:	48 85 c0             	test   %rax,%rax
    136e:	75 d0                	jne    1340 <main+0x120>
    1370:	48 8b 05 d9 2c 00 00 	mov    0x2cd9(%rip),%rax        # 4050 <head>
    1377:	48 8b 3d 42 51 01 00 	mov    0x15142(%rip),%rdi        # 164c0 <file>
    137e:	49 89 84 24 f0 0f 00 	mov    %rax,0xff0(%r12)
    1385:	00 
    1386:	4c 89 a0 f8 0f 00 00 	mov    %r12,0xff8(%rax)
    138d:	e8 be fd ff ff       	call   1150 <fclose@plt>
    1392:	48 8b 0d b7 2c 00 00 	mov    0x2cb7(%rip),%rcx        # 4050 <head>
    1399:	48 8b 81 f0 0f 00 00 	mov    0xff0(%rcx),%rax
    13a0:	48 39 c1             	cmp    %rax,%rcx
    13a3:	0f 84 a2 00 00 00    	je     144b <main+0x22b>
    13a9:	31 d2                	xor    %edx,%edx
    13ab:	eb 16                	jmp    13c3 <main+0x1a3>
    13ad:	0f 1f 00             	nopl   (%rax)
    13b0:	48 8b 80 f0 0f 00 00 	mov    0xff0(%rax),%rax
    13b7:	83 c2 01             	add    $0x1,%edx
    13ba:	48 39 c1             	cmp    %rax,%rcx
    13bd:	0f 84 88 00 00 00    	je     144b <main+0x22b>
    13c3:	39 90 e8 0f 00 00    	cmp    %edx,0xfe8(%rax)
    13c9:	74 e5                	je     13b0 <main+0x190>
    13cb:	48 8d 3d 1d 0d 00 00 	lea    0xd1d(%rip),%rdi        # 20ef <_IO_stdin_used+0xef>
    13d2:	e8 19 fe ff ff       	call   11f0 <perror@plt>
    13d7:	b8 01 00 00 00       	mov    $0x1,%eax
    13dc:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
    13e1:	64 48 33 1c 25 28 00 	xor    %fs:0x28,%rbx
    13e8:	00 00 
    13ea:	0f 85 80 05 00 00    	jne    1970 <main+0x750>
    13f0:	48 83 c4 28          	add    $0x28,%rsp
    13f4:	5b                   	pop    %rbx
    13f5:	5d                   	pop    %rbp
    13f6:	41 5c                	pop    %r12
    13f8:	41 5d                	pop    %r13
    13fa:	41 5e                	pop    %r14
    13fc:	41 5f                	pop    %r15
    13fe:	c3                   	ret    
    13ff:	90                   	nop
    1400:	4c 89 f0             	mov    %r14,%rax
    1403:	49 83 c6 01          	add    $0x1,%r14
    1407:	48 c1 e0 0c          	shl    $0xc,%rax
    140b:	48 03 05 36 2c 00 00 	add    0x2c36(%rip),%rax        # 4048 <list>
    1412:	44 89 a8 e8 0f 00 00 	mov    %r13d,0xfe8(%rax)
    1419:	49 89 84 24 f0 0f 00 	mov    %rax,0xff0(%r12)
    1420:	00 
    1421:	4c 89 a0 f8 0f 00 00 	mov    %r12,0xff8(%rax)
    1428:	49 89 c4             	mov    %rax,%r12
    142b:	e9 0b ff ff ff       	jmp    133b <main+0x11b>
    1430:	48 8b 7e 18          	mov    0x18(%rsi),%rdi
    1434:	ba 0a 00 00 00       	mov    $0xa,%edx
    1439:	31 f6                	xor    %esi,%esi
    143b:	e8 50 fd ff ff       	call   1190 <strtol@plt>
    1440:	89 05 1e 2c 00 00    	mov    %eax,0x2c1e(%rip)        # 4064 <ONLY_BENCHMARK>
    1446:	e9 0c fe ff ff       	jmp    1257 <main+0x37>
    144b:	83 3d 12 2c 00 00 00 	cmpl   $0x0,0x2c12(%rip)        # 4064 <ONLY_BENCHMARK>
    1452:	0f 84 8d 04 00 00    	je     18e5 <main+0x6c5>
    1458:	44 8b 0d fd 2b 00 00 	mov    0x2bfd(%rip),%r9d        # 405c <N_FREE>
    145f:	be 10 00 00 00       	mov    $0x10,%esi
    1464:	48 8d 2d 5d 60 01 00 	lea    0x1605d(%rip),%rbp        # 174c8 <access_points+0xfe8>
    146b:	31 ff                	xor    %edi,%edi
    146d:	49 89 e8             	mov    %rbp,%r8
    1470:	4c 8d 15 09 4c 01 00 	lea    0x14c09(%rip),%r10        # 16080 <access_point_counts>
    1477:	45 31 db             	xor    %r11d,%r11d
    147a:	44 89 c8             	mov    %r9d,%eax
    147d:	99                   	cltd   
    147e:	f7 fe                	idiv   %esi
    1480:	48 8b 91 f0 0f 00 00 	mov    0xff0(%rcx),%rdx
    1487:	89 05 cb 2b 00 00    	mov    %eax,0x2bcb(%rip)        # 4058 <SEGMENT_LEN>
    148d:	0f 1f 00             	nopl   (%rax)
    1490:	49 89 50 08          	mov    %rdx,0x8(%r8)
    1494:	48 8b 8a f8 0f 00 00 	mov    0xff8(%rdx),%rcx
    149b:	89 fe                	mov    %edi,%esi
    149d:	49 89 48 10          	mov    %rcx,0x10(%r8)
    14a1:	8b 8a e8 0f 00 00    	mov    0xfe8(%rdx),%ecx
    14a7:	41 89 08             	mov    %ecx,(%r8)
    14aa:	41 83 f9 0f          	cmp    $0xf,%r9d
    14ae:	7e 38                	jle    14e8 <main+0x2c8>
    14b0:	45 8b 24 ba          	mov    (%r10,%rdi,4),%r12d
    14b4:	31 c9                	xor    %ecx,%ecx
    14b6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    14bd:	00 00 00 
    14c0:	83 c1 01             	add    $0x1,%ecx
    14c3:	89 b2 ec 0f 00 00    	mov    %esi,0xfec(%rdx)
    14c9:	48 8b 92 f0 0f 00 00 	mov    0xff0(%rdx),%rdx
    14d0:	39 c8                	cmp    %ecx,%eax
    14d2:	7f ec                	jg     14c0 <main+0x2a0>
    14d4:	8d 48 ff             	lea    -0x1(%rax),%ecx
    14d7:	41 83 f9 0f          	cmp    $0xf,%r9d
    14db:	41 0f 4e cb          	cmovle %r11d,%ecx
    14df:	41 8d 4c 0c 01       	lea    0x1(%r12,%rcx,1),%ecx
    14e4:	41 89 0c ba          	mov    %ecx,(%r10,%rdi,4)
    14e8:	48 83 c7 01          	add    $0x1,%rdi
    14ec:	49 81 c0 00 10 00 00 	add    $0x1000,%r8
    14f3:	48 83 ff 10          	cmp    $0x10,%rdi
    14f7:	75 97                	jne    1490 <main+0x270>
    14f9:	45 31 e4             	xor    %r12d,%r12d
    14fc:	4c 8d 2d 7d 4b 01 00 	lea    0x14b7d(%rip),%r13        # 16080 <access_point_counts>
    1503:	eb 0d                	jmp    1512 <main+0x2f2>
    1505:	0f 1f 00             	nopl   (%rax)
    1508:	49 83 c4 01          	add    $0x1,%r12
    150c:	49 83 fc 10          	cmp    $0x10,%r12
    1510:	74 50                	je     1562 <main+0x342>
    1512:	8b 05 4c 2b 00 00    	mov    0x2b4c(%rip),%eax        # 4064 <ONLY_BENCHMARK>
    1518:	85 c0                	test   %eax,%eax
    151a:	75 ec                	jne    1508 <main+0x2e8>
    151c:	4c 89 e0             	mov    %r12,%rax
    151f:	44 89 e2             	mov    %r12d,%edx
    1522:	bf 01 00 00 00       	mov    $0x1,%edi
    1527:	48 c1 e0 0c          	shl    $0xc,%rax
    152b:	48 8d 35 ea 0b 00 00 	lea    0xbea(%rip),%rsi        # 211c <_IO_stdin_used+0x11c>
    1532:	8b 4c 05 00          	mov    0x0(%rbp,%rax,1),%ecx
    1536:	31 c0                	xor    %eax,%eax
    1538:	e8 93 fc ff ff       	call   11d0 <__printf_chk@plt>
    153d:	43 8b 4c a5 00       	mov    0x0(%r13,%r12,4),%ecx
    1542:	44 89 e2             	mov    %r12d,%edx
    1545:	31 c0                	xor    %eax,%eax
    1547:	48 8d 35 e3 0b 00 00 	lea    0xbe3(%rip),%rsi        # 2131 <_IO_stdin_used+0x131>
    154e:	bf 01 00 00 00       	mov    $0x1,%edi
    1553:	49 83 c4 01          	add    $0x1,%r12
    1557:	e8 74 fc ff ff       	call   11d0 <__printf_chk@plt>
    155c:	49 83 fc 10          	cmp    $0x10,%r12
    1560:	75 b0                	jne    1512 <main+0x2f2>
    1562:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
    1566:	48 8d 35 64 0b 00 00 	lea    0xb64(%rip),%rsi        # 20d1 <_IO_stdin_used+0xd1>
    156d:	e8 6e fc ff ff       	call   11e0 <fopen@plt>
    1572:	48 89 05 47 4f 01 00 	mov    %rax,0x14f47(%rip)        # 164c0 <file>
    1579:	48 85 c0             	test   %rax,%rax
    157c:	0f 84 96 03 00 00    	je     1918 <main+0x6f8>
    1582:	83 3d db 2a 00 00 00 	cmpl   $0x0,0x2adb(%rip)        # 4064 <ONLY_BENCHMARK>
    1589:	0f 84 78 03 00 00    	je     1907 <main+0x6e7>
    158f:	e8 dc 04 00 00       	call   1a70 <overwrite_x_kb_l1.constprop.0>
    1594:	31 ed                	xor    %ebp,%ebp
    1596:	4c 8d 74 24 14       	lea    0x14(%rsp),%r14
    159b:	4c 8d 6c 24 13       	lea    0x13(%rsp),%r13
    15a0:	e8 9b fb ff ff       	call   1140 <clock@plt>
    15a5:	4c 8d 25 34 4f 01 00 	lea    0x14f34(%rip),%r12        # 164e0 <access_points>
    15ac:	48 8d 1d cd 4a 01 00 	lea    0x14acd(%rip),%rbx        # 16080 <access_point_counts>
    15b3:	49 89 c7             	mov    %rax,%r15
    15b6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    15bd:	00 00 00 
    15c0:	48 8b 15 f9 4e 01 00 	mov    0x14ef9(%rip),%rdx        # 164c0 <file>
    15c7:	be 00 04 00 00       	mov    $0x400,%esi
    15cc:	48 8d 3d ed 4a 01 00 	lea    0x14aed(%rip),%rdi        # 160c0 <line>
    15d3:	e8 a8 fb ff ff       	call   1180 <fgets@plt>
    15d8:	48 85 c0             	test   %rax,%rax
    15db:	0f 84 38 01 00 00    	je     1719 <main+0x4f9>
    15e1:	4c 89 f1             	mov    %r14,%rcx
    15e4:	4c 89 ea             	mov    %r13,%rdx
    15e7:	48 8d 35 7f 0b 00 00 	lea    0xb7f(%rip),%rsi        # 216d <_IO_stdin_used+0x16d>
    15ee:	31 c0                	xor    %eax,%eax
    15f0:	48 8d 3d c9 4a 01 00 	lea    0x14ac9(%rip),%rdi        # 160c0 <line>
    15f7:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%rsp)
    15fe:	00 
    15ff:	c6 44 24 13 00       	movb   $0x0,0x13(%rsp)
    1604:	e8 b7 fb ff ff       	call   11c0 <__isoc99_sscanf@plt>
    1609:	0f b6 44 24 13       	movzbl 0x13(%rsp),%eax
    160e:	3c 61                	cmp    $0x61,%al
    1610:	0f 84 96 00 00 00    	je     16ac <main+0x48c>
    1616:	3c 66                	cmp    $0x66,%al
    1618:	74 16                	je     1630 <main+0x410>
    161a:	3c 64                	cmp    $0x64,%al
    161c:	0f 94 c0             	sete   %al
    161f:	0f b6 c0             	movzbl %al,%eax
    1622:	01 c5                	add    %eax,%ebp
    1624:	eb 9a                	jmp    15c0 <main+0x3a0>
    1626:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    162d:	00 00 00 
    1630:	8b 05 0a 2a 00 00    	mov    0x2a0a(%rip),%eax        # 4040 <pos>
    1636:	48 63 54 24 14       	movslq 0x14(%rsp),%rdx
    163b:	83 c5 01             	add    $0x1,%ebp
    163e:	83 c0 0f             	add    $0xf,%eax
    1641:	48 c1 e2 0c          	shl    $0xc,%rdx
    1645:	48 03 15 fc 29 00 00 	add    0x29fc(%rip),%rdx        # 4048 <list>
    164c:	89 c1                	mov    %eax,%ecx
    164e:	c1 f9 1f             	sar    $0x1f,%ecx
    1651:	c1 e9 1c             	shr    $0x1c,%ecx
    1654:	01 c8                	add    %ecx,%eax
    1656:	83 e0 0f             	and    $0xf,%eax
    1659:	29 c8                	sub    %ecx,%eax
    165b:	48 63 f0             	movslq %eax,%rsi
    165e:	89 05 dc 29 00 00    	mov    %eax,0x29dc(%rip)        # 4040 <pos>
    1664:	48 89 f1             	mov    %rsi,%rcx
    1667:	83 04 b3 01          	addl   $0x1,(%rbx,%rsi,4)
    166b:	48 c1 e1 0c          	shl    $0xc,%rcx
    166f:	49 8b 8c 0c f0 0f 00 	mov    0xff0(%r12,%rcx,1),%rcx
    1676:	00 
    1677:	48 8b b9 f8 0f 00 00 	mov    0xff8(%rcx),%rdi
    167e:	48 89 8a f0 0f 00 00 	mov    %rcx,0xff0(%rdx)
    1685:	48 89 ba f8 0f 00 00 	mov    %rdi,0xff8(%rdx)
    168c:	48 8b b9 f8 0f 00 00 	mov    0xff8(%rcx),%rdi
    1693:	48 89 97 f0 0f 00 00 	mov    %rdx,0xff0(%rdi)
    169a:	48 89 91 f8 0f 00 00 	mov    %rdx,0xff8(%rcx)
    16a1:	89 82 ec 0f 00 00    	mov    %eax,0xfec(%rdx)
    16a7:	e9 14 ff ff ff       	jmp    15c0 <main+0x3a0>
    16ac:	8b 74 24 14          	mov    0x14(%rsp),%esi
    16b0:	85 f6                	test   %esi,%esi
    16b2:	7e 5b                	jle    170f <main+0x4ef>
    16b4:	8b 05 86 29 00 00    	mov    0x2986(%rip),%eax        # 4040 <pos>
    16ba:	31 c9                	xor    %ecx,%ecx
    16bc:	0f 1f 40 00          	nopl   0x0(%rax)
    16c0:	48 63 d0             	movslq %eax,%rdx
    16c3:	83 c0 01             	add    $0x1,%eax
    16c6:	83 c1 01             	add    $0x1,%ecx
    16c9:	48 89 d7             	mov    %rdx,%rdi
    16cc:	83 2c 93 01          	subl   $0x1,(%rbx,%rdx,4)
    16d0:	99                   	cltd   
    16d1:	48 c1 e7 0c          	shl    $0xc,%rdi
    16d5:	c1 ea 1c             	shr    $0x1c,%edx
    16d8:	49 8b bc 3c f0 0f 00 	mov    0xff0(%r12,%rdi,1),%rdi
    16df:	00 
    16e0:	01 d0                	add    %edx,%eax
    16e2:	83 e0 0f             	and    $0xf,%eax
    16e5:	4c 8b 87 f8 0f 00 00 	mov    0xff8(%rdi),%r8
    16ec:	48 8b bf f0 0f 00 00 	mov    0xff0(%rdi),%rdi
    16f3:	29 d0                	sub    %edx,%eax
    16f5:	49 89 b8 f0 0f 00 00 	mov    %rdi,0xff0(%r8)
    16fc:	4c 89 87 f8 0f 00 00 	mov    %r8,0xff8(%rdi)
    1703:	39 f1                	cmp    %esi,%ecx
    1705:	75 b9                	jne    16c0 <main+0x4a0>
    1707:	89 05 33 29 00 00    	mov    %eax,0x2933(%rip)        # 4040 <pos>
    170d:	01 cd                	add    %ecx,%ebp
    170f:	e8 5c 03 00 00       	call   1a70 <overwrite_x_kb_l1.constprop.0>
    1714:	e9 a7 fe ff ff       	jmp    15c0 <main+0x3a0>
    1719:	e8 22 fa ff ff       	call   1140 <clock@plt>
    171e:	83 3d 3f 29 00 00 00 	cmpl   $0x0,0x293f(%rip)        # 4064 <ONLY_BENCHMARK>
    1725:	49 89 c5             	mov    %rax,%r13
    1728:	0f 84 df 00 00 00    	je     180d <main+0x5ed>
    172e:	8b 15 2c 29 00 00    	mov    0x292c(%rip),%edx        # 4060 <N_BLOCKS>
    1734:	bf 01 00 00 00       	mov    $0x1,%edi
    1739:	31 c0                	xor    %eax,%eax
    173b:	4d 29 fd             	sub    %r15,%r13
    173e:	48 8d 35 e8 09 00 00 	lea    0x9e8(%rip),%rsi        # 212d <_IO_stdin_used+0x12d>
    1745:	e8 86 fa ff ff       	call   11d0 <__printf_chk@plt>
    174a:	66 0f ef c9          	pxor   %xmm1,%xmm1
    174e:	bf 01 00 00 00       	mov    $0x1,%edi
    1753:	48 8d 35 38 0a 00 00 	lea    0xa38(%rip),%rsi        # 2192 <_IO_stdin_used+0x192>
    175a:	f2 49 0f 2a cd       	cvtsi2sd %r13,%xmm1
    175f:	b8 01 00 00 00       	mov    $0x1,%eax
    1764:	f2 0f 5e 0d 44 0a 00 	divsd  0xa44(%rip),%xmm1        # 21b0 <_IO_stdin_used+0x1b0>
    176b:	00 
    176c:	66 0f 28 c1          	movapd %xmm1,%xmm0
    1770:	f2 0f 11 4c 24 08    	movsd  %xmm1,0x8(%rsp)
    1776:	e8 55 fa ff ff       	call   11d0 <__printf_chk@plt>
    177b:	48 8d 35 ab 09 00 00 	lea    0x9ab(%rip),%rsi        # 212d <_IO_stdin_used+0x12d>
    1782:	89 ea                	mov    %ebp,%edx
    1784:	31 c0                	xor    %eax,%eax
    1786:	bf 01 00 00 00       	mov    $0x1,%edi
    178b:	e8 40 fa ff ff       	call   11d0 <__printf_chk@plt>
    1790:	66 0f ef c0          	pxor   %xmm0,%xmm0
    1794:	f2 0f 10 4c 24 08    	movsd  0x8(%rsp),%xmm1
    179a:	48 8d 35 f1 09 00 00 	lea    0x9f1(%rip),%rsi        # 2192 <_IO_stdin_used+0x192>
    17a1:	f2 0f 2a c5          	cvtsi2sd %ebp,%xmm0
    17a5:	bf 01 00 00 00       	mov    $0x1,%edi
    17aa:	b8 01 00 00 00       	mov    $0x1,%eax
    17af:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
    17b3:	e8 18 fa ff ff       	call   11d0 <__printf_chk@plt>
    17b8:	48 8b 3d 01 4d 01 00 	mov    0x14d01(%rip),%rdi        # 164c0 <file>
    17bf:	e8 8c f9 ff ff       	call   1150 <fclose@plt>
    17c4:	31 c0                	xor    %eax,%eax
    17c6:	e9 11 fc ff ff       	jmp    13dc <main+0x1bc>
    17cb:	ba 00 10 00 00       	mov    $0x1000,%edx
    17d0:	48 8d 35 e4 08 00 00 	lea    0x8e4(%rip),%rsi        # 20bb <_IO_stdin_used+0xbb>
    17d7:	bf 01 00 00 00       	mov    $0x1,%edi
    17dc:	31 c0                	xor    %eax,%eax
    17de:	e8 ed f9 ff ff       	call   11d0 <__printf_chk@plt>
    17e3:	e9 7d fa ff ff       	jmp    1265 <main+0x45>
    17e8:	48 8b 0e             	mov    (%rsi),%rcx
    17eb:	48 8b 3d 2e 28 00 00 	mov    0x282e(%rip),%rdi        # 4020 <stderr@GLIBC_2.2.5>
    17f2:	48 8d 15 0f 08 00 00 	lea    0x80f(%rip),%rdx        # 2008 <_IO_stdin_used+0x8>
    17f9:	be 01 00 00 00       	mov    $0x1,%esi
    17fe:	e8 fd f9 ff ff       	call   1200 <__fprintf_chk@plt>
    1803:	b8 01 00 00 00       	mov    $0x1,%eax
    1808:	e9 cf fb ff ff       	jmp    13dc <main+0x1bc>
    180d:	48 8d 3d 5f 09 00 00 	lea    0x95f(%rip),%rdi        # 2173 <_IO_stdin_used+0x173>
    1814:	e8 17 f9 ff ff       	call   1130 <puts@plt>
    1819:	83 3d 44 28 00 00 00 	cmpl   $0x0,0x2844(%rip)        # 4064 <ONLY_BENCHMARK>
    1820:	0f 85 08 ff ff ff    	jne    172e <main+0x50e>
    1826:	31 db                	xor    %ebx,%ebx
    1828:	4c 8d 35 51 48 01 00 	lea    0x14851(%rip),%r14        # 16080 <access_point_counts>
    182f:	4c 8d 25 42 08 00 00 	lea    0x842(%rip),%r12        # 2078 <_IO_stdin_used+0x78>
    1836:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    183d:	00 00 00 
    1840:	41 8b 0c 9e          	mov    (%r14,%rbx,4),%ecx
    1844:	89 da                	mov    %ebx,%edx
    1846:	4c 89 e6             	mov    %r12,%rsi
    1849:	bf 01 00 00 00       	mov    $0x1,%edi
    184e:	31 c0                	xor    %eax,%eax
    1850:	48 83 c3 01          	add    $0x1,%rbx
    1854:	e8 77 f9 ff ff       	call   11d0 <__printf_chk@plt>
    1859:	48 83 fb 10          	cmp    $0x10,%rbx
    185d:	75 e1                	jne    1840 <main+0x620>
    185f:	4c 89 e8             	mov    %r13,%rax
    1862:	4c 29 f8             	sub    %r15,%rax
    1865:	83 3d f8 27 00 00 00 	cmpl   $0x0,0x27f8(%rip)        # 4064 <ONLY_BENCHMARK>
    186c:	0f 85 bc fe ff ff    	jne    172e <main+0x50e>
    1872:	66 0f ef c0          	pxor   %xmm0,%xmm0
    1876:	48 8d 35 05 09 00 00 	lea    0x905(%rip),%rsi        # 2182 <_IO_stdin_used+0x182>
    187d:	bf 01 00 00 00       	mov    $0x1,%edi
    1882:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
    1887:	b8 01 00 00 00       	mov    $0x1,%eax
    188c:	f2 0f 5e 05 1c 09 00 	divsd  0x91c(%rip),%xmm0        # 21b0 <_IO_stdin_used+0x1b0>
    1893:	00 
    1894:	f2 0f 11 44 24 08    	movsd  %xmm0,0x8(%rsp)
    189a:	e8 31 f9 ff ff       	call   11d0 <__printf_chk@plt>
    189f:	89 ea                	mov    %ebp,%edx
    18a1:	48 8d 35 ee 08 00 00 	lea    0x8ee(%rip),%rsi        # 2196 <_IO_stdin_used+0x196>
    18a8:	31 c0                	xor    %eax,%eax
    18aa:	bf 01 00 00 00       	mov    $0x1,%edi
    18af:	e8 1c f9 ff ff       	call   11d0 <__printf_chk@plt>
    18b4:	66 0f ef c9          	pxor   %xmm1,%xmm1
    18b8:	f2 0f 10 44 24 08    	movsd  0x8(%rsp),%xmm0
    18be:	48 8d 35 d3 07 00 00 	lea    0x7d3(%rip),%rsi        # 2098 <_IO_stdin_used+0x98>
    18c5:	f2 0f 2a cd          	cvtsi2sd %ebp,%xmm1
    18c9:	bf 01 00 00 00       	mov    $0x1,%edi
    18ce:	b8 01 00 00 00       	mov    $0x1,%eax
    18d3:	f2 0f 5e c8          	divsd  %xmm0,%xmm1
    18d7:	66 0f 28 c1          	movapd %xmm1,%xmm0
    18db:	e8 f0 f8 ff ff       	call   11d0 <__printf_chk@plt>
    18e0:	e9 d3 fe ff ff       	jmp    17b8 <main+0x598>
    18e5:	44 89 ea             	mov    %r13d,%edx
    18e8:	48 8d 35 1d 08 00 00 	lea    0x81d(%rip),%rsi        # 210c <_IO_stdin_used+0x10c>
    18ef:	bf 01 00 00 00       	mov    $0x1,%edi
    18f4:	31 c0                	xor    %eax,%eax
    18f6:	e8 d5 f8 ff ff       	call   11d0 <__printf_chk@plt>
    18fb:	48 8b 0d 4e 27 00 00 	mov    0x274e(%rip),%rcx        # 4050 <head>
    1902:	e9 51 fb ff ff       	jmp    1458 <main+0x238>
    1907:	48 8d 3d 50 08 00 00 	lea    0x850(%rip),%rdi        # 215e <_IO_stdin_used+0x15e>
    190e:	e8 1d f8 ff ff       	call   1130 <puts@plt>
    1913:	e9 77 fc ff ff       	jmp    158f <main+0x36f>
    1918:	48 8d 3d 2d 08 00 00 	lea    0x82d(%rip),%rdi        # 214c <_IO_stdin_used+0x14c>
    191f:	e8 cc f8 ff ff       	call   11f0 <perror@plt>
    1924:	b8 01 00 00 00       	mov    $0x1,%eax
    1929:	e9 ae fa ff ff       	jmp    13dc <main+0x1bc>
    192e:	48 8d 3d 23 07 00 00 	lea    0x723(%rip),%rdi        # 2058 <_IO_stdin_used+0x58>
    1935:	e8 b6 f8 ff ff       	call   11f0 <perror@plt>
    193a:	b8 01 00 00 00       	mov    $0x1,%eax
    193f:	e9 98 fa ff ff       	jmp    13dc <main+0x1bc>
    1944:	48 8d 3d ed 06 00 00 	lea    0x6ed(%rip),%rdi        # 2038 <_IO_stdin_used+0x38>
    194b:	e8 a0 f8 ff ff       	call   11f0 <perror@plt>
    1950:	b8 01 00 00 00       	mov    $0x1,%eax
    1955:	e9 82 fa ff ff       	jmp    13dc <main+0x1bc>
    195a:	48 8d 3d 72 07 00 00 	lea    0x772(%rip),%rdi        # 20d3 <_IO_stdin_used+0xd3>
    1961:	e8 8a f8 ff ff       	call   11f0 <perror@plt>
    1966:	b8 01 00 00 00       	mov    $0x1,%eax
    196b:	e9 6c fa ff ff       	jmp    13dc <main+0x1bc>
    1970:	e8 eb f7 ff ff       	call   1160 <__stack_chk_fail@plt>
    1975:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    197c:	00 00 00 
    197f:	90                   	nop

0000000000001980 <_start>:
    1980:	f3 0f 1e fa          	endbr64 
    1984:	31 ed                	xor    %ebp,%ebp
    1986:	49 89 d1             	mov    %rdx,%r9
    1989:	5e                   	pop    %rsi
    198a:	48 89 e2             	mov    %rsp,%rdx
    198d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    1991:	50                   	push   %rax
    1992:	54                   	push   %rsp
    1993:	45 31 c0             	xor    %r8d,%r8d
    1996:	31 c9                	xor    %ecx,%ecx
    1998:	48 8d 3d 81 f8 ff ff 	lea    -0x77f(%rip),%rdi        # 1220 <main>
    199f:	ff 15 33 26 00 00    	call   *0x2633(%rip)        # 3fd8 <__libc_start_main@GLIBC_2.34>
    19a5:	f4                   	hlt    
    19a6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    19ad:	00 00 00 

00000000000019b0 <deregister_tm_clones>:
    19b0:	48 8d 3d 59 26 00 00 	lea    0x2659(%rip),%rdi        # 4010 <__TMC_END__>
    19b7:	48 8d 05 52 26 00 00 	lea    0x2652(%rip),%rax        # 4010 <__TMC_END__>
    19be:	48 39 f8             	cmp    %rdi,%rax
    19c1:	74 15                	je     19d8 <deregister_tm_clones+0x28>
    19c3:	48 8b 05 16 26 00 00 	mov    0x2616(%rip),%rax        # 3fe0 <_ITM_deregisterTMCloneTable@Base>
    19ca:	48 85 c0             	test   %rax,%rax
    19cd:	74 09                	je     19d8 <deregister_tm_clones+0x28>
    19cf:	ff e0                	jmp    *%rax
    19d1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    19d8:	c3                   	ret    
    19d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000019e0 <register_tm_clones>:
    19e0:	48 8d 3d 29 26 00 00 	lea    0x2629(%rip),%rdi        # 4010 <__TMC_END__>
    19e7:	48 8d 35 22 26 00 00 	lea    0x2622(%rip),%rsi        # 4010 <__TMC_END__>
    19ee:	48 29 fe             	sub    %rdi,%rsi
    19f1:	48 89 f0             	mov    %rsi,%rax
    19f4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    19f8:	48 c1 f8 03          	sar    $0x3,%rax
    19fc:	48 01 c6             	add    %rax,%rsi
    19ff:	48 d1 fe             	sar    %rsi
    1a02:	74 14                	je     1a18 <register_tm_clones+0x38>
    1a04:	48 8b 05 e5 25 00 00 	mov    0x25e5(%rip),%rax        # 3ff0 <_ITM_registerTMCloneTable@Base>
    1a0b:	48 85 c0             	test   %rax,%rax
    1a0e:	74 08                	je     1a18 <register_tm_clones+0x38>
    1a10:	ff e0                	jmp    *%rax
    1a12:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1a18:	c3                   	ret    
    1a19:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001a20 <__do_global_dtors_aux>:
    1a20:	f3 0f 1e fa          	endbr64 
    1a24:	80 3d fd 25 00 00 00 	cmpb   $0x0,0x25fd(%rip)        # 4028 <completed.8099>
    1a2b:	75 2b                	jne    1a58 <__do_global_dtors_aux+0x38>
    1a2d:	55                   	push   %rbp
    1a2e:	48 83 3d c2 25 00 00 	cmpq   $0x0,0x25c2(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1a35:	00 
    1a36:	48 89 e5             	mov    %rsp,%rbp
    1a39:	74 0c                	je     1a47 <__do_global_dtors_aux+0x27>
    1a3b:	48 8b 3d c6 25 00 00 	mov    0x25c6(%rip),%rdi        # 4008 <__dso_handle>
    1a42:	e8 d9 f6 ff ff       	call   1120 <__cxa_finalize@plt>
    1a47:	e8 64 ff ff ff       	call   19b0 <deregister_tm_clones>
    1a4c:	c6 05 d5 25 00 00 01 	movb   $0x1,0x25d5(%rip)        # 4028 <completed.8099>
    1a53:	5d                   	pop    %rbp
    1a54:	c3                   	ret    
    1a55:	0f 1f 00             	nopl   (%rax)
    1a58:	c3                   	ret    
    1a59:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001a60 <frame_dummy>:
    1a60:	f3 0f 1e fa          	endbr64 
    1a64:	e9 77 ff ff ff       	jmp    19e0 <register_tm_clones>
    1a69:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001a70 <overwrite_x_kb_l1.constprop.0>:
    1a70:	41 55                	push   %r13
    1a72:	31 ff                	xor    %edi,%edi
    1a74:	41 54                	push   %r12
    1a76:	55                   	push   %rbp
    1a77:	48 8d 2d 02 46 00 00 	lea    0x4602(%rip),%rbp        # 6080 <g_buffer>
    1a7e:	53                   	push   %rbx
    1a7f:	4c 8d a5 00 c0 00 00 	lea    0xc000(%rbp),%r12
    1a86:	48 89 eb             	mov    %rbp,%rbx
    1a89:	48 83 ec 08          	sub    $0x8,%rsp
    1a8d:	e8 0e f7 ff ff       	call   11a0 <time@plt>
    1a92:	48 89 c7             	mov    %rax,%rdi
    1a95:	e8 d6 f6 ff ff       	call   1170 <srand@plt>
    1a9a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1aa0:	e8 6b f7 ff ff       	call   1210 <rand@plt>
    1aa5:	48 83 c3 01          	add    $0x1,%rbx
    1aa9:	88 43 ff             	mov    %al,-0x1(%rbx)
    1aac:	4c 39 e3             	cmp    %r12,%rbx
    1aaf:	75 ef                	jne    1aa0 <overwrite_x_kb_l1.constprop.0+0x30>
    1ab1:	31 db                	xor    %ebx,%ebx
    1ab3:	4c 8d 25 c6 25 00 00 	lea    0x25c6(%rip),%r12        # 4080 <g_indices>
    1aba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1ac0:	49 89 1c dc          	mov    %rbx,(%r12,%rbx,8)
    1ac4:	48 83 c3 01          	add    $0x1,%rbx
    1ac8:	48 81 fb 00 03 00 00 	cmp    $0x300,%rbx
    1acf:	75 ef                	jne    1ac0 <overwrite_x_kb_l1.constprop.0+0x50>
    1ad1:	4c 8d 2d a0 25 00 00 	lea    0x25a0(%rip),%r13        # 4078 <ONLY_BENCHMARK+0x14>
    1ad8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    1adf:	00 
    1ae0:	e8 2b f7 ff ff       	call   1210 <rand@plt>
    1ae5:	31 d2                	xor    %edx,%edx
    1ae7:	48 98                	cltq   
    1ae9:	48 f7 f3             	div    %rbx
    1aec:	49 8b 44 dd 00       	mov    0x0(%r13,%rbx,8),%rax
    1af1:	49 8b 0c d4          	mov    (%r12,%rdx,8),%rcx
    1af5:	49 89 4c dd 00       	mov    %rcx,0x0(%r13,%rbx,8)
    1afa:	48 83 eb 01          	sub    $0x1,%rbx
    1afe:	49 89 04 d4          	mov    %rax,(%r12,%rdx,8)
    1b02:	48 83 fb 01          	cmp    $0x1,%rbx
    1b06:	75 d8                	jne    1ae0 <overwrite_x_kb_l1.constprop.0+0x70>
    1b08:	4c 8d 25 71 25 00 00 	lea    0x2571(%rip),%r12        # 4080 <g_indices>
    1b0f:	4d 8d ac 24 00 18 00 	lea    0x1800(%r12),%r13
    1b16:	00 
    1b17:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    1b1e:	00 00 
    1b20:	49 8b 1c 24          	mov    (%r12),%rbx
    1b24:	49 83 c4 08          	add    $0x8,%r12
    1b28:	e8 e3 f6 ff ff       	call   1210 <rand@plt>
    1b2d:	48 c1 e3 06          	shl    $0x6,%rbx
    1b31:	30 44 1d 00          	xor    %al,0x0(%rbp,%rbx,1)
    1b35:	4d 39 ec             	cmp    %r13,%r12
    1b38:	75 e6                	jne    1b20 <overwrite_x_kb_l1.constprop.0+0xb0>
    1b3a:	48 83 c4 08          	add    $0x8,%rsp
    1b3e:	5b                   	pop    %rbx
    1b3f:	5d                   	pop    %rbp
    1b40:	41 5c                	pop    %r12
    1b42:	41 5d                	pop    %r13
    1b44:	c3                   	ret    
    1b45:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    1b4c:	00 00 00 00 

0000000000001b50 <apl_delete_single>:
    1b50:	f3 0f 1e fa          	endbr64 
    1b54:	48 63 15 e5 24 00 00 	movslq 0x24e5(%rip),%rdx        # 4040 <pos>
    1b5b:	48 8d 35 7e 49 01 00 	lea    0x1497e(%rip),%rsi        # 164e0 <access_points>
    1b62:	48 89 d1             	mov    %rdx,%rcx
    1b65:	48 89 d0             	mov    %rdx,%rax
    1b68:	48 c1 e1 0c          	shl    $0xc,%rcx
    1b6c:	83 c0 01             	add    $0x1,%eax
    1b6f:	48 8b 8c 0e f0 0f 00 	mov    0xff0(%rsi,%rcx,1),%rcx
    1b76:	00 
    1b77:	48 8b b1 f8 0f 00 00 	mov    0xff8(%rcx),%rsi
    1b7e:	48 8b 89 f0 0f 00 00 	mov    0xff0(%rcx),%rcx
    1b85:	48 89 8e f0 0f 00 00 	mov    %rcx,0xff0(%rsi)
    1b8c:	48 89 b1 f8 0f 00 00 	mov    %rsi,0xff8(%rcx)
    1b93:	48 8d 0d e6 44 01 00 	lea    0x144e6(%rip),%rcx        # 16080 <access_point_counts>
    1b9a:	83 2c 91 01          	subl   $0x1,(%rcx,%rdx,4)
    1b9e:	99                   	cltd   
    1b9f:	c1 ea 1c             	shr    $0x1c,%edx
    1ba2:	01 d0                	add    %edx,%eax
    1ba4:	83 e0 0f             	and    $0xf,%eax
    1ba7:	29 d0                	sub    %edx,%eax
    1ba9:	89 05 91 24 00 00    	mov    %eax,0x2491(%rip)        # 4040 <pos>
    1baf:	c3                   	ret    

0000000000001bb0 <apl_insert_single>:
    1bb0:	f3 0f 1e fa          	endbr64 
    1bb4:	8b 05 86 24 00 00    	mov    0x2486(%rip),%eax        # 4040 <pos>
    1bba:	48 8d 35 1f 49 01 00 	lea    0x1491f(%rip),%rsi        # 164e0 <access_points>
    1bc1:	83 c0 0f             	add    $0xf,%eax
    1bc4:	99                   	cltd   
    1bc5:	c1 ea 1c             	shr    $0x1c,%edx
    1bc8:	01 d0                	add    %edx,%eax
    1bca:	83 e0 0f             	and    $0xf,%eax
    1bcd:	29 d0                	sub    %edx,%eax
    1bcf:	48 63 c8             	movslq %eax,%rcx
    1bd2:	89 05 68 24 00 00    	mov    %eax,0x2468(%rip)        # 4040 <pos>
    1bd8:	48 89 ca             	mov    %rcx,%rdx
    1bdb:	48 c1 e2 0c          	shl    $0xc,%rdx
    1bdf:	48 8b 94 16 f0 0f 00 	mov    0xff0(%rsi,%rdx,1),%rdx
    1be6:	00 
    1be7:	48 8b b2 f8 0f 00 00 	mov    0xff8(%rdx),%rsi
    1bee:	48 89 97 f0 0f 00 00 	mov    %rdx,0xff0(%rdi)
    1bf5:	48 89 b7 f8 0f 00 00 	mov    %rsi,0xff8(%rdi)
    1bfc:	48 8b b2 f8 0f 00 00 	mov    0xff8(%rdx),%rsi
    1c03:	48 89 be f0 0f 00 00 	mov    %rdi,0xff0(%rsi)
    1c0a:	48 89 ba f8 0f 00 00 	mov    %rdi,0xff8(%rdx)
    1c11:	89 87 ec 0f 00 00    	mov    %eax,0xfec(%rdi)
    1c17:	48 8d 05 62 44 01 00 	lea    0x14462(%rip),%rax        # 16080 <access_point_counts>
    1c1e:	83 04 88 01          	addl   $0x1,(%rax,%rcx,4)
    1c22:	c3                   	ret    
    1c23:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    1c2a:	00 00 00 00 
    1c2e:	66 90                	xchg   %ax,%ax

0000000000001c30 <apl_delete_by_reference>:
    1c30:	f3 0f 1e fa          	endbr64 
    1c34:	48 63 97 ec 0f 00 00 	movslq 0xfec(%rdi),%rdx
    1c3b:	48 63 0d fe 23 00 00 	movslq 0x23fe(%rip),%rcx        # 4040 <pos>
    1c42:	48 8d 05 37 44 01 00 	lea    0x14437(%rip),%rax        # 16080 <access_point_counts>
    1c49:	83 2c 90 01          	subl   $0x1,(%rax,%rdx,4)
    1c4d:	8d 41 01             	lea    0x1(%rcx),%eax
    1c50:	89 c6                	mov    %eax,%esi
    1c52:	c1 fe 1f             	sar    $0x1f,%esi
    1c55:	c1 ee 1c             	shr    $0x1c,%esi
    1c58:	01 f0                	add    %esi,%eax
    1c5a:	83 e0 0f             	and    $0xf,%eax
    1c5d:	29 f0                	sub    %esi,%eax
    1c5f:	39 ca                	cmp    %ecx,%edx
    1c61:	74 6d                	je     1cd0 <apl_delete_by_reference+0xa0>
    1c63:	4c 8d 05 76 48 01 00 	lea    0x14876(%rip),%r8        # 164e0 <access_points>
    1c6a:	48 c1 e1 0c          	shl    $0xc,%rcx
    1c6e:	48 c1 e2 0c          	shl    $0xc,%rdx
    1c72:	89 05 c8 23 00 00    	mov    %eax,0x23c8(%rip)        # 4040 <pos>
    1c78:	49 8b 8c 08 f0 0f 00 	mov    0xff0(%r8,%rcx,1),%rcx
    1c7f:	00 
    1c80:	4c 01 c2             	add    %r8,%rdx
    1c83:	48 8b b1 f8 0f 00 00 	mov    0xff8(%rcx),%rsi
    1c8a:	4c 8b 89 f0 0f 00 00 	mov    0xff0(%rcx),%r9
    1c91:	4c 89 8e f0 0f 00 00 	mov    %r9,0xff0(%rsi)
    1c98:	4c 8b 89 f0 0f 00 00 	mov    0xff0(%rcx),%r9
    1c9f:	49 89 b1 f8 0f 00 00 	mov    %rsi,0xff8(%r9)
    1ca6:	48 8b b7 f0 0f 00 00 	mov    0xff0(%rdi),%rsi
    1cad:	48 89 91 f8 0f 00 00 	mov    %rdx,0xff8(%rcx)
    1cb4:	48 89 8a f0 0f 00 00 	mov    %rcx,0xff0(%rdx)
    1cbb:	48 89 b1 f0 0f 00 00 	mov    %rsi,0xff0(%rcx)
    1cc2:	48 89 8e f8 0f 00 00 	mov    %rcx,0xff8(%rsi)
    1cc9:	c3                   	ret    
    1cca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1cd0:	48 8b 8f f0 0f 00 00 	mov    0xff0(%rdi),%rcx
    1cd7:	48 8b 97 f8 0f 00 00 	mov    0xff8(%rdi),%rdx
    1cde:	89 05 5c 23 00 00    	mov    %eax,0x235c(%rip)        # 4040 <pos>
    1ce4:	48 89 8a f0 0f 00 00 	mov    %rcx,0xff0(%rdx)
    1ceb:	48 8b 8f f0 0f 00 00 	mov    0xff0(%rdi),%rcx
    1cf2:	48 89 91 f8 0f 00 00 	mov    %rdx,0xff8(%rcx)
    1cf9:	c3                   	ret    

Disassembly of section .fini:

0000000000001cfc <_fini>:
    1cfc:	f3 0f 1e fa          	endbr64 
    1d00:	48 83 ec 08          	sub    $0x8,%rsp
    1d04:	48 83 c4 08          	add    $0x8,%rsp
    1d08:	c3                   	ret    
