
/home/sjaeger/pulpissimo/aes/aes_sw_hwpe/build/hwme.c/pulpissimo/hwme/hwme:     file format elf32-littleriscv


Disassembly of section .vectors:

1c008000 <__irq_vector_base>:
1c008000:	0ec0006f          	j	1c0080ec <__rt_illegal_instr>
1c008004:	0900006f          	j	1c008094 <__rt_no_irq_handler>
1c008008:	08c0006f          	j	1c008094 <__rt_no_irq_handler>
1c00800c:	0880006f          	j	1c008094 <__rt_no_irq_handler>
1c008010:	0840006f          	j	1c008094 <__rt_no_irq_handler>
1c008014:	0800006f          	j	1c008094 <__rt_no_irq_handler>
1c008018:	07c0006f          	j	1c008094 <__rt_no_irq_handler>
1c00801c:	0780006f          	j	1c008094 <__rt_no_irq_handler>
1c008020:	0740006f          	j	1c008094 <__rt_no_irq_handler>
1c008024:	0700006f          	j	1c008094 <__rt_no_irq_handler>
1c008028:	06c0006f          	j	1c008094 <__rt_no_irq_handler>
1c00802c:	0680006f          	j	1c008094 <__rt_no_irq_handler>
1c008030:	0640006f          	j	1c008094 <__rt_no_irq_handler>
1c008034:	0600006f          	j	1c008094 <__rt_no_irq_handler>
1c008038:	05c0006f          	j	1c008094 <__rt_no_irq_handler>
1c00803c:	0580006f          	j	1c008094 <__rt_no_irq_handler>
1c008040:	0540006f          	j	1c008094 <__rt_no_irq_handler>
1c008044:	0500006f          	j	1c008094 <__rt_no_irq_handler>
1c008048:	04c0006f          	j	1c008094 <__rt_no_irq_handler>
1c00804c:	0480006f          	j	1c008094 <__rt_no_irq_handler>
1c008050:	0440006f          	j	1c008094 <__rt_no_irq_handler>
1c008054:	0400006f          	j	1c008094 <__rt_no_irq_handler>
1c008058:	03c0006f          	j	1c008094 <__rt_no_irq_handler>
1c00805c:	0380006f          	j	1c008094 <__rt_no_irq_handler>
1c008060:	0340006f          	j	1c008094 <__rt_no_irq_handler>
1c008064:	0300006f          	j	1c008094 <__rt_no_irq_handler>
1c008068:	02c0006f          	j	1c008094 <__rt_no_irq_handler>
1c00806c:	0280006f          	j	1c008094 <__rt_no_irq_handler>
1c008070:	0240006f          	j	1c008094 <__rt_no_irq_handler>
1c008074:	0200006f          	j	1c008094 <__rt_no_irq_handler>
1c008078:	01c0006f          	j	1c008094 <__rt_no_irq_handler>
1c00807c:	0180006f          	j	1c008094 <__rt_no_irq_handler>

1c008080 <_start>:
1c008080:	0200006f          	j	1c0080a0 <_entry>
1c008084:	0680006f          	j	1c0080ec <__rt_illegal_instr>
	...

1c008090 <__rt_debug_struct_ptr>:
1c008090:	0cf4                	addi	a3,sp,604
1c008092:	1c00                	addi	s0,sp,560

1c008094 <__rt_no_irq_handler>:
1c008094:	0000006f          	j	1c008094 <__rt_no_irq_handler>

1c008098 <__rt_semihosting_call>:
1c008098:	00100073          	ebreak
1c00809c:	00008067          	ret

Disassembly of section .text:

1c0080a0 <_entry>:
1c0080a0:	7a101073          	csrw	pcmr,zero
1c0080a4:	ffff9297          	auipc	t0,0xffff9
1c0080a8:	d2c28293          	addi	t0,t0,-724 # 1c000dd0 <_bss_start>
1c0080ac:	ffff9317          	auipc	t1,0xffff9
1c0080b0:	e0430313          	addi	t1,t1,-508 # 1c000eb0 <__l2_priv0_end>
1c0080b4:	0002a023          	sw	zero,0(t0)
1c0080b8:	0291                	addi	t0,t0,4
1c0080ba:	fe62ede3          	bltu	t0,t1,1c0080b4 <_entry+0x14>
1c0080be:	ffff9117          	auipc	sp,0xffff9
1c0080c2:	c0210113          	addi	sp,sp,-1022 # 1c000cc0 <stack>
1c0080c6:	5c8000ef          	jal	ra,1c00868e <__rt_init>
1c0080ca:	00000513          	li	a0,0
1c0080ce:	00000593          	li	a1,0
1c0080d2:	00000397          	auipc	t2,0x0
1c0080d6:	26438393          	addi	t2,t2,612 # 1c008336 <main>
1c0080da:	000380e7          	jalr	t2
1c0080de:	842a                	mv	s0,a0
1c0080e0:	684000ef          	jal	ra,1c008764 <__rt_deinit>
1c0080e4:	8522                	mv	a0,s0
1c0080e6:	572010ef          	jal	ra,1c009658 <exit>

1c0080ea <_fini>:
1c0080ea:	8082                	ret

1c0080ec <__rt_illegal_instr>:
1c0080ec:	fe112e23          	sw	ra,-4(sp)
1c0080f0:	fea12c23          	sw	a0,-8(sp)
1c0080f4:	00000517          	auipc	a0,0x0
1c0080f8:	6ee50513          	addi	a0,a0,1774 # 1c0087e2 <__rt_handle_illegal_instr>
1c0080fc:	010000ef          	jal	ra,1c00810c <__rt_call_c_function>
1c008100:	ffc12083          	lw	ra,-4(sp)
1c008104:	ff812503          	lw	a0,-8(sp)
1c008108:	30200073          	mret

1c00810c <__rt_call_c_function>:
1c00810c:	7119                	addi	sp,sp,-128
1c00810e:	c006                	sw	ra,0(sp)
1c008110:	c20e                	sw	gp,4(sp)
1c008112:	c412                	sw	tp,8(sp)
1c008114:	c616                	sw	t0,12(sp)
1c008116:	c81a                	sw	t1,16(sp)
1c008118:	ca1e                	sw	t2,20(sp)
1c00811a:	ce2e                	sw	a1,28(sp)
1c00811c:	d032                	sw	a2,32(sp)
1c00811e:	d236                	sw	a3,36(sp)
1c008120:	d43a                	sw	a4,40(sp)
1c008122:	d63e                	sw	a5,44(sp)
1c008124:	d842                	sw	a6,48(sp)
1c008126:	da46                	sw	a7,52(sp)
1c008128:	dc72                	sw	t3,56(sp)
1c00812a:	de76                	sw	t4,60(sp)
1c00812c:	c0fa                	sw	t5,64(sp)
1c00812e:	c6fe                	sw	t6,76(sp)
1c008130:	000500e7          	jalr	a0
1c008134:	4082                	lw	ra,0(sp)
1c008136:	4192                	lw	gp,4(sp)
1c008138:	4222                	lw	tp,8(sp)
1c00813a:	42b2                	lw	t0,12(sp)
1c00813c:	4342                	lw	t1,16(sp)
1c00813e:	43d2                	lw	t2,20(sp)
1c008140:	45f2                	lw	a1,28(sp)
1c008142:	5602                	lw	a2,32(sp)
1c008144:	5692                	lw	a3,36(sp)
1c008146:	5722                	lw	a4,40(sp)
1c008148:	57b2                	lw	a5,44(sp)
1c00814a:	5842                	lw	a6,48(sp)
1c00814c:	58d2                	lw	a7,52(sp)
1c00814e:	5e62                	lw	t3,56(sp)
1c008150:	5ef2                	lw	t4,60(sp)
1c008152:	4f06                	lw	t5,64(sp)
1c008154:	4fb6                	lw	t6,76(sp)
1c008156:	6109                	addi	sp,sp,128
1c008158:	8082                	ret

1c00815a <udma_event_handler>:
1c00815a:	00157413          	andi	s0,a0,1
1c00815e:	00155613          	srli	a2,a0,0x1
1c008162:	8e41                	or	a2,a2,s0
1c008164:	e3ff8417          	auipc	s0,0xe3ff8
1c008168:	ea040413          	addi	s0,s0,-352 # 4 <periph_channels>
1c00816c:	00561493          	slli	s1,a2,0x5
1c008170:	94a2                	add	s1,s1,s0
1c008172:	4080                	lw	s0,0(s1)
1c008174:	448c                	lw	a1,8(s1)
1c008176:	06040163          	beqz	s0,1c0081d8 <__rt_udma_no_copy>
1c00817a:	4c50                	lw	a2,28(s0)
1c00817c:	4848                	lw	a0,20(s0)
1c00817e:	04061b63          	bnez	a2,1c0081d4 <dmaCmd>
1c008182:	c088                	sw	a0,0(s1)
1c008184:	4448                	lw	a0,12(s0)
1c008186:	e52d                	bnez	a0,1c0081f0 <handle_special_end>

1c008188 <resume_after_special_end>:
1c008188:	02058b63          	beqz	a1,1c0081be <checkTask>
1c00818c:	4990                	lw	a2,16(a1)
1c00818e:	49c8                	lw	a0,20(a1)
1c008190:	c611                	beqz	a2,1c00819c <__rt_udma_call_enqueue_callback_resume>
1c008192:	00000497          	auipc	s1,0x0
1c008196:	00a48493          	addi	s1,s1,10 # 1c00819c <__rt_udma_call_enqueue_callback_resume>
1c00819a:	8602                	jr	a2

1c00819c <__rt_udma_call_enqueue_callback_resume>:
1c00819c:	44d0                	lw	a2,12(s1)
1c00819e:	c488                	sw	a0,8(s1)
1c0081a0:	4188                	lw	a0,0(a1)
1c0081a2:	41c4                	lw	s1,4(a1)
1c0081a4:	c208                	sw	a0,0(a2)
1c0081a6:	c244                	sw	s1,4(a2)
1c0081a8:	45c4                	lw	s1,12(a1)
1c0081aa:	88bd                	andi	s1,s1,15
1c0081ac:	4515                	li	a0,5
1c0081ae:	00a4c663          	blt	s1,a0,1c0081ba <dual>
1c0081b2:	0064a463          	p.beqimm	s1,6,1c0081ba <dual>
1c0081b6:	0074a263          	p.beqimm	s1,7,1c0081ba <dual>

1c0081ba <dual>:
1c0081ba:	4588                	lw	a0,8(a1)
1c0081bc:	c608                	sw	a0,8(a2)

1c0081be <checkTask>:
1c0081be:	4c0c                	lw	a1,24(s0)
1c0081c0:	00000497          	auipc	s1,0x0
1c0081c4:	0ba48493          	addi	s1,s1,186 # 1c00827a <__rt_fc_socevents_handler_exit>
1c0081c8:	00058463          	beqz	a1,1c0081d0 <checkTask+0x12>
1c0081cc:	0be0006f          	j	1c00828a <__rt_event_enqueue>
1c0081d0:	0aa0006f          	j	1c00827a <__rt_fc_socevents_handler_exit>

1c0081d4 <dmaCmd>:
1c0081d4:	0a60006f          	j	1c00827a <__rt_fc_socevents_handler_exit>

1c0081d8 <__rt_udma_no_copy>:
1c0081d8:	00555593          	srli	a1,a0,0x5
1c0081dc:	058a                	slli	a1,a1,0x2
1c0081de:	2845a603          	lw	a2,644(a1)
1c0081e2:	897d                	andi	a0,a0,31
1c0081e4:	80a64633          	p.bsetr	a2,a2,a0
1c0081e8:	28c5a223          	sw	a2,644(a1)
1c0081ec:	08e0006f          	j	1c00827a <__rt_fc_socevents_handler_exit>

1c0081f0 <handle_special_end>:
1c0081f0:	00352563          	p.beqimm	a0,3,1c0081fa <i2c_step1>
1c0081f4:	02452163          	p.beqimm	a0,4,1c008216 <i2c_step2>
1c0081f8:	bf41                	j	1c008188 <resume_after_special_end>

1c0081fa <i2c_step1>:
1c0081fa:	5408                	lw	a0,40(s0)
1c0081fc:	c448                	sw	a0,12(s0)
1c0081fe:	4088                	lw	a0,0(s1)
1c008200:	c848                	sw	a0,20(s0)
1c008202:	c080                	sw	s0,0(s1)
1c008204:	44d0                	lw	a2,12(s1)
1c008206:	4008                	lw	a0,0(s0)
1c008208:	c208                	sw	a0,0(a2)
1c00820a:	5048                	lw	a0,36(s0)
1c00820c:	c248                	sw	a0,4(a2)
1c00820e:	4408                	lw	a0,8(s0)
1c008210:	c608                	sw	a0,8(a2)
1c008212:	0680006f          	j	1c00827a <__rt_fc_socevents_handler_exit>

1c008216 <i2c_step2>:
1c008216:	00042623          	sw	zero,12(s0)
1c00821a:	4088                	lw	a0,0(s1)
1c00821c:	c848                	sw	a0,20(s0)
1c00821e:	c080                	sw	s0,0(s1)
1c008220:	02000613          	li	a2,32
1c008224:	c070                	sw	a2,68(s0)
1c008226:	44d0                	lw	a2,12(s1)
1c008228:	04440513          	addi	a0,s0,68
1c00822c:	c208                	sw	a0,0(a2)
1c00822e:	4505                	li	a0,1
1c008230:	c248                	sw	a0,4(a2)
1c008232:	4541                	li	a0,16
1c008234:	c608                	sw	a0,8(a2)
1c008236:	0440006f          	j	1c00827a <__rt_fc_socevents_handler_exit>

1c00823a <__rt_fc_socevents_handler>:
1c00823a:	7119                	addi	sp,sp,-128
1c00823c:	c022                	sw	s0,0(sp)
1c00823e:	c226                	sw	s1,4(sp)
1c008240:	c42a                	sw	a0,8(sp)
1c008242:	c62e                	sw	a1,12(sp)
1c008244:	c832                	sw	a2,16(sp)
1c008246:	1a10a437          	lui	s0,0x1a10a
1c00824a:	80040413          	addi	s0,s0,-2048 # 1a109800 <__rt_sched+0x1a1094f4>
1c00824e:	5048                	lw	a0,36(s0)
1c008250:	02800493          	li	s1,40
1c008254:	00955963          	ble	s1,a0,1c008266 <__rt_fc_socevents_register>
1c008258:	ffc57613          	andi	a2,a0,-4
1c00825c:	2a462583          	lw	a1,676(a2)
1c008260:	2cc62403          	lw	s0,716(a2)
1c008264:	8582                	jr	a1

1c008266 <__rt_fc_socevents_register>:
1c008266:	00555593          	srli	a1,a0,0x5
1c00826a:	058a                	slli	a1,a1,0x2
1c00826c:	2845a603          	lw	a2,644(a1)
1c008270:	897d                	andi	a0,a0,31
1c008272:	80a64633          	p.bsetr	a2,a2,a0
1c008276:	28c5a223          	sw	a2,644(a1)

1c00827a <__rt_fc_socevents_handler_exit>:
1c00827a:	4402                	lw	s0,0(sp)
1c00827c:	4492                	lw	s1,4(sp)
1c00827e:	4522                	lw	a0,8(sp)
1c008280:	45b2                	lw	a1,12(sp)
1c008282:	4642                	lw	a2,16(sp)
1c008284:	6109                	addi	sp,sp,128
1c008286:	30200073          	mret

1c00828a <__rt_event_enqueue>:
1c00828a:	0035f513          	andi	a0,a1,3
1c00828e:	02051063          	bnez	a0,1c0082ae <__rt_handle_special_event>
1c008292:	e3ff8517          	auipc	a0,0xe3ff8
1c008296:	07a50513          	addi	a0,a0,122 # 30c <__rt_sched>
1c00829a:	0005ac23          	sw	zero,24(a1)
1c00829e:	4110                	lw	a2,0(a0)
1c0082a0:	c601                	beqz	a2,1c0082a8 <__rt_no_first>
1c0082a2:	4150                	lw	a2,4(a0)
1c0082a4:	ce0c                	sw	a1,24(a2)
1c0082a6:	a011                	j	1c0082aa <__rt_common>

1c0082a8 <__rt_no_first>:
1c0082a8:	c10c                	sw	a1,0(a0)

1c0082aa <__rt_common>:
1c0082aa:	c14c                	sw	a1,4(a0)

1c0082ac <enqueue_end>:
1c0082ac:	8482                	jr	s1

1c0082ae <__rt_handle_special_event>:
1c0082ae:	5571                	li	a0,-4
1c0082b0:	8de9                	and	a1,a1,a0
1c0082b2:	4190                	lw	a2,0(a1)
1c0082b4:	41c8                	lw	a0,4(a1)
1c0082b6:	a82d                	j	1c0082f0 <__rt_call_external_c_function>

1c0082b8 <__rt_bridge_enqueue_event>:
1c0082b8:	fe812e23          	sw	s0,-4(sp)
1c0082bc:	fe912c23          	sw	s1,-8(sp)
1c0082c0:	fea12a23          	sw	a0,-12(sp)
1c0082c4:	feb12823          	sw	a1,-16(sp)
1c0082c8:	fec12623          	sw	a2,-20(sp)
1c0082cc:	00000617          	auipc	a2,0x0
1c0082d0:	6e660613          	addi	a2,a2,1766 # 1c0089b2 <__rt_bridge_handle_notif>
1c0082d4:	01c004ef          	jal	s1,1c0082f0 <__rt_call_external_c_function>
1c0082d8:	ffc12403          	lw	s0,-4(sp)
1c0082dc:	ff812483          	lw	s1,-8(sp)
1c0082e0:	ff412503          	lw	a0,-12(sp)
1c0082e4:	ff012583          	lw	a1,-16(sp)
1c0082e8:	fec12603          	lw	a2,-20(sp)
1c0082ec:	30200073          	mret

1c0082f0 <__rt_call_external_c_function>:
1c0082f0:	7119                	addi	sp,sp,-128
1c0082f2:	c006                	sw	ra,0(sp)
1c0082f4:	c20e                	sw	gp,4(sp)
1c0082f6:	c412                	sw	tp,8(sp)
1c0082f8:	c616                	sw	t0,12(sp)
1c0082fa:	c81a                	sw	t1,16(sp)
1c0082fc:	ca1e                	sw	t2,20(sp)
1c0082fe:	d236                	sw	a3,36(sp)
1c008300:	d43a                	sw	a4,40(sp)
1c008302:	d63e                	sw	a5,44(sp)
1c008304:	d842                	sw	a6,48(sp)
1c008306:	da46                	sw	a7,52(sp)
1c008308:	dc72                	sw	t3,56(sp)
1c00830a:	de76                	sw	t4,60(sp)
1c00830c:	c0fa                	sw	t5,64(sp)
1c00830e:	c6fe                	sw	t6,76(sp)
1c008310:	000600e7          	jalr	a2
1c008314:	4082                	lw	ra,0(sp)
1c008316:	4192                	lw	gp,4(sp)
1c008318:	4222                	lw	tp,8(sp)
1c00831a:	42b2                	lw	t0,12(sp)
1c00831c:	4342                	lw	t1,16(sp)
1c00831e:	43d2                	lw	t2,20(sp)
1c008320:	5692                	lw	a3,36(sp)
1c008322:	5722                	lw	a4,40(sp)
1c008324:	57b2                	lw	a5,44(sp)
1c008326:	5842                	lw	a6,48(sp)
1c008328:	58d2                	lw	a7,52(sp)
1c00832a:	5e62                	lw	t3,56(sp)
1c00832c:	5ef2                	lw	t4,60(sp)
1c00832e:	4f06                	lw	t5,64(sp)
1c008330:	4fb6                	lw	t6,76(sp)
1c008332:	6109                	addi	sp,sp,128
1c008334:	8482                	jr	s1

1c008336 <main>:
1c008336:	2b7e1737          	lui	a4,0x2b7e1
1c00833a:	715d                	addi	sp,sp,-80
1c00833c:	51670713          	addi	a4,a4,1302 # 2b7e1516 <__l2_shared_end+0xf7d142a>
1c008340:	c83a                	sw	a4,16(sp)
1c008342:	28aed737          	lui	a4,0x28aed
1c008346:	2a670713          	addi	a4,a4,678 # 28aed2a6 <__l2_shared_end+0xcadd1ba>
1c00834a:	ca3a                	sw	a4,20(sp)
1c00834c:	abf71737          	lui	a4,0xabf71
1c008350:	58870713          	addi	a4,a4,1416 # abf71588 <pulp__FC+0xabf71589>
1c008354:	cc3a                	sw	a4,24(sp)
1c008356:	09cf5737          	lui	a4,0x9cf5
1c00835a:	f3c70713          	addi	a4,a4,-196 # 9cf4f3c <__rt_sched+0x9cf4c30>
1c00835e:	ce3a                	sw	a4,28(sp)
1c008360:	3ad78737          	lui	a4,0x3ad78
1c008364:	bb470713          	addi	a4,a4,-1100 # 3ad77bb4 <__l2_shared_end+0x1ed67ac8>
1c008368:	d03a                	sw	a4,32(sp)
1c00836a:	0d7a3737          	lui	a4,0xd7a3
1c00836e:	66070713          	addi	a4,a4,1632 # d7a3660 <__rt_sched+0xd7a3354>
1c008372:	d23a                	sw	a4,36(sp)
1c008374:	a89ed737          	lui	a4,0xa89ed
1c008378:	af370713          	addi	a4,a4,-1293 # a89ecaf3 <pulp__FC+0xa89ecaf4>
1c00837c:	d43a                	sw	a4,40(sp)
1c00837e:	2466f737          	lui	a4,0x2466f
1c008382:	f9770713          	addi	a4,a4,-105 # 2466ef97 <__l2_shared_end+0x865eeab>
1c008386:	d63a                	sw	a4,44(sp)
1c008388:	6bc1c737          	lui	a4,0x6bc1c
1c00838c:	ee270713          	addi	a4,a4,-286 # 6bc1bee2 <__l2_shared_end+0x4fc0bdf6>
1c008390:	d83a                	sw	a4,48(sp)
1c008392:	2e40a737          	lui	a4,0x2e40a
1c008396:	f9670713          	addi	a4,a4,-106 # 2e409f96 <__l2_shared_end+0x123f9eaa>
1c00839a:	da3a                	sw	a4,52(sp)
1c00839c:	e93d8737          	lui	a4,0xe93d8
1c0083a0:	e1170713          	addi	a4,a4,-495 # e93d7e11 <pulp__FC+0xe93d7e12>
1c0083a4:	dc3a                	sw	a4,56(sp)
1c0083a6:	73931737          	lui	a4,0x73931
1c0083aa:	72a70713          	addi	a4,a4,1834 # 7393172a <__l2_shared_end+0x5792163e>
1c0083ae:	f14027f3          	csrr	a5,mhartid
1c0083b2:	c686                	sw	ra,76(sp)
1c0083b4:	c4a2                	sw	s0,72(sp)
1c0083b6:	de3a                	sw	a4,60(sp)
1c0083b8:	c602                	sw	zero,12(sp)
1c0083ba:	f457b7b3          	p.bclr	a5,a5,26,5
1c0083be:	12079163          	bnez	a5,1c0084e0 <main+0x1aa>
1c0083c2:	1c010637          	lui	a2,0x1c010
1c0083c6:	4681                	li	a3,0
1c0083c8:	080550fb          	lp.setupi	x1,128,1c0083dc <main+0xa6>
1c0083cc:	fa26b7b3          	p.bclr	a5,a3,29,2
1c0083d0:	078a                	slli	a5,a5,0x2
1c0083d2:	008c                	addi	a1,sp,64
1c0083d4:	97ae                	add	a5,a5,a1
1c0083d6:	ff07a783          	lw	a5,-16(a5)
1c0083da:	0685                	addi	a3,a3,1
1c0083dc:	00f6222b          	p.sw	a5,4(a2!) # 1c010004 <i2c_req>
1c0083e0:	1c010637          	lui	a2,0x1c010
1c0083e4:	20060613          	addi	a2,a2,512 # 1c010200 <__l2_shared_end+0x114>
1c0083e8:	4681                	li	a3,0
1c0083ea:	080550fb          	lp.setupi	x1,128,1c0083fe <main+0xc8>
1c0083ee:	fa26b7b3          	p.bclr	a5,a3,29,2
1c0083f2:	078a                	slli	a5,a5,0x2
1c0083f4:	008c                	addi	a1,sp,64
1c0083f6:	97ae                	add	a5,a5,a1
1c0083f8:	fd07a783          	lw	a5,-48(a5)
1c0083fc:	0685                	addi	a3,a3,1
1c0083fe:	00f6222b          	p.sw	a5,4(a2!)
1c008402:	1c010637          	lui	a2,0x1c010
1c008406:	60060613          	addi	a2,a2,1536 # 1c010600 <__l2_shared_end+0x514>
1c00840a:	4681                	li	a3,0
1c00840c:	080550fb          	lp.setupi	x1,128,1c008420 <main+0xea>
1c008410:	fa26b7b3          	p.bclr	a5,a3,29,2
1c008414:	078a                	slli	a5,a5,0x2
1c008416:	008c                	addi	a1,sp,64
1c008418:	97ae                	add	a5,a5,a1
1c00841a:	fe07a783          	lw	a5,-32(a5)
1c00841e:	0685                	addi	a3,a3,1
1c008420:	00f6222b          	p.sw	a5,4(a2!)
1c008424:	1c010737          	lui	a4,0x1c010
1c008428:	40070713          	addi	a4,a4,1024 # 1c010400 <__l2_shared_end+0x314>
1c00842c:	080250fb          	lp.setupi	x1,128,1c008434 <main+0xfe>
1c008430:	0007222b          	p.sw	zero,4(a4!)
1c008434:	0001                	nop
1c008436:	1a1067b7          	lui	a5,0x1a106
1c00843a:	07e1                	addi	a5,a5,24
1c00843c:	4394                	lw	a3,0(a5)
1c00843e:	1a10c737          	lui	a4,0x1a10c
1c008442:	c2a6c6b3          	p.bset	a3,a3,1,10
1c008446:	c394                	sw	a3,0(a5)
1c008448:	00472783          	lw	a5,4(a4) # 1a10c004 <__rt_sched+0x1a10bcf8>
1c00844c:	fe07cee3          	bltz	a5,1c008448 <main+0x112>
1c008450:	1a10c7b7          	lui	a5,0x1a10c
1c008454:	0207ac23          	sw	zero,56(a5) # 1a10c038 <__rt_sched+0x1a10bd2c>
1c008458:	00040737          	lui	a4,0x40
1c00845c:	02e7aa23          	sw	a4,52(a5)
1c008460:	0207a823          	sw	zero,48(a5)
1c008464:	0207a623          	sw	zero,44(a5)
1c008468:	0207a423          	sw	zero,40(a5)
1c00846c:	6705                	lui	a4,0x1
1c00846e:	8cd70713          	addi	a4,a4,-1843 # 8cd <__rt_sched+0x5c1>
1c008472:	02e7a223          	sw	a4,36(a5)
1c008476:	11a14737          	lui	a4,0x11a14
1c00847a:	c0570713          	addi	a4,a4,-1019 # 11a13c05 <__rt_sched+0x11a138f9>
1c00847e:	02e7a023          	sw	a4,32(a5)
1c008482:	1c010737          	lui	a4,0x1c010
1c008486:	04e7a023          	sw	a4,64(a5)
1c00848a:	20070693          	addi	a3,a4,512 # 1c010200 <__l2_shared_end+0x114>
1c00848e:	04d7a223          	sw	a3,68(a5)
1c008492:	40070713          	addi	a4,a4,1024
1c008496:	04e7a623          	sw	a4,76(a5)
1c00849a:	08000713          	li	a4,128
1c00849e:	04e7a823          	sw	a4,80(a5)
1c0084a2:	07f00713          	li	a4,127
1c0084a6:	04e7aa23          	sw	a4,84(a5)
1c0084aa:	4711                	li	a4,4
1c0084ac:	04e7ae23          	sw	a4,92(a5)
1c0084b0:	06e7a023          	sw	a4,96(a5)
1c0084b4:	4705                	li	a4,1
1c0084b6:	04e7ac23          	sw	a4,88(a5)
1c0084ba:	0007a023          	sw	zero,0(a5)
1c0084be:	1a106437          	lui	s0,0x1a106
1c0084c2:	01440713          	addi	a4,s0,20 # 1a106014 <__rt_sched+0x1a105d08>
1c0084c6:	431c                	lw	a5,0(a4)
1c0084c8:	4585                	li	a1,1
1c0084ca:	c0c7b7b3          	p.bclr	a5,a5,0,12
1c0084ce:	c31c                	sw	a5,0(a4)
1c0084d0:	08c00513          	li	a0,140
1c0084d4:	20fd                	jal	1c0085c2 <__rt_periph_wait_event>
1c0084d6:	0461                	addi	s0,s0,24
1c0084d8:	401c                	lw	a5,0(s0)
1c0084da:	c2a7b7b3          	p.bclr	a5,a5,1,10
1c0084de:	c01c                	sw	a5,0(s0)
1c0084e0:	40b6                	lw	ra,76(sp)
1c0084e2:	4426                	lw	s0,72(sp)
1c0084e4:	4532                	lw	a0,12(sp)
1c0084e6:	6161                	addi	sp,sp,80
1c0084e8:	8082                	ret

