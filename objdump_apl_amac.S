
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
    1248:	0f 8e 12 06 00 00    	jle    1860 <main+0x640>
    124e:	83 ff 03             	cmp    $0x3,%edi
    1251:	0f 85 d9 01 00 00    	jne    1430 <main+0x210>
    1257:	8b 15 07 2e 00 00    	mov    0x2e07(%rip),%edx        # 4064 <ONLY_BENCHMARK>
    125d:	85 d2                	test   %edx,%edx
    125f:	0f 84 d2 05 00 00    	je     1837 <main+0x617>
    1265:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
    1269:	48 8d 35 61 0e 00 00 	lea    0xe61(%rip),%rsi        # 20d1 <_IO_stdin_used+0xd1>
    1270:	e8 6b ff ff ff       	call   11e0 <fopen@plt>
    1275:	48 89 05 44 53 01 00 	mov    %rax,0x15344(%rip)        # 165c0 <file>
    127c:	49 89 c4             	mov    %rax,%r12
    127f:	48 85 c0             	test   %rax,%rax
    1282:	0f 84 47 07 00 00    	je     19cf <main+0x7af>
    1288:	bf 00 10 00 00       	mov    $0x1000,%edi
    128d:	e8 1e ff ff ff       	call   11b0 <malloc@plt>
    1292:	48 89 05 b7 2d 00 00 	mov    %rax,0x2db7(%rip)        # 4050 <head>
    1299:	48 85 c0             	test   %rax,%rax
    129c:	0f 84 17 07 00 00    	je     19b9 <main+0x799>
    12a2:	4c 89 e2             	mov    %r12,%rdx
    12a5:	be 00 04 00 00       	mov    $0x400,%esi
    12aa:	48 8d 3d 0f 4f 01 00 	lea    0x14f0f(%rip),%rdi        # 161c0 <line>
    12b1:	e8 ca fe ff ff       	call   1180 <fgets@plt>
    12b6:	48 85 c0             	test   %rax,%rax
    12b9:	74 19                	je     12d4 <main+0xb4>
    12bb:	ba 0a 00 00 00       	mov    $0xa,%edx
    12c0:	31 f6                	xor    %esi,%esi
    12c2:	48 8d 3d f7 4e 01 00 	lea    0x14ef7(%rip),%rdi        # 161c0 <line>
    12c9:	e8 c2 fe ff ff       	call   1190 <strtol@plt>
    12ce:	89 05 8c 2d 00 00    	mov    %eax,0x2d8c(%rip)        # 4060 <N_BLOCKS>
    12d4:	48 8b 15 e5 52 01 00 	mov    0x152e5(%rip),%rdx        # 165c0 <file>
    12db:	be 00 04 00 00       	mov    $0x400,%esi
    12e0:	48 8d 3d d9 4e 01 00 	lea    0x14ed9(%rip),%rdi        # 161c0 <line>
    12e7:	e8 94 fe ff ff       	call   1180 <fgets@plt>
    12ec:	48 85 c0             	test   %rax,%rax
    12ef:	74 19                	je     130a <main+0xea>
    12f1:	ba 0a 00 00 00       	mov    $0xa,%edx
    12f6:	31 f6                	xor    %esi,%esi
    12f8:	48 8d 3d c1 4e 01 00 	lea    0x14ec1(%rip),%rdi        # 161c0 <line>
    12ff:	e8 8c fe ff ff       	call   1190 <strtol@plt>
    1304:	89 05 52 2d 00 00    	mov    %eax,0x2d52(%rip)        # 405c <N_FREE>
    130a:	48 63 3d 4f 2d 00 00 	movslq 0x2d4f(%rip),%rdi        # 4060 <N_BLOCKS>
    1311:	48 c1 e7 0c          	shl    $0xc,%rdi
    1315:	e8 96 fe ff ff       	call   11b0 <malloc@plt>
    131a:	48 89 05 27 2d 00 00 	mov    %rax,0x2d27(%rip)        # 4048 <list>
    1321:	48 85 c0             	test   %rax,%rax
    1324:	0f 84 79 06 00 00    	je     19a3 <main+0x783>
    132a:	4c 8b 25 1f 2d 00 00 	mov    0x2d1f(%rip),%r12        # 4050 <head>
    1331:	45 31 f6             	xor    %r14d,%r14d
    1334:	48 8d 2d 85 4e 01 00 	lea    0x14e85(%rip),%rbp        # 161c0 <line>
    133b:	45 89 f5             	mov    %r14d,%r13d
    133e:	eb 17                	jmp    1357 <main+0x137>
    1340:	31 f6                	xor    %esi,%esi
    1342:	ba 0a 00 00 00       	mov    $0xa,%edx
    1347:	48 89 ef             	mov    %rbp,%rdi
    134a:	e8 41 fe ff ff       	call   1190 <strtol@plt>
    134f:	85 c0                	test   %eax,%eax
    1351:	0f 85 a9 00 00 00    	jne    1400 <main+0x1e0>
    1357:	48 8b 15 62 52 01 00 	mov    0x15262(%rip),%rdx        # 165c0 <file>
    135e:	be 00 04 00 00       	mov    $0x400,%esi
    1363:	48 89 ef             	mov    %rbp,%rdi
    1366:	e8 15 fe ff ff       	call   1180 <fgets@plt>
    136b:	48 85 c0             	test   %rax,%rax
    136e:	75 d0                	jne    1340 <main+0x120>
    1370:	48 8b 05 d9 2c 00 00 	mov    0x2cd9(%rip),%rax        # 4050 <head>
    1377:	48 8b 3d 42 52 01 00 	mov    0x15242(%rip),%rdi        # 165c0 <file>
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
    13ea:	0f 85 f5 05 00 00    	jne    19e5 <main+0x7c5>
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
    1452:	0f 84 02 05 00 00    	je     195a <main+0x73a>
    1458:	44 8b 0d fd 2b 00 00 	mov    0x2bfd(%rip),%r9d        # 405c <N_FREE>
    145f:	be 10 00 00 00       	mov    $0x10,%esi
    1464:	48 8d 2d 5d 61 01 00 	lea    0x1615d(%rip),%rbp        # 175c8 <access_points+0xfe8>
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
    1572:	48 89 05 47 50 01 00 	mov    %rax,0x15047(%rip)        # 165c0 <file>
    1579:	48 85 c0             	test   %rax,%rax
    157c:	0f 84 0b 04 00 00    	je     198d <main+0x76d>
    1582:	83 3d db 2a 00 00 00 	cmpl   $0x0,0x2adb(%rip)        # 4064 <ONLY_BENCHMARK>
    1589:	0f 84 ed 03 00 00    	je     197c <main+0x75c>
    158f:	e8 4c 05 00 00       	call   1ae0 <overwrite_x_kb_l1.constprop.0>
    1594:	48 8d 1d 25 4c 01 00 	lea    0x14c25(%rip),%rbx        # 161c0 <line>
    159b:	45 31 ff             	xor    %r15d,%r15d
    159e:	4c 8d 25 3b 50 01 00 	lea    0x1503b(%rip),%r12        # 165e0 <access_points>
    15a5:	e8 96 fb ff ff       	call   1140 <clock@plt>
    15aa:	48 8d ab 00 ff ff ff 	lea    -0x100(%rbx),%rbp
    15b1:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    15b6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    15bd:	00 00 00 
    15c0:	48 8b 15 f9 4f 01 00 	mov    0x14ff9(%rip),%rdx        # 165c0 <file>
    15c7:	be 00 04 00 00       	mov    $0x400,%esi
    15cc:	48 8d 3d ed 4b 01 00 	lea    0x14bed(%rip),%rdi        # 161c0 <line>
    15d3:	e8 a8 fb ff ff       	call   1180 <fgets@plt>
    15d8:	48 85 c0             	test   %rax,%rax
    15db:	0f 84 a0 01 00 00    	je     1781 <main+0x561>
    15e1:	31 c0                	xor    %eax,%eax
    15e3:	48 8d 4c 24 14       	lea    0x14(%rsp),%rcx
    15e8:	48 8d 54 24 13       	lea    0x13(%rsp),%rdx
    15ed:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%rsp)
    15f4:	00 
    15f5:	48 8d 35 71 0b 00 00 	lea    0xb71(%rip),%rsi        # 216d <_IO_stdin_used+0x16d>
    15fc:	48 8d 3d bd 4b 01 00 	lea    0x14bbd(%rip),%rdi        # 161c0 <line>
    1603:	c6 44 24 13 00       	movb   $0x0,0x13(%rsp)
    1608:	e8 b3 fb ff ff       	call   11c0 <__isoc99_sscanf@plt>
    160d:	80 7c 24 13 61       	cmpb   $0x61,0x13(%rsp)
    1612:	75 ac                	jne    15c0 <main+0x3a0>
    1614:	44 8b 54 24 14       	mov    0x14(%rsp),%r10d
    1619:	45 85 d2             	test   %r10d,%r10d
    161c:	0f 8e 37 01 00 00    	jle    1759 <main+0x539>
    1622:	8b 0d e8 29 00 00    	mov    0x29e8(%rip),%ecx        # 4010 <worker_ptr>
    1628:	8b 15 12 2a 00 00    	mov    0x2a12(%rip),%edx        # 4040 <pos>
    162e:	31 c0                	xor    %eax,%eax
    1630:	45 31 c9             	xor    %r9d,%r9d
    1633:	4c 8d 1d 46 4a 01 00 	lea    0x14a46(%rip),%r11        # 16080 <access_point_counts>
    163a:	eb 23                	jmp    165f <main+0x43f>
    163c:	0f 1f 40 00          	nopl   0x0(%rax)
    1640:	49 c1 e0 0c          	shl    $0xc,%r8
    1644:	c7 47 08 01 00 00 00 	movl   $0x1,0x8(%rdi)
    164b:	4b 8b bc 04 f0 0f 00 	mov    0xff0(%r12,%r8,1),%rdi
    1652:	00 
    1653:	0f 18 0f             	prefetcht0 (%rdi)
    1656:	45 39 d1             	cmp    %r10d,%r9d
    1659:	0f 8d ea 00 00 00    	jge    1749 <main+0x529>
    165f:	83 c1 01             	add    $0x1,%ecx
    1662:	89 ce                	mov    %ecx,%esi
    1664:	c1 fe 1f             	sar    $0x1f,%esi
    1667:	c1 ee 1c             	shr    $0x1c,%esi
    166a:	01 f1                	add    %esi,%ecx
    166c:	83 e1 0f             	and    $0xf,%ecx
    166f:	29 f1                	sub    %esi,%ecx
    1671:	4c 63 c1             	movslq %ecx,%r8
    1674:	89 ce                	mov    %ecx,%esi
    1676:	4c 89 c7             	mov    %r8,%rdi
    1679:	48 c1 e7 04          	shl    $0x4,%rdi
    167d:	48 01 ef             	add    %rbp,%rdi
    1680:	44 8b 6f 08          	mov    0x8(%rdi),%r13d
    1684:	45 85 ed             	test   %r13d,%r13d
    1687:	74 b7                	je     1640 <main+0x420>
    1689:	41 83 fd 01          	cmp    $0x1,%r13d
    168d:	0f 84 8d 00 00 00    	je     1720 <main+0x500>
    1693:	41 83 fd 02          	cmp    $0x2,%r13d
    1697:	75 bd                	jne    1656 <main+0x436>
    1699:	48 63 c2             	movslq %edx,%rax
    169c:	49 89 c5             	mov    %rax,%r13
    169f:	41 83 2c 83 01       	subl   $0x1,(%r11,%rax,4)
    16a4:	8d 42 01             	lea    0x1(%rdx),%eax
    16a7:	49 c1 e5 0c          	shl    $0xc,%r13
    16ab:	99                   	cltd   
    16ac:	4f 8b ac 2c f0 0f 00 	mov    0xff0(%r12,%r13,1),%r13
    16b3:	00 
    16b4:	4d 8b b5 f8 0f 00 00 	mov    0xff8(%r13),%r14
    16bb:	4d 8b ad f0 0f 00 00 	mov    0xff0(%r13),%r13
    16c2:	4d 89 ae f0 0f 00 00 	mov    %r13,0xff0(%r14)
    16c9:	4d 89 b5 f8 0f 00 00 	mov    %r14,0xff8(%r13)
    16d0:	41 be 10 00 00 00    	mov    $0x10,%r14d
    16d6:	41 f7 fe             	idiv   %r14d
    16d9:	44 89 d0             	mov    %r10d,%eax
    16dc:	44 29 c8             	sub    %r9d,%eax
    16df:	83 f8 0f             	cmp    $0xf,%eax
    16e2:	0f 8e 6c 01 00 00    	jle    1854 <main+0x634>
    16e8:	49 c1 e0 0c          	shl    $0xc,%r8
    16ec:	c7 47 08 01 00 00 00 	movl   $0x1,0x8(%rdi)
    16f3:	4b 8b 84 04 f0 0f 00 	mov    0xff0(%r12,%r8,1),%rax
    16fa:	00 
    16fb:	48 89 07             	mov    %rax,(%rdi)
    16fe:	48 8b 80 f0 0f 00 00 	mov    0xff0(%rax),%rax
    1705:	0f 18 08             	 (%rax)
    1708:	41 83 c1 01          	add  prefetcht0  $0x1,%r9d
    170c:	41 83 c7 01          	add    $0x1,%r15d
    1710:	b8 01 00 00 00       	mov    $0x1,%eax
    1715:	e9 3c ff ff ff       	jmp    1656 <main+0x436>
    171a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1720:	49 c1 e0 0c          	shl    $0xc,%r8
    1724:	c7 47 08 02 00 00 00 	movl   $0x2,0x8(%rdi)
    172b:	4f 8b 84 04 f0 0f 00 	mov    0xff0(%r12,%r8,1),%r8
    1732:	00 
    1733:	4c 89 07             	mov    %r8,(%rdi)
    1736:	49 8b b8 f0 0f 00 00 	mov    0xff0(%r8),%rdi
    173d:	0f 18 0f             	prefetcht0 (%rdi)
    1740:	45 39 d1             	cmp    %r10d,%r9d
    1743:	0f 8c 16 ff ff ff    	jl     165f <main+0x43f>
    1749:	89 35 c1 28 00 00    	mov    %esi,0x28c1(%rip)        # 4010 <worker_ptr>
    174f:	84 c0                	test   %al,%al
    1751:	74 06                	je     1759 <main+0x539>
    1753:	89 15 e7 28 00 00    	mov    %edx,0x28e7(%rip)        # 4040 <pos>
    1759:	48 8d 05 60 49 01 00 	lea    0x14960(%rip),%rax        # 160c0 <workers>
    1760:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
    1767:	48 83 c0 10          	add    $0x10,%rax
    176b:	c7 40 f8 00 00 00 00 	movl   $0x0,-0x8(%rax)
    1772:	48 39 d8             	cmp    %rbx,%rax
    1775:	75 e9                	jne    1760 <main+0x540>
    1777:	e8 64 03 00 00       	call   1ae0 <overwrite_x_kb_l1.constprop.0>
    177c:	e9 3f fe ff ff       	jmp    15c0 <main+0x3a0>
    1781:	e8 ba f9 ff ff       	call   1140 <clock@plt>
    1786:	83 3d d7 28 00 00 00 	cmpl   $0x0,0x28d7(%rip)        # 4064 <ONLY_BENCHMARK>
    178d:	49 89 c4             	mov    %rax,%r12
    1790:	0f 84 ef 00 00 00    	je     1885 <main+0x665>
    1796:	8b 15 c4 28 00 00    	mov    0x28c4(%rip),%edx        # 4060 <N_BLOCKS>
    179c:	48 8d 35 8a 09 00 00 	lea    0x98a(%rip),%rsi        # 212d <_IO_stdin_used+0x12d>
    17a3:	bf 01 00 00 00       	mov    $0x1,%edi
    17a8:	31 c0                	xor    %eax,%eax
    17aa:	e8 21 fa ff ff       	call   11d0 <__printf_chk@plt>
    17af:	4c 2b 64 24 08       	sub    0x8(%rsp),%r12
    17b4:	66 0f ef c9          	pxor   %xmm1,%xmm1
    17b8:	48 8d 35 d3 09 00 00 	lea    0x9d3(%rip),%rsi        # 2192 <_IO_stdin_used+0x192>
    17bf:	bf 01 00 00 00       	mov    $0x1,%edi
    17c4:	f2 49 0f 2a cc       	cvtsi2sd %r12,%xmm1
    17c9:	b8 01 00 00 00       	mov    $0x1,%eax
    17ce:	f2 0f 5e 0d da 09 00 	divsd  0x9da(%rip),%xmm1        # 21b0 <_IO_stdin_used+0x1b0>
    17d5:	00 
    17d6:	66 0f 28 c1          	movapd %xmm1,%xmm0
    17da:	f2 0f 11 4c 24 08    	movsd  %xmm1,0x8(%rsp)
    17e0:	e8 eb f9 ff ff       	call   11d0 <__printf_chk@plt>
    17e5:	bf 01 00 00 00       	mov    $0x1,%edi
    17ea:	44 89 fa             	mov    %r15d,%edx
    17ed:	31 c0                	xor    %eax,%eax
    17ef:	48 8d 35 37 09 00 00 	lea    0x937(%rip),%rsi        # 212d <_IO_stdin_used+0x12d>
    17f6:	e8 d5 f9 ff ff       	call   11d0 <__printf_chk@plt>
    17fb:	66 0f ef c0          	pxor   %xmm0,%xmm0
    17ff:	f2 0f 10 4c 24 08    	movsd  0x8(%rsp),%xmm1
    1805:	48 8d 35 86 09 00 00 	lea    0x986(%rip),%rsi        # 2192 <_IO_stdin_used+0x192>
    180c:	f2 41 0f 2a c7       	cvtsi2sd %r15d,%xmm0
    1811:	bf 01 00 00 00       	mov    $0x1,%edi
    1816:	b8 01 00 00 00       	mov    $0x1,%eax
    181b:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
    181f:	e8 ac f9 ff ff       	call   11d0 <__printf_chk@plt>
    1824:	48 8b 3d 95 4d 01 00 	mov    0x14d95(%rip),%rdi        # 165c0 <file>
    182b:	e8 20 f9 ff ff       	call   1150 <fclose@plt>
    1830:	31 c0                	xor    %eax,%eax
    1832:	e9 a5 fb ff ff       	jmp    13dc <main+0x1bc>
    1837:	ba 00 10 00 00       	mov    $0x1000,%edx
    183c:	48 8d 35 78 08 00 00 	lea    0x878(%rip),%rsi        # 20bb <_IO_stdin_used+0xbb>
    1843:	bf 01 00 00 00       	mov    $0x1,%edi
    1848:	31 c0                	xor    %eax,%eax
    184a:	e8 81 f9 ff ff       	call   11d0 <__printf_chk@plt>
    184f:	e9 11 fa ff ff       	jmp    1265 <main+0x45>
    1854:	c7 47 08 03 00 00 00 	movl   $0x3,0x8(%rdi)
    185b:	e9 a8 fe ff ff       	jmp    1708 <main+0x4e8>
    1860:	48 8b 0e             	mov    (%rsi),%rcx
    1863:	48 8b 3d b6 27 00 00 	mov    0x27b6(%rip),%rdi        # 4020 <stderr@GLIBC_2.2.5>
    186a:	48 8d 15 97 07 00 00 	lea    0x797(%rip),%rdx        # 2008 <_IO_stdin_used+0x8>
    1871:	be 01 00 00 00       	mov    $0x1,%esi
    1876:	e8 85 f9 ff ff       	call   1200 <__fprintf_chk@plt>
    187b:	b8 01 00 00 00       	mov    $0x1,%eax
    1880:	e9 57 fb ff ff       	jmp    13dc <main+0x1bc>
    1885:	48 8d 3d e7 08 00 00 	lea    0x8e7(%rip),%rdi        # 2173 <_IO_stdin_used+0x173>
    188c:	e8 9f f8 ff ff       	call   1130 <puts@plt>
    1891:	83 3d cc 27 00 00 00 	cmpl   $0x0,0x27cc(%rip)        # 4064 <ONLY_BENCHMARK>
    1898:	0f 85 f8 fe ff ff    	jne    1796 <main+0x576>
    189e:	31 db                	xor    %ebx,%ebx
    18a0:	4c 8d 2d d9 47 01 00 	lea    0x147d9(%rip),%r13        # 16080 <access_point_counts>
    18a7:	48 8d 2d ca 07 00 00 	lea    0x7ca(%rip),%rbp        # 2078 <_IO_stdin_used+0x78>
    18ae:	66 90                	xchg   %ax,%ax
    18b0:	41 8b 4c 9d 00       	mov    0x0(%r13,%rbx,4),%ecx
    18b5:	89 da                	mov    %ebx,%edx
    18b7:	48 89 ee             	mov    %rbp,%rsi
    18ba:	bf 01 00 00 00       	mov    $0x1,%edi
    18bf:	31 c0                	xor    %eax,%eax
    18c1:	48 83 c3 01          	add    $0x1,%rbx
    18c5:	e8 06 f9 ff ff       	call   11d0 <__printf_chk@plt>
    18ca:	48 83 fb 10          	cmp    $0x10,%rbx
    18ce:	75 e0                	jne    18b0 <main+0x690>
    18d0:	4c 89 e0             	mov    %r12,%rax
    18d3:	48 2b 44 24 08       	sub    0x8(%rsp),%rax
    18d8:	83 3d 85 27 00 00 00 	cmpl   $0x0,0x2785(%rip)        # 4064 <ONLY_BENCHMARK>
    18df:	0f 85 b1 fe ff ff    	jne    1796 <main+0x576>
    18e5:	66 0f ef c0          	pxor   %xmm0,%xmm0
    18e9:	48 8d 35 92 08 00 00 	lea    0x892(%rip),%rsi        # 2182 <_IO_stdin_used+0x182>
    18f0:	bf 01 00 00 00       	mov    $0x1,%edi
    18f5:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
    18fa:	b8 01 00 00 00       	mov    $0x1,%eax
    18ff:	f2 0f 5e 05 a9 08 00 	divsd  0x8a9(%rip),%xmm0        # 21b0 <_IO_stdin_used+0x1b0>
    1906:	00 
    1907:	f2 0f 11 44 24 08    	movsd  %xmm0,0x8(%rsp)
    190d:	e8 be f8 ff ff       	call   11d0 <__printf_chk@plt>
    1912:	44 89 fa             	mov    %r15d,%edx
    1915:	bf 01 00 00 00       	mov    $0x1,%edi
    191a:	31 c0                	xor    %eax,%eax
    191c:	48 8d 35 73 08 00 00 	lea    0x873(%rip),%rsi        # 2196 <_IO_stdin_used+0x196>
    1923:	e8 a8 f8 ff ff       	call   11d0 <__printf_chk@plt>
    1928:	66 0f ef c9          	pxor   %xmm1,%xmm1
    192c:	f2 0f 10 44 24 08    	movsd  0x8(%rsp),%xmm0
    1932:	48 8d 35 5f 07 00 00 	lea    0x75f(%rip),%rsi        # 2098 <_IO_stdin_used+0x98>
    1939:	f2 41 0f 2a cf       	cvtsi2sd %r15d,%xmm1
    193e:	bf 01 00 00 00       	mov    $0x1,%edi
    1943:	b8 01 00 00 00       	mov    $0x1,%eax
    1948:	f2 0f 5e c8          	divsd  %xmm0,%xmm1
    194c:	66 0f 28 c1          	movapd %xmm1,%xmm0
    1950:	e8 7b f8 ff ff       	call   11d0 <__printf_chk@plt>
    1955:	e9 ca fe ff ff       	jmp    1824 <main+0x604>
    195a:	44 89 ea             	mov    %r13d,%edx
    195d:	48 8d 35 a8 07 00 00 	lea    0x7a8(%rip),%rsi        # 210c <_IO_stdin_used+0x10c>
    1964:	bf 01 00 00 00       	mov    $0x1,%edi
    1969:	31 c0                	xor    %eax,%eax
    196b:	e8 60 f8 ff ff       	call   11d0 <__printf_chk@plt>
    1970:	48 8b 0d d9 26 00 00 	mov    0x26d9(%rip),%rcx        # 4050 <head>
    1977:	e9 dc fa ff ff       	jmp    1458 <main+0x238>
    197c:	48 8d 3d db 07 00 00 	lea    0x7db(%rip),%rdi        # 215e <_IO_stdin_used+0x15e>
    1983:	e8 a8 f7 ff ff       	call   1130 <puts@plt>
    1988:	e9 02 fc ff ff       	jmp    158f <main+0x36f>
    198d:	48 8d 3d b8 07 00 00 	lea    0x7b8(%rip),%rdi        # 214c <_IO_stdin_used+0x14c>
    1994:	e8 57 f8 ff ff       	call   11f0 <perror@plt>
    1999:	b8 01 00 00 00       	mov    $0x1,%eax
    199e:	e9 39 fa ff ff       	jmp    13dc <main+0x1bc>
    19a3:	48 8d 3d ae 06 00 00 	lea    0x6ae(%rip),%rdi        # 2058 <_IO_stdin_used+0x58>
    19aa:	e8 41 f8 ff ff       	call   11f0 <perror@plt>
    19af:	b8 01 00 00 00       	mov    $0x1,%eax
    19b4:	e9 23 fa ff ff       	jmp    13dc <main+0x1bc>
    19b9:	48 8d 3d 78 06 00 00 	lea    0x678(%rip),%rdi        # 2038 <_IO_stdin_used+0x38>
    19c0:	e8 2b f8 ff ff       	call   11f0 <perror@plt>
    19c5:	b8 01 00 00 00       	mov    $0x1,%eax
    19ca:	e9 0d fa ff ff       	jmp    13dc <main+0x1bc>
    19cf:	48 8d 3d fd 06 00 00 	lea    0x6fd(%rip),%rdi        # 20d3 <_IO_stdin_used+0xd3>
    19d6:	e8 15 f8 ff ff       	call   11f0 <perror@plt>
    19db:	b8 01 00 00 00       	mov    $0x1,%eax
    19e0:	e9 f7 f9 ff ff       	jmp    13dc <main+0x1bc>
    19e5:	e8 76 f7 ff ff       	call   1160 <__stack_chk_fail@plt>
    19ea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000019f0 <_start>:
    19f0:	f3 0f 1e fa          	endbr64 
    19f4:	31 ed                	xor    %ebp,%ebp
    19f6:	49 89 d1             	mov    %rdx,%r9
    19f9:	5e                   	pop    %rsi
    19fa:	48 89 e2             	mov    %rsp,%rdx
    19fd:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    1a01:	50                   	push   %rax
    1a02:	54                   	push   %rsp
    1a03:	45 31 c0             	xor    %r8d,%r8d
    1a06:	31 c9                	xor    %ecx,%ecx
    1a08:	48 8d 3d 11 f8 ff ff 	lea    -0x7ef(%rip),%rdi        # 1220 <main>
    1a0f:	ff 15 c3 25 00 00    	call   *0x25c3(%rip)        # 3fd8 <__libc_start_main@GLIBC_2.34>
    1a15:	f4                   	hlt    
    1a16:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    1a1d:	00 00 00 