1c0084ea <rt_periph_copy>:
1c0084ea:	1101                	addi	sp,sp,-32
1c0084ec:	cc22                	sw	s0,24(sp)
1c0084ee:	ca26                	sw	s1,20(sp)
1c0084f0:	ce06                	sw	ra,28(sp)
1c0084f2:	c84a                	sw	s2,16(sp)
1c0084f4:	842a                	mv	s0,a0
1c0084f6:	84ae                	mv	s1,a1
1c0084f8:	30047973          	csrrci	s2,mstatus,8
1c0084fc:	853e                	mv	a0,a5
1c0084fe:	eb91                	bnez	a5,1c008512 <rt_periph_copy+0x28>
1c008500:	c632                	sw	a2,12(sp)
1c008502:	c436                	sw	a3,8(sp)
1c008504:	c23a                	sw	a4,4(sp)
1c008506:	c03e                	sw	a5,0(sp)
1c008508:	2d4d                	jal	1c008bba <__rt_wait_event_prepare_blocking>
1c00850a:	4782                	lw	a5,0(sp)
1c00850c:	4712                	lw	a4,4(sp)
1c00850e:	46a2                	lw	a3,8(sp)
1c008510:	4632                	lw	a2,12(sp)
1c008512:	e419                	bnez	s0,1c008520 <rt_periph_copy+0x36>
1c008514:	03450413          	addi	s0,a0,52
1c008518:	04052023          	sw	zero,64(a0)
1c00851c:	04052823          	sw	zero,80(a0)
1c008520:	444c                	lw	a1,12(s0)
1c008522:	c054                	sw	a3,4(s0)
1c008524:	cc08                	sw	a0,24(s0)
1c008526:	f645b5b3          	p.bclr	a1,a1,27,4
1c00852a:	4811                	li	a6,4
1c00852c:	06b86263          	bltu	a6,a1,1c008590 <rt_periph_copy+0xa6>
1c008530:	00400593          	li	a1,4
1c008534:	00549313          	slli	t1,s1,0x5
1c008538:	959a                	add	a1,a1,t1
1c00853a:	0005a803          	lw	a6,0(a1)
1c00853e:	00042a23          	sw	zero,20(s0)
1c008542:	00400893          	li	a7,4
1c008546:	06081063          	bnez	a6,1c0085a6 <rt_periph_copy+0xbc>
1c00854a:	c180                	sw	s0,0(a1)
1c00854c:	006885b3          	add	a1,a7,t1
1c008550:	0085ae03          	lw	t3,8(a1)
1c008554:	c1c0                	sw	s0,4(a1)
1c008556:	c0474733          	p.bset	a4,a4,0,4
1c00855a:	040e1963          	bnez	t3,1c0085ac <rt_periph_copy+0xc2>
1c00855e:	4014d813          	srai	a6,s1,0x1
1c008562:	1a1025b7          	lui	a1,0x1a102
1c008566:	08058593          	addi	a1,a1,128 # 1a102080 <__rt_sched+0x1a101d74>
1c00856a:	081e                	slli	a6,a6,0x7
1c00856c:	982e                	add	a6,a6,a1
1c00856e:	00449593          	slli	a1,s1,0x4
1c008572:	89c1                	andi	a1,a1,16
1c008574:	95c2                	add	a1,a1,a6
1c008576:	00858e93          	addi	t4,a1,8
1c00857a:	000ea803          	lw	a6,0(t4)
1c00857e:	02087813          	andi	a6,a6,32
1c008582:	02081563          	bnez	a6,1c0085ac <rt_periph_copy+0xc2>
1c008586:	00c5a22b          	p.sw	a2,4(a1!)
1c00858a:	c194                	sw	a3,0(a1)
1c00858c:	00eea023          	sw	a4,0(t4)
1c008590:	e399                	bnez	a5,1c008596 <rt_periph_copy+0xac>
1c008592:	752000ef          	jal	ra,1c008ce4 <__rt_wait_event>
1c008596:	30091073          	csrw	mstatus,s2
1c00859a:	40f2                	lw	ra,28(sp)
1c00859c:	4462                	lw	s0,24(sp)
1c00859e:	44d2                	lw	s1,20(sp)
1c0085a0:	4942                	lw	s2,16(sp)
1c0085a2:	6105                	addi	sp,sp,32
1c0085a4:	8082                	ret
1c0085a6:	41cc                	lw	a1,4(a1)
1c0085a8:	c9c0                	sw	s0,20(a1)
1c0085aa:	b74d                	j	1c00854c <rt_periph_copy+0x62>
1c0085ac:	00042823          	sw	zero,16(s0)
1c0085b0:	c010                	sw	a2,0(s0)
1c0085b2:	c054                	sw	a3,4(s0)
1c0085b4:	c418                	sw	a4,8(s0)
1c0085b6:	fc0e1de3          	bnez	t3,1c008590 <rt_periph_copy+0xa6>
1c0085ba:	989a                	add	a7,a7,t1
1c0085bc:	0088a423          	sw	s0,8(a7)
1c0085c0:	bfc1                	j	1c008590 <rt_periph_copy+0xa6>

1c0085c2 <__rt_periph_wait_event>:
1c0085c2:	30047673          	csrrci	a2,mstatus,8
1c0085c6:	40555793          	srai	a5,a0,0x5
1c0085ca:	00279713          	slli	a4,a5,0x2
1c0085ce:	f4553533          	p.bclr	a0,a0,26,5
1c0085d2:	4685                	li	a3,1
1c0085d4:	00400793          	li	a5,4
1c0085d8:	00a696b3          	sll	a3,a3,a0
1c0085dc:	97ba                	add	a5,a5,a4
1c0085de:	2807a703          	lw	a4,640(a5)
1c0085e2:	8f75                	and	a4,a4,a3
1c0085e4:	cf19                	beqz	a4,1c008602 <__rt_periph_wait_event+0x40>
1c0085e6:	c999                	beqz	a1,1c0085fc <__rt_periph_wait_event+0x3a>
1c0085e8:	4705                	li	a4,1
1c0085ea:	2807a683          	lw	a3,640(a5)
1c0085ee:	00a71733          	sll	a4,a4,a0
1c0085f2:	fff74713          	not	a4,a4
1c0085f6:	8f75                	and	a4,a4,a3
1c0085f8:	28e7a023          	sw	a4,640(a5)
1c0085fc:	30061073          	csrw	mstatus,a2
1c008600:	8082                	ret
1c008602:	10500073          	wfi
1c008606:	30046773          	csrrsi	a4,mstatus,8
1c00860a:	30047773          	csrrci	a4,mstatus,8
1c00860e:	bfc1                	j	1c0085de <__rt_periph_wait_event+0x1c>

1c008610 <__rt_periph_init>:
1c008610:	00400693          	li	a3,4
1c008614:	1c008637          	lui	a2,0x1c008
1c008618:	2a068693          	addi	a3,a3,672
1c00861c:	00400713          	li	a4,4
1c008620:	15a60613          	addi	a2,a2,346 # 1c00815a <udma_event_handler>
1c008624:	00a250fb          	lp.setupi	x1,10,1c00862c <__rt_periph_init+0x1c>
1c008628:	00c6a22b          	p.sw	a2,4(a3!)
1c00862c:	0001                	nop
1c00862e:	28072023          	sw	zero,640(a4)
1c008632:	28072223          	sw	zero,644(a4)
1c008636:	28072423          	sw	zero,648(a4)
1c00863a:	28072623          	sw	zero,652(a4)
1c00863e:	28072823          	sw	zero,656(a4)
1c008642:	28072a23          	sw	zero,660(a4)
1c008646:	28072c23          	sw	zero,664(a4)
1c00864a:	1a102837          	lui	a6,0x1a102
1c00864e:	28072e23          	sw	zero,668(a4)
1c008652:	00400793          	li	a5,4
1c008656:	4681                	li	a3,0
1c008658:	08080813          	addi	a6,a6,128 # 1a102080 <__rt_sched+0x1a101d74>
1c00865c:	0148d0fb          	lp.setupi	x1,20,1c00867e <__rt_periph_init+0x6e>
1c008660:	4016d713          	srai	a4,a3,0x1
1c008664:	00469513          	slli	a0,a3,0x4
1c008668:	071e                	slli	a4,a4,0x7
1c00866a:	9742                	add	a4,a4,a6
1c00866c:	8941                	andi	a0,a0,16
1c00866e:	972a                	add	a4,a4,a0
1c008670:	0007a023          	sw	zero,0(a5)
1c008674:	0007a423          	sw	zero,8(a5)
1c008678:	c7d8                	sw	a4,12(a5)
1c00867a:	cfd0                	sw	a2,28(a5)
1c00867c:	0685                	addi	a3,a3,1
1c00867e:	02078793          	addi	a5,a5,32
1c008682:	8082                	ret

1c008684 <__rt_himax_init>:
1c008684:	1c0017b7          	lui	a5,0x1c001
1c008688:	cc078023          	sb	zero,-832(a5) # 1c000cc0 <stack>
1c00868c:	8082                	ret

1c00868e <__rt_init>:
1c00868e:	1141                	addi	sp,sp,-16
1c008690:	c606                	sw	ra,12(sp)
1c008692:	c422                	sw	s0,8(sp)
1c008694:	2ef1                	jal	1c008a70 <__rt_bridge_set_available>
1c008696:	1c0017b7          	lui	a5,0x1c001
1c00869a:	db47a783          	lw	a5,-588(a5) # 1c000db4 <__rt_platform>
1c00869e:	0237b263          	p.bneimm	a5,3,1c0086c2 <__rt_init+0x34>
1c0086a2:	7d005073          	csrwi	0x7d0,0
1c0086a6:	1c0007b7          	lui	a5,0x1c000
1c0086aa:	4c078793          	addi	a5,a5,1216 # 1c0004c0 <stack_start>
1c0086ae:	7d179073          	csrw	0x7d1,a5
1c0086b2:	1c0017b7          	lui	a5,0x1c001
1c0086b6:	cc078793          	addi	a5,a5,-832 # 1c000cc0 <stack>
1c0086ba:	7d279073          	csrw	0x7d2,a5
1c0086be:	7d00d073          	csrwi	0x7d0,1
1c0086c2:	2a85                	jal	1c008832 <__rt_irq_init>
1c0086c4:	1a1067b7          	lui	a5,0x1a106
1c0086c8:	577d                	li	a4,-1
1c0086ca:	00478693          	addi	a3,a5,4 # 1a106004 <__rt_sched+0x1a105cf8>
1c0086ce:	c298                	sw	a4,0(a3)
1c0086d0:	00878693          	addi	a3,a5,8
1c0086d4:	c298                	sw	a4,0(a3)
1c0086d6:	00c78693          	addi	a3,a5,12
1c0086da:	c298                	sw	a4,0(a3)
1c0086dc:	01078693          	addi	a3,a5,16
1c0086e0:	c298                	sw	a4,0(a3)
1c0086e2:	01478693          	addi	a3,a5,20
1c0086e6:	c298                	sw	a4,0(a3)
1c0086e8:	01878693          	addi	a3,a5,24
1c0086ec:	c298                	sw	a4,0(a3)
1c0086ee:	01c78693          	addi	a3,a5,28
1c0086f2:	c298                	sw	a4,0(a3)
1c0086f4:	02078793          	addi	a5,a5,32
1c0086f8:	1c0085b7          	lui	a1,0x1c008
1c0086fc:	23a58593          	addi	a1,a1,570 # 1c00823a <__rt_fc_socevents_handler>
1c008700:	4569                	li	a0,26
1c008702:	c398                	sw	a4,0(a5)
1c008704:	2851                	jal	1c008798 <rt_irq_set_handler>
1c008706:	1a10a7b7          	lui	a5,0x1a10a
1c00870a:	04000737          	lui	a4,0x4000
1c00870e:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__rt_sched+0x1a1094f8>
1c008712:	1c000437          	lui	s0,0x1c000
1c008716:	15b000ef          	jal	ra,1c009070 <__rt_freq_init>
1c00871a:	32840413          	addi	s0,s0,808 # 1c000328 <ctor_list+0x4>
1c00871e:	2275                	jal	1c0088ca <__rt_utils_init>
1c008720:	25c1                	jal	1c008de0 <__rt_allocs_init>
1c008722:	2511                	jal	1c008d26 <__rt_event_sched_init>
1c008724:	1c9000ef          	jal	ra,1c0090ec <__rt_padframe_init>
1c008728:	0044278b          	p.lw	a5,4(s0!)
1c00872c:	e795                	bnez	a5,1c008758 <__rt_init+0xca>
1c00872e:	300467f3          	csrrsi	a5,mstatus,8
1c008732:	4501                	li	a0,0
1c008734:	229d                	jal	1c00889a <__rt_cbsys_exec>
1c008736:	c11d                	beqz	a0,1c00875c <__rt_init+0xce>
1c008738:	f1402673          	csrr	a2,mhartid
1c00873c:	1c000537          	lui	a0,0x1c000
1c008740:	40565593          	srai	a1,a2,0x5
1c008744:	f265b5b3          	p.bclr	a1,a1,25,6
1c008748:	f4563633          	p.bclr	a2,a2,26,5
1c00874c:	36050513          	addi	a0,a0,864 # 1c000360 <__DTOR_END__+0x8>
1c008750:	008010ef          	jal	ra,1c009758 <printf>
1c008754:	771000ef          	jal	ra,1c0096c4 <abort>
1c008758:	9782                	jalr	a5
1c00875a:	b7f9                	j	1c008728 <__rt_init+0x9a>
1c00875c:	40b2                	lw	ra,12(sp)
1c00875e:	4422                	lw	s0,8(sp)
1c008760:	0141                	addi	sp,sp,16
1c008762:	8082                	ret

1c008764 <__rt_deinit>:
1c008764:	1c0017b7          	lui	a5,0x1c001
1c008768:	1141                	addi	sp,sp,-16
1c00876a:	db47a783          	lw	a5,-588(a5) # 1c000db4 <__rt_platform>
1c00876e:	c606                	sw	ra,12(sp)
1c008770:	c422                	sw	s0,8(sp)
1c008772:	0037b463          	p.bneimm	a5,3,1c00877a <__rt_deinit+0x16>
1c008776:	7d005073          	csrwi	0x7d0,0
1c00877a:	4505                	li	a0,1
1c00877c:	1c000437          	lui	s0,0x1c000
1c008780:	2a29                	jal	1c00889a <__rt_cbsys_exec>
1c008782:	35440413          	addi	s0,s0,852 # 1c000354 <dtor_list+0x4>
1c008786:	0044278b          	p.lw	a5,4(s0!)
1c00878a:	e789                	bnez	a5,1c008794 <__rt_deinit+0x30>
1c00878c:	40b2                	lw	ra,12(sp)
1c00878e:	4422                	lw	s0,8(sp)
1c008790:	0141                	addi	sp,sp,16
1c008792:	8082                	ret
1c008794:	9782                	jalr	a5
1c008796:	bfc5                	j	1c008786 <__rt_deinit+0x22>

1c008798 <rt_irq_set_handler>:
1c008798:	f14027f3          	csrr	a5,mhartid
1c00879c:	46fd                	li	a3,31
1c00879e:	ca5797b3          	p.extractu	a5,a5,5,5
1c0087a2:	4701                	li	a4,0
1c0087a4:	00d79663          	bne	a5,a3,1c0087b0 <rt_irq_set_handler+0x18>
1c0087a8:	30502773          	csrr	a4,mtvec
1c0087ac:	c0073733          	p.bclr	a4,a4,0,0
1c0087b0:	050a                	slli	a0,a0,0x2
1c0087b2:	8d89                	sub	a1,a1,a0
1c0087b4:	8d99                	sub	a1,a1,a4
1c0087b6:	c14586b3          	p.extract	a3,a1,0,20
1c0087ba:	06f00793          	li	a5,111
1c0087be:	c1f6a7b3          	p.insert	a5,a3,0,31
1c0087c2:	d21586b3          	p.extract	a3,a1,9,1
1c0087c6:	d356a7b3          	p.insert	a5,a3,9,21
1c0087ca:	c0b586b3          	p.extract	a3,a1,0,11
1c0087ce:	c146a7b3          	p.insert	a5,a3,0,20
1c0087d2:	cec585b3          	p.extract	a1,a1,7,12
1c0087d6:	cec5a7b3          	p.insert	a5,a1,7,12
1c0087da:	00f56723          	p.sw	a5,a4(a0)
1c0087de:	8082                	ret

1c0087e0 <illegal_insn_handler_c>:
1c0087e0:	8082                	ret

1c0087e2 <__rt_handle_illegal_instr>:
1c0087e2:	1141                	addi	sp,sp,-16
1c0087e4:	c606                	sw	ra,12(sp)
1c0087e6:	c422                	sw	s0,8(sp)
1c0087e8:	341026f3          	csrr	a3,mepc
1c0087ec:	1c0017b7          	lui	a5,0x1c001
1c0087f0:	cc87a703          	lw	a4,-824(a5) # 1c000cc8 <__rt_debug_config>
1c0087f4:	843e                	mv	s0,a5
1c0087f6:	fc173733          	p.bclr	a4,a4,30,1
1c0087fa:	c305                	beqz	a4,1c00881a <__rt_handle_illegal_instr+0x38>
1c0087fc:	f1402673          	csrr	a2,mhartid
1c008800:	1c000537          	lui	a0,0x1c000
1c008804:	40565593          	srai	a1,a2,0x5
1c008808:	4298                	lw	a4,0(a3)
1c00880a:	f4563633          	p.bclr	a2,a2,26,5
1c00880e:	f265b5b3          	p.bclr	a1,a1,25,6
1c008812:	3b850513          	addi	a0,a0,952 # 1c0003b8 <__DTOR_END__+0x60>
1c008816:	743000ef          	jal	ra,1c009758 <printf>
1c00881a:	cc842783          	lw	a5,-824(s0)
1c00881e:	c01797b3          	p.extractu	a5,a5,0,1
1c008822:	c399                	beqz	a5,1c008828 <__rt_handle_illegal_instr+0x46>
1c008824:	6a1000ef          	jal	ra,1c0096c4 <abort>
1c008828:	4422                	lw	s0,8(sp)
1c00882a:	40b2                	lw	ra,12(sp)
1c00882c:	0141                	addi	sp,sp,16
1c00882e:	fb3ff06f          	j	1c0087e0 <illegal_insn_handler_c>

1c008832 <__rt_irq_init>:
1c008832:	1a10a7b7          	lui	a5,0x1a10a
1c008836:	577d                	li	a4,-1
1c008838:	80e7a423          	sw	a4,-2040(a5) # 1a109808 <__rt_sched+0x1a1094fc>
1c00883c:	f14027f3          	csrr	a5,mhartid
1c008840:	477d                	li	a4,31
1c008842:	ca5797b3          	p.extractu	a5,a5,5,5
1c008846:	00e79a63          	bne	a5,a4,1c00885a <__rt_irq_init+0x28>
1c00884a:	1c0087b7          	lui	a5,0x1c008
1c00884e:	00078793          	mv	a5,a5
1c008852:	c007c7b3          	p.bset	a5,a5,0,0
1c008856:	30579073          	csrw	mtvec,a5
1c00885a:	8082                	ret

1c00885c <__rt_cbsys_add>:
1c00885c:	1101                	addi	sp,sp,-32
1c00885e:	cc22                	sw	s0,24(sp)
1c008860:	ca26                	sw	s1,20(sp)
1c008862:	842a                	mv	s0,a0
1c008864:	84ae                	mv	s1,a1
1c008866:	4501                	li	a0,0
1c008868:	45b1                	li	a1,12
1c00886a:	c632                	sw	a2,12(sp)
1c00886c:	ce06                	sw	ra,28(sp)
1c00886e:	2b0d                	jal	1c008da0 <rt_alloc>
1c008870:	4632                	lw	a2,12(sp)
1c008872:	c115                	beqz	a0,1c008896 <__rt_cbsys_add+0x3a>
1c008874:	1c0017b7          	lui	a5,0x1c001
1c008878:	040a                	slli	s0,s0,0x2
1c00887a:	ccc78793          	addi	a5,a5,-820 # 1c000ccc <cbsys_first>
1c00887e:	97a2                	add	a5,a5,s0
1c008880:	4398                	lw	a4,0(a5)
1c008882:	c104                	sw	s1,0(a0)
1c008884:	c150                	sw	a2,4(a0)
1c008886:	c518                	sw	a4,8(a0)
1c008888:	c388                	sw	a0,0(a5)
1c00888a:	4501                	li	a0,0
1c00888c:	40f2                	lw	ra,28(sp)
1c00888e:	4462                	lw	s0,24(sp)
1c008890:	44d2                	lw	s1,20(sp)
1c008892:	6105                	addi	sp,sp,32
1c008894:	8082                	ret
1c008896:	557d                	li	a0,-1
1c008898:	bfd5                	j	1c00888c <__rt_cbsys_add+0x30>

1c00889a <__rt_cbsys_exec>:
1c00889a:	1141                	addi	sp,sp,-16
1c00889c:	c422                	sw	s0,8(sp)
1c00889e:	1c001437          	lui	s0,0x1c001
1c0088a2:	050a                	slli	a0,a0,0x2
1c0088a4:	ccc40413          	addi	s0,s0,-820 # 1c000ccc <cbsys_first>
1c0088a8:	20a47403          	p.lw	s0,a0(s0)
1c0088ac:	c606                	sw	ra,12(sp)
1c0088ae:	e411                	bnez	s0,1c0088ba <__rt_cbsys_exec+0x20>
1c0088b0:	4501                	li	a0,0
1c0088b2:	40b2                	lw	ra,12(sp)
1c0088b4:	4422                	lw	s0,8(sp)
1c0088b6:	0141                	addi	sp,sp,16
1c0088b8:	8082                	ret
1c0088ba:	401c                	lw	a5,0(s0)
1c0088bc:	4048                	lw	a0,4(s0)
1c0088be:	9782                	jalr	a5
1c0088c0:	e119                	bnez	a0,1c0088c6 <__rt_cbsys_exec+0x2c>
1c0088c2:	4400                	lw	s0,8(s0)
1c0088c4:	b7ed                	j	1c0088ae <__rt_cbsys_exec+0x14>
1c0088c6:	557d                	li	a0,-1
1c0088c8:	b7ed                	j	1c0088b2 <__rt_cbsys_exec+0x18>

1c0088ca <__rt_utils_init>:
1c0088ca:	1c0017b7          	lui	a5,0x1c001
1c0088ce:	ccc78793          	addi	a5,a5,-820 # 1c000ccc <cbsys_first>
1c0088d2:	0007a023          	sw	zero,0(a5)
1c0088d6:	0007a223          	sw	zero,4(a5)
1c0088da:	0007a423          	sw	zero,8(a5)
1c0088de:	0007a623          	sw	zero,12(a5)
1c0088e2:	0007a823          	sw	zero,16(a5)
1c0088e6:	0007aa23          	sw	zero,20(a5)
1c0088ea:	8082                	ret

1c0088ec <__rt_fc_lock>:
1c0088ec:	1141                	addi	sp,sp,-16
1c0088ee:	c422                	sw	s0,8(sp)
1c0088f0:	c606                	sw	ra,12(sp)
1c0088f2:	c226                	sw	s1,4(sp)
1c0088f4:	842a                	mv	s0,a0
1c0088f6:	300474f3          	csrrci	s1,mstatus,8
1c0088fa:	401c                	lw	a5,0(s0)
1c0088fc:	eb91                	bnez	a5,1c008910 <__rt_fc_lock+0x24>
1c0088fe:	4785                	li	a5,1
1c008900:	c01c                	sw	a5,0(s0)
1c008902:	30049073          	csrw	mstatus,s1
1c008906:	40b2                	lw	ra,12(sp)
1c008908:	4422                	lw	s0,8(sp)
1c00890a:	4492                	lw	s1,4(sp)
1c00890c:	0141                	addi	sp,sp,16
1c00890e:	8082                	ret
1c008910:	4585                	li	a1,1
1c008912:	e3ff8517          	auipc	a0,0xe3ff8
1c008916:	9fa50513          	addi	a0,a0,-1542 # 30c <__rt_sched>
1c00891a:	26ad                	jal	1c008c84 <__rt_event_execute>
1c00891c:	bff9                	j	1c0088fa <__rt_fc_lock+0xe>

1c00891e <__rt_fc_unlock>:
1c00891e:	300477f3          	csrrci	a5,mstatus,8
1c008922:	00052023          	sw	zero,0(a0)
1c008926:	30079073          	csrw	mstatus,a5
1c00892a:	8082                	ret

1c00892c <__rt_event_enqueue>:
1c00892c:	30c02783          	lw	a5,780(zero) # 30c <__rt_sched>
1c008930:	00052c23          	sw	zero,24(a0)
1c008934:	c799                	beqz	a5,1c008942 <__rt_event_enqueue+0x16>
1c008936:	31002783          	lw	a5,784(zero) # 310 <__rt_sched+0x4>
1c00893a:	cf88                	sw	a0,24(a5)
1c00893c:	30a02823          	sw	a0,784(zero) # 310 <__rt_sched+0x4>
1c008940:	8082                	ret
1c008942:	30a02623          	sw	a0,780(zero) # 30c <__rt_sched>
1c008946:	bfdd                	j	1c00893c <__rt_event_enqueue+0x10>

1c008948 <__rt_bridge_check_bridge_req.part.5>:
1c008948:	1c001737          	lui	a4,0x1c001
1c00894c:	cf470793          	addi	a5,a4,-780 # 1c000cf4 <__hal_debug_struct>
1c008950:	0a47a783          	lw	a5,164(a5)
1c008954:	cf470713          	addi	a4,a4,-780
1c008958:	c789                	beqz	a5,1c008962 <__rt_bridge_check_bridge_req.part.5+0x1a>
1c00895a:	4f94                	lw	a3,24(a5)
1c00895c:	e681                	bnez	a3,1c008964 <__rt_bridge_check_bridge_req.part.5+0x1c>
1c00895e:	0af72623          	sw	a5,172(a4)
1c008962:	8082                	ret
1c008964:	479c                	lw	a5,8(a5)
1c008966:	bfcd                	j	1c008958 <__rt_bridge_check_bridge_req.part.5+0x10>

1c008968 <__rt_bridge_wait>:
1c008968:	f14027f3          	csrr	a5,mhartid
1c00896c:	477d                	li	a4,31
1c00896e:	ca5797b3          	p.extractu	a5,a5,5,5
1c008972:	02e79f63          	bne	a5,a4,1c0089b0 <__rt_bridge_wait+0x48>
1c008976:	1a10a7b7          	lui	a5,0x1a10a
1c00897a:	80c78513          	addi	a0,a5,-2036 # 1a10980c <__rt_sched+0x1a109500>
1c00897e:	6711                	lui	a4,0x4
1c008980:	80478593          	addi	a1,a5,-2044
1c008984:	80878613          	addi	a2,a5,-2040
1c008988:	300476f3          	csrrci	a3,mstatus,8
1c00898c:	00052803          	lw	a6,0(a0)
1c008990:	01181893          	slli	a7,a6,0x11
1c008994:	0008c963          	bltz	a7,1c0089a6 <__rt_bridge_wait+0x3e>
1c008998:	c198                	sw	a4,0(a1)
1c00899a:	10500073          	wfi
1c00899e:	c218                	sw	a4,0(a2)
1c0089a0:	30069073          	csrw	mstatus,a3
1c0089a4:	b7d5                	j	1c008988 <__rt_bridge_wait+0x20>
1c0089a6:	81478793          	addi	a5,a5,-2028
1c0089aa:	c398                	sw	a4,0(a5)
1c0089ac:	30069073          	csrw	mstatus,a3
1c0089b0:	8082                	ret

1c0089b2 <__rt_bridge_handle_notif>:
1c0089b2:	1141                	addi	sp,sp,-16
1c0089b4:	c422                	sw	s0,8(sp)
1c0089b6:	1c001437          	lui	s0,0x1c001
1c0089ba:	cf440793          	addi	a5,s0,-780 # 1c000cf4 <__hal_debug_struct>
1c0089be:	0a47a783          	lw	a5,164(a5)
1c0089c2:	c606                	sw	ra,12(sp)
1c0089c4:	c226                	sw	s1,4(sp)
1c0089c6:	c04a                	sw	s2,0(sp)
1c0089c8:	cf440413          	addi	s0,s0,-780
1c0089cc:	c399                	beqz	a5,1c0089d2 <__rt_bridge_handle_notif+0x20>
1c0089ce:	4bd8                	lw	a4,20(a5)
1c0089d0:	e30d                	bnez	a4,1c0089f2 <__rt_bridge_handle_notif+0x40>
1c0089d2:	0b442783          	lw	a5,180(s0)
1c0089d6:	c789                	beqz	a5,1c0089e0 <__rt_bridge_handle_notif+0x2e>
1c0089d8:	43a8                	lw	a0,64(a5)
1c0089da:	0a042a23          	sw	zero,180(s0)
1c0089de:	37b9                	jal	1c00892c <__rt_event_enqueue>
1c0089e0:	0ac42783          	lw	a5,172(s0)
1c0089e4:	eb9d                	bnez	a5,1c008a1a <__rt_bridge_handle_notif+0x68>
1c0089e6:	4422                	lw	s0,8(sp)
1c0089e8:	40b2                	lw	ra,12(sp)
1c0089ea:	4492                	lw	s1,4(sp)
1c0089ec:	4902                	lw	s2,0(sp)
1c0089ee:	0141                	addi	sp,sp,16
1c0089f0:	bfa1                	j	1c008948 <__rt_bridge_check_bridge_req.part.5>
1c0089f2:	0087a903          	lw	s2,8(a5)
1c0089f6:	4fd8                	lw	a4,28(a5)
1c0089f8:	0b242223          	sw	s2,164(s0)
1c0089fc:	cb01                	beqz	a4,1c008a0c <__rt_bridge_handle_notif+0x5a>
1c0089fe:	0b042703          	lw	a4,176(s0)
1c008a02:	c798                	sw	a4,8(a5)
1c008a04:	0af42823          	sw	a5,176(s0)
1c008a08:	87ca                	mv	a5,s2
1c008a0a:	b7c9                	j	1c0089cc <__rt_bridge_handle_notif+0x1a>
1c008a0c:	43a8                	lw	a0,64(a5)
1c008a0e:	300474f3          	csrrci	s1,mstatus,8
1c008a12:	3f29                	jal	1c00892c <__rt_event_enqueue>
1c008a14:	30049073          	csrw	mstatus,s1
1c008a18:	bfc5                	j	1c008a08 <__rt_bridge_handle_notif+0x56>
1c008a1a:	40b2                	lw	ra,12(sp)
1c008a1c:	4422                	lw	s0,8(sp)
1c008a1e:	4492                	lw	s1,4(sp)
1c008a20:	4902                	lw	s2,0(sp)
1c008a22:	0141                	addi	sp,sp,16
1c008a24:	8082                	ret

1c008a26 <__rt_bridge_check_connection>:
1c008a26:	1c0016b7          	lui	a3,0x1c001
1c008a2a:	cf468693          	addi	a3,a3,-780 # 1c000cf4 <__hal_debug_struct>
1c008a2e:	469c                	lw	a5,8(a3)
1c008a30:	ef9d                	bnez	a5,1c008a6e <__rt_bridge_check_connection+0x48>
1c008a32:	1a1047b7          	lui	a5,0x1a104
1c008a36:	07478793          	addi	a5,a5,116 # 1a104074 <__rt_sched+0x1a103d68>
1c008a3a:	4398                	lw	a4,0(a5)
1c008a3c:	8325                	srli	a4,a4,0x9
1c008a3e:	f8373733          	p.bclr	a4,a4,28,3
1c008a42:	02773663          	p.bneimm	a4,7,1c008a6e <__rt_bridge_check_connection+0x48>
1c008a46:	1141                	addi	sp,sp,-16
1c008a48:	c422                	sw	s0,8(sp)
1c008a4a:	c606                	sw	ra,12(sp)
1c008a4c:	4705                	li	a4,1
1c008a4e:	c698                	sw	a4,8(a3)
1c008a50:	4709                	li	a4,2
1c008a52:	c398                	sw	a4,0(a5)
1c008a54:	843e                	mv	s0,a5
1c008a56:	401c                	lw	a5,0(s0)
1c008a58:	83a5                	srli	a5,a5,0x9
1c008a5a:	f837b7b3          	p.bclr	a5,a5,28,3
1c008a5e:	0077a663          	p.beqimm	a5,7,1c008a6a <__rt_bridge_check_connection+0x44>
1c008a62:	40b2                	lw	ra,12(sp)
1c008a64:	4422                	lw	s0,8(sp)
1c008a66:	0141                	addi	sp,sp,16
1c008a68:	8082                	ret
1c008a6a:	3dfd                	jal	1c008968 <__rt_bridge_wait>
1c008a6c:	b7ed                	j	1c008a56 <__rt_bridge_check_connection+0x30>
1c008a6e:	8082                	ret

1c008a70 <__rt_bridge_set_available>:
1c008a70:	1c0017b7          	lui	a5,0x1c001
1c008a74:	cf478793          	addi	a5,a5,-780 # 1c000cf4 <__hal_debug_struct>
1c008a78:	4798                	lw	a4,8(a5)
1c008a7a:	1a1047b7          	lui	a5,0x1a104
1c008a7e:	07478793          	addi	a5,a5,116 # 1a104074 <__rt_sched+0x1a103d68>
1c008a82:	e701                	bnez	a4,1c008a8a <__rt_bridge_set_available+0x1a>
1c008a84:	4721                	li	a4,8
1c008a86:	c398                	sw	a4,0(a5)
1c008a88:	8082                	ret
1c008a8a:	4709                	li	a4,2
1c008a8c:	bfed                	j	1c008a86 <__rt_bridge_set_available+0x16>

1c008a8e <__rt_bridge_send_notif>:
1c008a8e:	1141                	addi	sp,sp,-16
1c008a90:	c606                	sw	ra,12(sp)
1c008a92:	3f51                	jal	1c008a26 <__rt_bridge_check_connection>
1c008a94:	1c0017b7          	lui	a5,0x1c001
1c008a98:	cf478793          	addi	a5,a5,-780 # 1c000cf4 <__hal_debug_struct>
1c008a9c:	479c                	lw	a5,8(a5)
1c008a9e:	c789                	beqz	a5,1c008aa8 <__rt_bridge_send_notif+0x1a>
1c008aa0:	1a1047b7          	lui	a5,0x1a104
1c008aa4:	4719                	li	a4,6
1c008aa6:	dbf8                	sw	a4,116(a5)
1c008aa8:	40b2                	lw	ra,12(sp)
1c008aaa:	0141                	addi	sp,sp,16
1c008aac:	8082                	ret

1c008aae <__rt_bridge_clear_notif>:
1c008aae:	1141                	addi	sp,sp,-16
1c008ab0:	c606                	sw	ra,12(sp)
1c008ab2:	3f95                	jal	1c008a26 <__rt_bridge_check_connection>
1c008ab4:	1c0017b7          	lui	a5,0x1c001
1c008ab8:	cf478793          	addi	a5,a5,-780 # 1c000cf4 <__hal_debug_struct>
1c008abc:	479c                	lw	a5,8(a5)
1c008abe:	c781                	beqz	a5,1c008ac6 <__rt_bridge_clear_notif+0x18>
1c008ac0:	40b2                	lw	ra,12(sp)
1c008ac2:	0141                	addi	sp,sp,16
1c008ac4:	b775                	j	1c008a70 <__rt_bridge_set_available>
1c008ac6:	40b2                	lw	ra,12(sp)
1c008ac8:	0141                	addi	sp,sp,16
1c008aca:	8082                	ret

1c008acc <__rt_bridge_printf_flush>:
1c008acc:	1141                	addi	sp,sp,-16
1c008ace:	c422                	sw	s0,8(sp)
1c008ad0:	c606                	sw	ra,12(sp)
1c008ad2:	1c001437          	lui	s0,0x1c001
1c008ad6:	3f81                	jal	1c008a26 <__rt_bridge_check_connection>
1c008ad8:	cf440793          	addi	a5,s0,-780 # 1c000cf4 <__hal_debug_struct>
1c008adc:	479c                	lw	a5,8(a5)
1c008ade:	c385                	beqz	a5,1c008afe <__rt_bridge_printf_flush+0x32>
1c008ae0:	cf440413          	addi	s0,s0,-780
1c008ae4:	485c                	lw	a5,20(s0)
1c008ae6:	e399                	bnez	a5,1c008aec <__rt_bridge_printf_flush+0x20>
1c008ae8:	4c1c                	lw	a5,24(s0)
1c008aea:	cb91                	beqz	a5,1c008afe <__rt_bridge_printf_flush+0x32>
1c008aec:	374d                	jal	1c008a8e <__rt_bridge_send_notif>
1c008aee:	485c                	lw	a5,20(s0)
1c008af0:	e789                	bnez	a5,1c008afa <__rt_bridge_printf_flush+0x2e>
1c008af2:	4422                	lw	s0,8(sp)
1c008af4:	40b2                	lw	ra,12(sp)
1c008af6:	0141                	addi	sp,sp,16
1c008af8:	bf5d                	j	1c008aae <__rt_bridge_clear_notif>
1c008afa:	35bd                	jal	1c008968 <__rt_bridge_wait>
1c008afc:	bfcd                	j	1c008aee <__rt_bridge_printf_flush+0x22>
1c008afe:	40b2                	lw	ra,12(sp)
1c008b00:	4422                	lw	s0,8(sp)
1c008b02:	0141                	addi	sp,sp,16
1c008b04:	8082                	ret

1c008b06 <__rt_bridge_req_shutdown>:
1c008b06:	1141                	addi	sp,sp,-16
1c008b08:	c606                	sw	ra,12(sp)
1c008b0a:	c422                	sw	s0,8(sp)
1c008b0c:	3f29                	jal	1c008a26 <__rt_bridge_check_connection>
1c008b0e:	1c0017b7          	lui	a5,0x1c001
1c008b12:	cf478793          	addi	a5,a5,-780 # 1c000cf4 <__hal_debug_struct>
1c008b16:	479c                	lw	a5,8(a5)
1c008b18:	c7a1                	beqz	a5,1c008b60 <__rt_bridge_req_shutdown+0x5a>
1c008b1a:	1a104437          	lui	s0,0x1a104
1c008b1e:	377d                	jal	1c008acc <__rt_bridge_printf_flush>
1c008b20:	07440413          	addi	s0,s0,116 # 1a104074 <__rt_sched+0x1a103d68>
1c008b24:	401c                	lw	a5,0(s0)
1c008b26:	83a5                	srli	a5,a5,0x9
1c008b28:	f837b7b3          	p.bclr	a5,a5,28,3
1c008b2c:	0277ae63          	p.beqimm	a5,7,1c008b68 <__rt_bridge_req_shutdown+0x62>
1c008b30:	4791                	li	a5,4
1c008b32:	c01c                	sw	a5,0(s0)
1c008b34:	1a104437          	lui	s0,0x1a104
1c008b38:	07440413          	addi	s0,s0,116 # 1a104074 <__rt_sched+0x1a103d68>
1c008b3c:	401c                	lw	a5,0(s0)
1c008b3e:	83a5                	srli	a5,a5,0x9
1c008b40:	f837b7b3          	p.bclr	a5,a5,28,3
1c008b44:	0277b463          	p.bneimm	a5,7,1c008b6c <__rt_bridge_req_shutdown+0x66>
1c008b48:	00042023          	sw	zero,0(s0)
1c008b4c:	1a104437          	lui	s0,0x1a104
1c008b50:	07440413          	addi	s0,s0,116 # 1a104074 <__rt_sched+0x1a103d68>
1c008b54:	401c                	lw	a5,0(s0)
1c008b56:	83a5                	srli	a5,a5,0x9
1c008b58:	f837b7b3          	p.bclr	a5,a5,28,3
1c008b5c:	0077aa63          	p.beqimm	a5,7,1c008b70 <__rt_bridge_req_shutdown+0x6a>
1c008b60:	40b2                	lw	ra,12(sp)
1c008b62:	4422                	lw	s0,8(sp)
1c008b64:	0141                	addi	sp,sp,16
1c008b66:	8082                	ret
1c008b68:	3501                	jal	1c008968 <__rt_bridge_wait>
1c008b6a:	bf6d                	j	1c008b24 <__rt_bridge_req_shutdown+0x1e>
1c008b6c:	3bf5                	jal	1c008968 <__rt_bridge_wait>
1c008b6e:	b7f9                	j	1c008b3c <__rt_bridge_req_shutdown+0x36>
1c008b70:	3be5                	jal	1c008968 <__rt_bridge_wait>
1c008b72:	b7cd                	j	1c008b54 <__rt_bridge_req_shutdown+0x4e>

1c008b74 <__rt_bridge_init>:
1c008b74:	1c0017b7          	lui	a5,0x1c001
1c008b78:	1a10a737          	lui	a4,0x1a10a
1c008b7c:	cf478793          	addi	a5,a5,-780 # 1c000cf4 <__hal_debug_struct>
1c008b80:	81070713          	addi	a4,a4,-2032 # 1a109810 <__rt_sched+0x1a109504>
1c008b84:	0ae7ac23          	sw	a4,184(a5)
1c008b88:	4741                	li	a4,16
1c008b8a:	0a07a223          	sw	zero,164(a5)
1c008b8e:	0a07a623          	sw	zero,172(a5)
1c008b92:	0a07aa23          	sw	zero,180(a5)
1c008b96:	0ae7ae23          	sw	a4,188(a5)
1c008b9a:	2f400793          	li	a5,756
1c008b9e:	0007a823          	sw	zero,16(a5)
1c008ba2:	0007a023          	sw	zero,0(a5)
1c008ba6:	8082                	ret

1c008ba8 <__rt_event_init>:
1c008ba8:	02052023          	sw	zero,32(a0)
1c008bac:	02052223          	sw	zero,36(a0)
1c008bb0:	02052823          	sw	zero,48(a0)
1c008bb4:	00052023          	sw	zero,0(a0)
1c008bb8:	8082                	ret

1c008bba <__rt_wait_event_prepare_blocking>:
1c008bba:	30800793          	li	a5,776
1c008bbe:	4388                	lw	a0,0(a5)
1c008bc0:	4d18                	lw	a4,24(a0)
1c008bc2:	02052223          	sw	zero,36(a0)
1c008bc6:	c398                	sw	a4,0(a5)
1c008bc8:	4785                	li	a5,1
1c008bca:	d11c                	sw	a5,32(a0)
1c008bcc:	00052023          	sw	zero,0(a0)
1c008bd0:	8082                	ret

1c008bd2 <rt_event_alloc>:
1c008bd2:	1141                	addi	sp,sp,-16
1c008bd4:	c422                	sw	s0,8(sp)
1c008bd6:	c606                	sw	ra,12(sp)
1c008bd8:	c226                	sw	s1,4(sp)
1c008bda:	842e                	mv	s0,a1
1c008bdc:	300474f3          	csrrci	s1,mstatus,8
1c008be0:	f14027f3          	csrr	a5,mhartid
1c008be4:	8795                	srai	a5,a5,0x5
1c008be6:	f267b7b3          	p.bclr	a5,a5,25,6
1c008bea:	477d                	li	a4,31
1c008bec:	00378513          	addi	a0,a5,3
1c008bf0:	00e79363          	bne	a5,a4,1c008bf6 <rt_event_alloc+0x24>
1c008bf4:	4501                	li	a0,0
1c008bf6:	08c00593          	li	a1,140
1c008bfa:	02b405b3          	mul	a1,s0,a1
1c008bfe:	224d                	jal	1c008da0 <rt_alloc>
1c008c00:	87aa                	mv	a5,a0
1c008c02:	557d                	li	a0,-1
1c008c04:	cf91                	beqz	a5,1c008c20 <rt_event_alloc+0x4e>
1c008c06:	30802683          	lw	a3,776(zero) # 308 <__rt_first_free>
1c008c0a:	4581                	li	a1,0
1c008c0c:	4601                	li	a2,0
1c008c0e:	30800713          	li	a4,776
1c008c12:	00864c63          	blt	a2,s0,1c008c2a <rt_event_alloc+0x58>
1c008c16:	c191                	beqz	a1,1c008c1a <rt_event_alloc+0x48>
1c008c18:	c314                	sw	a3,0(a4)
1c008c1a:	30049073          	csrw	mstatus,s1
1c008c1e:	4501                	li	a0,0
1c008c20:	40b2                	lw	ra,12(sp)
1c008c22:	4422                	lw	s0,8(sp)
1c008c24:	4492                	lw	s1,4(sp)
1c008c26:	0141                	addi	sp,sp,16
1c008c28:	8082                	ret
1c008c2a:	cf94                	sw	a3,24(a5)
1c008c2c:	0207a023          	sw	zero,32(a5)
1c008c30:	0207a223          	sw	zero,36(a5)
1c008c34:	0207a823          	sw	zero,48(a5)
1c008c38:	0007a023          	sw	zero,0(a5)
1c008c3c:	86be                	mv	a3,a5
1c008c3e:	0605                	addi	a2,a2,1
1c008c40:	4585                	li	a1,1
1c008c42:	08c78793          	addi	a5,a5,140
1c008c46:	b7f1                	j	1c008c12 <rt_event_alloc+0x40>

1c008c48 <rt_event_get>:
1c008c48:	30047773          	csrrci	a4,mstatus,8
1c008c4c:	30800793          	li	a5,776
1c008c50:	4388                	lw	a0,0(a5)
1c008c52:	c509                	beqz	a0,1c008c5c <rt_event_get+0x14>
1c008c54:	4d14                	lw	a3,24(a0)
1c008c56:	c150                	sw	a2,4(a0)
1c008c58:	c394                	sw	a3,0(a5)
1c008c5a:	c10c                	sw	a1,0(a0)
1c008c5c:	30071073          	csrw	mstatus,a4
1c008c60:	8082                	ret

1c008c62 <rt_event_get_blocking>:
1c008c62:	30047773          	csrrci	a4,mstatus,8
1c008c66:	30800793          	li	a5,776
1c008c6a:	4388                	lw	a0,0(a5)
1c008c6c:	c909                	beqz	a0,1c008c7e <rt_event_get_blocking+0x1c>
1c008c6e:	4d14                	lw	a3,24(a0)
1c008c70:	00052223          	sw	zero,4(a0)
1c008c74:	c394                	sw	a3,0(a5)
1c008c76:	4785                	li	a5,1
1c008c78:	00052023          	sw	zero,0(a0)
1c008c7c:	d11c                	sw	a5,32(a0)
1c008c7e:	30071073          	csrw	mstatus,a4
1c008c82:	8082                	ret

1c008c84 <__rt_event_execute>:
1c008c84:	1141                	addi	sp,sp,-16
1c008c86:	c422                	sw	s0,8(sp)
1c008c88:	30800793          	li	a5,776
1c008c8c:	43dc                	lw	a5,4(a5)
1c008c8e:	c606                	sw	ra,12(sp)
1c008c90:	c226                	sw	s1,4(sp)
1c008c92:	30800413          	li	s0,776
1c008c96:	eb91                	bnez	a5,1c008caa <__rt_event_execute+0x26>
1c008c98:	c1a9                	beqz	a1,1c008cda <__rt_event_execute+0x56>
1c008c9a:	10500073          	wfi
1c008c9e:	300467f3          	csrrsi	a5,mstatus,8
1c008ca2:	300477f3          	csrrci	a5,mstatus,8
1c008ca6:	405c                	lw	a5,4(s0)
1c008ca8:	cb8d                	beqz	a5,1c008cda <__rt_event_execute+0x56>
1c008caa:	4485                	li	s1,1
1c008cac:	4f98                	lw	a4,24(a5)
1c008cae:	53d4                	lw	a3,36(a5)
1c008cb0:	c058                	sw	a4,4(s0)
1c008cb2:	00978823          	sb	s1,16(a5)
1c008cb6:	4398                	lw	a4,0(a5)
1c008cb8:	43c8                	lw	a0,4(a5)
1c008cba:	e691                	bnez	a3,1c008cc6 <__rt_event_execute+0x42>
1c008cbc:	5394                	lw	a3,32(a5)
1c008cbe:	e681                	bnez	a3,1c008cc6 <__rt_event_execute+0x42>
1c008cc0:	4014                	lw	a3,0(s0)
1c008cc2:	c01c                	sw	a5,0(s0)
1c008cc4:	cf94                	sw	a3,24(a5)
1c008cc6:	0207a023          	sw	zero,32(a5)
1c008cca:	c711                	beqz	a4,1c008cd6 <__rt_event_execute+0x52>
1c008ccc:	300467f3          	csrrsi	a5,mstatus,8
1c008cd0:	9702                	jalr	a4
1c008cd2:	300477f3          	csrrci	a5,mstatus,8
1c008cd6:	405c                	lw	a5,4(s0)
1c008cd8:	fbf1                	bnez	a5,1c008cac <__rt_event_execute+0x28>
1c008cda:	40b2                	lw	ra,12(sp)
1c008cdc:	4422                	lw	s0,8(sp)
1c008cde:	4492                	lw	s1,4(sp)
1c008ce0:	0141                	addi	sp,sp,16
1c008ce2:	8082                	ret