0000000000001a20 <deregister_tm_clones>:
    1a20:	48 8d 3d f1 25 00 00 	lea    0x25f1(%rip),%rdi        # 4018 <__TMC_END__>
    1a27:	48 8d 05 ea 25 00 00 	lea    0x25ea(%rip),%rax        # 4018 <__TMC_END__>
    1a2e:	48 39 f8             	cmp    %rdi,%rax
    1a31:	74 15                	je     1a48 <deregister_tm_clones+0x28>
    1a33:	48 8b 05 a6 25 00 00 	mov    0x25a6(%rip),%rax        # 3fe0 <_ITM_deregisterTMCloneTable@Base>
    1a3a:	48 85 c0             	test   %rax,%rax
    1a3d:	74 09                	je     1a48 <deregister_tm_clones+0x28>
    1a3f:	ff e0                	jmp    *%rax
    1a41:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1a48:	c3                   	ret    
    1a49:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001a50 <register_tm_clones>:
    1a50:	48 8d 3d c1 25 00 00 	lea    0x25c1(%rip),%rdi        # 4018 <__TMC_END__>
    1a57:	48 8d 35 ba 25 00 00 	lea    0x25ba(%rip),%rsi        # 4018 <__TMC_END__>
    1a5e:	48 29 fe             	sub    %rdi,%rsi
    1a61:	48 89 f0             	mov    %rsi,%rax
    1a64:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1a68:	48 c1 f8 03          	sar    $0x3,%rax
    1a6c:	48 01 c6             	add    %rax,%rsi
    1a6f:	48 d1 fe             	sar    %rsi
    1a72:	74 14                	je     1a88 <register_tm_clones+0x38>
    1a74:	48 8b 05 75 25 00 00 	mov    0x2575(%rip),%rax        # 3ff0 <_ITM_registerTMCloneTable@Base>
    1a7b:	48 85 c0             	test   %rax,%rax
    1a7e:	74 08                	je     1a88 <register_tm_clones+0x38>
    1a80:	ff e0                	jmp    *%rax
    1a82:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1a88:	c3                   	ret    
    1a89:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001a90 <__do_global_dtors_aux>:
    1a90:	f3 0f 1e fa          	endbr64 
    1a94:	80 3d 8d 25 00 00 00 	cmpb   $0x0,0x258d(%rip)        # 4028 <completed.8099>
    1a9b:	75 2b                	jne    1ac8 <__do_global_dtors_aux+0x38>
    1a9d:	55                   	push   %rbp
    1a9e:	48 83 3d 52 25 00 00 	cmpq   $0x0,0x2552(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1aa5:	00 
    1aa6:	48 89 e5             	mov    %rsp,%rbp
    1aa9:	74 0c                	je     1ab7 <__do_global_dtors_aux+0x27>
    1aab:	48 8b 3d 56 25 00 00 	mov    0x2556(%rip),%rdi        # 4008 <__dso_handle>
    1ab2:	e8 69 f6 ff ff       	call   1120 <__cxa_finalize@plt>
    1ab7:	e8 64 ff ff ff       	call   1a20 <deregister_tm_clones>
    1abc:	c6 05 65 25 00 00 01 	movb   $0x1,0x2565(%rip)        # 4028 <completed.8099>
    1ac3:	5d                   	pop    %rbp
    1ac4:	c3                   	ret    
    1ac5:	0f 1f 00             	nopl   (%rax)
    1ac8:	c3                   	ret    
    1ac9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001ad0 <frame_dummy>:
    1ad0:	f3 0f 1e fa          	endbr64 
    1ad4:	e9 77 ff ff ff       	jmp    1a50 <register_tm_clones>
    1ad9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001ae0 <overwrite_x_kb_l1.constprop.0>:
    1ae0:	41 55                	push   %r13
    1ae2:	31 ff                	xor    %edi,%edi
    1ae4:	41 54                	push   %r12
    1ae6:	55                   	push   %rbp
    1ae7:	48 8d 2d 92 45 00 00 	lea    0x4592(%rip),%rbp        # 6080 <g_buffer>
    1aee:	53                   	push   %rbx
    1aef:	4c 8d a5 00 c0 00 00 	lea    0xc000(%rbp),%r12
    1af6:	48 89 eb             	mov    %rbp,%rbx
    1af9:	48 83 ec 08          	sub    $0x8,%rsp
    1afd:	e8 9e f6 ff ff       	call   11a0 <time@plt>
    1b02:	48 89 c7             	mov    %rax,%rdi
    1b05:	e8 66 f6 ff ff       	call   1170 <srand@plt>
    1b0a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1b10:	e8 fb f6 ff ff       	call   1210 <rand@plt>
    1b15:	48 83 c3 01          	add    $0x1,%rbx
    1b19:	88 43 ff             	mov    %al,-0x1(%rbx)
    1b1c:	4c 39 e3             	cmp    %r12,%rbx
    1b1f:	75 ef                	jne    1b10 <overwrite_x_kb_l1.constprop.0+0x30>
    1b21:	31 db                	xor    %ebx,%ebx
    1b23:	4c 8d 25 56 25 00 00 	lea    0x2556(%rip),%r12        # 4080 <g_indices>
    1b2a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1b30:	49 89 1c dc          	mov    %rbx,(%r12,%rbx,8)
    1b34:	48 83 c3 01          	add    $0x1,%rbx
    1b38:	48 81 fb 00 03 00 00 	cmp    $0x300,%rbx
    1b3f:	75 ef                	jne    1b30 <overwrite_x_kb_l1.constprop.0+0x50>
    1b41:	4c 8d 2d 30 25 00 00 	lea    0x2530(%rip),%r13        # 4078 <ONLY_BENCHMARK+0x14>
    1b48:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    1b4f:	00 
    1b50:	e8 bb f6 ff ff       	call   1210 <rand@plt>
    1b55:	31 d2                	xor    %edx,%edx
    1b57:	48 98                	cltq   
    1b59:	48 f7 f3             	div    %rbx
    1b5c:	49 8b 44 dd 00       	mov    0x0(%r13,%rbx,8),%rax
    1b61:	49 8b 0c d4          	mov    (%r12,%rdx,8),%rcx
    1b65:	49 89 4c dd 00       	mov    %rcx,0x0(%r13,%rbx,8)
    1b6a:	48 83 eb 01          	sub    $0x1,%rbx
    1b6e:	49 89 04 d4          	mov    %rax,(%r12,%rdx,8)
    1b72:	48 83 fb 01          	cmp    $0x1,%rbx
    1b76:	75 d8                	jne    1b50 <overwrite_x_kb_l1.constprop.0+0x70>
    1b78:	4c 8d 25 01 25 00 00 	lea    0x2501(%rip),%r12        # 4080 <g_indices>
    1b7f:	4d 8d ac 24 00 18 00 	lea    0x1800(%r12),%r13
    1b86:	00 
    1b87:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    1b8e:	00 00 
    1b90:	49 8b 1c 24          	mov    (%r12),%rbx
    1b94:	49 83 c4 08          	add    $0x8,%r12
    1b98:	e8 73 f6 ff ff       	call   1210 <rand@plt>
    1b9d:	48 c1 e3 06          	shl    $0x6,%rbx
    1ba1:	30 44 1d 00          	xor    %al,0x0(%rbp,%rbx,1)
    1ba5:	4d 39 ec             	cmp    %r13,%r12
    1ba8:	75 e6                	jne    1b90 <overwrite_x_kb_l1.constprop.0+0xb0>
    1baa:	48 83 c4 08          	add    $0x8,%rsp
    1bae:	5b                   	pop    %rbx
    1baf:	5d                   	pop    %rbp
    1bb0:	41 5c                	pop    %r12
    1bb2:	41 5d                	pop    %r13
    1bb4:	c3                   	ret    
    1bb5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    1bbc:	00 00 00 00 

0000000000001bc0 <apl_delete_single>:
    1bc0:	f3 0f 1e fa          	endbr64 
    1bc4:	48 63 15 75 24 00 00 	movslq 0x2475(%rip),%rdx        # 4040 <pos>
    1bcb:	48 8d 35 0e 4a 01 00 	lea    0x14a0e(%rip),%rsi        # 165e0 <access_points>
    1bd2:	48 89 d1             	mov    %rdx,%rcx
    1bd5:	48 89 d0             	mov    %rdx,%rax
    1bd8:	48 c1 e1 0c          	shl    $0xc,%rcx
    1bdc:	83 c0 01             	add    $0x1,%eax
    1bdf:	48 8b 8c 0e f0 0f 00 	mov    0xff0(%rsi,%rcx,1),%rcx
    1be6:	00 
    1be7:	48 8b b1 f8 0f 00 00 	mov    0xff8(%rcx),%rsi
    1bee:	48 8b 89 f0 0f 00 00 	mov    0xff0(%rcx),%rcx
    1bf5:	48 89 8e f0 0f 00 00 	mov    %rcx,0xff0(%rsi)
    1bfc:	48 89 b1 f8 0f 00 00 	mov    %rsi,0xff8(%rcx)
    1c03:	48 8d 0d 76 44 01 00 	lea    0x14476(%rip),%rcx        # 16080 <access_point_counts>
    1c0a:	83 2c 91 01          	subl   $0x1,(%rcx,%rdx,4)
    1c0e:	99                   	cltd   
    1c0f:	c1 ea 1c             	shr    $0x1c,%edx
    1c12:	01 d0                	add    %edx,%eax
    1c14:	83 e0 0f             	and    $0xf,%eax
    1c17:	29 d0                	sub    %edx,%eax
    1c19:	89 05 21 24 00 00    	mov    %eax,0x2421(%rip)        # 4040 <pos>
    1c1f:	c3                   	ret    

0000000000001c20 <apl_insert_single>:
    1c20:	f3 0f 1e fa          	endbr64 
    1c24:	8b 05 16 24 00 00    	mov    0x2416(%rip),%eax        # 4040 <pos>
    1c2a:	48 8d 35 af 49 01 00 	lea    0x149af(%rip),%rsi        # 165e0 <access_points>
    1c31:	83 c0 0f             	add    $0xf,%eax
    1c34:	99                   	cltd   
    1c35:	c1 ea 1c             	shr    $0x1c,%edx
    1c38:	01 d0                	add    %edx,%eax
    1c3a:	83 e0 0f             	and    $0xf,%eax
    1c3d:	29 d0                	sub    %edx,%eax
    1c3f:	48 63 c8             	movslq %eax,%rcx
    1c42:	89 05 f8 23 00 00    	mov    %eax,0x23f8(%rip)        # 4040 <pos>
    1c48:	48 89 ca             	mov    %rcx,%rdx
    1c4b:	48 c1 e2 0c          	shl    $0xc,%rdx
    1c4f:	48 8b 94 16 f0 0f 00 	mov    0xff0(%rsi,%rdx,1),%rdx
    1c56:	00 
    1c57:	48 8b b2 f8 0f 00 00 	mov    0xff8(%rdx),%rsi
    1c5e:	48 89 97 f0 0f 00 00 	mov    %rdx,0xff0(%rdi)
    1c65:	48 89 b7 f8 0f 00 00 	mov    %rsi,0xff8(%rdi)
    1c6c:	48 8b b2 f8 0f 00 00 	mov    0xff8(%rdx),%rsi
    1c73:	48 89 be f0 0f 00 00 	mov    %rdi,0xff0(%rsi)
    1c7a:	48 89 ba f8 0f 00 00 	mov    %rdi,0xff8(%rdx)
    1c81:	89 87 ec 0f 00 00    	mov    %eax,0xfec(%rdi)
    1c87:	48 8d 05 f2 43 01 00 	lea    0x143f2(%rip),%rax        # 16080 <access_point_counts>
    1c8e:	83 04 88 01          	addl   $0x1,(%rax,%rcx,4)
    1c92:	c3                   	ret    
    1c93:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    1c9a:	00 00 00 00 
    1c9e:	66 90                	xchg   %ax,%ax

0000000000001ca0 <apl_delete_by_reference>:
    1ca0:	f3 0f 1e fa          	endbr64 
    1ca4:	48 63 97 ec 0f 00 00 	movslq 0xfec(%rdi),%rdx
    1cab:	48 63 0d 8e 23 00 00 	movslq 0x238e(%rip),%rcx        # 4040 <pos>
    1cb2:	48 8d 05 c7 43 01 00 	lea    0x143c7(%rip),%rax        # 16080 <access_point_counts>
    1cb9:	83 2c 90 01          	subl   $0x1,(%rax,%rdx,4)
    1cbd:	8d 41 01             	lea    0x1(%rcx),%eax
    1cc0:	89 c6                	mov    %eax,%esi
    1cc2:	c1 fe 1f             	sar    $0x1f,%esi
    1cc5:	c1 ee 1c             	shr    $0x1c,%esi
    1cc8:	01 f0                	add    %esi,%eax
    1cca:	83 e0 0f             	and    $0xf,%eax
    1ccd:	29 f0                	sub    %esi,%eax
    1ccf:	39 ca                	cmp    %ecx,%edx
    1cd1:	74 6d                	je     1d40 <apl_delete_by_reference+0xa0>
    1cd3:	4c 8d 05 06 49 01 00 	lea    0x14906(%rip),%r8        # 165e0 <access_points>
    1cda:	48 c1 e1 0c          	shl    $0xc,%rcx
    1cde:	48 c1 e2 0c          	shl    $0xc,%rdx
    1ce2:	89 05 58 23 00 00    	mov    %eax,0x2358(%rip)        # 4040 <pos>
    1ce8:	49 8b 8c 08 f0 0f 00 	mov    0xff0(%r8,%rcx,1),%rcx
    1cef:	00 
    1cf0:	4c 01 c2             	add    %r8,%rdx
    1cf3:	48 8b b1 f8 0f 00 00 	mov    0xff8(%rcx),%rsi
    1cfa:	4c 8b 89 f0 0f 00 00 	mov    0xff0(%rcx),%r9
    1d01:	4c 89 8e f0 0f 00 00 	mov    %r9,0xff0(%rsi)
    1d08:	4c 8b 89 f0 0f 00 00 	mov    0xff0(%rcx),%r9
    1d0f:	49 89 b1 f8 0f 00 00 	mov    %rsi,0xff8(%r9)
    1d16:	48 8b b7 f0 0f 00 00 	mov    0xff0(%rdi),%rsi
    1d1d:	48 89 91 f8 0f 00 00 	mov    %rdx,0xff8(%rcx)
    1d24:	48 89 8a f0 0f 00 00 	mov    %rcx,0xff0(%rdx)
    1d2b:	48 89 b1 f0 0f 00 00 	mov    %rsi,0xff0(%rcx)
    1d32:	48 89 8e f8 0f 00 00 	mov    %rcx,0xff8(%rsi)
    1d39:	c3                   	ret    
    1d3a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1d40:	48 8b 8f f0 0f 00 00 	mov    0xff0(%rdi),%rcx
    1d47:	48 8b 97 f8 0f 00 00 	mov    0xff8(%rdi),%rdx
    1d4e:	89 05 ec 22 00 00    	mov    %eax,0x22ec(%rip)        # 4040 <pos>
    1d54:	48 89 8a f0 0f 00 00 	mov    %rcx,0xff0(%rdx)
    1d5b:	48 8b 8f f0 0f 00 00 	mov    0xff0(%rdi),%rcx
    1d62:	48 89 91 f8 0f 00 00 	mov    %rdx,0xff8(%rcx)
    1d69:	c3                   	ret    

Disassembly of section .fini:

0000000000001d6c <_fini>:
    1d6c:	f3 0f 1e fa          	endbr64 
    1d70:	48 83 ec 08          	sub    $0x8,%rsp
    1d74:	48 83 c4 08          	add    $0x8,%rsp
    1d78:	c3                   	ret    