1c008ce4 <__rt_wait_event>:
1c008ce4:	1141                	addi	sp,sp,-16
1c008ce6:	c422                	sw	s0,8(sp)
1c008ce8:	c606                	sw	ra,12(sp)
1c008cea:	842a                	mv	s0,a0
1c008cec:	501c                	lw	a5,32(s0)
1c008cee:	ef81                	bnez	a5,1c008d06 <__rt_wait_event+0x22>
1c008cf0:	581c                	lw	a5,48(s0)
1c008cf2:	eb91                	bnez	a5,1c008d06 <__rt_wait_event+0x22>
1c008cf4:	30800793          	li	a5,776
1c008cf8:	4398                	lw	a4,0(a5)
1c008cfa:	40b2                	lw	ra,12(sp)
1c008cfc:	cc18                	sw	a4,24(s0)
1c008cfe:	c380                	sw	s0,0(a5)
1c008d00:	4422                	lw	s0,8(sp)
1c008d02:	0141                	addi	sp,sp,16
1c008d04:	8082                	ret
1c008d06:	4585                	li	a1,1
1c008d08:	4501                	li	a0,0
1c008d0a:	3fad                	jal	1c008c84 <__rt_event_execute>
1c008d0c:	b7c5                	j	1c008cec <__rt_wait_event+0x8>

1c008d0e <rt_event_wait>:
1c008d0e:	1141                	addi	sp,sp,-16
1c008d10:	c606                	sw	ra,12(sp)
1c008d12:	c422                	sw	s0,8(sp)
1c008d14:	30047473          	csrrci	s0,mstatus,8
1c008d18:	37f1                	jal	1c008ce4 <__rt_wait_event>
1c008d1a:	30041073          	csrw	mstatus,s0
1c008d1e:	40b2                	lw	ra,12(sp)
1c008d20:	4422                	lw	s0,8(sp)
1c008d22:	0141                	addi	sp,sp,16
1c008d24:	8082                	ret

1c008d26 <__rt_event_sched_init>:
1c008d26:	30800513          	li	a0,776
1c008d2a:	00052023          	sw	zero,0(a0)
1c008d2e:	00052223          	sw	zero,4(a0)
1c008d32:	4585                	li	a1,1
1c008d34:	0511                	addi	a0,a0,4
1c008d36:	bd71                	j	1c008bd2 <rt_event_alloc>

1c008d38 <rt_user_alloc_init>:
1c008d38:	00758793          	addi	a5,a1,7
1c008d3c:	c407b7b3          	p.bclr	a5,a5,2,0
1c008d40:	40b785b3          	sub	a1,a5,a1
1c008d44:	c11c                	sw	a5,0(a0)
1c008d46:	8e0d                	sub	a2,a2,a1
1c008d48:	00c05763          	blez	a2,1c008d56 <rt_user_alloc_init+0x1e>
1c008d4c:	c4063633          	p.bclr	a2,a2,2,0
1c008d50:	c390                	sw	a2,0(a5)
1c008d52:	0007a223          	sw	zero,4(a5)
1c008d56:	8082                	ret

1c008d58 <rt_user_alloc>:
1c008d58:	059d                	addi	a1,a1,7
1c008d5a:	411c                	lw	a5,0(a0)
1c008d5c:	c405b5b3          	p.bclr	a1,a1,2,0
1c008d60:	4701                	li	a4,0
1c008d62:	cb89                	beqz	a5,1c008d74 <rt_user_alloc+0x1c>
1c008d64:	4394                	lw	a3,0(a5)
1c008d66:	43d0                	lw	a2,4(a5)
1c008d68:	00b6c863          	blt	a3,a1,1c008d78 <rt_user_alloc+0x20>
1c008d6c:	00b69b63          	bne	a3,a1,1c008d82 <rt_user_alloc+0x2a>
1c008d70:	c719                	beqz	a4,1c008d7e <rt_user_alloc+0x26>
1c008d72:	c350                	sw	a2,4(a4)
1c008d74:	853e                	mv	a0,a5
1c008d76:	8082                	ret
1c008d78:	873e                	mv	a4,a5
1c008d7a:	87b2                	mv	a5,a2
1c008d7c:	b7dd                	j	1c008d62 <rt_user_alloc+0xa>
1c008d7e:	c110                	sw	a2,0(a0)
1c008d80:	bfd5                	j	1c008d74 <rt_user_alloc+0x1c>
1c008d82:	00b78833          	add	a6,a5,a1
1c008d86:	40b685b3          	sub	a1,a3,a1
1c008d8a:	00b82023          	sw	a1,0(a6)
1c008d8e:	00c82223          	sw	a2,4(a6)
1c008d92:	c701                	beqz	a4,1c008d9a <rt_user_alloc+0x42>
1c008d94:	01072223          	sw	a6,4(a4)
1c008d98:	bff1                	j	1c008d74 <rt_user_alloc+0x1c>
1c008d9a:	01052023          	sw	a6,0(a0)
1c008d9e:	bfd9                	j	1c008d74 <rt_user_alloc+0x1c>

1c008da0 <rt_alloc>:
1c008da0:	1101                	addi	sp,sp,-32
1c008da2:	c84a                	sw	s2,16(sp)
1c008da4:	1c001937          	lui	s2,0x1c001
1c008da8:	cc22                	sw	s0,24(sp)
1c008daa:	ca26                	sw	s1,20(sp)
1c008dac:	c64e                	sw	s3,12(sp)
1c008dae:	ce06                	sw	ra,28(sp)
1c008db0:	842a                	mv	s0,a0
1c008db2:	89ae                	mv	s3,a1
1c008db4:	448d                	li	s1,3
1c008db6:	e9090913          	addi	s2,s2,-368 # 1c000e90 <__rt_alloc_l2>
1c008dba:	00241513          	slli	a0,s0,0x2
1c008dbe:	85ce                	mv	a1,s3
1c008dc0:	954a                	add	a0,a0,s2
1c008dc2:	3f59                	jal	1c008d58 <rt_user_alloc>
1c008dc4:	e519                	bnez	a0,1c008dd2 <rt_alloc+0x32>
1c008dc6:	0405                	addi	s0,s0,1
1c008dc8:	00343363          	p.bneimm	s0,3,1c008dce <rt_alloc+0x2e>
1c008dcc:	4401                	li	s0,0
1c008dce:	14fd                	addi	s1,s1,-1
1c008dd0:	f4ed                	bnez	s1,1c008dba <rt_alloc+0x1a>
1c008dd2:	40f2                	lw	ra,28(sp)
1c008dd4:	4462                	lw	s0,24(sp)
1c008dd6:	44d2                	lw	s1,20(sp)
1c008dd8:	4942                	lw	s2,16(sp)
1c008dda:	49b2                	lw	s3,12(sp)
1c008ddc:	6105                	addi	sp,sp,32
1c008dde:	8082                	ret

1c008de0 <__rt_allocs_init>:
1c008de0:	1141                	addi	sp,sp,-16
1c008de2:	1c0015b7          	lui	a1,0x1c001
1c008de6:	c606                	sw	ra,12(sp)
1c008de8:	eb058793          	addi	a5,a1,-336 # 1c000eb0 <__l2_priv0_end>
1c008dec:	1c008637          	lui	a2,0x1c008
1c008df0:	04c7c863          	blt	a5,a2,1c008e40 <__rt_allocs_init+0x60>
1c008df4:	4581                	li	a1,0
1c008df6:	4601                	li	a2,0
1c008df8:	1c001537          	lui	a0,0x1c001
1c008dfc:	e9050513          	addi	a0,a0,-368 # 1c000e90 <__rt_alloc_l2>
1c008e00:	3f25                	jal	1c008d38 <rt_user_alloc_init>
1c008e02:	1c00a5b7          	lui	a1,0x1c00a
1c008e06:	2a858793          	addi	a5,a1,680 # 1c00a2a8 <__l2_priv1_end>
1c008e0a:	1c010637          	lui	a2,0x1c010
1c008e0e:	02c7cd63          	blt	a5,a2,1c008e48 <__rt_allocs_init+0x68>
1c008e12:	4581                	li	a1,0
1c008e14:	4601                	li	a2,0
1c008e16:	1c001537          	lui	a0,0x1c001
1c008e1a:	e9450513          	addi	a0,a0,-364 # 1c000e94 <__rt_alloc_l2+0x4>
1c008e1e:	3f29                	jal	1c008d38 <rt_user_alloc_init>
1c008e20:	1c0105b7          	lui	a1,0x1c010
1c008e24:	0ec58793          	addi	a5,a1,236 # 1c0100ec <__l2_shared_end>
1c008e28:	40b2                	lw	ra,12(sp)
1c008e2a:	1c080637          	lui	a2,0x1c080
1c008e2e:	1c001537          	lui	a0,0x1c001
1c008e32:	8e1d                	sub	a2,a2,a5
1c008e34:	0ec58593          	addi	a1,a1,236
1c008e38:	e9850513          	addi	a0,a0,-360 # 1c000e98 <__rt_alloc_l2+0x8>
1c008e3c:	0141                	addi	sp,sp,16
1c008e3e:	bded                	j	1c008d38 <rt_user_alloc_init>
1c008e40:	8e1d                	sub	a2,a2,a5
1c008e42:	eb058593          	addi	a1,a1,-336
1c008e46:	bf4d                	j	1c008df8 <__rt_allocs_init+0x18>
1c008e48:	8e1d                	sub	a2,a2,a5
1c008e4a:	2a858593          	addi	a1,a1,680
1c008e4e:	b7e1                	j	1c008e16 <__rt_allocs_init+0x36>

1c008e50 <__rt_time_poweroff>:
1c008e50:	1a10b7b7          	lui	a5,0x1a10b
1c008e54:	0791                	addi	a5,a5,4
1c008e56:	0087a783          	lw	a5,8(a5) # 1a10b008 <__rt_sched+0x1a10acfc>
1c008e5a:	1c001737          	lui	a4,0x1c001
1c008e5e:	e6f72c23          	sw	a5,-392(a4) # 1c000e78 <timer_count>
1c008e62:	4501                	li	a0,0
1c008e64:	8082                	ret

1c008e66 <__rt_time_poweron>:
1c008e66:	1c0017b7          	lui	a5,0x1c001
1c008e6a:	e787a703          	lw	a4,-392(a5) # 1c000e78 <timer_count>
1c008e6e:	1a10b7b7          	lui	a5,0x1a10b
1c008e72:	0791                	addi	a5,a5,4
1c008e74:	00e7a423          	sw	a4,8(a5) # 1a10b008 <__rt_sched+0x1a10acfc>
1c008e78:	4501                	li	a0,0
1c008e7a:	8082                	ret

1c008e7c <rt_event_push_delayed>:
1c008e7c:	30047373          	csrrci	t1,mstatus,8
1c008e80:	1c001637          	lui	a2,0x1c001
1c008e84:	e9c62703          	lw	a4,-356(a2) # 1c000e9c <first_delayed>
1c008e88:	1a10b7b7          	lui	a5,0x1a10b
1c008e8c:	0791                	addi	a5,a5,4
1c008e8e:	0087a783          	lw	a5,8(a5) # 1a10b008 <__rt_sched+0x1a10acfc>
1c008e92:	46f9                	li	a3,30
1c008e94:	0405e5b3          	p.max	a1,a1,zero
1c008e98:	02d5c5b3          	div	a1,a1,a3
1c008e9c:	800006b7          	lui	a3,0x80000
1c008ea0:	0585                	addi	a1,a1,1
1c008ea2:	fff6c693          	not	a3,a3
1c008ea6:	00d7f833          	and	a6,a5,a3
1c008eaa:	97ae                	add	a5,a5,a1
1c008eac:	d95c                	sw	a5,52(a0)
1c008eae:	982e                	add	a6,a6,a1
1c008eb0:	4781                	li	a5,0
1c008eb2:	c719                	beqz	a4,1c008ec0 <rt_event_push_delayed+0x44>
1c008eb4:	03472883          	lw	a7,52(a4)
1c008eb8:	00d8f8b3          	and	a7,a7,a3
1c008ebc:	0108e863          	bltu	a7,a6,1c008ecc <rt_event_push_delayed+0x50>
1c008ec0:	cb89                	beqz	a5,1c008ed2 <rt_event_push_delayed+0x56>
1c008ec2:	cf88                	sw	a0,24(a5)
1c008ec4:	cd18                	sw	a4,24(a0)
1c008ec6:	30031073          	csrw	mstatus,t1
1c008eca:	8082                	ret
1c008ecc:	87ba                	mv	a5,a4
1c008ece:	4f18                	lw	a4,24(a4)
1c008ed0:	b7cd                	j	1c008eb2 <rt_event_push_delayed+0x36>
1c008ed2:	1a10b7b7          	lui	a5,0x1a10b
1c008ed6:	0791                	addi	a5,a5,4
1c008ed8:	e8a62e23          	sw	a0,-356(a2)
1c008edc:	cd18                	sw	a4,24(a0)
1c008ede:	0087a703          	lw	a4,8(a5) # 1a10b008 <__rt_sched+0x1a10acfc>
1c008ee2:	95ba                	add	a1,a1,a4
1c008ee4:	00b7a823          	sw	a1,16(a5)
1c008ee8:	08500713          	li	a4,133
1c008eec:	00e7a023          	sw	a4,0(a5)
1c008ef0:	bfd9                	j	1c008ec6 <rt_event_push_delayed+0x4a>

1c008ef2 <rt_time_wait_us>:
1c008ef2:	1101                	addi	sp,sp,-32
1c008ef4:	85aa                	mv	a1,a0
1c008ef6:	4501                	li	a0,0
1c008ef8:	ce06                	sw	ra,28(sp)
1c008efa:	cc22                	sw	s0,24(sp)
1c008efc:	c62e                	sw	a1,12(sp)
1c008efe:	3395                	jal	1c008c62 <rt_event_get_blocking>
1c008f00:	45b2                	lw	a1,12(sp)
1c008f02:	842a                	mv	s0,a0
1c008f04:	3fa5                	jal	1c008e7c <rt_event_push_delayed>
1c008f06:	8522                	mv	a0,s0
1c008f08:	4462                	lw	s0,24(sp)
1c008f0a:	40f2                	lw	ra,28(sp)
1c008f0c:	6105                	addi	sp,sp,32
1c008f0e:	b501                	j	1c008d0e <rt_event_wait>

1c008f10 <__rt_time_init>:
1c008f10:	1c0017b7          	lui	a5,0x1c001
1c008f14:	e807ae23          	sw	zero,-356(a5) # 1c000e9c <first_delayed>
1c008f18:	1a10b7b7          	lui	a5,0x1a10b
1c008f1c:	1141                	addi	sp,sp,-16
1c008f1e:	08300713          	li	a4,131
1c008f22:	0791                	addi	a5,a5,4
1c008f24:	c606                	sw	ra,12(sp)
1c008f26:	c422                	sw	s0,8(sp)
1c008f28:	00e7a023          	sw	a4,0(a5) # 1a10b000 <__rt_sched+0x1a10acf4>
1c008f2c:	1c0095b7          	lui	a1,0x1c009
1c008f30:	f9658593          	addi	a1,a1,-106 # 1c008f96 <__rt_timer_handler>
1c008f34:	452d                	li	a0,11
1c008f36:	863ff0ef          	jal	ra,1c008798 <rt_irq_set_handler>
1c008f3a:	6785                	lui	a5,0x1
1c008f3c:	1a10a737          	lui	a4,0x1a10a
1c008f40:	80078793          	addi	a5,a5,-2048 # 800 <__rt_sched+0x4f4>
1c008f44:	1c0095b7          	lui	a1,0x1c009
1c008f48:	80f72223          	sw	a5,-2044(a4) # 1a109804 <__rt_sched+0x1a1094f8>
1c008f4c:	4601                	li	a2,0
1c008f4e:	e5058593          	addi	a1,a1,-432 # 1c008e50 <__rt_time_poweroff>
1c008f52:	4509                	li	a0,2
1c008f54:	909ff0ef          	jal	ra,1c00885c <__rt_cbsys_add>
1c008f58:	1c0095b7          	lui	a1,0x1c009
1c008f5c:	842a                	mv	s0,a0
1c008f5e:	4601                	li	a2,0
1c008f60:	e6658593          	addi	a1,a1,-410 # 1c008e66 <__rt_time_poweron>
1c008f64:	450d                	li	a0,3
1c008f66:	8f7ff0ef          	jal	ra,1c00885c <__rt_cbsys_add>
1c008f6a:	8d41                	or	a0,a0,s0
1c008f6c:	c10d                	beqz	a0,1c008f8e <__rt_time_init+0x7e>
1c008f6e:	f1402673          	csrr	a2,mhartid
1c008f72:	1c000537          	lui	a0,0x1c000
1c008f76:	40565593          	srai	a1,a2,0x5
1c008f7a:	f265b5b3          	p.bclr	a1,a1,25,6
1c008f7e:	f4563633          	p.bclr	a2,a2,26,5
1c008f82:	41450513          	addi	a0,a0,1044 # 1c000414 <__DTOR_END__+0xbc>
1c008f86:	7d2000ef          	jal	ra,1c009758 <printf>
1c008f8a:	73a000ef          	jal	ra,1c0096c4 <abort>
1c008f8e:	40b2                	lw	ra,12(sp)
1c008f90:	4422                	lw	s0,8(sp)
1c008f92:	0141                	addi	sp,sp,16
1c008f94:	8082                	ret

1c008f96 <__rt_timer_handler>:
1c008f96:	7179                	addi	sp,sp,-48
1c008f98:	ce36                	sw	a3,28(sp)
1c008f9a:	1c0016b7          	lui	a3,0x1c001
1c008f9e:	cc3a                	sw	a4,24(sp)
1c008fa0:	ca3e                	sw	a5,20(sp)
1c008fa2:	1a10b737          	lui	a4,0x1a10b
1c008fa6:	e9c6a783          	lw	a5,-356(a3) # 1c000e9c <first_delayed>
1c008faa:	0711                	addi	a4,a4,4
1c008fac:	d61a                	sw	t1,44(sp)
1c008fae:	d42a                	sw	a0,40(sp)
1c008fb0:	d22e                	sw	a1,36(sp)
1c008fb2:	d032                	sw	a2,32(sp)
1c008fb4:	c842                	sw	a6,16(sp)
1c008fb6:	c646                	sw	a7,12(sp)
1c008fb8:	00872703          	lw	a4,8(a4) # 1a10b008 <__rt_sched+0x1a10acfc>
1c008fbc:	800008b7          	lui	a7,0x80000
1c008fc0:	30c02583          	lw	a1,780(zero) # 30c <__rt_sched>
1c008fc4:	31002603          	lw	a2,784(zero) # 310 <__rt_sched+0x4>
1c008fc8:	4501                	li	a0,0
1c008fca:	4801                	li	a6,0
1c008fcc:	ffe8c893          	xori	a7,a7,-2
1c008fd0:	e3ad                	bnez	a5,1c009032 <__rt_timer_handler+0x9c>
1c008fd2:	00080463          	beqz	a6,1c008fda <__rt_timer_handler+0x44>
1c008fd6:	30b02623          	sw	a1,780(zero) # 30c <__rt_sched>
1c008fda:	c119                	beqz	a0,1c008fe0 <__rt_timer_handler+0x4a>
1c008fdc:	30c02823          	sw	a2,784(zero) # 310 <__rt_sched+0x4>
1c008fe0:	1a10b7b7          	lui	a5,0x1a10b
1c008fe4:	08100713          	li	a4,129
1c008fe8:	0791                	addi	a5,a5,4
1c008fea:	e806ae23          	sw	zero,-356(a3)
1c008fee:	00e7a023          	sw	a4,0(a5) # 1a10b000 <__rt_sched+0x1a10acf4>
1c008ff2:	6785                	lui	a5,0x1
1c008ff4:	1a10a737          	lui	a4,0x1a10a
1c008ff8:	80078793          	addi	a5,a5,-2048 # 800 <__rt_sched+0x4f4>
1c008ffc:	80f72a23          	sw	a5,-2028(a4) # 1a109814 <__rt_sched+0x1a109508>
1c009000:	5332                	lw	t1,44(sp)
1c009002:	5522                	lw	a0,40(sp)
1c009004:	5592                	lw	a1,36(sp)
1c009006:	5602                	lw	a2,32(sp)
1c009008:	46f2                	lw	a3,28(sp)
1c00900a:	4762                	lw	a4,24(sp)
1c00900c:	47d2                	lw	a5,20(sp)
1c00900e:	4842                	lw	a6,16(sp)
1c009010:	48b2                	lw	a7,12(sp)
1c009012:	6145                	addi	sp,sp,48
1c009014:	30200073          	mret
1c009018:	0187a303          	lw	t1,24(a5)
1c00901c:	0007ac23          	sw	zero,24(a5)
1c009020:	c591                	beqz	a1,1c00902c <__rt_timer_handler+0x96>
1c009022:	ce1c                	sw	a5,24(a2)
1c009024:	863e                	mv	a2,a5
1c009026:	4505                	li	a0,1
1c009028:	879a                	mv	a5,t1
1c00902a:	b75d                	j	1c008fd0 <__rt_timer_handler+0x3a>
1c00902c:	85be                	mv	a1,a5
1c00902e:	4805                	li	a6,1
1c009030:	bfd5                	j	1c009024 <__rt_timer_handler+0x8e>
1c009032:	0347a303          	lw	t1,52(a5)
1c009036:	40670333          	sub	t1,a4,t1
1c00903a:	fc68ffe3          	bleu	t1,a7,1c009018 <__rt_timer_handler+0x82>
1c00903e:	00080463          	beqz	a6,1c009046 <__rt_timer_handler+0xb0>
1c009042:	30b02623          	sw	a1,780(zero) # 30c <__rt_sched>
1c009046:	c119                	beqz	a0,1c00904c <__rt_timer_handler+0xb6>
1c009048:	30c02823          	sw	a2,784(zero) # 310 <__rt_sched+0x4>
1c00904c:	e8f6ae23          	sw	a5,-356(a3)
1c009050:	1a10b6b7          	lui	a3,0x1a10b
1c009054:	0691                	addi	a3,a3,4
1c009056:	0086a603          	lw	a2,8(a3) # 1a10b008 <__rt_sched+0x1a10acfc>
1c00905a:	5bdc                	lw	a5,52(a5)
1c00905c:	40e78733          	sub	a4,a5,a4
1c009060:	9732                	add	a4,a4,a2
1c009062:	00e6a823          	sw	a4,16(a3)
1c009066:	08500793          	li	a5,133
1c00906a:	00f6a023          	sw	a5,0(a3)
1c00906e:	bf49                	j	1c009000 <__rt_timer_handler+0x6a>

1c009070 <__rt_freq_init>:
1c009070:	1141                	addi	sp,sp,-16
1c009072:	c422                	sw	s0,8(sp)
1c009074:	c226                	sw	s1,4(sp)
1c009076:	c606                	sw	ra,12(sp)
1c009078:	227d                	jal	1c009226 <__rt_flls_constructor>
1c00907a:	1c0017b7          	lui	a5,0x1c001
1c00907e:	db47a783          	lw	a5,-588(a5) # 1c000db4 <__rt_platform>
1c009082:	1c001437          	lui	s0,0x1c001
1c009086:	ea040493          	addi	s1,s0,-352 # 1c000ea0 <__rt_freq_domains>
1c00908a:	0017ae63          	p.beqimm	a5,1,1c0090a6 <__rt_freq_init+0x36>
1c00908e:	4501                	li	a0,0
1c009090:	28cd                	jal	1c009182 <__rt_fll_init>
1c009092:	eaa42023          	sw	a0,-352(s0)
1c009096:	4505                	li	a0,1
1c009098:	20ed                	jal	1c009182 <__rt_fll_init>
1c00909a:	c0c8                	sw	a0,4(s1)
1c00909c:	40b2                	lw	ra,12(sp)
1c00909e:	4422                	lw	s0,8(sp)
1c0090a0:	4492                	lw	s1,4(sp)
1c0090a2:	0141                	addi	sp,sp,16
1c0090a4:	8082                	ret
1c0090a6:	1c0017b7          	lui	a5,0x1c001
1c0090aa:	dc47a783          	lw	a5,-572(a5) # 1c000dc4 <__rt_fpga_fc_frequency>
1c0090ae:	eaf42023          	sw	a5,-352(s0)
1c0090b2:	1c0017b7          	lui	a5,0x1c001
1c0090b6:	dc87a783          	lw	a5,-568(a5) # 1c000dc8 <__rt_fpga_periph_frequency>
1c0090ba:	c0dc                	sw	a5,4(s1)
1c0090bc:	b7c5                	j	1c00909c <__rt_freq_init+0x2c>

1c0090be <rt_padframe_set>:
1c0090be:	300476f3          	csrrci	a3,mstatus,8
1c0090c2:	4158                	lw	a4,4(a0)
1c0090c4:	1a1047b7          	lui	a5,0x1a104
1c0090c8:	430c                	lw	a1,0(a4)
1c0090ca:	01078613          	addi	a2,a5,16 # 1a104010 <__rt_sched+0x1a103d04>
1c0090ce:	c20c                	sw	a1,0(a2)
1c0090d0:	434c                	lw	a1,4(a4)
1c0090d2:	01478613          	addi	a2,a5,20
1c0090d6:	c20c                	sw	a1,0(a2)
1c0090d8:	470c                	lw	a1,8(a4)
1c0090da:	01878613          	addi	a2,a5,24
1c0090de:	c20c                	sw	a1,0(a2)
1c0090e0:	4758                	lw	a4,12(a4)
1c0090e2:	07f1                	addi	a5,a5,28
1c0090e4:	c398                	sw	a4,0(a5)
1c0090e6:	30069073          	csrw	mstatus,a3
1c0090ea:	8082                	ret

1c0090ec <__rt_padframe_init>:
1c0090ec:	1c001537          	lui	a0,0x1c001
1c0090f0:	db850513          	addi	a0,a0,-584 # 1c000db8 <__rt_padframe_profiles>
1c0090f4:	b7e9                	j	1c0090be <rt_padframe_set>

1c0090f6 <__rt_ov7670_init>:
1c0090f6:	1c0107b7          	lui	a5,0x1c010
1c0090fa:	00078023          	sb	zero,0(a5) # 1c010000 <__ov7670Inited>
1c0090fe:	8082                	ret

1c009100 <__rt_i2c_init>:
1c009100:	1c0107b7          	lui	a5,0x1c010
1c009104:	06078023          	sb	zero,96(a5) # 1c010060 <__rt_i2c+0x4>
1c009108:	8082                	ret

1c00910a <__rt_fll_set_freq>:
1c00910a:	1101                	addi	sp,sp,-32
1c00910c:	cc22                	sw	s0,24(sp)
1c00910e:	ce06                	sw	ra,28(sp)
1c009110:	842a                	mv	s0,a0
1c009112:	e501                	bnez	a0,1c00911a <__rt_fll_set_freq+0x10>
1c009114:	c62e                	sw	a1,12(sp)
1c009116:	3ac5                	jal	1c008b06 <__rt_bridge_req_shutdown>
1c009118:	45b2                	lw	a1,12(sp)
1c00911a:	10059733          	p.fl1	a4,a1
1c00911e:	47f5                	li	a5,29
1c009120:	4505                	li	a0,1
1c009122:	82e7b7db          	p.subun	a5,a5,a4,1
1c009126:	04f567b3          	p.max	a5,a0,a5
1c00912a:	fff78713          	addi	a4,a5,-1
1c00912e:	00f595b3          	sll	a1,a1,a5
1c009132:	00e51533          	sll	a0,a0,a4
1c009136:	1c0016b7          	lui	a3,0x1c001
1c00913a:	dc05b733          	p.bclr	a4,a1,14,0
1c00913e:	c0f7255b          	p.addunr	a0,a4,a5
1c009142:	ea868693          	addi	a3,a3,-344 # 1c000ea8 <__rt_fll_freq>
1c009146:	00241713          	slli	a4,s0,0x2
1c00914a:	00a6e723          	p.sw	a0,a4(a3)
1c00914e:	1c001737          	lui	a4,0x1c001
1c009152:	e7c70713          	addi	a4,a4,-388 # 1c000e7c <__rt_fll_is_on>
1c009156:	9722                	add	a4,a4,s0
1c009158:	00074703          	lbu	a4,0(a4)
1c00915c:	cf19                	beqz	a4,1c00917a <__rt_fll_set_freq+0x70>
1c00915e:	0412                	slli	s0,s0,0x4
1c009160:	0411                	addi	s0,s0,4
1c009162:	1a1006b7          	lui	a3,0x1a100
1c009166:	2086f703          	p.lw	a4,s0(a3)
1c00916a:	81bd                	srli	a1,a1,0xf
1c00916c:	de05a733          	p.insert	a4,a1,15,0
1c009170:	0785                	addi	a5,a5,1
1c009172:	c7a7a733          	p.insert	a4,a5,3,26
1c009176:	00e6e423          	p.sw	a4,s0(a3)
1c00917a:	40f2                	lw	ra,28(sp)
1c00917c:	4462                	lw	s0,24(sp)
1c00917e:	6105                	addi	sp,sp,32
1c009180:	8082                	ret

1c009182 <__rt_fll_init>:
1c009182:	1141                	addi	sp,sp,-16
1c009184:	00451613          	slli	a2,a0,0x4
1c009188:	c226                	sw	s1,4(sp)
1c00918a:	00460813          	addi	a6,a2,4
1c00918e:	84aa                	mv	s1,a0
1c009190:	1a1006b7          	lui	a3,0x1a100
1c009194:	c606                	sw	ra,12(sp)
1c009196:	c422                	sw	s0,8(sp)
1c009198:	2106f703          	p.lw	a4,a6(a3)
1c00919c:	87ba                	mv	a5,a4
1c00919e:	04074163          	bltz	a4,1c0091e0 <__rt_fll_init+0x5e>
1c0091a2:	00860893          	addi	a7,a2,8
1c0091a6:	2116f503          	p.lw	a0,a7(a3)
1c0091aa:	4599                	li	a1,6
1c0091ac:	caa5a533          	p.insert	a0,a1,5,10
1c0091b0:	05000593          	li	a1,80
1c0091b4:	d705a533          	p.insert	a0,a1,11,16
1c0091b8:	1a1005b7          	lui	a1,0x1a100
1c0091bc:	00a5e8a3          	p.sw	a0,a7(a1)
1c0091c0:	0631                	addi	a2,a2,12
1c0091c2:	20c6f683          	p.lw	a3,a2(a3)
1c0091c6:	14c00513          	li	a0,332
1c0091ca:	d30526b3          	p.insert	a3,a0,9,16
1c0091ce:	00d5e623          	p.sw	a3,a2(a1)
1c0091d2:	4685                	li	a3,1
1c0091d4:	c1e6a7b3          	p.insert	a5,a3,0,30
1c0091d8:	c1f6a7b3          	p.insert	a5,a3,0,31
1c0091dc:	00f5e823          	p.sw	a5,a6(a1)
1c0091e0:	1c001637          	lui	a2,0x1c001
1c0091e4:	00249693          	slli	a3,s1,0x2
1c0091e8:	ea860613          	addi	a2,a2,-344 # 1c000ea8 <__rt_fll_freq>
1c0091ec:	96b2                	add	a3,a3,a2
1c0091ee:	4280                	lw	s0,0(a3)
1c0091f0:	c00d                	beqz	s0,1c009212 <__rt_fll_init+0x90>
1c0091f2:	85a2                	mv	a1,s0
1c0091f4:	8526                	mv	a0,s1
1c0091f6:	3f11                	jal	1c00910a <__rt_fll_set_freq>
1c0091f8:	1c0017b7          	lui	a5,0x1c001
1c0091fc:	e7c78793          	addi	a5,a5,-388 # 1c000e7c <__rt_fll_is_on>
1c009200:	4705                	li	a4,1
1c009202:	00e7c4a3          	p.sb	a4,s1(a5)
1c009206:	8522                	mv	a0,s0
1c009208:	40b2                	lw	ra,12(sp)
1c00920a:	4422                	lw	s0,8(sp)
1c00920c:	4492                	lw	s1,4(sp)
1c00920e:	0141                	addi	sp,sp,16
1c009210:	8082                	ret
1c009212:	10075733          	p.exthz	a4,a4
1c009216:	c7a797b3          	p.extractu	a5,a5,3,26
1c00921a:	073e                	slli	a4,a4,0xf
1c00921c:	17fd                	addi	a5,a5,-1
1c00921e:	00f75433          	srl	s0,a4,a5
1c009222:	c280                	sw	s0,0(a3)
1c009224:	bfd1                	j	1c0091f8 <__rt_fll_init+0x76>

1c009226 <__rt_flls_constructor>:
1c009226:	1c0017b7          	lui	a5,0x1c001
1c00922a:	ea07a423          	sw	zero,-344(a5) # 1c000ea8 <__rt_fll_freq>
1c00922e:	ea878793          	addi	a5,a5,-344
1c009232:	0007a223          	sw	zero,4(a5)
1c009236:	1c0017b7          	lui	a5,0x1c001
1c00923a:	e6079e23          	sh	zero,-388(a5) # 1c000e7c <__rt_fll_is_on>
1c00923e:	8082                	ret

1c009240 <rt_is_fc>:
1c009240:	f1402573          	csrr	a0,mhartid
1c009244:	8515                	srai	a0,a0,0x5
1c009246:	f2653533          	p.bclr	a0,a0,25,6
1c00924a:	1505                	addi	a0,a0,-31
1c00924c:	00153513          	seqz	a0,a0
1c009250:	8082                	ret

1c009252 <__rt_io_end_of_flush>:
1c009252:	1c0017b7          	lui	a5,0x1c001
1c009256:	e807a223          	sw	zero,-380(a5) # 1c000e84 <__rt_io_pending_flush>
1c00925a:	00052c23          	sw	zero,24(a0)
1c00925e:	8082                	ret

1c009260 <__rt_io_unlock>:
1c009260:	1c0017b7          	lui	a5,0x1c001
1c009264:	d047a783          	lw	a5,-764(a5) # 1c000d04 <__hal_debug_struct+0x10>
1c009268:	cf81                	beqz	a5,1c009280 <__rt_io_unlock+0x20>
1c00926a:	1c0017b7          	lui	a5,0x1c001
1c00926e:	e8c7a783          	lw	a5,-372(a5) # 1c000e8c <_rt_io_uart>
1c009272:	e799                	bnez	a5,1c009280 <__rt_io_unlock+0x20>
1c009274:	1c0017b7          	lui	a5,0x1c001
1c009278:	e707a783          	lw	a5,-400(a5) # 1c000e70 <__rt_iodev>
1c00927c:	0227b163          	p.bneimm	a5,2,1c00929e <__rt_io_unlock+0x3e>
1c009280:	1141                	addi	sp,sp,-16
1c009282:	c606                	sw	ra,12(sp)
1c009284:	3f75                	jal	1c009240 <rt_is_fc>
1c009286:	c909                	beqz	a0,1c009298 <__rt_io_unlock+0x38>
1c009288:	40b2                	lw	ra,12(sp)
1c00928a:	1c001537          	lui	a0,0x1c001
1c00928e:	ce450513          	addi	a0,a0,-796 # 1c000ce4 <__rt_io_fc_lock>
1c009292:	0141                	addi	sp,sp,16
1c009294:	e8aff06f          	j	1c00891e <__rt_fc_unlock>
1c009298:	40b2                	lw	ra,12(sp)
1c00929a:	0141                	addi	sp,sp,16
1c00929c:	8082                	ret
1c00929e:	8082                	ret

1c0092a0 <__rt_io_lock>:
1c0092a0:	1c0017b7          	lui	a5,0x1c001
1c0092a4:	d047a783          	lw	a5,-764(a5) # 1c000d04 <__hal_debug_struct+0x10>
1c0092a8:	cf81                	beqz	a5,1c0092c0 <__rt_io_lock+0x20>
1c0092aa:	1c0017b7          	lui	a5,0x1c001
1c0092ae:	e8c7a783          	lw	a5,-372(a5) # 1c000e8c <_rt_io_uart>
1c0092b2:	e799                	bnez	a5,1c0092c0 <__rt_io_lock+0x20>
1c0092b4:	1c0017b7          	lui	a5,0x1c001
1c0092b8:	e707a783          	lw	a5,-400(a5) # 1c000e70 <__rt_iodev>
1c0092bc:	0227b163          	p.bneimm	a5,2,1c0092de <__rt_io_lock+0x3e>
1c0092c0:	1141                	addi	sp,sp,-16
1c0092c2:	c606                	sw	ra,12(sp)
1c0092c4:	3fb5                	jal	1c009240 <rt_is_fc>
1c0092c6:	c909                	beqz	a0,1c0092d8 <__rt_io_lock+0x38>
1c0092c8:	40b2                	lw	ra,12(sp)
1c0092ca:	1c001537          	lui	a0,0x1c001
1c0092ce:	ce450513          	addi	a0,a0,-796 # 1c000ce4 <__rt_io_fc_lock>
1c0092d2:	0141                	addi	sp,sp,16
1c0092d4:	e18ff06f          	j	1c0088ec <__rt_fc_lock>
1c0092d8:	40b2                	lw	ra,12(sp)
1c0092da:	0141                	addi	sp,sp,16
1c0092dc:	8082                	ret
1c0092de:	8082                	ret

1c0092e0 <__rt_io_start>:
1c0092e0:	1101                	addi	sp,sp,-32
1c0092e2:	0028                	addi	a0,sp,8
1c0092e4:	ce06                	sw	ra,28(sp)
1c0092e6:	cc22                	sw	s0,24(sp)
1c0092e8:	68b000ef          	jal	ra,1c00a172 <rt_uart_conf_init>
1c0092ec:	4585                	li	a1,1
1c0092ee:	4501                	li	a0,0
1c0092f0:	8e3ff0ef          	jal	ra,1c008bd2 <rt_event_alloc>
1c0092f4:	547d                	li	s0,-1
1c0092f6:	ed15                	bnez	a0,1c009332 <__rt_io_start+0x52>
1c0092f8:	1c0017b7          	lui	a5,0x1c001
1c0092fc:	dc07a783          	lw	a5,-576(a5) # 1c000dc0 <__rt_iodev_uart_baudrate>
1c009300:	842a                	mv	s0,a0
1c009302:	1c001537          	lui	a0,0x1c001
1c009306:	e3ff7597          	auipc	a1,0xe3ff7
1c00930a:	00658593          	addi	a1,a1,6 # 30c <__rt_sched>
1c00930e:	dd050513          	addi	a0,a0,-560 # 1c000dd0 <_bss_start>
1c009312:	c43e                	sw	a5,8(sp)
1c009314:	895ff0ef          	jal	ra,1c008ba8 <__rt_event_init>
1c009318:	1c0017b7          	lui	a5,0x1c001
1c00931c:	e747a503          	lw	a0,-396(a5) # 1c000e74 <__rt_iodev_uart_channel>
1c009320:	4681                	li	a3,0
1c009322:	4601                	li	a2,0
1c009324:	002c                	addi	a1,sp,8
1c009326:	65d000ef          	jal	ra,1c00a182 <__rt_uart_open>
1c00932a:	1c0017b7          	lui	a5,0x1c001
1c00932e:	e8a7a623          	sw	a0,-372(a5) # 1c000e8c <_rt_io_uart>
1c009332:	8522                	mv	a0,s0
1c009334:	40f2                	lw	ra,28(sp)
1c009336:	4462                	lw	s0,24(sp)
1c009338:	6105                	addi	sp,sp,32
1c00933a:	8082                	ret

1c00933c <rt_event_execute.isra.0.constprop.6>:
1c00933c:	1141                	addi	sp,sp,-16
1c00933e:	c606                	sw	ra,12(sp)
1c009340:	c422                	sw	s0,8(sp)
1c009342:	30047473          	csrrci	s0,mstatus,8
1c009346:	4585                	li	a1,1
1c009348:	e3ff7517          	auipc	a0,0xe3ff7
1c00934c:	fc450513          	addi	a0,a0,-60 # 30c <__rt_sched>
1c009350:	935ff0ef          	jal	ra,1c008c84 <__rt_event_execute>
1c009354:	30041073          	csrw	mstatus,s0
1c009358:	40b2                	lw	ra,12(sp)
1c00935a:	4422                	lw	s0,8(sp)
1c00935c:	0141                	addi	sp,sp,16
1c00935e:	8082                	ret

1c009360 <__rt_io_uart_wait_pending>:
1c009360:	1141                	addi	sp,sp,-16
1c009362:	c422                	sw	s0,8(sp)
1c009364:	c606                	sw	ra,12(sp)
1c009366:	c226                	sw	s1,4(sp)
1c009368:	1c001437          	lui	s0,0x1c001
1c00936c:	e8442783          	lw	a5,-380(s0) # 1c000e84 <__rt_io_pending_flush>
1c009370:	e39d                	bnez	a5,1c009396 <__rt_io_uart_wait_pending+0x36>
1c009372:	1c001437          	lui	s0,0x1c001
1c009376:	e8040413          	addi	s0,s0,-384 # 1c000e80 <__rt_io_event_current>
1c00937a:	4004                	lw	s1,0(s0)
1c00937c:	c881                	beqz	s1,1c00938c <__rt_io_uart_wait_pending+0x2c>
1c00937e:	35c9                	jal	1c009240 <rt_is_fc>
1c009380:	c511                	beqz	a0,1c00938c <__rt_io_uart_wait_pending+0x2c>
1c009382:	8526                	mv	a0,s1
1c009384:	98bff0ef          	jal	ra,1c008d0e <rt_event_wait>
1c009388:	00042023          	sw	zero,0(s0)
1c00938c:	40b2                	lw	ra,12(sp)
1c00938e:	4422                	lw	s0,8(sp)
1c009390:	4492                	lw	s1,4(sp)
1c009392:	0141                	addi	sp,sp,16
1c009394:	8082                	ret
1c009396:	35e9                	jal	1c009260 <__rt_io_unlock>
1c009398:	3755                	jal	1c00933c <rt_event_execute.isra.0.constprop.6>
1c00939a:	3719                	jal	1c0092a0 <__rt_io_lock>
1c00939c:	bfc1                	j	1c00936c <__rt_io_uart_wait_pending+0xc>

1c00939e <__rt_io_stop>:
1c00939e:	1141                	addi	sp,sp,-16
1c0093a0:	c422                	sw	s0,8(sp)
1c0093a2:	1c001437          	lui	s0,0x1c001
1c0093a6:	c606                	sw	ra,12(sp)
1c0093a8:	e8c40413          	addi	s0,s0,-372 # 1c000e8c <_rt_io_uart>
1c0093ac:	3f55                	jal	1c009360 <__rt_io_uart_wait_pending>
1c0093ae:	4008                	lw	a0,0(s0)
1c0093b0:	4581                	li	a1,0
1c0093b2:	653000ef          	jal	ra,1c00a204 <rt_uart_close>
1c0093b6:	40b2                	lw	ra,12(sp)
1c0093b8:	00042023          	sw	zero,0(s0)
1c0093bc:	4422                	lw	s0,8(sp)
1c0093be:	4501                	li	a0,0
1c0093c0:	0141                	addi	sp,sp,16
1c0093c2:	8082                	ret

1c0093c4 <__rt_io_uart_flush.constprop.5>:
1c0093c4:	1101                	addi	sp,sp,-32
1c0093c6:	ca26                	sw	s1,20(sp)
1c0093c8:	ce06                	sw	ra,28(sp)
1c0093ca:	cc22                	sw	s0,24(sp)
1c0093cc:	c84a                	sw	s2,16(sp)
1c0093ce:	c64e                	sw	s3,12(sp)
1c0093d0:	c452                	sw	s4,8(sp)
1c0093d2:	1c0014b7          	lui	s1,0x1c001
1c0093d6:	e844a783          	lw	a5,-380(s1) # 1c000e84 <__rt_io_pending_flush>
1c0093da:	e8448413          	addi	s0,s1,-380
1c0093de:	e3ad                	bnez	a5,1c009440 <__rt_io_uart_flush.constprop.5+0x7c>
1c0093e0:	1c0019b7          	lui	s3,0x1c001
1c0093e4:	cf498493          	addi	s1,s3,-780 # 1c000cf4 <__hal_debug_struct>
1c0093e8:	0184a903          	lw	s2,24(s1)
1c0093ec:	06090063          	beqz	s2,1c00944c <__rt_io_uart_flush.constprop.5+0x88>
1c0093f0:	3d81                	jal	1c009240 <rt_is_fc>
1c0093f2:	cd29                	beqz	a0,1c00944c <__rt_io_uart_flush.constprop.5+0x88>
1c0093f4:	4785                	li	a5,1
1c0093f6:	c01c                	sw	a5,0(s0)
1c0093f8:	1c0095b7          	lui	a1,0x1c009
1c0093fc:	1c0017b7          	lui	a5,0x1c001
1c009400:	e8c7aa03          	lw	s4,-372(a5) # 1c000e8c <_rt_io_uart>
1c009404:	cf498613          	addi	a2,s3,-780
1c009408:	25258593          	addi	a1,a1,594 # 1c009252 <__rt_io_end_of_flush>
1c00940c:	4501                	li	a0,0
1c00940e:	83bff0ef          	jal	ra,1c008c48 <rt_event_get>
1c009412:	004a2583          	lw	a1,4(s4)
1c009416:	87aa                	mv	a5,a0
1c009418:	0586                	slli	a1,a1,0x1
1c00941a:	4701                	li	a4,0
1c00941c:	86ca                	mv	a3,s2
1c00941e:	01c48613          	addi	a2,s1,28
1c009422:	0585                	addi	a1,a1,1
1c009424:	4501                	li	a0,0
1c009426:	8c4ff0ef          	jal	ra,1c0084ea <rt_periph_copy>
1c00942a:	3d1d                	jal	1c009260 <__rt_io_unlock>
1c00942c:	401c                	lw	a5,0(s0)
1c00942e:	ef89                	bnez	a5,1c009448 <__rt_io_uart_flush.constprop.5+0x84>
1c009430:	4462                	lw	s0,24(sp)
1c009432:	40f2                	lw	ra,28(sp)
1c009434:	44d2                	lw	s1,20(sp)
1c009436:	4942                	lw	s2,16(sp)
1c009438:	49b2                	lw	s3,12(sp)
1c00943a:	4a22                	lw	s4,8(sp)
1c00943c:	6105                	addi	sp,sp,32
1c00943e:	b58d                	j	1c0092a0 <__rt_io_lock>
1c009440:	3505                	jal	1c009260 <__rt_io_unlock>
1c009442:	3ded                	jal	1c00933c <rt_event_execute.isra.0.constprop.6>
1c009444:	3db1                	jal	1c0092a0 <__rt_io_lock>
1c009446:	bf41                	j	1c0093d6 <__rt_io_uart_flush.constprop.5+0x12>
1c009448:	3dd5                	jal	1c00933c <rt_event_execute.isra.0.constprop.6>
1c00944a:	b7cd                	j	1c00942c <__rt_io_uart_flush.constprop.5+0x68>
1c00944c:	40f2                	lw	ra,28(sp)
1c00944e:	4462                	lw	s0,24(sp)
1c009450:	44d2                	lw	s1,20(sp)
1c009452:	4942                	lw	s2,16(sp)
1c009454:	49b2                	lw	s3,12(sp)
1c009456:	4a22                	lw	s4,8(sp)
1c009458:	6105                	addi	sp,sp,32
1c00945a:	8082                	ret

1c00945c <memcpy>:
1c00945c:	00a5e733          	or	a4,a1,a0
1c009460:	fa273733          	p.bclr	a4,a4,29,2
1c009464:	87aa                	mv	a5,a0
1c009466:	c709                	beqz	a4,1c009470 <memcpy+0x14>
1c009468:	962e                	add	a2,a2,a1
1c00946a:	00c59f63          	bne	a1,a2,1c009488 <memcpy+0x2c>
1c00946e:	8082                	ret
1c009470:	fa263733          	p.bclr	a4,a2,29,2
1c009474:	fb75                	bnez	a4,1c009468 <memcpy+0xc>
1c009476:	962e                	add	a2,a2,a1
1c009478:	00c59363          	bne	a1,a2,1c00947e <memcpy+0x22>
1c00947c:	8082                	ret
1c00947e:	0045a70b          	p.lw	a4,4(a1!)
1c009482:	00e7a22b          	p.sw	a4,4(a5!)
1c009486:	bfcd                	j	1c009478 <memcpy+0x1c>
1c009488:	0015c70b          	p.lbu	a4,1(a1!)
1c00948c:	00e780ab          	p.sb	a4,1(a5!)
1c009490:	bfe9                	j	1c00946a <memcpy+0xe>

1c009492 <memmove>:
1c009492:	40b507b3          	sub	a5,a0,a1
1c009496:	00c7e763          	bltu	a5,a2,1c0094a4 <memmove+0x12>
1c00949a:	962a                	add	a2,a2,a0
1c00949c:	87aa                	mv	a5,a0
1c00949e:	00c79f63          	bne	a5,a2,1c0094bc <memmove+0x2a>
1c0094a2:	8082                	ret
1c0094a4:	167d                	addi	a2,a2,-1
1c0094a6:	00c507b3          	add	a5,a0,a2
1c0094aa:	95b2                	add	a1,a1,a2
1c0094ac:	0605                	addi	a2,a2,1
1c0094ae:	004640fb          	lp.setup	x1,a2,1c0094b6 <memmove+0x24>
1c0094b2:	fff5c70b          	p.lbu	a4,-1(a1!)
1c0094b6:	fee78fab          	p.sb	a4,-1(a5!)
1c0094ba:	8082                	ret
1c0094bc:	0015c70b          	p.lbu	a4,1(a1!)
1c0094c0:	00e780ab          	p.sb	a4,1(a5!)
1c0094c4:	bfe9                	j	1c00949e <memmove+0xc>

1c0094c6 <strchr>:
1c0094c6:	0ff5f593          	andi	a1,a1,255
1c0094ca:	00054703          	lbu	a4,0(a0)
1c0094ce:	87aa                	mv	a5,a0
1c0094d0:	0505                	addi	a0,a0,1
1c0094d2:	00b70563          	beq	a4,a1,1c0094dc <strchr+0x16>
1c0094d6:	fb75                	bnez	a4,1c0094ca <strchr+0x4>
1c0094d8:	c191                	beqz	a1,1c0094dc <strchr+0x16>
1c0094da:	4781                	li	a5,0
1c0094dc:	853e                	mv	a0,a5
1c0094de:	8082                	ret

1c0094e0 <__rt_putc_debug_bridge>:
1c0094e0:	1141                	addi	sp,sp,-16
1c0094e2:	c422                	sw	s0,8(sp)
1c0094e4:	1c001437          	lui	s0,0x1c001
1c0094e8:	c226                	sw	s1,4(sp)
1c0094ea:	c606                	sw	ra,12(sp)
1c0094ec:	84aa                	mv	s1,a0
1c0094ee:	cf440413          	addi	s0,s0,-780 # 1c000cf4 <__hal_debug_struct>
1c0094f2:	485c                	lw	a5,20(s0)
1c0094f4:	c789                	beqz	a5,1c0094fe <__rt_putc_debug_bridge+0x1e>
1c0094f6:	06400513          	li	a0,100
1c0094fa:	3ae5                	jal	1c008ef2 <rt_time_wait_us>
1c0094fc:	bfdd                	j	1c0094f2 <__rt_putc_debug_bridge+0x12>
1c0094fe:	4c1c                	lw	a5,24(s0)
1c009500:	00178713          	addi	a4,a5,1
1c009504:	97a2                	add	a5,a5,s0
1c009506:	00978e23          	sb	s1,28(a5)
1c00950a:	cc18                	sw	a4,24(s0)
1c00950c:	4c14                	lw	a3,24(s0)
1c00950e:	08000793          	li	a5,128
1c009512:	00f68463          	beq	a3,a5,1c00951a <__rt_putc_debug_bridge+0x3a>
1c009516:	00a4b663          	p.bneimm	s1,10,1c009522 <__rt_putc_debug_bridge+0x42>
1c00951a:	c701                	beqz	a4,1c009522 <__rt_putc_debug_bridge+0x42>
1c00951c:	c858                	sw	a4,20(s0)
1c00951e:	00042c23          	sw	zero,24(s0)
1c009522:	4c1c                	lw	a5,24(s0)
1c009524:	e799                	bnez	a5,1c009532 <__rt_putc_debug_bridge+0x52>
1c009526:	4422                	lw	s0,8(sp)
1c009528:	40b2                	lw	ra,12(sp)
1c00952a:	4492                	lw	s1,4(sp)
1c00952c:	0141                	addi	sp,sp,16
1c00952e:	d9eff06f          	j	1c008acc <__rt_bridge_printf_flush>
1c009532:	40b2                	lw	ra,12(sp)
1c009534:	4422                	lw	s0,8(sp)
1c009536:	4492                	lw	s1,4(sp)
1c009538:	0141                	addi	sp,sp,16
1c00953a:	8082                	ret

1c00953c <__rt_putc_uart>:
1c00953c:	1101                	addi	sp,sp,-32
1c00953e:	c62a                	sw	a0,12(sp)
1c009540:	ce06                	sw	ra,28(sp)
1c009542:	3d39                	jal	1c009360 <__rt_io_uart_wait_pending>
1c009544:	1c0017b7          	lui	a5,0x1c001
1c009548:	cf478793          	addi	a5,a5,-780 # 1c000cf4 <__hal_debug_struct>
1c00954c:	4f94                	lw	a3,24(a5)
1c00954e:	4532                	lw	a0,12(sp)
1c009550:	00168713          	addi	a4,a3,1 # 1a100001 <__rt_sched+0x1a0ffcf5>
1c009554:	cf98                	sw	a4,24(a5)
1c009556:	97b6                	add	a5,a5,a3
1c009558:	00a78e23          	sb	a0,28(a5)
1c00955c:	08000793          	li	a5,128
1c009560:	00f70463          	beq	a4,a5,1c009568 <__rt_putc_uart+0x2c>
1c009564:	00a53563          	p.bneimm	a0,10,1c00956e <__rt_putc_uart+0x32>
1c009568:	40f2                	lw	ra,28(sp)
1c00956a:	6105                	addi	sp,sp,32
1c00956c:	bda1                	j	1c0093c4 <__rt_io_uart_flush.constprop.5>
1c00956e:	40f2                	lw	ra,28(sp)
1c009570:	6105                	addi	sp,sp,32
1c009572:	8082                	ret

1c009574 <tfp_putc.isra.3>:
1c009574:	1c0017b7          	lui	a5,0x1c001
1c009578:	1141                	addi	sp,sp,-16
1c00957a:	e707a783          	lw	a5,-400(a5) # 1c000e70 <__rt_iodev>
1c00957e:	c422                	sw	s0,8(sp)
1c009580:	c606                	sw	ra,12(sp)
1c009582:	842a                	mv	s0,a0
1c009584:	0427b663          	p.bneimm	a5,2,1c0095d0 <tfp_putc.isra.3+0x5c>
1c009588:	3965                	jal	1c009240 <rt_is_fc>
1c00958a:	c149                	beqz	a0,1c00960c <tfp_putc.isra.3+0x98>
1c00958c:	1c0017b7          	lui	a5,0x1c001
1c009590:	e8878613          	addi	a2,a5,-376 # 1c000e88 <__rt_putc_host_buffer_index>
1c009594:	4214                	lw	a3,0(a2)
1c009596:	1c010537          	lui	a0,0x1c010
1c00959a:	00168713          	addi	a4,a3,1
1c00959e:	c218                	sw	a4,0(a2)
1c0095a0:	06c50613          	addi	a2,a0,108 # 1c01006c <__rt_putc_host_buffer>
1c0095a4:	008646a3          	p.sb	s0,a3(a2)
1c0095a8:	07f00613          	li	a2,127
1c0095ac:	e8878793          	addi	a5,a5,-376
1c0095b0:	06c50693          	addi	a3,a0,108
1c0095b4:	00c70463          	beq	a4,a2,1c0095bc <tfp_putc.isra.3+0x48>
1c0095b8:	04a43a63          	p.bneimm	s0,10,1c00960c <tfp_putc.isra.3+0x98>
1c0095bc:	0006c723          	p.sb	zero,a4(a3)
1c0095c0:	4422                	lw	s0,8(sp)
1c0095c2:	40b2                	lw	ra,12(sp)
1c0095c4:	0007a023          	sw	zero,0(a5)
1c0095c8:	06c50513          	addi	a0,a0,108
1c0095cc:	0141                	addi	sp,sp,16
1c0095ce:	aabd                	j	1c00974c <semihost_write0>
1c0095d0:	1c0017b7          	lui	a5,0x1c001
1c0095d4:	e8c7a783          	lw	a5,-372(a5) # 1c000e8c <_rt_io_uart>
1c0095d8:	c789                	beqz	a5,1c0095e2 <tfp_putc.isra.3+0x6e>
1c0095da:	4422                	lw	s0,8(sp)
1c0095dc:	40b2                	lw	ra,12(sp)
1c0095de:	0141                	addi	sp,sp,16
1c0095e0:	bfb1                	j	1c00953c <__rt_putc_uart>
1c0095e2:	1c0017b7          	lui	a5,0x1c001
1c0095e6:	d047a783          	lw	a5,-764(a5) # 1c000d04 <__hal_debug_struct+0x10>
1c0095ea:	c78d                	beqz	a5,1c009614 <tfp_putc.isra.3+0xa0>
1c0095ec:	6609                	lui	a2,0x2
1c0095ee:	f14027f3          	csrr	a5,mhartid
1c0095f2:	f8060613          	addi	a2,a2,-128 # 1f80 <__rt_sched+0x1c74>
1c0095f6:	00379713          	slli	a4,a5,0x3
1c0095fa:	078a                	slli	a5,a5,0x2
1c0095fc:	ee873733          	p.bclr	a4,a4,23,8
1c009600:	8ff1                	and	a5,a5,a2
1c009602:	97ba                	add	a5,a5,a4
1c009604:	1a10f737          	lui	a4,0x1a10f
1c009608:	00a767a3          	p.sw	a0,a5(a4)
1c00960c:	40b2                	lw	ra,12(sp)
1c00960e:	4422                	lw	s0,8(sp)
1c009610:	0141                	addi	sp,sp,16
1c009612:	8082                	ret
1c009614:	4422                	lw	s0,8(sp)
1c009616:	40b2                	lw	ra,12(sp)
1c009618:	0141                	addi	sp,sp,16
1c00961a:	b5d9                	j	1c0094e0 <__rt_putc_debug_bridge>

1c00961c <fputc_locked>:
1c00961c:	1141                	addi	sp,sp,-16
1c00961e:	c422                	sw	s0,8(sp)
1c009620:	842a                	mv	s0,a0
1c009622:	0ff57513          	andi	a0,a0,255
1c009626:	c606                	sw	ra,12(sp)
1c009628:	37b1                	jal	1c009574 <tfp_putc.isra.3>
1c00962a:	8522                	mv	a0,s0
1c00962c:	40b2                	lw	ra,12(sp)
1c00962e:	4422                	lw	s0,8(sp)
1c009630:	0141                	addi	sp,sp,16
1c009632:	8082                	ret

1c009634 <_prf_locked>:
1c009634:	1101                	addi	sp,sp,-32
1c009636:	ce06                	sw	ra,28(sp)
1c009638:	c02a                	sw	a0,0(sp)
1c00963a:	c62e                	sw	a1,12(sp)
1c00963c:	c432                	sw	a2,8(sp)
1c00963e:	c236                	sw	a3,4(sp)
1c009640:	3185                	jal	1c0092a0 <__rt_io_lock>
1c009642:	4692                	lw	a3,4(sp)
1c009644:	4622                	lw	a2,8(sp)
1c009646:	45b2                	lw	a1,12(sp)
1c009648:	4502                	lw	a0,0(sp)
1c00964a:	2425                	jal	1c009872 <_prf>
1c00964c:	c02a                	sw	a0,0(sp)
1c00964e:	3909                	jal	1c009260 <__rt_io_unlock>
1c009650:	40f2                	lw	ra,28(sp)
1c009652:	4502                	lw	a0,0(sp)
1c009654:	6105                	addi	sp,sp,32
1c009656:	8082                	ret

1c009658 <exit>:
1c009658:	1141                	addi	sp,sp,-16
1c00965a:	c422                	sw	s0,8(sp)
1c00965c:	1a104437          	lui	s0,0x1a104
1c009660:	c04a                	sw	s2,0(sp)
1c009662:	0a040793          	addi	a5,s0,160 # 1a1040a0 <__rt_sched+0x1a103d94>
1c009666:	c606                	sw	ra,12(sp)
1c009668:	c226                	sw	s1,4(sp)
1c00966a:	c1f54933          	p.bset	s2,a0,0,31
1c00966e:	0127a023          	sw	s2,0(a5)
1c009672:	1c0017b7          	lui	a5,0x1c001
1c009676:	e707a783          	lw	a5,-400(a5) # 1c000e70 <__rt_iodev>
1c00967a:	0027be63          	p.bneimm	a5,2,1c009696 <exit+0x3e>
1c00967e:	c519                	beqz	a0,1c00968c <exit+0x34>
1c009680:	00020537          	lui	a0,0x20
1c009684:	02350513          	addi	a0,a0,35 # 20023 <__rt_sched+0x1fd17>
1c009688:	20e9                	jal	1c009752 <semihost_exit>
1c00968a:	a001                	j	1c00968a <exit+0x32>
1c00968c:	00020537          	lui	a0,0x20
1c009690:	02650513          	addi	a0,a0,38 # 20026 <__rt_sched+0x1fd1a>
1c009694:	bfd5                	j	1c009688 <exit+0x30>
1c009696:	1c0014b7          	lui	s1,0x1c001
1c00969a:	cf448493          	addi	s1,s1,-780 # 1c000cf4 <__hal_debug_struct>
1c00969e:	c2eff0ef          	jal	ra,1c008acc <__rt_bridge_printf_flush>
1c0096a2:	0124a623          	sw	s2,12(s1)
1c0096a6:	be8ff0ef          	jal	ra,1c008a8e <__rt_bridge_send_notif>
1c0096aa:	449c                	lw	a5,8(s1)
1c0096ac:	dff9                	beqz	a5,1c00968a <exit+0x32>
1c0096ae:	07440413          	addi	s0,s0,116
1c0096b2:	401c                	lw	a5,0(s0)
1c0096b4:	83a5                	srli	a5,a5,0x9
1c0096b6:	f837b7b3          	p.bclr	a5,a5,28,3
1c0096ba:	fe77bce3          	p.bneimm	a5,7,1c0096b2 <exit+0x5a>
1c0096be:	bf0ff0ef          	jal	ra,1c008aae <__rt_bridge_clear_notif>
1c0096c2:	b7e1                	j	1c00968a <exit+0x32>

1c0096c4 <abort>:
1c0096c4:	1141                	addi	sp,sp,-16
1c0096c6:	557d                	li	a0,-1
1c0096c8:	c606                	sw	ra,12(sp)
1c0096ca:	3779                	jal	1c009658 <exit>

1c0096cc <__rt_io_init>:
1c0096cc:	1c0017b7          	lui	a5,0x1c001
1c0096d0:	e807a423          	sw	zero,-376(a5) # 1c000e88 <__rt_putc_host_buffer_index>
1c0096d4:	1c0017b7          	lui	a5,0x1c001
1c0096d8:	ce478793          	addi	a5,a5,-796 # 1c000ce4 <__rt_io_fc_lock>
1c0096dc:	0007a223          	sw	zero,4(a5)
1c0096e0:	0007a023          	sw	zero,0(a5)
1c0096e4:	0007a623          	sw	zero,12(a5)
1c0096e8:	1c0017b7          	lui	a5,0x1c001
1c0096ec:	e807a623          	sw	zero,-372(a5) # 1c000e8c <_rt_io_uart>
1c0096f0:	1c0017b7          	lui	a5,0x1c001
1c0096f4:	e807a023          	sw	zero,-384(a5) # 1c000e80 <__rt_io_event_current>
1c0096f8:	1c0017b7          	lui	a5,0x1c001
1c0096fc:	e707a783          	lw	a5,-400(a5) # 1c000e70 <__rt_iodev>
1c009700:	0217be63          	p.bneimm	a5,1,1c00973c <__rt_io_init+0x70>
1c009704:	1c0095b7          	lui	a1,0x1c009
1c009708:	1141                	addi	sp,sp,-16
1c00970a:	4601                	li	a2,0
1c00970c:	2e058593          	addi	a1,a1,736 # 1c0092e0 <__rt_io_start>
1c009710:	4501                	li	a0,0
1c009712:	c606                	sw	ra,12(sp)
1c009714:	948ff0ef          	jal	ra,1c00885c <__rt_cbsys_add>
1c009718:	1c0095b7          	lui	a1,0x1c009
1c00971c:	39e58593          	addi	a1,a1,926 # 1c00939e <__rt_io_stop>
1c009720:	4601                	li	a2,0
1c009722:	4505                	li	a0,1
1c009724:	938ff0ef          	jal	ra,1c00885c <__rt_cbsys_add>
1c009728:	1c0017b7          	lui	a5,0x1c001
1c00972c:	40b2                	lw	ra,12(sp)
1c00972e:	e807a223          	sw	zero,-380(a5) # 1c000e84 <__rt_io_pending_flush>
1c009732:	4585                	li	a1,1
1c009734:	4501                	li	a0,0
1c009736:	0141                	addi	sp,sp,16
1c009738:	c9aff06f          	j	1c008bd2 <rt_event_alloc>
1c00973c:	8082                	ret

1c00973e <__internal_semihost>:
1c00973e:	01f01013          	slli	zero,zero,0x1f
1c009742:	00100073          	ebreak
1c009746:	40705013          	srai	zero,zero,0x7
1c00974a:	8082                	ret

1c00974c <semihost_write0>:
1c00974c:	85aa                	mv	a1,a0
1c00974e:	4511                	li	a0,4
1c009750:	b7fd                	j	1c00973e <__internal_semihost>

1c009752 <semihost_exit>:
1c009752:	85aa                	mv	a1,a0
1c009754:	4561                	li	a0,24
1c009756:	b7e5                	j	1c00973e <__internal_semihost>

1c009758 <printf>:
1c009758:	7139                	addi	sp,sp,-64
1c00975a:	d432                	sw	a2,40(sp)
1c00975c:	862a                	mv	a2,a0
1c00975e:	1c009537          	lui	a0,0x1c009
1c009762:	d22e                	sw	a1,36(sp)
1c009764:	d636                	sw	a3,44(sp)
1c009766:	4589                	li	a1,2
1c009768:	1054                	addi	a3,sp,36
1c00976a:	61c50513          	addi	a0,a0,1564 # 1c00961c <fputc_locked>
1c00976e:	ce06                	sw	ra,28(sp)
1c009770:	d83a                	sw	a4,48(sp)
1c009772:	da3e                	sw	a5,52(sp)
1c009774:	dc42                	sw	a6,56(sp)
1c009776:	de46                	sw	a7,60(sp)
1c009778:	c636                	sw	a3,12(sp)
1c00977a:	3d6d                	jal	1c009634 <_prf_locked>
1c00977c:	40f2                	lw	ra,28(sp)
1c00977e:	6121                	addi	sp,sp,64
1c009780:	8082                	ret

1c009782 <_to_x>:
1c009782:	872a                	mv	a4,a0
1c009784:	87aa                	mv	a5,a0
1c009786:	4325                	li	t1,9
1c009788:	02c5f8b3          	remu	a7,a1,a2
1c00978c:	02700513          	li	a0,39
1c009790:	02c5d5b3          	divu	a1,a1,a2
1c009794:	0ff8f813          	andi	a6,a7,255
1c009798:	01136363          	bltu	t1,a7,1c00979e <_to_x+0x1c>
1c00979c:	4501                	li	a0,0
1c00979e:	03080813          	addi	a6,a6,48
1c0097a2:	9542                	add	a0,a0,a6
1c0097a4:	00a780ab          	p.sb	a0,1(a5!)
1c0097a8:	f1e5                	bnez	a1,1c009788 <_to_x+0x6>
1c0097aa:	03000613          	li	a2,48
1c0097ae:	40e78533          	sub	a0,a5,a4
1c0097b2:	00d54763          	blt	a0,a3,1c0097c0 <_to_x+0x3e>
1c0097b6:	fe078fab          	p.sb	zero,-1(a5!)
1c0097ba:	00f76663          	bltu	a4,a5,1c0097c6 <_to_x+0x44>
1c0097be:	8082                	ret
1c0097c0:	00c780ab          	p.sb	a2,1(a5!)
1c0097c4:	b7ed                	j	1c0097ae <_to_x+0x2c>
1c0097c6:	00074603          	lbu	a2,0(a4) # 1a10f000 <__rt_sched+0x1a10ecf4>
1c0097ca:	0007c683          	lbu	a3,0(a5)
1c0097ce:	fec78fab          	p.sb	a2,-1(a5!)
1c0097d2:	00d700ab          	p.sb	a3,1(a4!)
1c0097d6:	b7d5                	j	1c0097ba <_to_x+0x38>

1c0097d8 <_rlrshift>:
1c0097d8:	411c                	lw	a5,0(a0)
1c0097da:	4154                	lw	a3,4(a0)
1c0097dc:	fc17b733          	p.bclr	a4,a5,30,1
1c0097e0:	01f69613          	slli	a2,a3,0x1f
1c0097e4:	8385                	srli	a5,a5,0x1
1c0097e6:	8fd1                	or	a5,a5,a2
1c0097e8:	97ba                	add	a5,a5,a4
1c0097ea:	8285                	srli	a3,a3,0x1
1c0097ec:	00e7b733          	sltu	a4,a5,a4
1c0097f0:	9736                	add	a4,a4,a3
1c0097f2:	c11c                	sw	a5,0(a0)
1c0097f4:	c158                	sw	a4,4(a0)
1c0097f6:	8082                	ret

1c0097f8 <_ldiv5>:
1c0097f8:	4118                	lw	a4,0(a0)
1c0097fa:	4154                	lw	a3,4(a0)
1c0097fc:	00270793          	addi	a5,a4,2
1c009800:	00e7b733          	sltu	a4,a5,a4
1c009804:	4615                	li	a2,5
1c009806:	9736                	add	a4,a4,a3
1c009808:	02c755b3          	divu	a1,a4,a2
1c00980c:	42b61733          	p.msu	a4,a2,a1
1c009810:	01d71693          	slli	a3,a4,0x1d
1c009814:	0037d713          	srli	a4,a5,0x3
1c009818:	8f55                	or	a4,a4,a3
1c00981a:	02c75733          	divu	a4,a4,a2
1c00981e:	01d75693          	srli	a3,a4,0x1d
1c009822:	070e                	slli	a4,a4,0x3
1c009824:	42e617b3          	p.msu	a5,a2,a4
1c009828:	02c7d7b3          	divu	a5,a5,a2
1c00982c:	973e                	add	a4,a4,a5
1c00982e:	95b6                	add	a1,a1,a3
1c009830:	00f737b3          	sltu	a5,a4,a5
1c009834:	97ae                	add	a5,a5,a1
1c009836:	c118                	sw	a4,0(a0)
1c009838:	c15c                	sw	a5,4(a0)
1c00983a:	8082                	ret

1c00983c <_get_digit>:
1c00983c:	419c                	lw	a5,0(a1)
1c00983e:	03000713          	li	a4,48
1c009842:	02f05563          	blez	a5,1c00986c <_get_digit+0x30>
1c009846:	17fd                	addi	a5,a5,-1
1c009848:	c19c                	sw	a5,0(a1)
1c00984a:	411c                	lw	a5,0(a0)
1c00984c:	4729                	li	a4,10
1c00984e:	4150                	lw	a2,4(a0)
1c009850:	02f706b3          	mul	a3,a4,a5
1c009854:	02f737b3          	mulhu	a5,a4,a5
1c009858:	42c707b3          	p.mac	a5,a4,a2
1c00985c:	01c7d713          	srli	a4,a5,0x1c
1c009860:	c7c7b7b3          	p.bclr	a5,a5,3,28
1c009864:	03070713          	addi	a4,a4,48
1c009868:	c114                	sw	a3,0(a0)
1c00986a:	c15c                	sw	a5,4(a0)
1c00986c:	0ff77513          	andi	a0,a4,255
1c009870:	8082                	ret

1c009872 <_prf>:
1c009872:	714d                	addi	sp,sp,-336
1c009874:	14912223          	sw	s1,324(sp)
1c009878:	15212023          	sw	s2,320(sp)
1c00987c:	13812423          	sw	s8,296(sp)
1c009880:	14112623          	sw	ra,332(sp)
1c009884:	14812423          	sw	s0,328(sp)
1c009888:	13312e23          	sw	s3,316(sp)
1c00988c:	13412c23          	sw	s4,312(sp)
1c009890:	13512a23          	sw	s5,308(sp)
1c009894:	13612823          	sw	s6,304(sp)
1c009898:	13712623          	sw	s7,300(sp)
1c00989c:	13912223          	sw	s9,292(sp)
1c0098a0:	13a12023          	sw	s10,288(sp)
1c0098a4:	11b12e23          	sw	s11,284(sp)
1c0098a8:	cc2a                	sw	a0,24(sp)
1c0098aa:	ce2e                	sw	a1,28(sp)
1c0098ac:	84b2                	mv	s1,a2
1c0098ae:	8c36                	mv	s8,a3
1c0098b0:	4901                	li	s2,0
1c0098b2:	0004c503          	lbu	a0,0(s1)
1c0098b6:	00148b93          	addi	s7,s1,1
1c0098ba:	c919                	beqz	a0,1c0098d0 <_prf+0x5e>
1c0098bc:	02500793          	li	a5,37
1c0098c0:	14f50563          	beq	a0,a5,1c009a0a <_prf+0x198>
1c0098c4:	45f2                	lw	a1,28(sp)
1c0098c6:	4762                	lw	a4,24(sp)
1c0098c8:	9702                	jalr	a4
1c0098ca:	05f53063          	p.bneimm	a0,-1,1c00990a <_prf+0x98>
1c0098ce:	597d                	li	s2,-1
1c0098d0:	14c12083          	lw	ra,332(sp)
1c0098d4:	14812403          	lw	s0,328(sp)
1c0098d8:	854a                	mv	a0,s2
1c0098da:	14412483          	lw	s1,324(sp)
1c0098de:	14012903          	lw	s2,320(sp)
1c0098e2:	13c12983          	lw	s3,316(sp)
1c0098e6:	13812a03          	lw	s4,312(sp)
1c0098ea:	13412a83          	lw	s5,308(sp)
1c0098ee:	13012b03          	lw	s6,304(sp)
1c0098f2:	12c12b83          	lw	s7,300(sp)
1c0098f6:	12812c03          	lw	s8,296(sp)
1c0098fa:	12412c83          	lw	s9,292(sp)
1c0098fe:	12012d03          	lw	s10,288(sp)
1c009902:	11c12d83          	lw	s11,284(sp)
1c009906:	6171                	addi	sp,sp,336
1c009908:	8082                	ret
1c00990a:	0905                	addi	s2,s2,1
1c00990c:	8a62                	mv	s4,s8
1c00990e:	84de                	mv	s1,s7
1c009910:	8c52                	mv	s8,s4
1c009912:	b745                	j	1c0098b2 <_prf+0x40>
1c009914:	0f3a8263          	beq	s5,s3,1c0099f8 <_prf+0x186>
1c009918:	0d59e563          	bltu	s3,s5,1c0099e2 <_prf+0x170>
1c00991c:	fa0a8ae3          	beqz	s5,1c0098d0 <_prf+0x5e>
1c009920:	0dba8a63          	beq	s5,s11,1c0099f4 <_prf+0x182>
1c009924:	8ba6                	mv	s7,s1
1c009926:	000bca83          	lbu	s5,0(s7)
1c00992a:	1c0007b7          	lui	a5,0x1c000
1c00992e:	85d6                	mv	a1,s5
1c009930:	45c78513          	addi	a0,a5,1116 # 1c00045c <__DTOR_END__+0x104>
1c009934:	001b8493          	addi	s1,s7,1
1c009938:	3679                	jal	1c0094c6 <strchr>
1c00993a:	fd69                	bnez	a0,1c009914 <_prf+0xa2>
1c00993c:	02a00693          	li	a3,42
1c009940:	0eda9763          	bne	s5,a3,1c009a2e <_prf+0x1bc>
1c009944:	000c2983          	lw	s3,0(s8)
1c009948:	004c0693          	addi	a3,s8,4
1c00994c:	0009d663          	bgez	s3,1c009958 <_prf+0xe6>
1c009950:	4705                	li	a4,1
1c009952:	413009b3          	neg	s3,s3
1c009956:	ca3a                	sw	a4,20(sp)
1c009958:	0004ca83          	lbu	s5,0(s1)
1c00995c:	8c36                	mv	s8,a3
1c00995e:	002b8493          	addi	s1,s7,2
1c009962:	0c800713          	li	a4,200
1c009966:	02e00693          	li	a3,46
1c00996a:	04e9d9b3          	p.minu	s3,s3,a4
1c00996e:	5d7d                	li	s10,-1
1c009970:	02da9463          	bne	s5,a3,1c009998 <_prf+0x126>
1c009974:	0004c703          	lbu	a4,0(s1)
1c009978:	02a00793          	li	a5,42
1c00997c:	0ef71c63          	bne	a4,a5,1c009a74 <_prf+0x202>
1c009980:	000c2d03          	lw	s10,0(s8)
1c009984:	0485                	addi	s1,s1,1
1c009986:	0c11                	addi	s8,s8,4
1c009988:	0c800793          	li	a5,200
1c00998c:	01a7d363          	ble	s10,a5,1c009992 <_prf+0x120>
1c009990:	5d7d                	li	s10,-1
1c009992:	0004ca83          	lbu	s5,0(s1)
1c009996:	0485                	addi	s1,s1,1
1c009998:	1c0007b7          	lui	a5,0x1c000
1c00999c:	85d6                	mv	a1,s5
1c00999e:	46478513          	addi	a0,a5,1124 # 1c000464 <__DTOR_END__+0x10c>
1c0099a2:	3615                	jal	1c0094c6 <strchr>
1c0099a4:	c501                	beqz	a0,1c0099ac <_prf+0x13a>
1c0099a6:	0004ca83          	lbu	s5,0(s1)
1c0099aa:	0485                	addi	s1,s1,1
1c0099ac:	06700693          	li	a3,103
1c0099b0:	1356c563          	blt	a3,s5,1c009ada <_prf+0x268>
1c0099b4:	06500693          	li	a3,101
1c0099b8:	20dad063          	ble	a3,s5,1c009bb8 <_prf+0x346>
1c0099bc:	04700693          	li	a3,71
1c0099c0:	0b56ce63          	blt	a3,s5,1c009a7c <_prf+0x20a>
1c0099c4:	04500693          	li	a3,69
1c0099c8:	1edad863          	ble	a3,s5,1c009bb8 <_prf+0x346>
1c0099cc:	f00a82e3          	beqz	s5,1c0098d0 <_prf+0x5e>
1c0099d0:	02500713          	li	a4,37
1c0099d4:	64ea8963          	beq	s5,a4,1c00a026 <_prf+0x7b4>
1c0099d8:	0c800713          	li	a4,200
1c0099dc:	65575d63          	ble	s5,a4,1c00a036 <_prf+0x7c4>
1c0099e0:	b5fd                	j	1c0098ce <_prf+0x5c>
1c0099e2:	034a8163          	beq	s5,s4,1c009a04 <_prf+0x192>
1c0099e6:	016a8b63          	beq	s5,s6,1c0099fc <_prf+0x18a>
1c0099ea:	f3aa9de3          	bne	s5,s10,1c009924 <_prf+0xb2>
1c0099ee:	4785                	li	a5,1
1c0099f0:	c83e                	sw	a5,16(sp)
1c0099f2:	bf0d                	j	1c009924 <_prf+0xb2>
1c0099f4:	4405                	li	s0,1
1c0099f6:	b73d                	j	1c009924 <_prf+0xb2>
1c0099f8:	4c85                	li	s9,1
1c0099fa:	b72d                	j	1c009924 <_prf+0xb2>
1c0099fc:	03000713          	li	a4,48
1c009a00:	c63a                	sw	a4,12(sp)
1c009a02:	b70d                	j	1c009924 <_prf+0xb2>
1c009a04:	4785                	li	a5,1
1c009a06:	ca3e                	sw	a5,20(sp)
1c009a08:	bf31                	j	1c009924 <_prf+0xb2>
1c009a0a:	02000713          	li	a4,32
1c009a0e:	c63a                	sw	a4,12(sp)
1c009a10:	4401                	li	s0,0
1c009a12:	c802                	sw	zero,16(sp)
1c009a14:	ca02                	sw	zero,20(sp)
1c009a16:	4c81                	li	s9,0
1c009a18:	02300993          	li	s3,35
1c009a1c:	02d00a13          	li	s4,45
1c009a20:	03000b13          	li	s6,48
1c009a24:	02b00d13          	li	s10,43
1c009a28:	02000d93          	li	s11,32
1c009a2c:	bded                	j	1c009926 <_prf+0xb4>
1c009a2e:	fd0a8693          	addi	a3,s5,-48
1c009a32:	4625                	li	a2,9
1c009a34:	4981                	li	s3,0
1c009a36:	f2d666e3          	bltu	a2,a3,1c009962 <_prf+0xf0>
1c009a3a:	46a5                	li	a3,9
1c009a3c:	45a9                	li	a1,10
1c009a3e:	84de                	mv	s1,s7
1c009a40:	0014c70b          	p.lbu	a4,1(s1!)
1c009a44:	fd070613          	addi	a2,a4,-48
1c009a48:	8aba                	mv	s5,a4
1c009a4a:	f0c6ece3          	bltu	a3,a2,1c009962 <_prf+0xf0>
1c009a4e:	42b98733          	p.mac	a4,s3,a1
1c009a52:	fd070993          	addi	s3,a4,-48
1c009a56:	8ba6                	mv	s7,s1
1c009a58:	b7dd                	j	1c009a3e <_prf+0x1cc>
1c009a5a:	42ad07b3          	p.mac	a5,s10,a0
1c009a5e:	fd078d13          	addi	s10,a5,-48
1c009a62:	84b6                	mv	s1,a3
1c009a64:	86a6                	mv	a3,s1
1c009a66:	0016c78b          	p.lbu	a5,1(a3!)
1c009a6a:	fd078593          	addi	a1,a5,-48
1c009a6e:	feb676e3          	bleu	a1,a2,1c009a5a <_prf+0x1e8>
1c009a72:	bf19                	j	1c009988 <_prf+0x116>
1c009a74:	4d01                	li	s10,0
1c009a76:	4625                	li	a2,9
1c009a78:	4529                	li	a0,10
1c009a7a:	b7ed                	j	1c009a64 <_prf+0x1f2>
1c009a7c:	06300693          	li	a3,99
1c009a80:	0cda8e63          	beq	s5,a3,1c009b5c <_prf+0x2ea>
1c009a84:	0756cb63          	blt	a3,s5,1c009afa <_prf+0x288>
1c009a88:	05800693          	li	a3,88
1c009a8c:	f4da96e3          	bne	s5,a3,1c0099d8 <_prf+0x166>
1c009a90:	04410b93          	addi	s7,sp,68
1c009a94:	004c0a13          	addi	s4,s8,4
1c009a98:	000c2583          	lw	a1,0(s8)
1c009a9c:	845e                	mv	s0,s7
1c009a9e:	000c8963          	beqz	s9,1c009ab0 <_prf+0x23e>
1c009aa2:	76e1                	lui	a3,0xffff8
1c009aa4:	8306c693          	xori	a3,a3,-2000
1c009aa8:	04d11223          	sh	a3,68(sp)
1c009aac:	04610413          	addi	s0,sp,70
1c009ab0:	86ea                	mv	a3,s10
1c009ab2:	4641                	li	a2,16
1c009ab4:	8522                	mv	a0,s0
1c009ab6:	31f1                	jal	1c009782 <_to_x>
1c009ab8:	05800693          	li	a3,88
1c009abc:	00da9863          	bne	s5,a3,1c009acc <_prf+0x25a>
1c009ac0:	86de                	mv	a3,s7
1c009ac2:	45e5                	li	a1,25
1c009ac4:	0016c78b          	p.lbu	a5,1(a3!) # ffff8001 <pulp__FC+0xffff8002>
1c009ac8:	54079563          	bnez	a5,1c00a012 <_prf+0x7a0>
1c009acc:	41740433          	sub	s0,s0,s7
1c009ad0:	9522                	add	a0,a0,s0
1c009ad2:	01903433          	snez	s0,s9
1c009ad6:	0406                	slli	s0,s0,0x1
1c009ad8:	a0e9                	j	1c009ba2 <_prf+0x330>
1c009ada:	07000693          	li	a3,112
1c009ade:	4eda8363          	beq	s5,a3,1c009fc4 <_prf+0x752>
1c009ae2:	0556c163          	blt	a3,s5,1c009b24 <_prf+0x2b2>
1c009ae6:	06e00693          	li	a3,110
1c009aea:	46da8063          	beq	s5,a3,1c009f4a <_prf+0x6d8>
1c009aee:	4756c563          	blt	a3,s5,1c009f58 <_prf+0x6e6>
1c009af2:	06900693          	li	a3,105
1c009af6:	eeda91e3          	bne	s5,a3,1c0099d8 <_prf+0x166>
1c009afa:	000c2a83          	lw	s5,0(s8)
1c009afe:	004c0a13          	addi	s4,s8,4
1c009b02:	04410b13          	addi	s6,sp,68
1c009b06:	060ad663          	bgez	s5,1c009b72 <_prf+0x300>
1c009b0a:	02d00693          	li	a3,45
1c009b0e:	04d10223          	sb	a3,68(sp)
1c009b12:	80000737          	lui	a4,0x80000
1c009b16:	415005b3          	neg	a1,s5
1c009b1a:	06ea9663          	bne	s5,a4,1c009b86 <_prf+0x314>
1c009b1e:	800005b7          	lui	a1,0x80000
1c009b22:	a095                	j	1c009b86 <_prf+0x314>
1c009b24:	07500693          	li	a3,117
1c009b28:	4cda8b63          	beq	s5,a3,1c009ffe <_prf+0x78c>
1c009b2c:	07800693          	li	a3,120
1c009b30:	f6da80e3          	beq	s5,a3,1c009a90 <_prf+0x21e>
1c009b34:	07300693          	li	a3,115
1c009b38:	eada90e3          	bne	s5,a3,1c0099d8 <_prf+0x166>
1c009b3c:	000c2583          	lw	a1,0(s8)
1c009b40:	004c0a13          	addi	s4,s8,4
1c009b44:	86ae                	mv	a3,a1
1c009b46:	4c81                	li	s9,0
1c009b48:	0c8350fb          	lp.setupi	x1,200,1c009b54 <_prf+0x2e2>
1c009b4c:	0016c60b          	p.lbu	a2,1(a3!)
1c009b50:	48060c63          	beqz	a2,1c009fe8 <_prf+0x776>
1c009b54:	0c85                	addi	s9,s9,1
1c009b56:	480d5b63          	bgez	s10,1c009fec <_prf+0x77a>
1c009b5a:	a969                	j	1c009ff4 <_prf+0x782>
1c009b5c:	000c2783          	lw	a5,0(s8)
1c009b60:	004c0a13          	addi	s4,s8,4
1c009b64:	04f10223          	sb	a5,68(sp)
1c009b68:	040102a3          	sb	zero,69(sp)
1c009b6c:	4c85                	li	s9,1
1c009b6e:	4401                	li	s0,0
1c009b70:	a139                	j	1c009f7e <_prf+0x70c>
1c009b72:	47c2                	lw	a5,16(sp)
1c009b74:	02b00693          	li	a3,43
1c009b78:	e781                	bnez	a5,1c009b80 <_prf+0x30e>
1c009b7a:	c815                	beqz	s0,1c009bae <_prf+0x33c>
1c009b7c:	02000693          	li	a3,32
1c009b80:	04d10223          	sb	a3,68(sp)
1c009b84:	85d6                	mv	a1,s5
1c009b86:	04510c13          	addi	s8,sp,69
1c009b8a:	86ea                	mv	a3,s10
1c009b8c:	4629                	li	a2,10
1c009b8e:	8562                	mv	a0,s8
1c009b90:	3ecd                	jal	1c009782 <_to_x>
1c009b92:	4742                	lw	a4,16(sp)
1c009b94:	9562                	add	a0,a0,s8
1c009b96:	41650533          	sub	a0,a0,s6
1c009b9a:	ef09                	bnez	a4,1c009bb4 <_prf+0x342>
1c009b9c:	e019                	bnez	s0,1c009ba2 <_prf+0x330>
1c009b9e:	01fad413          	srli	s0,s5,0x1f
1c009ba2:	0bfd2363          	p.beqimm	s10,-1,1c009c48 <_prf+0x3d6>
1c009ba6:	02000713          	li	a4,32
1c009baa:	c63a                	sw	a4,12(sp)
1c009bac:	a871                	j	1c009c48 <_prf+0x3d6>
1c009bae:	85d6                	mv	a1,s5
1c009bb0:	8c5a                	mv	s8,s6
1c009bb2:	bfe1                	j	1c009b8a <_prf+0x318>
1c009bb4:	4442                	lw	s0,16(sp)
1c009bb6:	b7f5                	j	1c009ba2 <_prf+0x330>
1c009bb8:	0c1d                	addi	s8,s8,7
1c009bba:	c40c3c33          	p.bclr	s8,s8,2,0
1c009bbe:	000c2883          	lw	a7,0(s8)
1c009bc2:	004c2303          	lw	t1,4(s8)
1c009bc6:	0158d593          	srli	a1,a7,0x15
1c009bca:	00b31693          	slli	a3,t1,0xb
1c009bce:	800007b7          	lui	a5,0x80000
1c009bd2:	8ecd                	or	a3,a3,a1
1c009bd4:	fff7c793          	not	a5,a5
1c009bd8:	01435613          	srli	a2,t1,0x14
1c009bdc:	08ae                	slli	a7,a7,0xb
1c009bde:	8efd                	and	a3,a3,a5
1c009be0:	e8b63633          	p.bclr	a2,a2,20,11
1c009be4:	d846                	sw	a7,48(sp)
1c009be6:	da36                	sw	a3,52(sp)
1c009be8:	7ff00593          	li	a1,2047
1c009bec:	008c0a13          	addi	s4,s8,8
1c009bf0:	08b61d63          	bne	a2,a1,1c009c8a <_prf+0x418>
1c009bf4:	00d0                	addi	a2,sp,68
1c009bf6:	8732                	mv	a4,a2
1c009bf8:	00035863          	bgez	t1,1c009c08 <_prf+0x396>
1c009bfc:	02d00713          	li	a4,45
1c009c00:	04e10223          	sb	a4,68(sp)
1c009c04:	04510713          	addi	a4,sp,69
1c009c08:	00d8e6b3          	or	a3,a7,a3
1c009c0c:	fbfa8793          	addi	a5,s5,-65
1c009c10:	00370513          	addi	a0,a4,3 # 80000003 <pulp__FC+0x80000004>
1c009c14:	eaa1                	bnez	a3,1c009c64 <_prf+0x3f2>
1c009c16:	46e5                	li	a3,25
1c009c18:	02f6ee63          	bltu	a3,a5,1c009c54 <_prf+0x3e2>
1c009c1c:	6795                	lui	a5,0x5
1c009c1e:	e4978793          	addi	a5,a5,-439 # 4e49 <__rt_sched+0x4b3d>
1c009c22:	00f71023          	sh	a5,0(a4)
1c009c26:	04600793          	li	a5,70
1c009c2a:	00f70123          	sb	a5,2(a4)
1c009c2e:	000701a3          	sb	zero,3(a4)
1c009c32:	8d11                	sub	a0,a0,a2
1c009c34:	47c2                	lw	a5,16(sp)
1c009c36:	44079e63          	bnez	a5,1c00a092 <_prf+0x820>
1c009c3a:	e419                	bnez	s0,1c009c48 <_prf+0x3d6>
1c009c3c:	04414403          	lbu	s0,68(sp)
1c009c40:	fd340413          	addi	s0,s0,-45
1c009c44:	00143413          	seqz	s0,s0
1c009c48:	0c800793          	li	a5,200
1c009c4c:	c8a7c1e3          	blt	a5,a0,1c0098ce <_prf+0x5c>
1c009c50:	8caa                	mv	s9,a0
1c009c52:	a635                	j	1c009f7e <_prf+0x70c>
1c009c54:	679d                	lui	a5,0x7
1c009c56:	e6978793          	addi	a5,a5,-407 # 6e69 <__rt_sched+0x6b5d>
1c009c5a:	00f71023          	sh	a5,0(a4)
1c009c5e:	06600793          	li	a5,102
1c009c62:	b7e1                	j	1c009c2a <_prf+0x3b8>
1c009c64:	46e5                	li	a3,25
1c009c66:	00f6ea63          	bltu	a3,a5,1c009c7a <_prf+0x408>
1c009c6a:	6791                	lui	a5,0x4
1c009c6c:	14e78793          	addi	a5,a5,334 # 414e <__rt_sched+0x3e42>
1c009c70:	00f71023          	sh	a5,0(a4)
1c009c74:	04e00793          	li	a5,78
1c009c78:	bf4d                	j	1c009c2a <_prf+0x3b8>
1c009c7a:	6799                	lui	a5,0x6
1c009c7c:	16e78793          	addi	a5,a5,366 # 616e <__rt_sched+0x5e62>
1c009c80:	00f71023          	sh	a5,0(a4)
1c009c84:	06e00793          	li	a5,110
1c009c88:	b74d                	j	1c009c2a <_prf+0x3b8>
1c009c8a:	04600593          	li	a1,70
1c009c8e:	00ba9463          	bne	s5,a1,1c009c96 <_prf+0x424>
1c009c92:	06600a93          	li	s5,102
1c009c96:	011665b3          	or	a1,a2,a7
1c009c9a:	8dd5                	or	a1,a1,a3
1c009c9c:	c5d1                	beqz	a1,1c009d28 <_prf+0x4b6>
1c009c9e:	80000737          	lui	a4,0x80000
1c009ca2:	8ed9                	or	a3,a3,a4
1c009ca4:	da36                	sw	a3,52(sp)
1c009ca6:	d846                	sw	a7,48(sp)
1c009ca8:	c0260c13          	addi	s8,a2,-1022
1c009cac:	02d00693          	li	a3,45
1c009cb0:	00034b63          	bltz	t1,1c009cc6 <_prf+0x454>
1c009cb4:	47c2                	lw	a5,16(sp)
1c009cb6:	02b00693          	li	a3,43
1c009cba:	e791                	bnez	a5,1c009cc6 <_prf+0x454>
1c009cbc:	04410b13          	addi	s6,sp,68
1c009cc0:	c419                	beqz	s0,1c009cce <_prf+0x45c>
1c009cc2:	02000693          	li	a3,32
1c009cc6:	04d10223          	sb	a3,68(sp)
1c009cca:	04510b13          	addi	s6,sp,69
1c009cce:	4b81                	li	s7,0
1c009cd0:	55f9                	li	a1,-2
1c009cd2:	04bc4f63          	blt	s8,a1,1c009d30 <_prf+0x4be>
1c009cd6:	0b804563          	bgtz	s8,1c009d80 <_prf+0x50e>
1c009cda:	1808                	addi	a0,sp,48
1c009cdc:	0c05                	addi	s8,s8,1
1c009cde:	3ced                	jal	1c0097d8 <_rlrshift>
1c009ce0:	fe4c3de3          	p.bneimm	s8,4,1c009cda <_prf+0x468>
1c009ce4:	000d5363          	bgez	s10,1c009cea <_prf+0x478>
1c009ce8:	4d19                	li	s10,6
1c009cea:	c05ab5b3          	p.bclr	a1,s5,0,5
1c009cee:	04700513          	li	a0,71
1c009cf2:	0ca59263          	bne	a1,a0,1c009db6 <_prf+0x544>
1c009cf6:	4c01                	li	s8,0
1c009cf8:	000c9463          	bnez	s9,1c009d00 <_prf+0x48e>
1c009cfc:	01a03c33          	snez	s8,s10
1c009d00:	55f5                	li	a1,-3
1c009d02:	00bbc663          	blt	s7,a1,1c009d0e <_prf+0x49c>
1c009d06:	001d0593          	addi	a1,s10,1
1c009d0a:	0b75db63          	ble	s7,a1,1c009dc0 <_prf+0x54e>
1c009d0e:	06700593          	li	a1,103
1c009d12:	14ba8663          	beq	s5,a1,1c009e5e <_prf+0x5ec>
1c009d16:	04500a93          	li	s5,69
1c009d1a:	001d0593          	addi	a1,s10,1
1c009d1e:	4541                	li	a0,16
1c009d20:	d62a                	sw	a0,44(sp)
1c009d22:	04a5cdb3          	p.min	s11,a1,a0
1c009d26:	a075                	j	1c009dd2 <_prf+0x560>
1c009d28:	4c01                	li	s8,0
1c009d2a:	b769                	j	1c009cb4 <_prf+0x442>
1c009d2c:	1808                	addi	a0,sp,48
1c009d2e:	346d                	jal	1c0097d8 <_rlrshift>
1c009d30:	33333737          	lui	a4,0x33333
1c009d34:	5352                	lw	t1,52(sp)
1c009d36:	33270713          	addi	a4,a4,818 # 33333332 <__l2_shared_end+0x17323246>
1c009d3a:	58c2                	lw	a7,48(sp)
1c009d3c:	0c05                	addi	s8,s8,1
1c009d3e:	fe6767e3          	bltu	a4,t1,1c009d2c <_prf+0x4ba>
1c009d42:	4515                	li	a0,5
1c009d44:	031535b3          	mulhu	a1,a0,a7
1c009d48:	426505b3          	p.mac	a1,a0,t1
1c009d4c:	031508b3          	mul	a7,a0,a7
1c009d50:	d846                	sw	a7,48(sp)
1c009d52:	da2e                	sw	a1,52(sp)
1c009d54:	1bfd                	addi	s7,s7,-1
1c009d56:	4501                	li	a0,0
1c009d58:	800007b7          	lui	a5,0x80000
1c009d5c:	fff7c793          	not	a5,a5
1c009d60:	00b7f663          	bleu	a1,a5,1c009d6c <_prf+0x4fa>
1c009d64:	d535                	beqz	a0,1c009cd0 <_prf+0x45e>
1c009d66:	d846                	sw	a7,48(sp)
1c009d68:	da2e                	sw	a1,52(sp)
1c009d6a:	b79d                	j	1c009cd0 <_prf+0x45e>
1c009d6c:	01f8d313          	srli	t1,a7,0x1f
1c009d70:	00159513          	slli	a0,a1,0x1
1c009d74:	00a365b3          	or	a1,t1,a0
1c009d78:	0886                	slli	a7,a7,0x1
1c009d7a:	1c7d                	addi	s8,s8,-1
1c009d7c:	4505                	li	a0,1
1c009d7e:	bfe9                	j	1c009d58 <_prf+0x4e6>
1c009d80:	1808                	addi	a0,sp,48
1c009d82:	3c9d                	jal	1c0097f8 <_ldiv5>
1c009d84:	58c2                	lw	a7,48(sp)
1c009d86:	55d2                	lw	a1,52(sp)
1c009d88:	1c7d                	addi	s8,s8,-1
1c009d8a:	0b85                	addi	s7,s7,1
1c009d8c:	4501                	li	a0,0
1c009d8e:	80000737          	lui	a4,0x80000
1c009d92:	fff74713          	not	a4,a4
1c009d96:	00b77663          	bleu	a1,a4,1c009da2 <_prf+0x530>
1c009d9a:	dd15                	beqz	a0,1c009cd6 <_prf+0x464>
1c009d9c:	d846                	sw	a7,48(sp)
1c009d9e:	da2e                	sw	a1,52(sp)
1c009da0:	bf1d                	j	1c009cd6 <_prf+0x464>
1c009da2:	01f8d313          	srli	t1,a7,0x1f
1c009da6:	00159513          	slli	a0,a1,0x1
1c009daa:	00a365b3          	or	a1,t1,a0
1c009dae:	0886                	slli	a7,a7,0x1
1c009db0:	1c7d                	addi	s8,s8,-1
1c009db2:	4505                	li	a0,1
1c009db4:	bfe9                	j	1c009d8e <_prf+0x51c>
1c009db6:	06600593          	li	a1,102
1c009dba:	4c01                	li	s8,0
1c009dbc:	f4ba9fe3          	bne	s5,a1,1c009d1a <_prf+0x4a8>
1c009dc0:	01ab85b3          	add	a1,s7,s10
1c009dc4:	06600a93          	li	s5,102
1c009dc8:	f405dbe3          	bgez	a1,1c009d1e <_prf+0x4ac>
1c009dcc:	45c1                	li	a1,16
1c009dce:	d62e                	sw	a1,44(sp)
1c009dd0:	4d81                	li	s11,0
1c009dd2:	4301                	li	t1,0
1c009dd4:	080003b7          	lui	t2,0x8000
1c009dd8:	dc1a                	sw	t1,56(sp)
1c009dda:	de1e                	sw	t2,60(sp)
1c009ddc:	1dfd                	addi	s11,s11,-1
1c009dde:	09fdb363          	p.bneimm	s11,-1,1c009e64 <_prf+0x5f2>
1c009de2:	55c2                	lw	a1,48(sp)
1c009de4:	5562                	lw	a0,56(sp)
1c009de6:	58d2                	lw	a7,52(sp)
1c009de8:	5372                	lw	t1,60(sp)
1c009dea:	952e                	add	a0,a0,a1
1c009dec:	00b535b3          	sltu	a1,a0,a1
1c009df0:	989a                	add	a7,a7,t1
1c009df2:	95c6                	add	a1,a1,a7
1c009df4:	da2e                	sw	a1,52(sp)
1c009df6:	d82a                	sw	a0,48(sp)
1c009df8:	f605b5b3          	p.bclr	a1,a1,27,0
1c009dfc:	c981                	beqz	a1,1c009e0c <_prf+0x59a>
1c009dfe:	1808                	addi	a0,sp,48
1c009e00:	9f9ff0ef          	jal	ra,1c0097f8 <_ldiv5>
1c009e04:	1808                	addi	a0,sp,48
1c009e06:	9d3ff0ef          	jal	ra,1c0097d8 <_rlrshift>
1c009e0a:	0b85                	addi	s7,s7,1
1c009e0c:	06600593          	li	a1,102
1c009e10:	001b0d93          	addi	s11,s6,1
1c009e14:	08ba9463          	bne	s5,a1,1c009e9c <_prf+0x62a>
1c009e18:	05705d63          	blez	s7,1c009e72 <_prf+0x600>
1c009e1c:	017b0db3          	add	s11,s6,s7
1c009e20:	106c                	addi	a1,sp,44
1c009e22:	1808                	addi	a0,sp,48
1c009e24:	a19ff0ef          	jal	ra,1c00983c <_get_digit>
1c009e28:	00ab00ab          	p.sb	a0,1(s6!)
1c009e2c:	ffbb1ae3          	bne	s6,s11,1c009e20 <_prf+0x5ae>
1c009e30:	4b81                	li	s7,0
1c009e32:	000c9463          	bnez	s9,1c009e3a <_prf+0x5c8>
1c009e36:	020d0163          	beqz	s10,1c009e58 <_prf+0x5e6>
1c009e3a:	001d8b13          	addi	s6,s11,1
1c009e3e:	02e00613          	li	a2,46
1c009e42:	00cd8023          	sb	a2,0(s11)
1c009e46:	8cea                	mv	s9,s10
1c009e48:	8dda                	mv	s11,s6
1c009e4a:	03000893          	li	a7,48
1c009e4e:	1cfd                	addi	s9,s9,-1
1c009e50:	03fcb663          	p.bneimm	s9,-1,1c009e7c <_prf+0x60a>
1c009e54:	01ab0db3          	add	s11,s6,s10
1c009e58:	060c1c63          	bnez	s8,1c009ed0 <_prf+0x65e>
1c009e5c:	a8c1                	j	1c009f2c <_prf+0x6ba>
1c009e5e:	06500a93          	li	s5,101
1c009e62:	bd65                	j	1c009d1a <_prf+0x4a8>
1c009e64:	1828                	addi	a0,sp,56
1c009e66:	993ff0ef          	jal	ra,1c0097f8 <_ldiv5>
1c009e6a:	1828                	addi	a0,sp,56
1c009e6c:	96dff0ef          	jal	ra,1c0097d8 <_rlrshift>
1c009e70:	b7b5                	j	1c009ddc <_prf+0x56a>
1c009e72:	03000593          	li	a1,48
1c009e76:	00bb0023          	sb	a1,0(s6)
1c009e7a:	bf65                	j	1c009e32 <_prf+0x5c0>
1c009e7c:	0d85                	addi	s11,s11,1
1c009e7e:	000b8663          	beqz	s7,1c009e8a <_prf+0x618>
1c009e82:	ff1d8fa3          	sb	a7,-1(s11)
1c009e86:	0b85                	addi	s7,s7,1
1c009e88:	b7d9                	j	1c009e4e <_prf+0x5dc>
1c009e8a:	106c                	addi	a1,sp,44
1c009e8c:	1808                	addi	a0,sp,48
1c009e8e:	c446                	sw	a7,8(sp)
1c009e90:	9adff0ef          	jal	ra,1c00983c <_get_digit>
1c009e94:	fead8fa3          	sb	a0,-1(s11)
1c009e98:	48a2                	lw	a7,8(sp)
1c009e9a:	bf55                	j	1c009e4e <_prf+0x5dc>
1c009e9c:	106c                	addi	a1,sp,44
1c009e9e:	1808                	addi	a0,sp,48
1c009ea0:	99dff0ef          	jal	ra,1c00983c <_get_digit>
1c009ea4:	00ab0023          	sb	a0,0(s6)
1c009ea8:	03000593          	li	a1,48
1c009eac:	00b50363          	beq	a0,a1,1c009eb2 <_prf+0x640>
1c009eb0:	1bfd                	addi	s7,s7,-1
1c009eb2:	000c9463          	bnez	s9,1c009eba <_prf+0x648>
1c009eb6:	000d0b63          	beqz	s10,1c009ecc <_prf+0x65a>
1c009eba:	002b0d93          	addi	s11,s6,2
1c009ebe:	02e00593          	li	a1,46
1c009ec2:	00bb00a3          	sb	a1,1(s6)
1c009ec6:	9d6e                	add	s10,s10,s11
1c009ec8:	07bd1863          	bne	s10,s11,1c009f38 <_prf+0x6c6>
1c009ecc:	000c0f63          	beqz	s8,1c009eea <_prf+0x678>
1c009ed0:	03000593          	li	a1,48
1c009ed4:	fffd8713          	addi	a4,s11,-1
1c009ed8:	00074603          	lbu	a2,0(a4) # 80000000 <pulp__FC+0x80000001>
1c009edc:	06b60563          	beq	a2,a1,1c009f46 <_prf+0x6d4>
1c009ee0:	02e00593          	li	a1,46
1c009ee4:	00b61363          	bne	a2,a1,1c009eea <_prf+0x678>
1c009ee8:	8dba                	mv	s11,a4
1c009eea:	c05ab733          	p.bclr	a4,s5,0,5
1c009eee:	04500613          	li	a2,69
1c009ef2:	02c71d63          	bne	a4,a2,1c009f2c <_prf+0x6ba>
1c009ef6:	87d6                	mv	a5,s5
1c009ef8:	00fd8023          	sb	a5,0(s11)
1c009efc:	02b00793          	li	a5,43
1c009f00:	000bd663          	bgez	s7,1c009f0c <_prf+0x69a>
1c009f04:	41700bb3          	neg	s7,s7
1c009f08:	02d00793          	li	a5,45
1c009f0c:	00fd80a3          	sb	a5,1(s11)
1c009f10:	47a9                	li	a5,10
1c009f12:	02fbc733          	div	a4,s7,a5
1c009f16:	02fbe6b3          	rem	a3,s7,a5
1c009f1a:	03070713          	addi	a4,a4,48
1c009f1e:	03068693          	addi	a3,a3,48
1c009f22:	00ed8123          	sb	a4,2(s11)
1c009f26:	00dd81a3          	sb	a3,3(s11)
1c009f2a:	0d91                	addi	s11,s11,4
1c009f2c:	00c8                	addi	a0,sp,68
1c009f2e:	000d8023          	sb	zero,0(s11)
1c009f32:	40ad8533          	sub	a0,s11,a0
1c009f36:	b9fd                	j	1c009c34 <_prf+0x3c2>
1c009f38:	106c                	addi	a1,sp,44
1c009f3a:	1808                	addi	a0,sp,48
1c009f3c:	901ff0ef          	jal	ra,1c00983c <_get_digit>
1c009f40:	00ad80ab          	p.sb	a0,1(s11!)
1c009f44:	b751                	j	1c009ec8 <_prf+0x656>
1c009f46:	8dba                	mv	s11,a4
1c009f48:	b771                	j	1c009ed4 <_prf+0x662>
1c009f4a:	000c2783          	lw	a5,0(s8)
1c009f4e:	004c0a13          	addi	s4,s8,4
1c009f52:	0127a023          	sw	s2,0(a5) # 80000000 <pulp__FC+0x80000001>
1c009f56:	ba6d                	j	1c009910 <_prf+0x9e>
1c009f58:	004c0a13          	addi	s4,s8,4
1c009f5c:	000c2583          	lw	a1,0(s8)
1c009f60:	00dc                	addi	a5,sp,68
1c009f62:	040c8263          	beqz	s9,1c009fa6 <_prf+0x734>
1c009f66:	03000693          	li	a3,48
1c009f6a:	04d10223          	sb	a3,68(sp)
1c009f6e:	04510513          	addi	a0,sp,69
1c009f72:	e99d                	bnez	a1,1c009fa8 <_prf+0x736>
1c009f74:	040102a3          	sb	zero,69(sp)
1c009f78:	4401                	li	s0,0
1c009f7a:	0dfd3063          	p.bneimm	s10,-1,1c00a03a <_prf+0x7c8>
1c009f7e:	04410b93          	addi	s7,sp,68
1c009f82:	0d3cc063          	blt	s9,s3,1c00a042 <_prf+0x7d0>
1c009f86:	89e6                	mv	s3,s9
1c009f88:	41790433          	sub	s0,s2,s7
1c009f8c:	01740933          	add	s2,s0,s7
1c009f90:	980980e3          	beqz	s3,1c009910 <_prf+0x9e>
1c009f94:	45f2                	lw	a1,28(sp)
1c009f96:	001bc50b          	p.lbu	a0,1(s7!)
1c009f9a:	47e2                	lw	a5,24(sp)
1c009f9c:	9782                	jalr	a5
1c009f9e:	93f528e3          	p.beqimm	a0,-1,1c0098ce <_prf+0x5c>
1c009fa2:	19fd                	addi	s3,s3,-1
1c009fa4:	b7e5                	j	1c009f8c <_prf+0x71a>
1c009fa6:	853e                	mv	a0,a5
1c009fa8:	86ea                	mv	a3,s10
1c009faa:	4621                	li	a2,8
1c009fac:	40f50433          	sub	s0,a0,a5
1c009fb0:	fd2ff0ef          	jal	ra,1c009782 <_to_x>
1c009fb4:	9522                	add	a0,a0,s0
1c009fb6:	4401                	li	s0,0
1c009fb8:	c9fd28e3          	p.beqimm	s10,-1,1c009c48 <_prf+0x3d6>
1c009fbc:	02000793          	li	a5,32
1c009fc0:	c63e                	sw	a5,12(sp)
1c009fc2:	b159                	j	1c009c48 <_prf+0x3d6>
1c009fc4:	000c2583          	lw	a1,0(s8)
1c009fc8:	77e1                	lui	a5,0xffff8
1c009fca:	8307c793          	xori	a5,a5,-2000
1c009fce:	46a1                	li	a3,8
1c009fd0:	4641                	li	a2,16
1c009fd2:	04610513          	addi	a0,sp,70
1c009fd6:	04f11223          	sh	a5,68(sp)
1c009fda:	fa8ff0ef          	jal	ra,1c009782 <_to_x>
1c009fde:	004c0a13          	addi	s4,s8,4
1c009fe2:	0509                	addi	a0,a0,2
1c009fe4:	4401                	li	s0,0
1c009fe6:	be75                	j	1c009ba2 <_prf+0x330>
1c009fe8:	000d4463          	bltz	s10,1c009ff0 <_prf+0x77e>
1c009fec:	05acccb3          	p.min	s9,s9,s10
1c009ff0:	920c80e3          	beqz	s9,1c009910 <_prf+0x9e>
1c009ff4:	8666                	mv	a2,s9
1c009ff6:	00c8                	addi	a0,sp,68
1c009ff8:	c64ff0ef          	jal	ra,1c00945c <memcpy>
1c009ffc:	be8d                	j	1c009b6e <_prf+0x2fc>
1c009ffe:	000c2583          	lw	a1,0(s8)
1c00a002:	86ea                	mv	a3,s10
1c00a004:	4629                	li	a2,10
1c00a006:	00c8                	addi	a0,sp,68
1c00a008:	004c0a13          	addi	s4,s8,4
1c00a00c:	f76ff0ef          	jal	ra,1c009782 <_to_x>
1c00a010:	b75d                	j	1c009fb6 <_prf+0x744>
1c00a012:	f9f78613          	addi	a2,a5,-97 # ffff7f9f <pulp__FC+0xffff7fa0>
1c00a016:	0ff67613          	andi	a2,a2,255
1c00a01a:	aac5e5e3          	bltu	a1,a2,1c009ac4 <_prf+0x252>
1c00a01e:	1781                	addi	a5,a5,-32
1c00a020:	fef68fa3          	sb	a5,-1(a3)
1c00a024:	b445                	j	1c009ac4 <_prf+0x252>
1c00a026:	45f2                	lw	a1,28(sp)
1c00a028:	4762                	lw	a4,24(sp)
1c00a02a:	02500513          	li	a0,37
1c00a02e:	9702                	jalr	a4
1c00a030:	89f52fe3          	p.beqimm	a0,-1,1c0098ce <_prf+0x5c>
1c00a034:	0905                	addi	s2,s2,1
1c00a036:	8a62                	mv	s4,s8
1c00a038:	b8e1                	j	1c009910 <_prf+0x9e>
1c00a03a:	02000793          	li	a5,32
1c00a03e:	c63e                	sw	a5,12(sp)
1c00a040:	bf3d                	j	1c009f7e <_prf+0x70c>
1c00a042:	4752                	lw	a4,20(sp)
1c00a044:	cf01                	beqz	a4,1c00a05c <_prf+0x7ea>
1c00a046:	019b8833          	add	a6,s7,s9
1c00a04a:	02000713          	li	a4,32
1c00a04e:	417807b3          	sub	a5,a6,s7
1c00a052:	f337dbe3          	ble	s3,a5,1c009f88 <_prf+0x716>
1c00a056:	00e800ab          	p.sb	a4,1(a6!)
1c00a05a:	bfd5                	j	1c00a04e <_prf+0x7dc>
1c00a05c:	41998c33          	sub	s8,s3,s9
1c00a060:	001c8613          	addi	a2,s9,1
1c00a064:	85de                	mv	a1,s7
1c00a066:	018b8533          	add	a0,s7,s8
1c00a06a:	c28ff0ef          	jal	ra,1c009492 <memmove>
1c00a06e:	4732                	lw	a4,12(sp)
1c00a070:	02000793          	li	a5,32
1c00a074:	00f70363          	beq	a4,a5,1c00a07a <_prf+0x808>
1c00a078:	ca22                	sw	s0,20(sp)
1c00a07a:	47d2                	lw	a5,20(sp)
1c00a07c:	9c3e                	add	s8,s8,a5
1c00a07e:	00fb8ab3          	add	s5,s7,a5
1c00a082:	417a87b3          	sub	a5,s5,s7
1c00a086:	f187d1e3          	ble	s8,a5,1c009f88 <_prf+0x716>
1c00a08a:	4732                	lw	a4,12(sp)
1c00a08c:	00ea80ab          	p.sb	a4,1(s5!)
1c00a090:	bfcd                	j	1c00a082 <_prf+0x810>
1c00a092:	4442                	lw	s0,16(sp)
1c00a094:	be55                	j	1c009c48 <_prf+0x3d6>

1c00a096 <__rt_uart_wait_tx_done.isra.3>:
1c00a096:	1a102737          	lui	a4,0x1a102
1c00a09a:	09870713          	addi	a4,a4,152 # 1a102098 <__rt_sched+0x1a101d8c>
1c00a09e:	431c                	lw	a5,0(a4)
1c00a0a0:	8bc1                	andi	a5,a5,16
1c00a0a2:	eb95                	bnez	a5,1c00a0d6 <__rt_uart_wait_tx_done.isra.3+0x40>
1c00a0a4:	1a102737          	lui	a4,0x1a102
1c00a0a8:	0a070713          	addi	a4,a4,160 # 1a1020a0 <__rt_sched+0x1a101d94>
1c00a0ac:	431c                	lw	a5,0(a4)
1c00a0ae:	fc17b7b3          	p.bclr	a5,a5,30,1
1c00a0b2:	ffed                	bnez	a5,1c00a0ac <__rt_uart_wait_tx_done.isra.3+0x16>
1c00a0b4:	1a10a7b7          	lui	a5,0x1a10a
1c00a0b8:	81478593          	addi	a1,a5,-2028 # 1a109814 <__rt_sched+0x1a109508>
1c00a0bc:	80478613          	addi	a2,a5,-2044
1c00a0c0:	6691                	lui	a3,0x4
1c00a0c2:	80878793          	addi	a5,a5,-2040
1c00a0c6:	032350fb          	lp.setupi	x1,50,1c00a0d2 <__rt_uart_wait_tx_done.isra.3+0x3c>
1c00a0ca:	c194                	sw	a3,0(a1)
1c00a0cc:	c214                	sw	a3,0(a2)
1c00a0ce:	10500073          	wfi
1c00a0d2:	c394                	sw	a3,0(a5)
1c00a0d4:	8082                	ret
1c00a0d6:	10500073          	wfi
1c00a0da:	b7d1                	j	1c00a09e <__rt_uart_wait_tx_done.isra.3+0x8>

1c00a0dc <__rt_uart_setfreq_before>:
1c00a0dc:	1c0017b7          	lui	a5,0x1c001
1c00a0e0:	e5c7a783          	lw	a5,-420(a5) # 1c000e5c <__rt_uart>
1c00a0e4:	cf99                	beqz	a5,1c00a102 <__rt_uart_setfreq_before+0x26>
1c00a0e6:	1141                	addi	sp,sp,-16
1c00a0e8:	c606                	sw	ra,12(sp)
1c00a0ea:	3775                	jal	1c00a096 <__rt_uart_wait_tx_done.isra.3>
1c00a0ec:	005007b7          	lui	a5,0x500
1c00a0f0:	40b2                	lw	ra,12(sp)
1c00a0f2:	1a102737          	lui	a4,0x1a102
1c00a0f6:	0799                	addi	a5,a5,6
1c00a0f8:	0af72223          	sw	a5,164(a4) # 1a1020a4 <__rt_sched+0x1a101d98>
1c00a0fc:	4501                	li	a0,0
1c00a0fe:	0141                	addi	sp,sp,16
1c00a100:	8082                	ret
1c00a102:	4501                	li	a0,0
1c00a104:	8082                	ret

1c00a106 <__rt_uart_setup.isra.4>:
1c00a106:	1c001737          	lui	a4,0x1c001
1c00a10a:	ea472703          	lw	a4,-348(a4) # 1c000ea4 <__rt_freq_domains+0x4>
1c00a10e:	00155793          	srli	a5,a0,0x1
1c00a112:	97ba                	add	a5,a5,a4
1c00a114:	02a7d7b3          	divu	a5,a5,a0
1c00a118:	17fd                	addi	a5,a5,-1
1c00a11a:	07c2                	slli	a5,a5,0x10
1c00a11c:	3067e793          	ori	a5,a5,774
1c00a120:	1a102737          	lui	a4,0x1a102
1c00a124:	0af72223          	sw	a5,164(a4) # 1a1020a4 <__rt_sched+0x1a101d98>
1c00a128:	8082                	ret

1c00a12a <__rt_uart_setfreq_after>:
1c00a12a:	1c0017b7          	lui	a5,0x1c001
1c00a12e:	e5c78793          	addi	a5,a5,-420 # 1c000e5c <__rt_uart>
1c00a132:	4398                	lw	a4,0(a5)
1c00a134:	cb09                	beqz	a4,1c00a146 <__rt_uart_setfreq_after+0x1c>
1c00a136:	4788                	lw	a0,8(a5)
1c00a138:	1141                	addi	sp,sp,-16
1c00a13a:	c606                	sw	ra,12(sp)
1c00a13c:	37e9                	jal	1c00a106 <__rt_uart_setup.isra.4>
1c00a13e:	40b2                	lw	ra,12(sp)
1c00a140:	4501                	li	a0,0
1c00a142:	0141                	addi	sp,sp,16
1c00a144:	8082                	ret
1c00a146:	4501                	li	a0,0
1c00a148:	8082                	ret

1c00a14a <soc_eu_fcEventMask_setEvent>:
1c00a14a:	02000793          	li	a5,32
1c00a14e:	02f54733          	div	a4,a0,a5
1c00a152:	1a1066b7          	lui	a3,0x1a106
1c00a156:	02f56533          	rem	a0,a0,a5
1c00a15a:	0691                	addi	a3,a3,4
1c00a15c:	070a                	slli	a4,a4,0x2
1c00a15e:	9736                	add	a4,a4,a3
1c00a160:	4785                	li	a5,1
1c00a162:	4314                	lw	a3,0(a4)
1c00a164:	00a797b3          	sll	a5,a5,a0
1c00a168:	fff7c793          	not	a5,a5
1c00a16c:	8ff5                	and	a5,a5,a3
1c00a16e:	c31c                	sw	a5,0(a4)
1c00a170:	8082                	ret

1c00a172 <rt_uart_conf_init>:
1c00a172:	000997b7          	lui	a5,0x99
1c00a176:	96878793          	addi	a5,a5,-1688 # 98968 <__rt_sched+0x9865c>
1c00a17a:	c11c                	sw	a5,0(a0)
1c00a17c:	57fd                	li	a5,-1
1c00a17e:	c15c                	sw	a5,4(a0)
1c00a180:	8082                	ret

1c00a182 <__rt_uart_open>:
1c00a182:	1141                	addi	sp,sp,-16
1c00a184:	c606                	sw	ra,12(sp)
1c00a186:	c422                	sw	s0,8(sp)
1c00a188:	c226                	sw	s1,4(sp)
1c00a18a:	c04a                	sw	s2,0(sp)
1c00a18c:	30047973          	csrrci	s2,mstatus,8
1c00a190:	cd85                	beqz	a1,1c00a1c8 <__rt_uart_open+0x46>
1c00a192:	4198                	lw	a4,0(a1)
1c00a194:	1c0017b7          	lui	a5,0x1c001
1c00a198:	e5c78413          	addi	s0,a5,-420 # 1c000e5c <__rt_uart>
1c00a19c:	00451613          	slli	a2,a0,0x4
1c00a1a0:	9432                	add	s0,s0,a2
1c00a1a2:	4014                	lw	a3,0(s0)
1c00a1a4:	e5c78793          	addi	a5,a5,-420
1c00a1a8:	c68d                	beqz	a3,1c00a1d2 <__rt_uart_open+0x50>
1c00a1aa:	c589                	beqz	a1,1c00a1b4 <__rt_uart_open+0x32>
1c00a1ac:	418c                	lw	a1,0(a1)
1c00a1ae:	4418                	lw	a4,8(s0)
1c00a1b0:	04e59863          	bne	a1,a4,1c00a200 <__rt_uart_open+0x7e>
1c00a1b4:	0685                	addi	a3,a3,1
1c00a1b6:	00d7e623          	p.sw	a3,a2(a5)
1c00a1ba:	8522                	mv	a0,s0
1c00a1bc:	40b2                	lw	ra,12(sp)
1c00a1be:	4422                	lw	s0,8(sp)
1c00a1c0:	4492                	lw	s1,4(sp)
1c00a1c2:	4902                	lw	s2,0(sp)
1c00a1c4:	0141                	addi	sp,sp,16
1c00a1c6:	8082                	ret
1c00a1c8:	00099737          	lui	a4,0x99
1c00a1cc:	96870713          	addi	a4,a4,-1688 # 98968 <__rt_sched+0x9865c>
1c00a1d0:	b7d1                	j	1c00a194 <__rt_uart_open+0x12>
1c00a1d2:	4785                	li	a5,1
1c00a1d4:	c01c                	sw	a5,0(s0)
1c00a1d6:	c418                	sw	a4,8(s0)
1c00a1d8:	c048                	sw	a0,4(s0)
1c00a1da:	1a102737          	lui	a4,0x1a102
1c00a1de:	4314                	lw	a3,0(a4)
1c00a1e0:	00a797b3          	sll	a5,a5,a0
1c00a1e4:	8fd5                	or	a5,a5,a3
1c00a1e6:	00251493          	slli	s1,a0,0x2
1c00a1ea:	c31c                	sw	a5,0(a4)
1c00a1ec:	8526                	mv	a0,s1
1c00a1ee:	3fb1                	jal	1c00a14a <soc_eu_fcEventMask_setEvent>
1c00a1f0:	00148513          	addi	a0,s1,1
1c00a1f4:	3f99                	jal	1c00a14a <soc_eu_fcEventMask_setEvent>
1c00a1f6:	4408                	lw	a0,8(s0)
1c00a1f8:	3739                	jal	1c00a106 <__rt_uart_setup.isra.4>
1c00a1fa:	30091073          	csrw	mstatus,s2
1c00a1fe:	bf75                	j	1c00a1ba <__rt_uart_open+0x38>
1c00a200:	4401                	li	s0,0
1c00a202:	bf65                	j	1c00a1ba <__rt_uart_open+0x38>

1c00a204 <rt_uart_close>:
1c00a204:	1141                	addi	sp,sp,-16
1c00a206:	c606                	sw	ra,12(sp)
1c00a208:	c422                	sw	s0,8(sp)
1c00a20a:	c226                	sw	s1,4(sp)
1c00a20c:	300474f3          	csrrci	s1,mstatus,8
1c00a210:	411c                	lw	a5,0(a0)
1c00a212:	17fd                	addi	a5,a5,-1
1c00a214:	c11c                	sw	a5,0(a0)
1c00a216:	e785                	bnez	a5,1c00a23e <rt_uart_close+0x3a>
1c00a218:	842a                	mv	s0,a0
1c00a21a:	3db5                	jal	1c00a096 <__rt_uart_wait_tx_done.isra.3>
1c00a21c:	1a102737          	lui	a4,0x1a102
1c00a220:	005007b7          	lui	a5,0x500
1c00a224:	0a470693          	addi	a3,a4,164 # 1a1020a4 <__rt_sched+0x1a101d98>
1c00a228:	0799                	addi	a5,a5,6
1c00a22a:	c29c                	sw	a5,0(a3)
1c00a22c:	4050                	lw	a2,4(s0)
1c00a22e:	4785                	li	a5,1
1c00a230:	4314                	lw	a3,0(a4)
1c00a232:	00c797b3          	sll	a5,a5,a2
1c00a236:	fff7c793          	not	a5,a5
1c00a23a:	8ff5                	and	a5,a5,a3
1c00a23c:	c31c                	sw	a5,0(a4)
1c00a23e:	30049073          	csrw	mstatus,s1
1c00a242:	40b2                	lw	ra,12(sp)
1c00a244:	4422                	lw	s0,8(sp)
1c00a246:	4492                	lw	s1,4(sp)
1c00a248:	0141                	addi	sp,sp,16
1c00a24a:	8082                	ret

1c00a24c <__rt_uart_init>:
1c00a24c:	1c00a5b7          	lui	a1,0x1c00a
1c00a250:	1141                	addi	sp,sp,-16
1c00a252:	4601                	li	a2,0
1c00a254:	0dc58593          	addi	a1,a1,220 # 1c00a0dc <__rt_uart_setfreq_before>
1c00a258:	4511                	li	a0,4
1c00a25a:	c606                	sw	ra,12(sp)
1c00a25c:	c422                	sw	s0,8(sp)
1c00a25e:	dfefe0ef          	jal	ra,1c00885c <__rt_cbsys_add>
1c00a262:	1c00a5b7          	lui	a1,0x1c00a
1c00a266:	842a                	mv	s0,a0
1c00a268:	4601                	li	a2,0
1c00a26a:	12a58593          	addi	a1,a1,298 # 1c00a12a <__rt_uart_setfreq_after>
1c00a26e:	4515                	li	a0,5
1c00a270:	decfe0ef          	jal	ra,1c00885c <__rt_cbsys_add>
1c00a274:	1c0017b7          	lui	a5,0x1c001
1c00a278:	e407ae23          	sw	zero,-420(a5) # 1c000e5c <__rt_uart>
1c00a27c:	8d41                	or	a0,a0,s0
1c00a27e:	c10d                	beqz	a0,1c00a2a0 <__rt_uart_init+0x54>
1c00a280:	f1402673          	csrr	a2,mhartid
1c00a284:	1c000537          	lui	a0,0x1c000
1c00a288:	40565593          	srai	a1,a2,0x5
1c00a28c:	f265b5b3          	p.bclr	a1,a1,25,6
1c00a290:	f4563633          	p.bclr	a2,a2,26,5
1c00a294:	46c50513          	addi	a0,a0,1132 # 1c00046c <__DTOR_END__+0x114>
1c00a298:	cc0ff0ef          	jal	ra,1c009758 <printf>
1c00a29c:	c28ff0ef          	jal	ra,1c0096c4 <abort>
1c00a2a0:	40b2                	lw	ra,12(sp)
1c00a2a2:	4422                	lw	s0,8(sp)
1c00a2a4:	0141                	addi	sp,sp,16
1c00a2a6:	8082                	ret
