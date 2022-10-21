
/home/sjaeger/pulpissimo/aes/aes_sw/build/pulpissimo/aes_demo/aes_demo:     file format elf32-littleriscv


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
1c008090:	0df4                	addi	a3,sp,732
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
1c0080a8:	e2c28293          	addi	t0,t0,-468 # 1c000ed0 <_bss_start>
1c0080ac:	ffff9317          	auipc	t1,0xffff9
1c0080b0:	f0430313          	addi	t1,t1,-252 # 1c000fb0 <__l2_priv0_end>
1c0080b4:	0002a023          	sw	zero,0(t0)
1c0080b8:	0291                	addi	t0,t0,4
1c0080ba:	fe62ede3          	bltu	t0,t1,1c0080b4 <_entry+0x14>
1c0080be:	ffff9117          	auipc	sp,0xffff9
1c0080c2:	d0210113          	addi	sp,sp,-766 # 1c000dc0 <stack>
1c0080c6:	5c2000ef          	jal	ra,1c008688 <__rt_init>
1c0080ca:	00000513          	li	a0,0
1c0080ce:	00000593          	li	a1,0
1c0080d2:	00000397          	auipc	t2,0x0
1c0080d6:	26438393          	addi	t2,t2,612 # 1c008336 <main>
1c0080da:	000380e7          	jalr	t2
1c0080de:	842a                	mv	s0,a0
1c0080e0:	67e000ef          	jal	ra,1c00875e <__rt_deinit>
1c0080e4:	8522                	mv	a0,s0
1c0080e6:	6b8010ef          	jal	ra,1c00979e <exit>

1c0080ea <_fini>:
1c0080ea:	8082                	ret

1c0080ec <__rt_illegal_instr>:
1c0080ec:	fe112e23          	sw	ra,-4(sp)
1c0080f0:	fea12c23          	sw	a0,-8(sp)
1c0080f4:	00000517          	auipc	a0,0x0
1c0080f8:	6e850513          	addi	a0,a0,1768 # 1c0087dc <__rt_handle_illegal_instr>
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
1c008168:	ecc40413          	addi	s0,s0,-308 # 30 <periph_channels>
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
1c0081de:	2b05a603          	lw	a2,688(a1)
1c0081e2:	897d                	andi	a0,a0,31
1c0081e4:	80a64633          	p.bsetr	a2,a2,a0
1c0081e8:	2ac5a823          	sw	a2,688(a1)
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
1c00824a:	80040413          	addi	s0,s0,-2048 # 1a109800 <__rt_udma_callback_data+0x1a109508>
1c00824e:	5048                	lw	a0,36(s0)
1c008250:	02800493          	li	s1,40
1c008254:	00955963          	ble	s1,a0,1c008266 <__rt_fc_socevents_register>
1c008258:	ffc57613          	andi	a2,a0,-4
1c00825c:	2d062583          	lw	a1,720(a2)
1c008260:	2f862403          	lw	s0,760(a2)
1c008264:	8582                	jr	a1

1c008266 <__rt_fc_socevents_register>:
1c008266:	00555593          	srli	a1,a0,0x5
1c00826a:	058a                	slli	a1,a1,0x2
1c00826c:	2b05a603          	lw	a2,688(a1)
1c008270:	897d                	andi	a0,a0,31
1c008272:	80a64633          	p.bsetr	a2,a2,a0
1c008276:	2ac5a823          	sw	a2,688(a1)

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
1c008296:	d8a50513          	addi	a0,a0,-630 # 1c <__rt_sched>
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
1c0082d0:	6e060613          	addi	a2,a2,1760 # 1c0089ac <__rt_bridge_handle_notif>
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
1c008336:	161587b7          	lui	a5,0x16158
1c00833a:	7115                	addi	sp,sp,-224
1c00833c:	e2b78793          	addi	a5,a5,-469 # 16157e2b <__rt_udma_callback_data+0x16157b33>
1c008340:	c03e                	sw	a5,0(sp)
1c008342:	a6d2b7b7          	lui	a5,0xa6d2b
1c008346:	e2878793          	addi	a5,a5,-472 # a6d2ae28 <pulp__FC+0xa6d2ae29>
1c00834a:	c23e                	sw	a5,4(sp)
1c00834c:	8815f7b7          	lui	a5,0x8815f
1c008350:	7ab78793          	addi	a5,a5,1963 # 8815f7ab <pulp__FC+0x8815f7ac>
1c008354:	c43e                	sw	a5,8(sp)
1c008356:	3c4fd7b7          	lui	a5,0x3c4fd
1c00835a:	f0978793          	addi	a5,a5,-247 # 3c4fcf09 <__l2_shared_end+0x204ece1d>
1c00835e:	c63e                	sw	a5,12(sp)
1c008360:	e2bec7b7          	lui	a5,0xe2bec
1c008364:	16b78793          	addi	a5,a5,363 # e2bec16b <pulp__FC+0xe2bec16c>
1c008368:	c83e                	sw	a5,16(sp)
1c00836a:	969f47b7          	lui	a5,0x969f4
1c00836e:	02e78793          	addi	a5,a5,46 # 969f402e <pulp__FC+0x969f402f>
1c008372:	ca3e                	sw	a5,20(sp)
1c008374:	117e47b7          	lui	a5,0x117e4
1c008378:	de978793          	addi	a5,a5,-535 # 117e3de9 <__rt_udma_callback_data+0x117e3af1>
1c00837c:	cc3e                	sw	a5,24(sp)
1c00837e:	2a1797b7          	lui	a5,0x2a179
1c008382:	858a                	mv	a1,sp
1c008384:	1008                	addi	a0,sp,32
1c008386:	37378793          	addi	a5,a5,883 # 2a179373 <__l2_shared_end+0xe169287>
1c00838a:	cf86                	sw	ra,220(sp)
1c00838c:	ce3e                	sw	a5,28(sp)
1c00838e:	2809                	jal	1c0083a0 <AES_init_ctx>
1c008390:	1008                	addi	a0,sp,32
1c008392:	080c                	addi	a1,sp,16
1c008394:	20e9                	jal	1c00845e <AES_ECB_encrypt>
1c008396:	40fe                	lw	ra,220(sp)
1c008398:	03a00513          	li	a0,58
1c00839c:	612d                	addi	sp,sp,224
1c00839e:	8082                	ret

1c0083a0 <AES_init_ctx>:
1c0083a0:	87aa                	mv	a5,a0
1c0083a2:	004950fb          	lp.setupi	x1,4,1c0083c6 <AES_init_ctx+0x26>
1c0083a6:	0005c683          	lbu	a3,0(a1)
1c0083aa:	0791                	addi	a5,a5,4
1c0083ac:	fed78e23          	sb	a3,-4(a5)
1c0083b0:	0015c683          	lbu	a3,1(a1)
1c0083b4:	0591                	addi	a1,a1,4
1c0083b6:	fed78ea3          	sb	a3,-3(a5)
1c0083ba:	ffe5c683          	lbu	a3,-2(a1)
1c0083be:	fed78f23          	sb	a3,-2(a5)
1c0083c2:	fff5c683          	lbu	a3,-1(a1)
1c0083c6:	fed78fa3          	sb	a3,-1(a5)
1c0083ca:	1c0005b7          	lui	a1,0x1c000
1c0083ce:	1c0003b7          	lui	t2,0x1c000
1c0083d2:	4811                	li	a6,4
1c0083d4:	36458593          	addi	a1,a1,868 # 1c000364 <sbox>
1c0083d8:	35838393          	addi	t2,t2,856 # 1c000358 <__DTOR_END__>
1c0083dc:	02800313          	li	t1,40
1c0083e0:	03d340fb          	lp.setup	x1,t1,1c00845a <AES_init_ctx+0xba>
1c0083e4:	00c54783          	lbu	a5,12(a0)
1c0083e8:	00d54603          	lbu	a2,13(a0)
1c0083ec:	00e54683          	lbu	a3,14(a0)
1c0083f0:	00f54703          	lbu	a4,15(a0)
1c0083f4:	fa2838b3          	p.bclr	a7,a6,29,2
1c0083f8:	00285e13          	srli	t3,a6,0x2
1c0083fc:	00f58eb3          	add	t4,a1,a5
1c008400:	00c582b3          	add	t0,a1,a2
1c008404:	00d58fb3          	add	t6,a1,a3
1c008408:	00e58f33          	add	t5,a1,a4
1c00840c:	00089e63          	bnez	a7,1c008428 <AES_init_ctx+0x88>
1c008410:	0002c783          	lbu	a5,0(t0)
1c008414:	01c3fe03          	p.lb	t3,t3(t2)
1c008418:	000fc603          	lbu	a2,0(t6)
1c00841c:	000f4683          	lbu	a3,0(t5)
1c008420:	000ec703          	lbu	a4,0(t4)
1c008424:	01c7c7b3          	xor	a5,a5,t3
1c008428:	00054f03          	lbu	t5,0(a0)
1c00842c:	00154e83          	lbu	t4,1(a0)
1c008430:	00254e03          	lbu	t3,2(a0)
1c008434:	00354883          	lbu	a7,3(a0)
1c008438:	01e7c7b3          	xor	a5,a5,t5
1c00843c:	01d64633          	xor	a2,a2,t4
1c008440:	01c6c6b3          	xor	a3,a3,t3
1c008444:	01174733          	xor	a4,a4,a7
1c008448:	00f50823          	sb	a5,16(a0)
1c00844c:	00c508a3          	sb	a2,17(a0)
1c008450:	00d50923          	sb	a3,18(a0)
1c008454:	00e509a3          	sb	a4,19(a0)
1c008458:	0805                	addi	a6,a6,1
1c00845a:	0511                	addi	a0,a0,4
1c00845c:	8082                	ret

1c00845e <AES_ECB_encrypt>:
1c00845e:	7179                	addi	sp,sp,-48
1c008460:	d622                	sw	s0,44(sp)
1c008462:	d426                	sw	s1,40(sp)
1c008464:	d24a                	sw	s2,36(sp)
1c008466:	d04e                	sw	s3,32(sp)
1c008468:	ce52                	sw	s4,28(sp)
1c00846a:	cc56                	sw	s5,24(sp)
1c00846c:	ca5a                	sw	s6,20(sp)
1c00846e:	c85e                	sw	s7,16(sp)
1c008470:	c662                	sw	s8,12(sp)
1c008472:	c466                	sw	s9,8(sp)
1c008474:	c26a                	sw	s10,4(sp)
1c008476:	c06e                	sw	s11,0(sp)
1c008478:	8fae                	mv	t6,a1
1c00847a:	00450793          	addi	a5,a0,4
1c00847e:	01450313          	addi	t1,a0,20
1c008482:	88ae                	mv	a7,a1
1c008484:	ffc78613          	addi	a2,a5,-4
1c008488:	86c6                	mv	a3,a7
1c00848a:	8f91                	sub	a5,a5,a2
1c00848c:	0087c0fb          	lp.setup	x1,a5,1c00849c <AES_ECB_encrypt+0x3e>
1c008490:	0006c703          	lbu	a4,0(a3)
1c008494:	0016480b          	p.lbu	a6,1(a2!)
1c008498:	01074733          	xor	a4,a4,a6
1c00849c:	00e680ab          	p.sb	a4,1(a3!)
1c0084a0:	00460793          	addi	a5,a2,4
1c0084a4:	0891                	addi	a7,a7,4
1c0084a6:	fc679fe3          	bne	a5,t1,1c008484 <AES_ECB_encrypt+0x26>
1c0084aa:	1c000e37          	lui	t3,0x1c000
1c0084ae:	01050f13          	addi	t5,a0,16
1c0084b2:	0a050393          	addi	t2,a0,160
1c0084b6:	00458293          	addi	t0,a1,4
1c0084ba:	364e0e13          	addi	t3,t3,868 # 1c000364 <sbox>
1c0084be:	01058e93          	addi	t4,a1,16
1c0084c2:	882e                	mv	a6,a1
1c0084c4:	40b28633          	sub	a2,t0,a1
1c0084c8:	00b6407b          	lp.setup	x0,a2,1c0084de <AES_ECB_encrypt+0x80>
1c0084cc:	86c2                	mv	a3,a6
1c0084ce:	004350fb          	lp.setupi	x1,4,1c0084da <AES_ECB_encrypt+0x7c>
1c0084d2:	0006c783          	lbu	a5,0(a3)
1c0084d6:	00fe7783          	p.lb	a5,a5(t3)
1c0084da:	00f6822b          	p.sb	a5,4(a3!)
1c0084de:	0805                	addi	a6,a6,1
1c0084e0:	0015c483          	lbu	s1,1(a1)
1c0084e4:	0055c703          	lbu	a4,5(a1)
1c0084e8:	0095c983          	lbu	s3,9(a1)
1c0084ec:	00d5c903          	lbu	s2,13(a1)
1c0084f0:	0025c403          	lbu	s0,2(a1)
1c0084f4:	00a5c883          	lbu	a7,10(a1)
1c0084f8:	0065c803          	lbu	a6,6(a1)
1c0084fc:	00e5c303          	lbu	t1,14(a1)
1c008500:	0035c783          	lbu	a5,3(a1)
1c008504:	00f5cd83          	lbu	s11,15(a1)
1c008508:	00b5c603          	lbu	a2,11(a1)
1c00850c:	0075c683          	lbu	a3,7(a1)
1c008510:	00e580a3          	sb	a4,1(a1)
1c008514:	013582a3          	sb	s3,5(a1)
1c008518:	012584a3          	sb	s2,9(a1)
1c00851c:	009586a3          	sb	s1,13(a1)
1c008520:	01158123          	sb	a7,2(a1)
1c008524:	00858523          	sb	s0,10(a1)
1c008528:	00658323          	sb	t1,6(a1)
1c00852c:	01058723          	sb	a6,14(a1)
1c008530:	01b581a3          	sb	s11,3(a1)
1c008534:	00c587a3          	sb	a2,15(a1)
1c008538:	00d585a3          	sb	a3,11(a1)
1c00853c:	00f583a3          	sb	a5,7(a1)
1c008540:	0fe38f63          	beq	t2,t5,1c00863e <AES_ECB_encrypt+0x1e0>
1c008544:	87ae                	mv	a5,a1
1c008546:	0007c483          	lbu	s1,0(a5)
1c00854a:	0027c403          	lbu	s0,2(a5)
1c00854e:	0037cb03          	lbu	s6,3(a5)
1c008552:	0017c903          	lbu	s2,1(a5)
1c008556:	8f25                	xor	a4,a4,s1
1c008558:	00894ab3          	xor	s5,s2,s0
1c00855c:	01644a33          	xor	s4,s0,s6
1c008560:	0164c9b3          	xor	s3,s1,s6
1c008564:	00775d13          	srli	s10,a4,0x7
1c008568:	007adc93          	srli	s9,s5,0x7
1c00856c:	007a5c13          	srli	s8,s4,0x7
1c008570:	0079db93          	srli	s7,s3,0x7
1c008574:	003b9693          	slli	a3,s7,0x3
1c008578:	003d1313          	slli	t1,s10,0x3
1c00857c:	003c9813          	slli	a6,s9,0x3
1c008580:	003c1613          	slli	a2,s8,0x3
1c008584:	417686b3          	sub	a3,a3,s7
1c008588:	41a30333          	sub	t1,t1,s10
1c00858c:	41980833          	sub	a6,a6,s9
1c008590:	41860633          	sub	a2,a2,s8
1c008594:	01b8c8b3          	xor	a7,a7,s11
1c008598:	030a                	slli	t1,t1,0x2
1c00859a:	080a                	slli	a6,a6,0x2
1c00859c:	060a                	slli	a2,a2,0x2
1c00859e:	068a                	slli	a3,a3,0x2
1c0085a0:	011748b3          	xor	a7,a4,a7
1c0085a4:	41a30333          	sub	t1,t1,s10
1c0085a8:	0706                	slli	a4,a4,0x1
1c0085aa:	41980833          	sub	a6,a6,s9
1c0085ae:	0a86                	slli	s5,s5,0x1
1c0085b0:	41860633          	sub	a2,a2,s8
1c0085b4:	0a06                	slli	s4,s4,0x1
1c0085b6:	41768bb3          	sub	s7,a3,s7
1c0085ba:	0986                	slli	s3,s3,0x1
1c0085bc:	0114c4b3          	xor	s1,s1,a7
1c0085c0:	0128c933          	xor	s2,a7,s2
1c0085c4:	0088c433          	xor	s0,a7,s0
1c0085c8:	00e34333          	xor	t1,t1,a4
1c0085cc:	01584833          	xor	a6,a6,s5
1c0085d0:	01464633          	xor	a2,a2,s4
1c0085d4:	013bc9b3          	xor	s3,s7,s3
1c0085d8:	0168c8b3          	xor	a7,a7,s6
1c0085dc:	00934333          	xor	t1,t1,s1
1c0085e0:	01284933          	xor	s2,a6,s2
1c0085e4:	8c31                	xor	s0,s0,a2
1c0085e6:	0119c8b3          	xor	a7,s3,a7
1c0085ea:	00678023          	sb	t1,0(a5)
1c0085ee:	012780a3          	sb	s2,1(a5)
1c0085f2:	00878123          	sb	s0,2(a5)
1c0085f6:	011781a3          	sb	a7,3(a5)
1c0085fa:	0791                	addi	a5,a5,4
1c0085fc:	00fe8963          	beq	t4,a5,1c00860e <AES_ECB_encrypt+0x1b0>
1c008600:	0017c703          	lbu	a4,1(a5)
1c008604:	0027c883          	lbu	a7,2(a5)
1c008608:	0037cd83          	lbu	s11,3(a5)
1c00860c:	bf2d                	j	1c008546 <AES_ECB_encrypt+0xe8>
1c00860e:	40be88b3          	sub	a7,t4,a1
1c008612:	18f1                	addi	a7,a7,-4
1c008614:	0028d893          	srli	a7,a7,0x2
1c008618:	867a                	mv	a2,t5
1c00861a:	832e                	mv	t1,a1
1c00861c:	0885                	addi	a7,a7,1
1c00861e:	00d8c07b          	lp.setup	x0,a7,1c008638 <AES_ECB_encrypt+0x1da>
1c008622:	869a                	mv	a3,t1
1c008624:	004450fb          	lp.setupi	x1,4,1c008634 <AES_ECB_encrypt+0x1d6>
1c008628:	0006c783          	lbu	a5,0(a3)
1c00862c:	0016480b          	p.lbu	a6,1(a2!)
1c008630:	0107c7b3          	xor	a5,a5,a6
1c008634:	00f680ab          	p.sb	a5,1(a3!)
1c008638:	0311                	addi	t1,t1,4
1c00863a:	0f41                	addi	t5,t5,16
1c00863c:	b559                	j	1c0084c2 <AES_ECB_encrypt+0x64>
1c00863e:	0a450513          	addi	a0,a0,164
1c008642:	0047d07b          	lp.setupi	x0,4,1c008660 <AES_ECB_encrypt+0x202>
1c008646:	ffc50613          	addi	a2,a0,-4
1c00864a:	86fe                	mv	a3,t6
1c00864c:	0043d0fb          	lp.setupi	x1,4,1c00865a <AES_ECB_encrypt+0x1fc>
1c008650:	0006c783          	lbu	a5,0(a3)
1c008654:	0016458b          	p.lbu	a1,1(a2!)
1c008658:	8fad                	xor	a5,a5,a1
1c00865a:	00f680ab          	p.sb	a5,1(a3!)
1c00865e:	0f91                	addi	t6,t6,4
1c008660:	0511                	addi	a0,a0,4
1c008662:	5432                	lw	s0,44(sp)
1c008664:	54a2                	lw	s1,40(sp)
1c008666:	5912                	lw	s2,36(sp)
1c008668:	5982                	lw	s3,32(sp)
1c00866a:	4a72                	lw	s4,28(sp)
1c00866c:	4ae2                	lw	s5,24(sp)
1c00866e:	4b52                	lw	s6,20(sp)
1c008670:	4bc2                	lw	s7,16(sp)
1c008672:	4c32                	lw	s8,12(sp)
1c008674:	4ca2                	lw	s9,8(sp)
1c008676:	4d12                	lw	s10,4(sp)
1c008678:	4d82                	lw	s11,0(sp)
1c00867a:	6145                	addi	sp,sp,48
1c00867c:	8082                	ret

1c00867e <__rt_himax_init>:
1c00867e:	1c0017b7          	lui	a5,0x1c001
1c008682:	dc078023          	sb	zero,-576(a5) # 1c000dc0 <stack>
1c008686:	8082                	ret

1c008688 <__rt_init>:
1c008688:	1141                	addi	sp,sp,-16
1c00868a:	c606                	sw	ra,12(sp)
1c00868c:	c422                	sw	s0,8(sp)
1c00868e:	2ef1                	jal	1c008a6a <__rt_bridge_set_available>
1c008690:	1c0017b7          	lui	a5,0x1c001
1c008694:	eb47a783          	lw	a5,-332(a5) # 1c000eb4 <__rt_platform>
1c008698:	0237b263          	p.bneimm	a5,3,1c0086bc <__rt_init+0x34>
1c00869c:	7d005073          	csrwi	0x7d0,0
1c0086a0:	1c0007b7          	lui	a5,0x1c000
1c0086a4:	5c078793          	addi	a5,a5,1472 # 1c0005c0 <.got>
1c0086a8:	7d179073          	csrw	0x7d1,a5
1c0086ac:	1c0017b7          	lui	a5,0x1c001
1c0086b0:	dc078793          	addi	a5,a5,-576 # 1c000dc0 <stack>
1c0086b4:	7d279073          	csrw	0x7d2,a5
1c0086b8:	7d00d073          	csrwi	0x7d0,1
1c0086bc:	2a85                	jal	1c00882c <__rt_irq_init>
1c0086be:	1a1067b7          	lui	a5,0x1a106
1c0086c2:	577d                	li	a4,-1
1c0086c4:	00478693          	addi	a3,a5,4 # 1a106004 <__rt_udma_callback_data+0x1a105d0c>
1c0086c8:	c298                	sw	a4,0(a3)
1c0086ca:	00878693          	addi	a3,a5,8
1c0086ce:	c298                	sw	a4,0(a3)
1c0086d0:	00c78693          	addi	a3,a5,12
1c0086d4:	c298                	sw	a4,0(a3)
1c0086d6:	01078693          	addi	a3,a5,16
1c0086da:	c298                	sw	a4,0(a3)
1c0086dc:	01478693          	addi	a3,a5,20
1c0086e0:	c298                	sw	a4,0(a3)
1c0086e2:	01878693          	addi	a3,a5,24
1c0086e6:	c298                	sw	a4,0(a3)
1c0086e8:	01c78693          	addi	a3,a5,28
1c0086ec:	c298                	sw	a4,0(a3)
1c0086ee:	02078793          	addi	a5,a5,32
1c0086f2:	1c0085b7          	lui	a1,0x1c008
1c0086f6:	23a58593          	addi	a1,a1,570 # 1c00823a <__rt_fc_socevents_handler>
1c0086fa:	4569                	li	a0,26
1c0086fc:	c398                	sw	a4,0(a5)
1c0086fe:	2851                	jal	1c008792 <rt_irq_set_handler>
1c008700:	1a10a7b7          	lui	a5,0x1a10a
1c008704:	04000737          	lui	a4,0x4000
1c008708:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__rt_udma_callback_data+0x1a10950c>
1c00870c:	1c000437          	lui	s0,0x1c000
1c008710:	2a5000ef          	jal	ra,1c0091b4 <__rt_freq_init>
1c008714:	32840413          	addi	s0,s0,808 # 1c000328 <ctor_list+0x4>
1c008718:	2275                	jal	1c0088c4 <__rt_utils_init>
1c00871a:	25c1                	jal	1c008dda <__rt_allocs_init>
1c00871c:	2511                	jal	1c008d20 <__rt_event_sched_init>
1c00871e:	313000ef          	jal	ra,1c009230 <__rt_padframe_init>
1c008722:	0044278b          	p.lw	a5,4(s0!)
1c008726:	e795                	bnez	a5,1c008752 <__rt_init+0xca>
1c008728:	300467f3          	csrrsi	a5,mstatus,8
1c00872c:	4501                	li	a0,0
1c00872e:	229d                	jal	1c008894 <__rt_cbsys_exec>
1c008730:	c11d                	beqz	a0,1c008756 <__rt_init+0xce>
1c008732:	f1402673          	csrr	a2,mhartid
1c008736:	1c000537          	lui	a0,0x1c000
1c00873a:	40565593          	srai	a1,a2,0x5
1c00873e:	f265b5b3          	p.bclr	a1,a1,25,6
1c008742:	f4563633          	p.bclr	a2,a2,26,5
1c008746:	46c50513          	addi	a0,a0,1132 # 1c00046c <sbox+0x108>
1c00874a:	154010ef          	jal	ra,1c00989e <printf>
1c00874e:	0bc010ef          	jal	ra,1c00980a <abort>
1c008752:	9782                	jalr	a5
1c008754:	b7f9                	j	1c008722 <__rt_init+0x9a>
1c008756:	40b2                	lw	ra,12(sp)
1c008758:	4422                	lw	s0,8(sp)
1c00875a:	0141                	addi	sp,sp,16
1c00875c:	8082                	ret

1c00875e <__rt_deinit>:
1c00875e:	1c0017b7          	lui	a5,0x1c001
1c008762:	1141                	addi	sp,sp,-16
1c008764:	eb47a783          	lw	a5,-332(a5) # 1c000eb4 <__rt_platform>
1c008768:	c606                	sw	ra,12(sp)
1c00876a:	c422                	sw	s0,8(sp)
1c00876c:	0037b463          	p.bneimm	a5,3,1c008774 <__rt_deinit+0x16>
1c008770:	7d005073          	csrwi	0x7d0,0
1c008774:	4505                	li	a0,1
1c008776:	1c000437          	lui	s0,0x1c000
1c00877a:	2a29                	jal	1c008894 <__rt_cbsys_exec>
1c00877c:	35440413          	addi	s0,s0,852 # 1c000354 <dtor_list+0x4>
1c008780:	0044278b          	p.lw	a5,4(s0!)
1c008784:	e789                	bnez	a5,1c00878e <__rt_deinit+0x30>
1c008786:	40b2                	lw	ra,12(sp)
1c008788:	4422                	lw	s0,8(sp)
1c00878a:	0141                	addi	sp,sp,16
1c00878c:	8082                	ret
1c00878e:	9782                	jalr	a5
1c008790:	bfc5                	j	1c008780 <__rt_deinit+0x22>

1c008792 <rt_irq_set_handler>:
1c008792:	f14027f3          	csrr	a5,mhartid
1c008796:	46fd                	li	a3,31
1c008798:	ca5797b3          	p.extractu	a5,a5,5,5
1c00879c:	4701                	li	a4,0
1c00879e:	00d79663          	bne	a5,a3,1c0087aa <rt_irq_set_handler+0x18>
1c0087a2:	30502773          	csrr	a4,mtvec
1c0087a6:	c0073733          	p.bclr	a4,a4,0,0
1c0087aa:	050a                	slli	a0,a0,0x2
1c0087ac:	8d89                	sub	a1,a1,a0
1c0087ae:	8d99                	sub	a1,a1,a4
1c0087b0:	c14586b3          	p.extract	a3,a1,0,20
1c0087b4:	06f00793          	li	a5,111
1c0087b8:	c1f6a7b3          	p.insert	a5,a3,0,31
1c0087bc:	d21586b3          	p.extract	a3,a1,9,1
1c0087c0:	d356a7b3          	p.insert	a5,a3,9,21
1c0087c4:	c0b586b3          	p.extract	a3,a1,0,11
1c0087c8:	c146a7b3          	p.insert	a5,a3,0,20
1c0087cc:	cec585b3          	p.extract	a1,a1,7,12
1c0087d0:	cec5a7b3          	p.insert	a5,a1,7,12
1c0087d4:	00f56723          	p.sw	a5,a4(a0)
1c0087d8:	8082                	ret

1c0087da <illegal_insn_handler_c>:
1c0087da:	8082                	ret

1c0087dc <__rt_handle_illegal_instr>:
1c0087dc:	1141                	addi	sp,sp,-16
1c0087de:	c606                	sw	ra,12(sp)
1c0087e0:	c422                	sw	s0,8(sp)
1c0087e2:	341026f3          	csrr	a3,mepc
1c0087e6:	1c0017b7          	lui	a5,0x1c001
1c0087ea:	dc87a703          	lw	a4,-568(a5) # 1c000dc8 <__rt_debug_config>
1c0087ee:	843e                	mv	s0,a5
1c0087f0:	fc173733          	p.bclr	a4,a4,30,1
1c0087f4:	c305                	beqz	a4,1c008814 <__rt_handle_illegal_instr+0x38>
1c0087f6:	f1402673          	csrr	a2,mhartid
1c0087fa:	1c000537          	lui	a0,0x1c000
1c0087fe:	40565593          	srai	a1,a2,0x5
1c008802:	4298                	lw	a4,0(a3)
1c008804:	f4563633          	p.bclr	a2,a2,26,5
1c008808:	f265b5b3          	p.bclr	a1,a1,25,6
1c00880c:	4c450513          	addi	a0,a0,1220 # 1c0004c4 <sbox+0x160>
1c008810:	08e010ef          	jal	ra,1c00989e <printf>
1c008814:	dc842783          	lw	a5,-568(s0)
1c008818:	c01797b3          	p.extractu	a5,a5,0,1
1c00881c:	c399                	beqz	a5,1c008822 <__rt_handle_illegal_instr+0x46>
1c00881e:	7ed000ef          	jal	ra,1c00980a <abort>
1c008822:	4422                	lw	s0,8(sp)
1c008824:	40b2                	lw	ra,12(sp)
1c008826:	0141                	addi	sp,sp,16
1c008828:	fb3ff06f          	j	1c0087da <illegal_insn_handler_c>

1c00882c <__rt_irq_init>:
1c00882c:	1a10a7b7          	lui	a5,0x1a10a
1c008830:	577d                	li	a4,-1
1c008832:	80e7a423          	sw	a4,-2040(a5) # 1a109808 <__rt_udma_callback_data+0x1a109510>
1c008836:	f14027f3          	csrr	a5,mhartid
1c00883a:	477d                	li	a4,31
1c00883c:	ca5797b3          	p.extractu	a5,a5,5,5
1c008840:	00e79a63          	bne	a5,a4,1c008854 <__rt_irq_init+0x28>
1c008844:	1c0087b7          	lui	a5,0x1c008
1c008848:	00078793          	mv	a5,a5
1c00884c:	c007c7b3          	p.bset	a5,a5,0,0
1c008850:	30579073          	csrw	mtvec,a5
1c008854:	8082                	ret

1c008856 <__rt_cbsys_add>:
1c008856:	1101                	addi	sp,sp,-32
1c008858:	cc22                	sw	s0,24(sp)
1c00885a:	ca26                	sw	s1,20(sp)
1c00885c:	842a                	mv	s0,a0
1c00885e:	84ae                	mv	s1,a1
1c008860:	4501                	li	a0,0
1c008862:	45b1                	li	a1,12
1c008864:	c632                	sw	a2,12(sp)
1c008866:	ce06                	sw	ra,28(sp)
1c008868:	2b0d                	jal	1c008d9a <rt_alloc>
1c00886a:	4632                	lw	a2,12(sp)
1c00886c:	c115                	beqz	a0,1c008890 <__rt_cbsys_add+0x3a>
1c00886e:	1c0017b7          	lui	a5,0x1c001
1c008872:	040a                	slli	s0,s0,0x2
1c008874:	dcc78793          	addi	a5,a5,-564 # 1c000dcc <cbsys_first>
1c008878:	97a2                	add	a5,a5,s0
1c00887a:	4398                	lw	a4,0(a5)
1c00887c:	c104                	sw	s1,0(a0)
1c00887e:	c150                	sw	a2,4(a0)
1c008880:	c518                	sw	a4,8(a0)
1c008882:	c388                	sw	a0,0(a5)
1c008884:	4501                	li	a0,0
1c008886:	40f2                	lw	ra,28(sp)
1c008888:	4462                	lw	s0,24(sp)
1c00888a:	44d2                	lw	s1,20(sp)
1c00888c:	6105                	addi	sp,sp,32
1c00888e:	8082                	ret
1c008890:	557d                	li	a0,-1
1c008892:	bfd5                	j	1c008886 <__rt_cbsys_add+0x30>

1c008894 <__rt_cbsys_exec>:
1c008894:	1141                	addi	sp,sp,-16
1c008896:	c422                	sw	s0,8(sp)
1c008898:	1c001437          	lui	s0,0x1c001
1c00889c:	050a                	slli	a0,a0,0x2
1c00889e:	dcc40413          	addi	s0,s0,-564 # 1c000dcc <cbsys_first>
1c0088a2:	20a47403          	p.lw	s0,a0(s0)
1c0088a6:	c606                	sw	ra,12(sp)
1c0088a8:	e411                	bnez	s0,1c0088b4 <__rt_cbsys_exec+0x20>
1c0088aa:	4501                	li	a0,0
1c0088ac:	40b2                	lw	ra,12(sp)
1c0088ae:	4422                	lw	s0,8(sp)
1c0088b0:	0141                	addi	sp,sp,16
1c0088b2:	8082                	ret
1c0088b4:	401c                	lw	a5,0(s0)
1c0088b6:	4048                	lw	a0,4(s0)
1c0088b8:	9782                	jalr	a5
1c0088ba:	e119                	bnez	a0,1c0088c0 <__rt_cbsys_exec+0x2c>
1c0088bc:	4400                	lw	s0,8(s0)
1c0088be:	b7ed                	j	1c0088a8 <__rt_cbsys_exec+0x14>
1c0088c0:	557d                	li	a0,-1
1c0088c2:	b7ed                	j	1c0088ac <__rt_cbsys_exec+0x18>

1c0088c4 <__rt_utils_init>:
1c0088c4:	1c0017b7          	lui	a5,0x1c001
1c0088c8:	dcc78793          	addi	a5,a5,-564 # 1c000dcc <cbsys_first>
1c0088cc:	0007a023          	sw	zero,0(a5)
1c0088d0:	0007a223          	sw	zero,4(a5)
1c0088d4:	0007a423          	sw	zero,8(a5)
1c0088d8:	0007a623          	sw	zero,12(a5)
1c0088dc:	0007a823          	sw	zero,16(a5)
1c0088e0:	0007aa23          	sw	zero,20(a5)
1c0088e4:	8082                	ret

1c0088e6 <__rt_fc_lock>:
1c0088e6:	1141                	addi	sp,sp,-16
1c0088e8:	c422                	sw	s0,8(sp)
1c0088ea:	c606                	sw	ra,12(sp)
1c0088ec:	c226                	sw	s1,4(sp)
1c0088ee:	842a                	mv	s0,a0
1c0088f0:	300474f3          	csrrci	s1,mstatus,8
1c0088f4:	401c                	lw	a5,0(s0)
1c0088f6:	eb91                	bnez	a5,1c00890a <__rt_fc_lock+0x24>
1c0088f8:	4785                	li	a5,1
1c0088fa:	c01c                	sw	a5,0(s0)
1c0088fc:	30049073          	csrw	mstatus,s1
1c008900:	40b2                	lw	ra,12(sp)
1c008902:	4422                	lw	s0,8(sp)
1c008904:	4492                	lw	s1,4(sp)
1c008906:	0141                	addi	sp,sp,16
1c008908:	8082                	ret
1c00890a:	4585                	li	a1,1
1c00890c:	e3ff7517          	auipc	a0,0xe3ff7
1c008910:	71050513          	addi	a0,a0,1808 # 1c <__rt_sched>
1c008914:	26ad                	jal	1c008c7e <__rt_event_execute>
1c008916:	bff9                	j	1c0088f4 <__rt_fc_lock+0xe>

1c008918 <__rt_fc_unlock>:
1c008918:	300477f3          	csrrci	a5,mstatus,8
1c00891c:	00052023          	sw	zero,0(a0)
1c008920:	30079073          	csrw	mstatus,a5
1c008924:	8082                	ret

1c008926 <__rt_event_enqueue>:
1c008926:	01c02783          	lw	a5,28(zero) # 1c <__rt_sched>
1c00892a:	00052c23          	sw	zero,24(a0)
1c00892e:	c799                	beqz	a5,1c00893c <__rt_event_enqueue+0x16>
1c008930:	02002783          	lw	a5,32(zero) # 20 <__rt_sched+0x4>
1c008934:	cf88                	sw	a0,24(a5)
1c008936:	02a02023          	sw	a0,32(zero) # 20 <__rt_sched+0x4>
1c00893a:	8082                	ret
1c00893c:	00a02e23          	sw	a0,28(zero) # 1c <__rt_sched>
1c008940:	bfdd                	j	1c008936 <__rt_event_enqueue+0x10>

1c008942 <__rt_bridge_check_bridge_req.part.5>:
1c008942:	1c001737          	lui	a4,0x1c001
1c008946:	df470793          	addi	a5,a4,-524 # 1c000df4 <__hal_debug_struct>
1c00894a:	0a47a783          	lw	a5,164(a5)
1c00894e:	df470713          	addi	a4,a4,-524
1c008952:	c789                	beqz	a5,1c00895c <__rt_bridge_check_bridge_req.part.5+0x1a>
1c008954:	4f94                	lw	a3,24(a5)
1c008956:	e681                	bnez	a3,1c00895e <__rt_bridge_check_bridge_req.part.5+0x1c>
1c008958:	0af72623          	sw	a5,172(a4)
1c00895c:	8082                	ret
1c00895e:	479c                	lw	a5,8(a5)
1c008960:	bfcd                	j	1c008952 <__rt_bridge_check_bridge_req.part.5+0x10>

1c008962 <__rt_bridge_wait>:
1c008962:	f14027f3          	csrr	a5,mhartid
1c008966:	477d                	li	a4,31
1c008968:	ca5797b3          	p.extractu	a5,a5,5,5
1c00896c:	02e79f63          	bne	a5,a4,1c0089aa <__rt_bridge_wait+0x48>
1c008970:	1a10a7b7          	lui	a5,0x1a10a
1c008974:	80c78513          	addi	a0,a5,-2036 # 1a10980c <__rt_udma_callback_data+0x1a109514>
1c008978:	6711                	lui	a4,0x4
1c00897a:	80478593          	addi	a1,a5,-2044
1c00897e:	80878613          	addi	a2,a5,-2040
1c008982:	300476f3          	csrrci	a3,mstatus,8
1c008986:	00052803          	lw	a6,0(a0)
1c00898a:	01181893          	slli	a7,a6,0x11
1c00898e:	0008c963          	bltz	a7,1c0089a0 <__rt_bridge_wait+0x3e>
1c008992:	c198                	sw	a4,0(a1)
1c008994:	10500073          	wfi
1c008998:	c218                	sw	a4,0(a2)
1c00899a:	30069073          	csrw	mstatus,a3
1c00899e:	b7d5                	j	1c008982 <__rt_bridge_wait+0x20>
1c0089a0:	81478793          	addi	a5,a5,-2028
1c0089a4:	c398                	sw	a4,0(a5)
1c0089a6:	30069073          	csrw	mstatus,a3
1c0089aa:	8082                	ret

1c0089ac <__rt_bridge_handle_notif>:
1c0089ac:	1141                	addi	sp,sp,-16
1c0089ae:	c422                	sw	s0,8(sp)
1c0089b0:	1c001437          	lui	s0,0x1c001
1c0089b4:	df440793          	addi	a5,s0,-524 # 1c000df4 <__hal_debug_struct>
1c0089b8:	0a47a783          	lw	a5,164(a5)
1c0089bc:	c606                	sw	ra,12(sp)
1c0089be:	c226                	sw	s1,4(sp)
1c0089c0:	c04a                	sw	s2,0(sp)
1c0089c2:	df440413          	addi	s0,s0,-524
1c0089c6:	c399                	beqz	a5,1c0089cc <__rt_bridge_handle_notif+0x20>
1c0089c8:	4bd8                	lw	a4,20(a5)
1c0089ca:	e30d                	bnez	a4,1c0089ec <__rt_bridge_handle_notif+0x40>
1c0089cc:	0b442783          	lw	a5,180(s0)
1c0089d0:	c789                	beqz	a5,1c0089da <__rt_bridge_handle_notif+0x2e>
1c0089d2:	43a8                	lw	a0,64(a5)
1c0089d4:	0a042a23          	sw	zero,180(s0)
1c0089d8:	37b9                	jal	1c008926 <__rt_event_enqueue>
1c0089da:	0ac42783          	lw	a5,172(s0)
1c0089de:	eb9d                	bnez	a5,1c008a14 <__rt_bridge_handle_notif+0x68>
1c0089e0:	4422                	lw	s0,8(sp)
1c0089e2:	40b2                	lw	ra,12(sp)
1c0089e4:	4492                	lw	s1,4(sp)
1c0089e6:	4902                	lw	s2,0(sp)
1c0089e8:	0141                	addi	sp,sp,16
1c0089ea:	bfa1                	j	1c008942 <__rt_bridge_check_bridge_req.part.5>
1c0089ec:	0087a903          	lw	s2,8(a5)
1c0089f0:	4fd8                	lw	a4,28(a5)
1c0089f2:	0b242223          	sw	s2,164(s0)
1c0089f6:	cb01                	beqz	a4,1c008a06 <__rt_bridge_handle_notif+0x5a>
1c0089f8:	0b042703          	lw	a4,176(s0)
1c0089fc:	c798                	sw	a4,8(a5)
1c0089fe:	0af42823          	sw	a5,176(s0)
1c008a02:	87ca                	mv	a5,s2
1c008a04:	b7c9                	j	1c0089c6 <__rt_bridge_handle_notif+0x1a>
1c008a06:	43a8                	lw	a0,64(a5)
1c008a08:	300474f3          	csrrci	s1,mstatus,8
1c008a0c:	3f29                	jal	1c008926 <__rt_event_enqueue>
1c008a0e:	30049073          	csrw	mstatus,s1
1c008a12:	bfc5                	j	1c008a02 <__rt_bridge_handle_notif+0x56>
1c008a14:	40b2                	lw	ra,12(sp)
1c008a16:	4422                	lw	s0,8(sp)
1c008a18:	4492                	lw	s1,4(sp)
1c008a1a:	4902                	lw	s2,0(sp)
1c008a1c:	0141                	addi	sp,sp,16
1c008a1e:	8082                	ret

1c008a20 <__rt_bridge_check_connection>:
1c008a20:	1c0016b7          	lui	a3,0x1c001
1c008a24:	df468693          	addi	a3,a3,-524 # 1c000df4 <__hal_debug_struct>
1c008a28:	469c                	lw	a5,8(a3)
1c008a2a:	ef9d                	bnez	a5,1c008a68 <__rt_bridge_check_connection+0x48>
1c008a2c:	1a1047b7          	lui	a5,0x1a104
1c008a30:	07478793          	addi	a5,a5,116 # 1a104074 <__rt_udma_callback_data+0x1a103d7c>
1c008a34:	4398                	lw	a4,0(a5)
1c008a36:	8325                	srli	a4,a4,0x9
1c008a38:	f8373733          	p.bclr	a4,a4,28,3
1c008a3c:	02773663          	p.bneimm	a4,7,1c008a68 <__rt_bridge_check_connection+0x48>
1c008a40:	1141                	addi	sp,sp,-16
1c008a42:	c422                	sw	s0,8(sp)
1c008a44:	c606                	sw	ra,12(sp)
1c008a46:	4705                	li	a4,1
1c008a48:	c698                	sw	a4,8(a3)
1c008a4a:	4709                	li	a4,2
1c008a4c:	c398                	sw	a4,0(a5)
1c008a4e:	843e                	mv	s0,a5
1c008a50:	401c                	lw	a5,0(s0)
1c008a52:	83a5                	srli	a5,a5,0x9
1c008a54:	f837b7b3          	p.bclr	a5,a5,28,3
1c008a58:	0077a663          	p.beqimm	a5,7,1c008a64 <__rt_bridge_check_connection+0x44>
1c008a5c:	40b2                	lw	ra,12(sp)
1c008a5e:	4422                	lw	s0,8(sp)
1c008a60:	0141                	addi	sp,sp,16
1c008a62:	8082                	ret
1c008a64:	3dfd                	jal	1c008962 <__rt_bridge_wait>
1c008a66:	b7ed                	j	1c008a50 <__rt_bridge_check_connection+0x30>
1c008a68:	8082                	ret

1c008a6a <__rt_bridge_set_available>:
1c008a6a:	1c0017b7          	lui	a5,0x1c001
1c008a6e:	df478793          	addi	a5,a5,-524 # 1c000df4 <__hal_debug_struct>
1c008a72:	4798                	lw	a4,8(a5)
1c008a74:	1a1047b7          	lui	a5,0x1a104
1c008a78:	07478793          	addi	a5,a5,116 # 1a104074 <__rt_udma_callback_data+0x1a103d7c>
1c008a7c:	e701                	bnez	a4,1c008a84 <__rt_bridge_set_available+0x1a>
1c008a7e:	4721                	li	a4,8
1c008a80:	c398                	sw	a4,0(a5)
1c008a82:	8082                	ret
1c008a84:	4709                	li	a4,2
1c008a86:	bfed                	j	1c008a80 <__rt_bridge_set_available+0x16>

1c008a88 <__rt_bridge_send_notif>:
1c008a88:	1141                	addi	sp,sp,-16
1c008a8a:	c606                	sw	ra,12(sp)
1c008a8c:	3f51                	jal	1c008a20 <__rt_bridge_check_connection>
1c008a8e:	1c0017b7          	lui	a5,0x1c001
1c008a92:	df478793          	addi	a5,a5,-524 # 1c000df4 <__hal_debug_struct>
1c008a96:	479c                	lw	a5,8(a5)
1c008a98:	c789                	beqz	a5,1c008aa2 <__rt_bridge_send_notif+0x1a>
1c008a9a:	1a1047b7          	lui	a5,0x1a104
1c008a9e:	4719                	li	a4,6
1c008aa0:	dbf8                	sw	a4,116(a5)
1c008aa2:	40b2                	lw	ra,12(sp)
1c008aa4:	0141                	addi	sp,sp,16
1c008aa6:	8082                	ret

1c008aa8 <__rt_bridge_clear_notif>:
1c008aa8:	1141                	addi	sp,sp,-16
1c008aaa:	c606                	sw	ra,12(sp)
1c008aac:	3f95                	jal	1c008a20 <__rt_bridge_check_connection>
1c008aae:	1c0017b7          	lui	a5,0x1c001
1c008ab2:	df478793          	addi	a5,a5,-524 # 1c000df4 <__hal_debug_struct>
1c008ab6:	479c                	lw	a5,8(a5)
1c008ab8:	c781                	beqz	a5,1c008ac0 <__rt_bridge_clear_notif+0x18>
1c008aba:	40b2                	lw	ra,12(sp)
1c008abc:	0141                	addi	sp,sp,16
1c008abe:	b775                	j	1c008a6a <__rt_bridge_set_available>
1c008ac0:	40b2                	lw	ra,12(sp)
1c008ac2:	0141                	addi	sp,sp,16
1c008ac4:	8082                	ret

1c008ac6 <__rt_bridge_printf_flush>:
1c008ac6:	1141                	addi	sp,sp,-16
1c008ac8:	c422                	sw	s0,8(sp)
1c008aca:	c606                	sw	ra,12(sp)
1c008acc:	1c001437          	lui	s0,0x1c001
1c008ad0:	3f81                	jal	1c008a20 <__rt_bridge_check_connection>
1c008ad2:	df440793          	addi	a5,s0,-524 # 1c000df4 <__hal_debug_struct>
1c008ad6:	479c                	lw	a5,8(a5)
1c008ad8:	c385                	beqz	a5,1c008af8 <__rt_bridge_printf_flush+0x32>
1c008ada:	df440413          	addi	s0,s0,-524
1c008ade:	485c                	lw	a5,20(s0)
1c008ae0:	e399                	bnez	a5,1c008ae6 <__rt_bridge_printf_flush+0x20>
1c008ae2:	4c1c                	lw	a5,24(s0)
1c008ae4:	cb91                	beqz	a5,1c008af8 <__rt_bridge_printf_flush+0x32>
1c008ae6:	374d                	jal	1c008a88 <__rt_bridge_send_notif>
1c008ae8:	485c                	lw	a5,20(s0)
1c008aea:	e789                	bnez	a5,1c008af4 <__rt_bridge_printf_flush+0x2e>
1c008aec:	4422                	lw	s0,8(sp)
1c008aee:	40b2                	lw	ra,12(sp)
1c008af0:	0141                	addi	sp,sp,16
1c008af2:	bf5d                	j	1c008aa8 <__rt_bridge_clear_notif>
1c008af4:	35bd                	jal	1c008962 <__rt_bridge_wait>
1c008af6:	bfcd                	j	1c008ae8 <__rt_bridge_printf_flush+0x22>
1c008af8:	40b2                	lw	ra,12(sp)
1c008afa:	4422                	lw	s0,8(sp)
1c008afc:	0141                	addi	sp,sp,16
1c008afe:	8082                	ret

1c008b00 <__rt_bridge_req_shutdown>:
1c008b00:	1141                	addi	sp,sp,-16
1c008b02:	c606                	sw	ra,12(sp)
1c008b04:	c422                	sw	s0,8(sp)
1c008b06:	3f29                	jal	1c008a20 <__rt_bridge_check_connection>
1c008b08:	1c0017b7          	lui	a5,0x1c001
1c008b0c:	df478793          	addi	a5,a5,-524 # 1c000df4 <__hal_debug_struct>
1c008b10:	479c                	lw	a5,8(a5)
1c008b12:	c7a1                	beqz	a5,1c008b5a <__rt_bridge_req_shutdown+0x5a>
1c008b14:	1a104437          	lui	s0,0x1a104
1c008b18:	377d                	jal	1c008ac6 <__rt_bridge_printf_flush>
1c008b1a:	07440413          	addi	s0,s0,116 # 1a104074 <__rt_udma_callback_data+0x1a103d7c>
1c008b1e:	401c                	lw	a5,0(s0)
1c008b20:	83a5                	srli	a5,a5,0x9
1c008b22:	f837b7b3          	p.bclr	a5,a5,28,3
1c008b26:	0277ae63          	p.beqimm	a5,7,1c008b62 <__rt_bridge_req_shutdown+0x62>
1c008b2a:	4791                	li	a5,4
1c008b2c:	c01c                	sw	a5,0(s0)
1c008b2e:	1a104437          	lui	s0,0x1a104
1c008b32:	07440413          	addi	s0,s0,116 # 1a104074 <__rt_udma_callback_data+0x1a103d7c>
1c008b36:	401c                	lw	a5,0(s0)
1c008b38:	83a5                	srli	a5,a5,0x9
1c008b3a:	f837b7b3          	p.bclr	a5,a5,28,3
1c008b3e:	0277b463          	p.bneimm	a5,7,1c008b66 <__rt_bridge_req_shutdown+0x66>
1c008b42:	00042023          	sw	zero,0(s0)
1c008b46:	1a104437          	lui	s0,0x1a104
1c008b4a:	07440413          	addi	s0,s0,116 # 1a104074 <__rt_udma_callback_data+0x1a103d7c>
1c008b4e:	401c                	lw	a5,0(s0)
1c008b50:	83a5                	srli	a5,a5,0x9
1c008b52:	f837b7b3          	p.bclr	a5,a5,28,3
1c008b56:	0077aa63          	p.beqimm	a5,7,1c008b6a <__rt_bridge_req_shutdown+0x6a>
1c008b5a:	40b2                	lw	ra,12(sp)
1c008b5c:	4422                	lw	s0,8(sp)
1c008b5e:	0141                	addi	sp,sp,16
1c008b60:	8082                	ret
1c008b62:	3501                	jal	1c008962 <__rt_bridge_wait>
1c008b64:	bf6d                	j	1c008b1e <__rt_bridge_req_shutdown+0x1e>
1c008b66:	3bf5                	jal	1c008962 <__rt_bridge_wait>
1c008b68:	b7f9                	j	1c008b36 <__rt_bridge_req_shutdown+0x36>
1c008b6a:	3be5                	jal	1c008962 <__rt_bridge_wait>
1c008b6c:	b7cd                	j	1c008b4e <__rt_bridge_req_shutdown+0x4e>

1c008b6e <__rt_bridge_init>:
1c008b6e:	1c0017b7          	lui	a5,0x1c001
1c008b72:	1a10a737          	lui	a4,0x1a10a
1c008b76:	df478793          	addi	a5,a5,-524 # 1c000df4 <__hal_debug_struct>
1c008b7a:	81070713          	addi	a4,a4,-2032 # 1a109810 <__rt_udma_callback_data+0x1a109518>
1c008b7e:	0ae7ac23          	sw	a4,184(a5)
1c008b82:	4741                	li	a4,16
1c008b84:	0a07a223          	sw	zero,164(a5)
1c008b88:	0a07a623          	sw	zero,172(a5)
1c008b8c:	0a07aa23          	sw	zero,180(a5)
1c008b90:	0ae7ae23          	sw	a4,188(a5)
1c008b94:	00400793          	li	a5,4
1c008b98:	0007a823          	sw	zero,16(a5)
1c008b9c:	0007a023          	sw	zero,0(a5)
1c008ba0:	8082                	ret

1c008ba2 <__rt_event_init>:
1c008ba2:	02052023          	sw	zero,32(a0)
1c008ba6:	02052223          	sw	zero,36(a0)
1c008baa:	02052823          	sw	zero,48(a0)
1c008bae:	00052023          	sw	zero,0(a0)
1c008bb2:	8082                	ret

1c008bb4 <__rt_wait_event_prepare_blocking>:
1c008bb4:	01800793          	li	a5,24
1c008bb8:	4388                	lw	a0,0(a5)
1c008bba:	4d18                	lw	a4,24(a0)
1c008bbc:	02052223          	sw	zero,36(a0)
1c008bc0:	c398                	sw	a4,0(a5)
1c008bc2:	4785                	li	a5,1
1c008bc4:	d11c                	sw	a5,32(a0)
1c008bc6:	00052023          	sw	zero,0(a0)
1c008bca:	8082                	ret

1c008bcc <rt_event_alloc>:
1c008bcc:	1141                	addi	sp,sp,-16
1c008bce:	c422                	sw	s0,8(sp)
1c008bd0:	c606                	sw	ra,12(sp)
1c008bd2:	c226                	sw	s1,4(sp)
1c008bd4:	842e                	mv	s0,a1
1c008bd6:	300474f3          	csrrci	s1,mstatus,8
1c008bda:	f14027f3          	csrr	a5,mhartid
1c008bde:	8795                	srai	a5,a5,0x5
1c008be0:	f267b7b3          	p.bclr	a5,a5,25,6
1c008be4:	477d                	li	a4,31
1c008be6:	00378513          	addi	a0,a5,3
1c008bea:	00e79363          	bne	a5,a4,1c008bf0 <rt_event_alloc+0x24>
1c008bee:	4501                	li	a0,0
1c008bf0:	08c00593          	li	a1,140
1c008bf4:	02b405b3          	mul	a1,s0,a1
1c008bf8:	224d                	jal	1c008d9a <rt_alloc>
1c008bfa:	87aa                	mv	a5,a0
1c008bfc:	557d                	li	a0,-1
1c008bfe:	cf91                	beqz	a5,1c008c1a <rt_event_alloc+0x4e>
1c008c00:	01802683          	lw	a3,24(zero) # 18 <__rt_first_free>
1c008c04:	4581                	li	a1,0
1c008c06:	4601                	li	a2,0
1c008c08:	01800713          	li	a4,24
1c008c0c:	00864c63          	blt	a2,s0,1c008c24 <rt_event_alloc+0x58>
1c008c10:	c191                	beqz	a1,1c008c14 <rt_event_alloc+0x48>
1c008c12:	c314                	sw	a3,0(a4)
1c008c14:	30049073          	csrw	mstatus,s1
1c008c18:	4501                	li	a0,0
1c008c1a:	40b2                	lw	ra,12(sp)
1c008c1c:	4422                	lw	s0,8(sp)
1c008c1e:	4492                	lw	s1,4(sp)
1c008c20:	0141                	addi	sp,sp,16
1c008c22:	8082                	ret
1c008c24:	cf94                	sw	a3,24(a5)
1c008c26:	0207a023          	sw	zero,32(a5)
1c008c2a:	0207a223          	sw	zero,36(a5)
1c008c2e:	0207a823          	sw	zero,48(a5)
1c008c32:	0007a023          	sw	zero,0(a5)
1c008c36:	86be                	mv	a3,a5
1c008c38:	0605                	addi	a2,a2,1
1c008c3a:	4585                	li	a1,1
1c008c3c:	08c78793          	addi	a5,a5,140
1c008c40:	b7f1                	j	1c008c0c <rt_event_alloc+0x40>

1c008c42 <rt_event_get>:
1c008c42:	30047773          	csrrci	a4,mstatus,8
1c008c46:	01800793          	li	a5,24
1c008c4a:	4388                	lw	a0,0(a5)
1c008c4c:	c509                	beqz	a0,1c008c56 <rt_event_get+0x14>
1c008c4e:	4d14                	lw	a3,24(a0)
1c008c50:	c150                	sw	a2,4(a0)
1c008c52:	c394                	sw	a3,0(a5)
1c008c54:	c10c                	sw	a1,0(a0)
1c008c56:	30071073          	csrw	mstatus,a4
1c008c5a:	8082                	ret

1c008c5c <rt_event_get_blocking>:
1c008c5c:	30047773          	csrrci	a4,mstatus,8
1c008c60:	01800793          	li	a5,24
1c008c64:	4388                	lw	a0,0(a5)
1c008c66:	c909                	beqz	a0,1c008c78 <rt_event_get_blocking+0x1c>
1c008c68:	4d14                	lw	a3,24(a0)
1c008c6a:	00052223          	sw	zero,4(a0)
1c008c6e:	c394                	sw	a3,0(a5)
1c008c70:	4785                	li	a5,1
1c008c72:	00052023          	sw	zero,0(a0)
1c008c76:	d11c                	sw	a5,32(a0)
1c008c78:	30071073          	csrw	mstatus,a4
1c008c7c:	8082                	ret

1c008c7e <__rt_event_execute>:
1c008c7e:	1141                	addi	sp,sp,-16
1c008c80:	c422                	sw	s0,8(sp)
1c008c82:	01800793          	li	a5,24
1c008c86:	43dc                	lw	a5,4(a5)
1c008c88:	c606                	sw	ra,12(sp)
1c008c8a:	c226                	sw	s1,4(sp)
1c008c8c:	01800413          	li	s0,24
1c008c90:	eb91                	bnez	a5,1c008ca4 <__rt_event_execute+0x26>
1c008c92:	c1a9                	beqz	a1,1c008cd4 <__rt_event_execute+0x56>
1c008c94:	10500073          	wfi
1c008c98:	300467f3          	csrrsi	a5,mstatus,8
1c008c9c:	300477f3          	csrrci	a5,mstatus,8
1c008ca0:	405c                	lw	a5,4(s0)
1c008ca2:	cb8d                	beqz	a5,1c008cd4 <__rt_event_execute+0x56>
1c008ca4:	4485                	li	s1,1
1c008ca6:	4f98                	lw	a4,24(a5)
1c008ca8:	53d4                	lw	a3,36(a5)
1c008caa:	c058                	sw	a4,4(s0)
1c008cac:	00978823          	sb	s1,16(a5)
1c008cb0:	4398                	lw	a4,0(a5)
1c008cb2:	43c8                	lw	a0,4(a5)
1c008cb4:	e691                	bnez	a3,1c008cc0 <__rt_event_execute+0x42>
1c008cb6:	5394                	lw	a3,32(a5)
1c008cb8:	e681                	bnez	a3,1c008cc0 <__rt_event_execute+0x42>
1c008cba:	4014                	lw	a3,0(s0)
1c008cbc:	c01c                	sw	a5,0(s0)
1c008cbe:	cf94                	sw	a3,24(a5)
1c008cc0:	0207a023          	sw	zero,32(a5)
1c008cc4:	c711                	beqz	a4,1c008cd0 <__rt_event_execute+0x52>
1c008cc6:	300467f3          	csrrsi	a5,mstatus,8
1c008cca:	9702                	jalr	a4
1c008ccc:	300477f3          	csrrci	a5,mstatus,8
1c008cd0:	405c                	lw	a5,4(s0)
1c008cd2:	fbf1                	bnez	a5,1c008ca6 <__rt_event_execute+0x28>
1c008cd4:	40b2                	lw	ra,12(sp)
1c008cd6:	4422                	lw	s0,8(sp)
1c008cd8:	4492                	lw	s1,4(sp)
1c008cda:	0141                	addi	sp,sp,16
1c008cdc:	8082                	ret

1c008cde <__rt_wait_event>:
1c008cde:	1141                	addi	sp,sp,-16
1c008ce0:	c422                	sw	s0,8(sp)
1c008ce2:	c606                	sw	ra,12(sp)
1c008ce4:	842a                	mv	s0,a0
1c008ce6:	501c                	lw	a5,32(s0)
1c008ce8:	ef81                	bnez	a5,1c008d00 <__rt_wait_event+0x22>
1c008cea:	581c                	lw	a5,48(s0)
1c008cec:	eb91                	bnez	a5,1c008d00 <__rt_wait_event+0x22>
1c008cee:	01800793          	li	a5,24
1c008cf2:	4398                	lw	a4,0(a5)
1c008cf4:	40b2                	lw	ra,12(sp)
1c008cf6:	cc18                	sw	a4,24(s0)
1c008cf8:	c380                	sw	s0,0(a5)
1c008cfa:	4422                	lw	s0,8(sp)
1c008cfc:	0141                	addi	sp,sp,16
1c008cfe:	8082                	ret
1c008d00:	4585                	li	a1,1
1c008d02:	4501                	li	a0,0
1c008d04:	3fad                	jal	1c008c7e <__rt_event_execute>
1c008d06:	b7c5                	j	1c008ce6 <__rt_wait_event+0x8>

1c008d08 <rt_event_wait>:
1c008d08:	1141                	addi	sp,sp,-16
1c008d0a:	c606                	sw	ra,12(sp)
1c008d0c:	c422                	sw	s0,8(sp)
1c008d0e:	30047473          	csrrci	s0,mstatus,8
1c008d12:	37f1                	jal	1c008cde <__rt_wait_event>
1c008d14:	30041073          	csrw	mstatus,s0
1c008d18:	40b2                	lw	ra,12(sp)
1c008d1a:	4422                	lw	s0,8(sp)
1c008d1c:	0141                	addi	sp,sp,16
1c008d1e:	8082                	ret

1c008d20 <__rt_event_sched_init>:
1c008d20:	01800513          	li	a0,24
1c008d24:	00052023          	sw	zero,0(a0)
1c008d28:	00052223          	sw	zero,4(a0)
1c008d2c:	4585                	li	a1,1
1c008d2e:	0511                	addi	a0,a0,4
1c008d30:	bd71                	j	1c008bcc <rt_event_alloc>

1c008d32 <rt_user_alloc_init>:
1c008d32:	00758793          	addi	a5,a1,7
1c008d36:	c407b7b3          	p.bclr	a5,a5,2,0
1c008d3a:	40b785b3          	sub	a1,a5,a1
1c008d3e:	c11c                	sw	a5,0(a0)
1c008d40:	8e0d                	sub	a2,a2,a1
1c008d42:	00c05763          	blez	a2,1c008d50 <rt_user_alloc_init+0x1e>
1c008d46:	c4063633          	p.bclr	a2,a2,2,0
1c008d4a:	c390                	sw	a2,0(a5)
1c008d4c:	0007a223          	sw	zero,4(a5)
1c008d50:	8082                	ret

1c008d52 <rt_user_alloc>:
1c008d52:	059d                	addi	a1,a1,7
1c008d54:	411c                	lw	a5,0(a0)
1c008d56:	c405b5b3          	p.bclr	a1,a1,2,0
1c008d5a:	4701                	li	a4,0
1c008d5c:	cb89                	beqz	a5,1c008d6e <rt_user_alloc+0x1c>
1c008d5e:	4394                	lw	a3,0(a5)
1c008d60:	43d0                	lw	a2,4(a5)
1c008d62:	00b6c863          	blt	a3,a1,1c008d72 <rt_user_alloc+0x20>
1c008d66:	00b69b63          	bne	a3,a1,1c008d7c <rt_user_alloc+0x2a>
1c008d6a:	c719                	beqz	a4,1c008d78 <rt_user_alloc+0x26>
1c008d6c:	c350                	sw	a2,4(a4)
1c008d6e:	853e                	mv	a0,a5
1c008d70:	8082                	ret
1c008d72:	873e                	mv	a4,a5
1c008d74:	87b2                	mv	a5,a2
1c008d76:	b7dd                	j	1c008d5c <rt_user_alloc+0xa>
1c008d78:	c110                	sw	a2,0(a0)
1c008d7a:	bfd5                	j	1c008d6e <rt_user_alloc+0x1c>
1c008d7c:	00b78833          	add	a6,a5,a1
1c008d80:	40b685b3          	sub	a1,a3,a1
1c008d84:	00b82023          	sw	a1,0(a6)
1c008d88:	00c82223          	sw	a2,4(a6)
1c008d8c:	c701                	beqz	a4,1c008d94 <rt_user_alloc+0x42>
1c008d8e:	01072223          	sw	a6,4(a4)
1c008d92:	bff1                	j	1c008d6e <rt_user_alloc+0x1c>
1c008d94:	01052023          	sw	a6,0(a0)
1c008d98:	bfd9                	j	1c008d6e <rt_user_alloc+0x1c>

1c008d9a <rt_alloc>:
1c008d9a:	1101                	addi	sp,sp,-32
1c008d9c:	c84a                	sw	s2,16(sp)
1c008d9e:	1c001937          	lui	s2,0x1c001
1c008da2:	cc22                	sw	s0,24(sp)
1c008da4:	ca26                	sw	s1,20(sp)
1c008da6:	c64e                	sw	s3,12(sp)
1c008da8:	ce06                	sw	ra,28(sp)
1c008daa:	842a                	mv	s0,a0
1c008dac:	89ae                	mv	s3,a1
1c008dae:	448d                	li	s1,3
1c008db0:	f9090913          	addi	s2,s2,-112 # 1c000f90 <__rt_alloc_l2>
1c008db4:	00241513          	slli	a0,s0,0x2
1c008db8:	85ce                	mv	a1,s3
1c008dba:	954a                	add	a0,a0,s2
1c008dbc:	3f59                	jal	1c008d52 <rt_user_alloc>
1c008dbe:	e519                	bnez	a0,1c008dcc <rt_alloc+0x32>
1c008dc0:	0405                	addi	s0,s0,1
1c008dc2:	00343363          	p.bneimm	s0,3,1c008dc8 <rt_alloc+0x2e>
1c008dc6:	4401                	li	s0,0
1c008dc8:	14fd                	addi	s1,s1,-1
1c008dca:	f4ed                	bnez	s1,1c008db4 <rt_alloc+0x1a>
1c008dcc:	40f2                	lw	ra,28(sp)
1c008dce:	4462                	lw	s0,24(sp)
1c008dd0:	44d2                	lw	s1,20(sp)
1c008dd2:	4942                	lw	s2,16(sp)
1c008dd4:	49b2                	lw	s3,12(sp)
1c008dd6:	6105                	addi	sp,sp,32
1c008dd8:	8082                	ret

1c008dda <__rt_allocs_init>:
1c008dda:	1141                	addi	sp,sp,-16
1c008ddc:	1c0015b7          	lui	a1,0x1c001
1c008de0:	c606                	sw	ra,12(sp)
1c008de2:	fb058793          	addi	a5,a1,-80 # 1c000fb0 <__l2_priv0_end>
1c008de6:	1c008637          	lui	a2,0x1c008
1c008dea:	04c7c863          	blt	a5,a2,1c008e3a <__rt_allocs_init+0x60>
1c008dee:	4581                	li	a1,0
1c008df0:	4601                	li	a2,0
1c008df2:	1c001537          	lui	a0,0x1c001
1c008df6:	f9050513          	addi	a0,a0,-112 # 1c000f90 <__rt_alloc_l2>
1c008dfa:	3f25                	jal	1c008d32 <rt_user_alloc_init>
1c008dfc:	1c00a5b7          	lui	a1,0x1c00a
1c008e00:	3f058793          	addi	a5,a1,1008 # 1c00a3f0 <__l2_priv1_end>
1c008e04:	1c010637          	lui	a2,0x1c010
1c008e08:	02c7cd63          	blt	a5,a2,1c008e42 <__rt_allocs_init+0x68>
1c008e0c:	4581                	li	a1,0
1c008e0e:	4601                	li	a2,0
1c008e10:	1c001537          	lui	a0,0x1c001
1c008e14:	f9450513          	addi	a0,a0,-108 # 1c000f94 <__rt_alloc_l2+0x4>
1c008e18:	3f29                	jal	1c008d32 <rt_user_alloc_init>
1c008e1a:	1c0105b7          	lui	a1,0x1c010
1c008e1e:	0ec58793          	addi	a5,a1,236 # 1c0100ec <__l2_shared_end>
1c008e22:	40b2                	lw	ra,12(sp)
1c008e24:	1c080637          	lui	a2,0x1c080
1c008e28:	1c001537          	lui	a0,0x1c001
1c008e2c:	8e1d                	sub	a2,a2,a5
1c008e2e:	0ec58593          	addi	a1,a1,236
1c008e32:	f9850513          	addi	a0,a0,-104 # 1c000f98 <__rt_alloc_l2+0x8>
1c008e36:	0141                	addi	sp,sp,16
1c008e38:	bded                	j	1c008d32 <rt_user_alloc_init>
1c008e3a:	8e1d                	sub	a2,a2,a5
1c008e3c:	fb058593          	addi	a1,a1,-80
1c008e40:	bf4d                	j	1c008df2 <__rt_allocs_init+0x18>
1c008e42:	8e1d                	sub	a2,a2,a5
1c008e44:	3f058593          	addi	a1,a1,1008
1c008e48:	b7e1                	j	1c008e10 <__rt_allocs_init+0x36>

1c008e4a <__rt_time_poweroff>:
1c008e4a:	1a10b7b7          	lui	a5,0x1a10b
1c008e4e:	0791                	addi	a5,a5,4
1c008e50:	0087a783          	lw	a5,8(a5) # 1a10b008 <__rt_udma_callback_data+0x1a10ad10>
1c008e54:	1c001737          	lui	a4,0x1c001
1c008e58:	f6f72c23          	sw	a5,-136(a4) # 1c000f78 <timer_count>
1c008e5c:	4501                	li	a0,0
1c008e5e:	8082                	ret

1c008e60 <__rt_time_poweron>:
1c008e60:	1c0017b7          	lui	a5,0x1c001
1c008e64:	f787a703          	lw	a4,-136(a5) # 1c000f78 <timer_count>
1c008e68:	1a10b7b7          	lui	a5,0x1a10b
1c008e6c:	0791                	addi	a5,a5,4
1c008e6e:	00e7a423          	sw	a4,8(a5) # 1a10b008 <__rt_udma_callback_data+0x1a10ad10>
1c008e72:	4501                	li	a0,0
1c008e74:	8082                	ret

1c008e76 <rt_event_push_delayed>:
1c008e76:	30047373          	csrrci	t1,mstatus,8
1c008e7a:	1c001637          	lui	a2,0x1c001
1c008e7e:	f9c62703          	lw	a4,-100(a2) # 1c000f9c <first_delayed>
1c008e82:	1a10b7b7          	lui	a5,0x1a10b
1c008e86:	0791                	addi	a5,a5,4
1c008e88:	0087a783          	lw	a5,8(a5) # 1a10b008 <__rt_udma_callback_data+0x1a10ad10>
1c008e8c:	46f9                	li	a3,30
1c008e8e:	0405e5b3          	p.max	a1,a1,zero
1c008e92:	02d5c5b3          	div	a1,a1,a3
1c008e96:	800006b7          	lui	a3,0x80000
1c008e9a:	0585                	addi	a1,a1,1
1c008e9c:	fff6c693          	not	a3,a3
1c008ea0:	00d7f833          	and	a6,a5,a3
1c008ea4:	97ae                	add	a5,a5,a1
1c008ea6:	d95c                	sw	a5,52(a0)
1c008ea8:	982e                	add	a6,a6,a1
1c008eaa:	4781                	li	a5,0
1c008eac:	c719                	beqz	a4,1c008eba <rt_event_push_delayed+0x44>
1c008eae:	03472883          	lw	a7,52(a4)
1c008eb2:	00d8f8b3          	and	a7,a7,a3
1c008eb6:	0108e863          	bltu	a7,a6,1c008ec6 <rt_event_push_delayed+0x50>
1c008eba:	cb89                	beqz	a5,1c008ecc <rt_event_push_delayed+0x56>
1c008ebc:	cf88                	sw	a0,24(a5)
1c008ebe:	cd18                	sw	a4,24(a0)
1c008ec0:	30031073          	csrw	mstatus,t1
1c008ec4:	8082                	ret
1c008ec6:	87ba                	mv	a5,a4
1c008ec8:	4f18                	lw	a4,24(a4)
1c008eca:	b7cd                	j	1c008eac <rt_event_push_delayed+0x36>
1c008ecc:	1a10b7b7          	lui	a5,0x1a10b
1c008ed0:	0791                	addi	a5,a5,4
1c008ed2:	f8a62e23          	sw	a0,-100(a2)
1c008ed6:	cd18                	sw	a4,24(a0)
1c008ed8:	0087a703          	lw	a4,8(a5) # 1a10b008 <__rt_udma_callback_data+0x1a10ad10>
1c008edc:	95ba                	add	a1,a1,a4
1c008ede:	00b7a823          	sw	a1,16(a5)
1c008ee2:	08500713          	li	a4,133
1c008ee6:	00e7a023          	sw	a4,0(a5)
1c008eea:	bfd9                	j	1c008ec0 <rt_event_push_delayed+0x4a>

1c008eec <rt_time_wait_us>:
1c008eec:	1101                	addi	sp,sp,-32
1c008eee:	85aa                	mv	a1,a0
1c008ef0:	4501                	li	a0,0
1c008ef2:	ce06                	sw	ra,28(sp)
1c008ef4:	cc22                	sw	s0,24(sp)
1c008ef6:	c62e                	sw	a1,12(sp)
1c008ef8:	3395                	jal	1c008c5c <rt_event_get_blocking>
1c008efa:	45b2                	lw	a1,12(sp)
1c008efc:	842a                	mv	s0,a0
1c008efe:	3fa5                	jal	1c008e76 <rt_event_push_delayed>
1c008f00:	8522                	mv	a0,s0
1c008f02:	4462                	lw	s0,24(sp)
1c008f04:	40f2                	lw	ra,28(sp)
1c008f06:	6105                	addi	sp,sp,32
1c008f08:	b501                	j	1c008d08 <rt_event_wait>

1c008f0a <__rt_time_init>:
1c008f0a:	1c0017b7          	lui	a5,0x1c001
1c008f0e:	f807ae23          	sw	zero,-100(a5) # 1c000f9c <first_delayed>
1c008f12:	1a10b7b7          	lui	a5,0x1a10b
1c008f16:	1141                	addi	sp,sp,-16
1c008f18:	08300713          	li	a4,131
1c008f1c:	0791                	addi	a5,a5,4
1c008f1e:	c606                	sw	ra,12(sp)
1c008f20:	c422                	sw	s0,8(sp)
1c008f22:	00e7a023          	sw	a4,0(a5) # 1a10b000 <__rt_udma_callback_data+0x1a10ad08>
1c008f26:	1c0095b7          	lui	a1,0x1c009
1c008f2a:	f9058593          	addi	a1,a1,-112 # 1c008f90 <__rt_timer_handler>
1c008f2e:	452d                	li	a0,11
1c008f30:	863ff0ef          	jal	ra,1c008792 <rt_irq_set_handler>
1c008f34:	6785                	lui	a5,0x1
1c008f36:	1a10a737          	lui	a4,0x1a10a
1c008f3a:	80078793          	addi	a5,a5,-2048 # 800 <__rt_udma_callback_data+0x508>
1c008f3e:	1c0095b7          	lui	a1,0x1c009
1c008f42:	80f72223          	sw	a5,-2044(a4) # 1a109804 <__rt_udma_callback_data+0x1a10950c>
1c008f46:	4601                	li	a2,0
1c008f48:	e4a58593          	addi	a1,a1,-438 # 1c008e4a <__rt_time_poweroff>
1c008f4c:	4509                	li	a0,2
1c008f4e:	909ff0ef          	jal	ra,1c008856 <__rt_cbsys_add>
1c008f52:	1c0095b7          	lui	a1,0x1c009
1c008f56:	842a                	mv	s0,a0
1c008f58:	4601                	li	a2,0
1c008f5a:	e6058593          	addi	a1,a1,-416 # 1c008e60 <__rt_time_poweron>
1c008f5e:	450d                	li	a0,3
1c008f60:	8f7ff0ef          	jal	ra,1c008856 <__rt_cbsys_add>
1c008f64:	8d41                	or	a0,a0,s0
1c008f66:	c10d                	beqz	a0,1c008f88 <__rt_time_init+0x7e>
1c008f68:	f1402673          	csrr	a2,mhartid
1c008f6c:	1c000537          	lui	a0,0x1c000
1c008f70:	40565593          	srai	a1,a2,0x5
1c008f74:	f265b5b3          	p.bclr	a1,a1,25,6
1c008f78:	f4563633          	p.bclr	a2,a2,26,5
1c008f7c:	52050513          	addi	a0,a0,1312 # 1c000520 <sbox+0x1bc>
1c008f80:	11f000ef          	jal	ra,1c00989e <printf>
1c008f84:	087000ef          	jal	ra,1c00980a <abort>
1c008f88:	40b2                	lw	ra,12(sp)
1c008f8a:	4422                	lw	s0,8(sp)
1c008f8c:	0141                	addi	sp,sp,16
1c008f8e:	8082                	ret

1c008f90 <__rt_timer_handler>:
1c008f90:	7179                	addi	sp,sp,-48
1c008f92:	ce36                	sw	a3,28(sp)
1c008f94:	1c0016b7          	lui	a3,0x1c001
1c008f98:	cc3a                	sw	a4,24(sp)
1c008f9a:	ca3e                	sw	a5,20(sp)
1c008f9c:	1a10b737          	lui	a4,0x1a10b
1c008fa0:	f9c6a783          	lw	a5,-100(a3) # 1c000f9c <first_delayed>
1c008fa4:	0711                	addi	a4,a4,4
1c008fa6:	d61a                	sw	t1,44(sp)
1c008fa8:	d42a                	sw	a0,40(sp)
1c008faa:	d22e                	sw	a1,36(sp)
1c008fac:	d032                	sw	a2,32(sp)
1c008fae:	c842                	sw	a6,16(sp)
1c008fb0:	c646                	sw	a7,12(sp)
1c008fb2:	00872703          	lw	a4,8(a4) # 1a10b008 <__rt_udma_callback_data+0x1a10ad10>
1c008fb6:	800008b7          	lui	a7,0x80000
1c008fba:	01c02583          	lw	a1,28(zero) # 1c <__rt_sched>
1c008fbe:	02002603          	lw	a2,32(zero) # 20 <__rt_sched+0x4>
1c008fc2:	4501                	li	a0,0
1c008fc4:	4801                	li	a6,0
1c008fc6:	ffe8c893          	xori	a7,a7,-2
1c008fca:	e3ad                	bnez	a5,1c00902c <__rt_timer_handler+0x9c>
1c008fcc:	00080463          	beqz	a6,1c008fd4 <__rt_timer_handler+0x44>
1c008fd0:	00b02e23          	sw	a1,28(zero) # 1c <__rt_sched>
1c008fd4:	c119                	beqz	a0,1c008fda <__rt_timer_handler+0x4a>
1c008fd6:	02c02023          	sw	a2,32(zero) # 20 <__rt_sched+0x4>
1c008fda:	1a10b7b7          	lui	a5,0x1a10b
1c008fde:	08100713          	li	a4,129
1c008fe2:	0791                	addi	a5,a5,4
1c008fe4:	f806ae23          	sw	zero,-100(a3)
1c008fe8:	00e7a023          	sw	a4,0(a5) # 1a10b000 <__rt_udma_callback_data+0x1a10ad08>
1c008fec:	6785                	lui	a5,0x1
1c008fee:	1a10a737          	lui	a4,0x1a10a
1c008ff2:	80078793          	addi	a5,a5,-2048 # 800 <__rt_udma_callback_data+0x508>
1c008ff6:	80f72a23          	sw	a5,-2028(a4) # 1a109814 <__rt_udma_callback_data+0x1a10951c>
1c008ffa:	5332                	lw	t1,44(sp)
1c008ffc:	5522                	lw	a0,40(sp)
1c008ffe:	5592                	lw	a1,36(sp)
1c009000:	5602                	lw	a2,32(sp)
1c009002:	46f2                	lw	a3,28(sp)
1c009004:	4762                	lw	a4,24(sp)
1c009006:	47d2                	lw	a5,20(sp)
1c009008:	4842                	lw	a6,16(sp)
1c00900a:	48b2                	lw	a7,12(sp)
1c00900c:	6145                	addi	sp,sp,48
1c00900e:	30200073          	mret
1c009012:	0187a303          	lw	t1,24(a5)
1c009016:	0007ac23          	sw	zero,24(a5)
1c00901a:	c591                	beqz	a1,1c009026 <__rt_timer_handler+0x96>
1c00901c:	ce1c                	sw	a5,24(a2)
1c00901e:	863e                	mv	a2,a5
1c009020:	4505                	li	a0,1
1c009022:	879a                	mv	a5,t1
1c009024:	b75d                	j	1c008fca <__rt_timer_handler+0x3a>
1c009026:	85be                	mv	a1,a5
1c009028:	4805                	li	a6,1
1c00902a:	bfd5                	j	1c00901e <__rt_timer_handler+0x8e>
1c00902c:	0347a303          	lw	t1,52(a5)
1c009030:	40670333          	sub	t1,a4,t1
1c009034:	fc68ffe3          	bleu	t1,a7,1c009012 <__rt_timer_handler+0x82>
1c009038:	00080463          	beqz	a6,1c009040 <__rt_timer_handler+0xb0>
1c00903c:	00b02e23          	sw	a1,28(zero) # 1c <__rt_sched>
1c009040:	c119                	beqz	a0,1c009046 <__rt_timer_handler+0xb6>
1c009042:	02c02023          	sw	a2,32(zero) # 20 <__rt_sched+0x4>
1c009046:	f8f6ae23          	sw	a5,-100(a3)
1c00904a:	1a10b6b7          	lui	a3,0x1a10b
1c00904e:	0691                	addi	a3,a3,4
1c009050:	0086a603          	lw	a2,8(a3) # 1a10b008 <__rt_udma_callback_data+0x1a10ad10>
1c009054:	5bdc                	lw	a5,52(a5)
1c009056:	40e78733          	sub	a4,a5,a4
1c00905a:	9732                	add	a4,a4,a2
1c00905c:	00e6a823          	sw	a4,16(a3)
1c009060:	08500793          	li	a5,133
1c009064:	00f6a023          	sw	a5,0(a3)
1c009068:	bf49                	j	1c008ffa <__rt_timer_handler+0x6a>

1c00906a <rt_periph_copy>:
1c00906a:	1101                	addi	sp,sp,-32
1c00906c:	cc22                	sw	s0,24(sp)
1c00906e:	ca26                	sw	s1,20(sp)
1c009070:	ce06                	sw	ra,28(sp)
1c009072:	c84a                	sw	s2,16(sp)
1c009074:	842a                	mv	s0,a0
1c009076:	84ae                	mv	s1,a1
1c009078:	30047973          	csrrci	s2,mstatus,8
1c00907c:	853e                	mv	a0,a5
1c00907e:	eb91                	bnez	a5,1c009092 <rt_periph_copy+0x28>
1c009080:	c632                	sw	a2,12(sp)
1c009082:	c436                	sw	a3,8(sp)
1c009084:	c23a                	sw	a4,4(sp)
1c009086:	c03e                	sw	a5,0(sp)
1c009088:	3635                	jal	1c008bb4 <__rt_wait_event_prepare_blocking>
1c00908a:	4782                	lw	a5,0(sp)
1c00908c:	4712                	lw	a4,4(sp)
1c00908e:	46a2                	lw	a3,8(sp)
1c009090:	4632                	lw	a2,12(sp)
1c009092:	e419                	bnez	s0,1c0090a0 <rt_periph_copy+0x36>
1c009094:	03450413          	addi	s0,a0,52
1c009098:	04052023          	sw	zero,64(a0)
1c00909c:	04052823          	sw	zero,80(a0)
1c0090a0:	444c                	lw	a1,12(s0)
1c0090a2:	c054                	sw	a3,4(s0)
1c0090a4:	cc08                	sw	a0,24(s0)
1c0090a6:	f645b5b3          	p.bclr	a1,a1,27,4
1c0090aa:	4811                	li	a6,4
1c0090ac:	06b86263          	bltu	a6,a1,1c009110 <rt_periph_copy+0xa6>
1c0090b0:	03000593          	li	a1,48
1c0090b4:	00549313          	slli	t1,s1,0x5
1c0090b8:	959a                	add	a1,a1,t1
1c0090ba:	0005a803          	lw	a6,0(a1)
1c0090be:	00042a23          	sw	zero,20(s0)
1c0090c2:	03000893          	li	a7,48
1c0090c6:	04081f63          	bnez	a6,1c009124 <rt_periph_copy+0xba>
1c0090ca:	c180                	sw	s0,0(a1)
1c0090cc:	006885b3          	add	a1,a7,t1
1c0090d0:	0085ae03          	lw	t3,8(a1)
1c0090d4:	c1c0                	sw	s0,4(a1)
1c0090d6:	c0474733          	p.bset	a4,a4,0,4
1c0090da:	040e1863          	bnez	t3,1c00912a <rt_periph_copy+0xc0>
1c0090de:	4014d813          	srai	a6,s1,0x1
1c0090e2:	1a1025b7          	lui	a1,0x1a102
1c0090e6:	08058593          	addi	a1,a1,128 # 1a102080 <__rt_udma_callback_data+0x1a101d88>
1c0090ea:	081e                	slli	a6,a6,0x7
1c0090ec:	982e                	add	a6,a6,a1
1c0090ee:	00449593          	slli	a1,s1,0x4
1c0090f2:	89c1                	andi	a1,a1,16
1c0090f4:	95c2                	add	a1,a1,a6
1c0090f6:	00858e93          	addi	t4,a1,8
1c0090fa:	000ea803          	lw	a6,0(t4)
1c0090fe:	02087813          	andi	a6,a6,32
1c009102:	02081463          	bnez	a6,1c00912a <rt_periph_copy+0xc0>
1c009106:	00c5a22b          	p.sw	a2,4(a1!)
1c00910a:	c194                	sw	a3,0(a1)
1c00910c:	00eea023          	sw	a4,0(t4)
1c009110:	e391                	bnez	a5,1c009114 <rt_periph_copy+0xaa>
1c009112:	36f1                	jal	1c008cde <__rt_wait_event>
1c009114:	30091073          	csrw	mstatus,s2
1c009118:	40f2                	lw	ra,28(sp)
1c00911a:	4462                	lw	s0,24(sp)
1c00911c:	44d2                	lw	s1,20(sp)
1c00911e:	4942                	lw	s2,16(sp)
1c009120:	6105                	addi	sp,sp,32
1c009122:	8082                	ret
1c009124:	41cc                	lw	a1,4(a1)
1c009126:	c9c0                	sw	s0,20(a1)
1c009128:	b755                	j	1c0090cc <rt_periph_copy+0x62>
1c00912a:	00042823          	sw	zero,16(s0)
1c00912e:	c010                	sw	a2,0(s0)
1c009130:	c054                	sw	a3,4(s0)
1c009132:	c418                	sw	a4,8(s0)
1c009134:	fc0e1ee3          	bnez	t3,1c009110 <rt_periph_copy+0xa6>
1c009138:	989a                	add	a7,a7,t1
1c00913a:	0088a423          	sw	s0,8(a7) # 80000008 <pulp__FC+0x80000009>
1c00913e:	bfc9                	j	1c009110 <rt_periph_copy+0xa6>

1c009140 <__rt_periph_init>:
1c009140:	03000693          	li	a3,48
1c009144:	1c008637          	lui	a2,0x1c008
1c009148:	2a068693          	addi	a3,a3,672
1c00914c:	03000713          	li	a4,48
1c009150:	15a60613          	addi	a2,a2,346 # 1c00815a <udma_event_handler>
1c009154:	00a250fb          	lp.setupi	x1,10,1c00915c <__rt_periph_init+0x1c>
1c009158:	00c6a22b          	p.sw	a2,4(a3!)
1c00915c:	0001                	nop
1c00915e:	28072023          	sw	zero,640(a4)
1c009162:	28072223          	sw	zero,644(a4)
1c009166:	28072423          	sw	zero,648(a4)
1c00916a:	28072623          	sw	zero,652(a4)
1c00916e:	28072823          	sw	zero,656(a4)
1c009172:	28072a23          	sw	zero,660(a4)
1c009176:	28072c23          	sw	zero,664(a4)
1c00917a:	1a102837          	lui	a6,0x1a102
1c00917e:	28072e23          	sw	zero,668(a4)
1c009182:	03000793          	li	a5,48
1c009186:	4681                	li	a3,0
1c009188:	08080813          	addi	a6,a6,128 # 1a102080 <__rt_udma_callback_data+0x1a101d88>
1c00918c:	0148d0fb          	lp.setupi	x1,20,1c0091ae <__rt_periph_init+0x6e>
1c009190:	4016d713          	srai	a4,a3,0x1
1c009194:	00469513          	slli	a0,a3,0x4
1c009198:	071e                	slli	a4,a4,0x7
1c00919a:	9742                	add	a4,a4,a6
1c00919c:	8941                	andi	a0,a0,16
1c00919e:	972a                	add	a4,a4,a0
1c0091a0:	0007a023          	sw	zero,0(a5)
1c0091a4:	0007a423          	sw	zero,8(a5)
1c0091a8:	c7d8                	sw	a4,12(a5)
1c0091aa:	cfd0                	sw	a2,28(a5)
1c0091ac:	0685                	addi	a3,a3,1
1c0091ae:	02078793          	addi	a5,a5,32
1c0091b2:	8082                	ret

1c0091b4 <__rt_freq_init>:
1c0091b4:	1141                	addi	sp,sp,-16
1c0091b6:	c422                	sw	s0,8(sp)
1c0091b8:	c226                	sw	s1,4(sp)
1c0091ba:	c606                	sw	ra,12(sp)
1c0091bc:	2a45                	jal	1c00936c <__rt_flls_constructor>
1c0091be:	1c0017b7          	lui	a5,0x1c001
1c0091c2:	eb47a783          	lw	a5,-332(a5) # 1c000eb4 <__rt_platform>
1c0091c6:	1c001437          	lui	s0,0x1c001
1c0091ca:	fa040493          	addi	s1,s0,-96 # 1c000fa0 <__rt_freq_domains>
1c0091ce:	0017ae63          	p.beqimm	a5,1,1c0091ea <__rt_freq_init+0x36>
1c0091d2:	4501                	li	a0,0
1c0091d4:	28d5                	jal	1c0092c8 <__rt_fll_init>
1c0091d6:	faa42023          	sw	a0,-96(s0)
1c0091da:	4505                	li	a0,1
1c0091dc:	20f5                	jal	1c0092c8 <__rt_fll_init>
1c0091de:	c0c8                	sw	a0,4(s1)
1c0091e0:	40b2                	lw	ra,12(sp)
1c0091e2:	4422                	lw	s0,8(sp)
1c0091e4:	4492                	lw	s1,4(sp)
1c0091e6:	0141                	addi	sp,sp,16
1c0091e8:	8082                	ret
1c0091ea:	1c0017b7          	lui	a5,0x1c001
1c0091ee:	ec47a783          	lw	a5,-316(a5) # 1c000ec4 <__rt_fpga_fc_frequency>
1c0091f2:	faf42023          	sw	a5,-96(s0)
1c0091f6:	1c0017b7          	lui	a5,0x1c001
1c0091fa:	ec87a783          	lw	a5,-312(a5) # 1c000ec8 <__rt_fpga_periph_frequency>
1c0091fe:	c0dc                	sw	a5,4(s1)
1c009200:	b7c5                	j	1c0091e0 <__rt_freq_init+0x2c>

1c009202 <rt_padframe_set>:
1c009202:	300476f3          	csrrci	a3,mstatus,8
1c009206:	4158                	lw	a4,4(a0)
1c009208:	1a1047b7          	lui	a5,0x1a104
1c00920c:	430c                	lw	a1,0(a4)
1c00920e:	01078613          	addi	a2,a5,16 # 1a104010 <__rt_udma_callback_data+0x1a103d18>
1c009212:	c20c                	sw	a1,0(a2)
1c009214:	434c                	lw	a1,4(a4)
1c009216:	01478613          	addi	a2,a5,20
1c00921a:	c20c                	sw	a1,0(a2)
1c00921c:	470c                	lw	a1,8(a4)
1c00921e:	01878613          	addi	a2,a5,24
1c009222:	c20c                	sw	a1,0(a2)
1c009224:	4758                	lw	a4,12(a4)
1c009226:	07f1                	addi	a5,a5,28
1c009228:	c398                	sw	a4,0(a5)
1c00922a:	30069073          	csrw	mstatus,a3
1c00922e:	8082                	ret

1c009230 <__rt_padframe_init>:
1c009230:	1c001537          	lui	a0,0x1c001
1c009234:	eb850513          	addi	a0,a0,-328 # 1c000eb8 <__rt_padframe_profiles>
1c009238:	b7e9                	j	1c009202 <rt_padframe_set>

1c00923a <__rt_ov7670_init>:
1c00923a:	1c0107b7          	lui	a5,0x1c010
1c00923e:	00078023          	sb	zero,0(a5) # 1c010000 <__ov7670Inited>
1c009242:	8082                	ret

1c009244 <__rt_i2c_init>:
1c009244:	1c0107b7          	lui	a5,0x1c010
1c009248:	06078023          	sb	zero,96(a5) # 1c010060 <__rt_i2c+0x4>
1c00924c:	8082                	ret

1c00924e <__rt_fll_set_freq>:
1c00924e:	1101                	addi	sp,sp,-32
1c009250:	cc22                	sw	s0,24(sp)
1c009252:	ce06                	sw	ra,28(sp)
1c009254:	842a                	mv	s0,a0
1c009256:	e509                	bnez	a0,1c009260 <__rt_fll_set_freq+0x12>
1c009258:	c62e                	sw	a1,12(sp)
1c00925a:	8a7ff0ef          	jal	ra,1c008b00 <__rt_bridge_req_shutdown>
1c00925e:	45b2                	lw	a1,12(sp)
1c009260:	10059733          	p.fl1	a4,a1
1c009264:	47f5                	li	a5,29
1c009266:	4505                	li	a0,1
1c009268:	82e7b7db          	p.subun	a5,a5,a4,1
1c00926c:	04f567b3          	p.max	a5,a0,a5
1c009270:	fff78713          	addi	a4,a5,-1
1c009274:	00f595b3          	sll	a1,a1,a5
1c009278:	00e51533          	sll	a0,a0,a4
1c00927c:	1c0016b7          	lui	a3,0x1c001
1c009280:	dc05b733          	p.bclr	a4,a1,14,0
1c009284:	c0f7255b          	p.addunr	a0,a4,a5
1c009288:	fa868693          	addi	a3,a3,-88 # 1c000fa8 <__rt_fll_freq>
1c00928c:	00241713          	slli	a4,s0,0x2
1c009290:	00a6e723          	p.sw	a0,a4(a3)
1c009294:	1c001737          	lui	a4,0x1c001
1c009298:	f7c70713          	addi	a4,a4,-132 # 1c000f7c <__rt_fll_is_on>
1c00929c:	9722                	add	a4,a4,s0
1c00929e:	00074703          	lbu	a4,0(a4)
1c0092a2:	cf19                	beqz	a4,1c0092c0 <__rt_fll_set_freq+0x72>
1c0092a4:	0412                	slli	s0,s0,0x4
1c0092a6:	0411                	addi	s0,s0,4
1c0092a8:	1a1006b7          	lui	a3,0x1a100
1c0092ac:	2086f703          	p.lw	a4,s0(a3)
1c0092b0:	81bd                	srli	a1,a1,0xf
1c0092b2:	de05a733          	p.insert	a4,a1,15,0
1c0092b6:	0785                	addi	a5,a5,1
1c0092b8:	c7a7a733          	p.insert	a4,a5,3,26
1c0092bc:	00e6e423          	p.sw	a4,s0(a3)
1c0092c0:	40f2                	lw	ra,28(sp)
1c0092c2:	4462                	lw	s0,24(sp)
1c0092c4:	6105                	addi	sp,sp,32
1c0092c6:	8082                	ret

1c0092c8 <__rt_fll_init>:
1c0092c8:	1141                	addi	sp,sp,-16
1c0092ca:	00451613          	slli	a2,a0,0x4
1c0092ce:	c226                	sw	s1,4(sp)
1c0092d0:	00460813          	addi	a6,a2,4
1c0092d4:	84aa                	mv	s1,a0
1c0092d6:	1a1006b7          	lui	a3,0x1a100
1c0092da:	c606                	sw	ra,12(sp)
1c0092dc:	c422                	sw	s0,8(sp)
1c0092de:	2106f703          	p.lw	a4,a6(a3)
1c0092e2:	87ba                	mv	a5,a4
1c0092e4:	04074163          	bltz	a4,1c009326 <__rt_fll_init+0x5e>
1c0092e8:	00860893          	addi	a7,a2,8
1c0092ec:	2116f503          	p.lw	a0,a7(a3)
1c0092f0:	4599                	li	a1,6
1c0092f2:	caa5a533          	p.insert	a0,a1,5,10
1c0092f6:	05000593          	li	a1,80
1c0092fa:	d705a533          	p.insert	a0,a1,11,16
1c0092fe:	1a1005b7          	lui	a1,0x1a100
1c009302:	00a5e8a3          	p.sw	a0,a7(a1)
1c009306:	0631                	addi	a2,a2,12
1c009308:	20c6f683          	p.lw	a3,a2(a3)
1c00930c:	14c00513          	li	a0,332
1c009310:	d30526b3          	p.insert	a3,a0,9,16
1c009314:	00d5e623          	p.sw	a3,a2(a1)
1c009318:	4685                	li	a3,1
1c00931a:	c1e6a7b3          	p.insert	a5,a3,0,30
1c00931e:	c1f6a7b3          	p.insert	a5,a3,0,31
1c009322:	00f5e823          	p.sw	a5,a6(a1)
1c009326:	1c001637          	lui	a2,0x1c001
1c00932a:	00249693          	slli	a3,s1,0x2
1c00932e:	fa860613          	addi	a2,a2,-88 # 1c000fa8 <__rt_fll_freq>
1c009332:	96b2                	add	a3,a3,a2
1c009334:	4280                	lw	s0,0(a3)
1c009336:	c00d                	beqz	s0,1c009358 <__rt_fll_init+0x90>
1c009338:	85a2                	mv	a1,s0
1c00933a:	8526                	mv	a0,s1
1c00933c:	3f09                	jal	1c00924e <__rt_fll_set_freq>
1c00933e:	1c0017b7          	lui	a5,0x1c001
1c009342:	f7c78793          	addi	a5,a5,-132 # 1c000f7c <__rt_fll_is_on>
1c009346:	4705                	li	a4,1
1c009348:	00e7c4a3          	p.sb	a4,s1(a5)
1c00934c:	8522                	mv	a0,s0
1c00934e:	40b2                	lw	ra,12(sp)
1c009350:	4422                	lw	s0,8(sp)
1c009352:	4492                	lw	s1,4(sp)
1c009354:	0141                	addi	sp,sp,16
1c009356:	8082                	ret
1c009358:	10075733          	p.exthz	a4,a4
1c00935c:	c7a797b3          	p.extractu	a5,a5,3,26
1c009360:	073e                	slli	a4,a4,0xf
1c009362:	17fd                	addi	a5,a5,-1
1c009364:	00f75433          	srl	s0,a4,a5
1c009368:	c280                	sw	s0,0(a3)
1c00936a:	bfd1                	j	1c00933e <__rt_fll_init+0x76>

1c00936c <__rt_flls_constructor>:
1c00936c:	1c0017b7          	lui	a5,0x1c001
1c009370:	fa07a423          	sw	zero,-88(a5) # 1c000fa8 <__rt_fll_freq>
1c009374:	fa878793          	addi	a5,a5,-88
1c009378:	0007a223          	sw	zero,4(a5)
1c00937c:	1c0017b7          	lui	a5,0x1c001
1c009380:	f6079e23          	sh	zero,-132(a5) # 1c000f7c <__rt_fll_is_on>
1c009384:	8082                	ret

1c009386 <rt_is_fc>:
1c009386:	f1402573          	csrr	a0,mhartid
1c00938a:	8515                	srai	a0,a0,0x5
1c00938c:	f2653533          	p.bclr	a0,a0,25,6
1c009390:	1505                	addi	a0,a0,-31
1c009392:	00153513          	seqz	a0,a0
1c009396:	8082                	ret

1c009398 <__rt_io_end_of_flush>:
1c009398:	1c0017b7          	lui	a5,0x1c001
1c00939c:	f807a223          	sw	zero,-124(a5) # 1c000f84 <__rt_io_pending_flush>
1c0093a0:	00052c23          	sw	zero,24(a0)
1c0093a4:	8082                	ret

1c0093a6 <__rt_io_unlock>:
1c0093a6:	1c0017b7          	lui	a5,0x1c001
1c0093aa:	e047a783          	lw	a5,-508(a5) # 1c000e04 <__hal_debug_struct+0x10>
1c0093ae:	cf81                	beqz	a5,1c0093c6 <__rt_io_unlock+0x20>
1c0093b0:	1c0017b7          	lui	a5,0x1c001
1c0093b4:	f8c7a783          	lw	a5,-116(a5) # 1c000f8c <_rt_io_uart>
1c0093b8:	e799                	bnez	a5,1c0093c6 <__rt_io_unlock+0x20>
1c0093ba:	1c0017b7          	lui	a5,0x1c001
1c0093be:	f707a783          	lw	a5,-144(a5) # 1c000f70 <__rt_iodev>
1c0093c2:	0227b163          	p.bneimm	a5,2,1c0093e4 <__rt_io_unlock+0x3e>
1c0093c6:	1141                	addi	sp,sp,-16
1c0093c8:	c606                	sw	ra,12(sp)
1c0093ca:	3f75                	jal	1c009386 <rt_is_fc>
1c0093cc:	c909                	beqz	a0,1c0093de <__rt_io_unlock+0x38>
1c0093ce:	40b2                	lw	ra,12(sp)
1c0093d0:	1c001537          	lui	a0,0x1c001
1c0093d4:	de450513          	addi	a0,a0,-540 # 1c000de4 <__rt_io_fc_lock>
1c0093d8:	0141                	addi	sp,sp,16
1c0093da:	d3eff06f          	j	1c008918 <__rt_fc_unlock>
1c0093de:	40b2                	lw	ra,12(sp)
1c0093e0:	0141                	addi	sp,sp,16
1c0093e2:	8082                	ret
1c0093e4:	8082                	ret

1c0093e6 <__rt_io_lock>:
1c0093e6:	1c0017b7          	lui	a5,0x1c001
1c0093ea:	e047a783          	lw	a5,-508(a5) # 1c000e04 <__hal_debug_struct+0x10>
1c0093ee:	cf81                	beqz	a5,1c009406 <__rt_io_lock+0x20>
1c0093f0:	1c0017b7          	lui	a5,0x1c001
1c0093f4:	f8c7a783          	lw	a5,-116(a5) # 1c000f8c <_rt_io_uart>
1c0093f8:	e799                	bnez	a5,1c009406 <__rt_io_lock+0x20>
1c0093fa:	1c0017b7          	lui	a5,0x1c001
1c0093fe:	f707a783          	lw	a5,-144(a5) # 1c000f70 <__rt_iodev>
1c009402:	0227b163          	p.bneimm	a5,2,1c009424 <__rt_io_lock+0x3e>
1c009406:	1141                	addi	sp,sp,-16
1c009408:	c606                	sw	ra,12(sp)
1c00940a:	3fb5                	jal	1c009386 <rt_is_fc>
1c00940c:	c909                	beqz	a0,1c00941e <__rt_io_lock+0x38>
1c00940e:	40b2                	lw	ra,12(sp)
1c009410:	1c001537          	lui	a0,0x1c001
1c009414:	de450513          	addi	a0,a0,-540 # 1c000de4 <__rt_io_fc_lock>
1c009418:	0141                	addi	sp,sp,16
1c00941a:	cccff06f          	j	1c0088e6 <__rt_fc_lock>
1c00941e:	40b2                	lw	ra,12(sp)
1c009420:	0141                	addi	sp,sp,16
1c009422:	8082                	ret
1c009424:	8082                	ret

1c009426 <__rt_io_start>:
1c009426:	1101                	addi	sp,sp,-32
1c009428:	0028                	addi	a0,sp,8
1c00942a:	ce06                	sw	ra,28(sp)
1c00942c:	cc22                	sw	s0,24(sp)
1c00942e:	68b000ef          	jal	ra,1c00a2b8 <rt_uart_conf_init>
1c009432:	4585                	li	a1,1
1c009434:	4501                	li	a0,0
1c009436:	f96ff0ef          	jal	ra,1c008bcc <rt_event_alloc>
1c00943a:	547d                	li	s0,-1
1c00943c:	ed15                	bnez	a0,1c009478 <__rt_io_start+0x52>
1c00943e:	1c0017b7          	lui	a5,0x1c001
1c009442:	ec07a783          	lw	a5,-320(a5) # 1c000ec0 <__rt_iodev_uart_baudrate>
1c009446:	842a                	mv	s0,a0
1c009448:	1c001537          	lui	a0,0x1c001
1c00944c:	e3ff7597          	auipc	a1,0xe3ff7
1c009450:	bd058593          	addi	a1,a1,-1072 # 1c <__rt_sched>
1c009454:	ed050513          	addi	a0,a0,-304 # 1c000ed0 <_bss_start>
1c009458:	c43e                	sw	a5,8(sp)
1c00945a:	f48ff0ef          	jal	ra,1c008ba2 <__rt_event_init>
1c00945e:	1c0017b7          	lui	a5,0x1c001
1c009462:	f747a503          	lw	a0,-140(a5) # 1c000f74 <__rt_iodev_uart_channel>
1c009466:	4681                	li	a3,0
1c009468:	4601                	li	a2,0
1c00946a:	002c                	addi	a1,sp,8
1c00946c:	65d000ef          	jal	ra,1c00a2c8 <__rt_uart_open>
1c009470:	1c0017b7          	lui	a5,0x1c001
1c009474:	f8a7a623          	sw	a0,-116(a5) # 1c000f8c <_rt_io_uart>
1c009478:	8522                	mv	a0,s0
1c00947a:	40f2                	lw	ra,28(sp)
1c00947c:	4462                	lw	s0,24(sp)
1c00947e:	6105                	addi	sp,sp,32
1c009480:	8082                	ret

1c009482 <rt_event_execute.isra.0.constprop.6>:
1c009482:	1141                	addi	sp,sp,-16
1c009484:	c606                	sw	ra,12(sp)
1c009486:	c422                	sw	s0,8(sp)
1c009488:	30047473          	csrrci	s0,mstatus,8
1c00948c:	4585                	li	a1,1
1c00948e:	e3ff7517          	auipc	a0,0xe3ff7
1c009492:	b8e50513          	addi	a0,a0,-1138 # 1c <__rt_sched>
1c009496:	fe8ff0ef          	jal	ra,1c008c7e <__rt_event_execute>
1c00949a:	30041073          	csrw	mstatus,s0
1c00949e:	40b2                	lw	ra,12(sp)
1c0094a0:	4422                	lw	s0,8(sp)
1c0094a2:	0141                	addi	sp,sp,16
1c0094a4:	8082                	ret

1c0094a6 <__rt_io_uart_wait_pending>:
1c0094a6:	1141                	addi	sp,sp,-16
1c0094a8:	c422                	sw	s0,8(sp)
1c0094aa:	c606                	sw	ra,12(sp)
1c0094ac:	c226                	sw	s1,4(sp)
1c0094ae:	1c001437          	lui	s0,0x1c001
1c0094b2:	f8442783          	lw	a5,-124(s0) # 1c000f84 <__rt_io_pending_flush>
1c0094b6:	e39d                	bnez	a5,1c0094dc <__rt_io_uart_wait_pending+0x36>
1c0094b8:	1c001437          	lui	s0,0x1c001
1c0094bc:	f8040413          	addi	s0,s0,-128 # 1c000f80 <__rt_io_event_current>
1c0094c0:	4004                	lw	s1,0(s0)
1c0094c2:	c881                	beqz	s1,1c0094d2 <__rt_io_uart_wait_pending+0x2c>
1c0094c4:	35c9                	jal	1c009386 <rt_is_fc>
1c0094c6:	c511                	beqz	a0,1c0094d2 <__rt_io_uart_wait_pending+0x2c>
1c0094c8:	8526                	mv	a0,s1
1c0094ca:	83fff0ef          	jal	ra,1c008d08 <rt_event_wait>
1c0094ce:	00042023          	sw	zero,0(s0)
1c0094d2:	40b2                	lw	ra,12(sp)
1c0094d4:	4422                	lw	s0,8(sp)
1c0094d6:	4492                	lw	s1,4(sp)
1c0094d8:	0141                	addi	sp,sp,16
1c0094da:	8082                	ret
1c0094dc:	35e9                	jal	1c0093a6 <__rt_io_unlock>
1c0094de:	3755                	jal	1c009482 <rt_event_execute.isra.0.constprop.6>
1c0094e0:	3719                	jal	1c0093e6 <__rt_io_lock>
1c0094e2:	bfc1                	j	1c0094b2 <__rt_io_uart_wait_pending+0xc>

1c0094e4 <__rt_io_stop>:
1c0094e4:	1141                	addi	sp,sp,-16
1c0094e6:	c422                	sw	s0,8(sp)
1c0094e8:	1c001437          	lui	s0,0x1c001
1c0094ec:	c606                	sw	ra,12(sp)
1c0094ee:	f8c40413          	addi	s0,s0,-116 # 1c000f8c <_rt_io_uart>
1c0094f2:	3f55                	jal	1c0094a6 <__rt_io_uart_wait_pending>
1c0094f4:	4008                	lw	a0,0(s0)
1c0094f6:	4581                	li	a1,0
1c0094f8:	653000ef          	jal	ra,1c00a34a <rt_uart_close>
1c0094fc:	40b2                	lw	ra,12(sp)
1c0094fe:	00042023          	sw	zero,0(s0)
1c009502:	4422                	lw	s0,8(sp)
1c009504:	4501                	li	a0,0
1c009506:	0141                	addi	sp,sp,16
1c009508:	8082                	ret

1c00950a <__rt_io_uart_flush.constprop.5>:
1c00950a:	1101                	addi	sp,sp,-32
1c00950c:	ca26                	sw	s1,20(sp)
1c00950e:	ce06                	sw	ra,28(sp)
1c009510:	cc22                	sw	s0,24(sp)
1c009512:	c84a                	sw	s2,16(sp)
1c009514:	c64e                	sw	s3,12(sp)
1c009516:	c452                	sw	s4,8(sp)
1c009518:	1c0014b7          	lui	s1,0x1c001
1c00951c:	f844a783          	lw	a5,-124(s1) # 1c000f84 <__rt_io_pending_flush>
1c009520:	f8448413          	addi	s0,s1,-124
1c009524:	e3a5                	bnez	a5,1c009584 <__rt_io_uart_flush.constprop.5+0x7a>
1c009526:	1c0019b7          	lui	s3,0x1c001
1c00952a:	df498493          	addi	s1,s3,-524 # 1c000df4 <__hal_debug_struct>
1c00952e:	0184a903          	lw	s2,24(s1)
1c009532:	04090f63          	beqz	s2,1c009590 <__rt_io_uart_flush.constprop.5+0x86>
1c009536:	3d81                	jal	1c009386 <rt_is_fc>
1c009538:	cd21                	beqz	a0,1c009590 <__rt_io_uart_flush.constprop.5+0x86>
1c00953a:	4785                	li	a5,1
1c00953c:	c01c                	sw	a5,0(s0)
1c00953e:	1c0095b7          	lui	a1,0x1c009
1c009542:	1c0017b7          	lui	a5,0x1c001
1c009546:	f8c7aa03          	lw	s4,-116(a5) # 1c000f8c <_rt_io_uart>
1c00954a:	df498613          	addi	a2,s3,-524
1c00954e:	39858593          	addi	a1,a1,920 # 1c009398 <__rt_io_end_of_flush>
1c009552:	4501                	li	a0,0
1c009554:	eeeff0ef          	jal	ra,1c008c42 <rt_event_get>
1c009558:	004a2583          	lw	a1,4(s4)
1c00955c:	87aa                	mv	a5,a0
1c00955e:	0586                	slli	a1,a1,0x1
1c009560:	4701                	li	a4,0
1c009562:	86ca                	mv	a3,s2
1c009564:	01c48613          	addi	a2,s1,28
1c009568:	0585                	addi	a1,a1,1
1c00956a:	4501                	li	a0,0
1c00956c:	3cfd                	jal	1c00906a <rt_periph_copy>
1c00956e:	3d25                	jal	1c0093a6 <__rt_io_unlock>
1c009570:	401c                	lw	a5,0(s0)
1c009572:	ef89                	bnez	a5,1c00958c <__rt_io_uart_flush.constprop.5+0x82>
1c009574:	4462                	lw	s0,24(sp)
1c009576:	40f2                	lw	ra,28(sp)
1c009578:	44d2                	lw	s1,20(sp)
1c00957a:	4942                	lw	s2,16(sp)
1c00957c:	49b2                	lw	s3,12(sp)
1c00957e:	4a22                	lw	s4,8(sp)
1c009580:	6105                	addi	sp,sp,32
1c009582:	b595                	j	1c0093e6 <__rt_io_lock>
1c009584:	350d                	jal	1c0093a6 <__rt_io_unlock>
1c009586:	3df5                	jal	1c009482 <rt_event_execute.isra.0.constprop.6>
1c009588:	3db9                	jal	1c0093e6 <__rt_io_lock>
1c00958a:	bf49                	j	1c00951c <__rt_io_uart_flush.constprop.5+0x12>
1c00958c:	3ddd                	jal	1c009482 <rt_event_execute.isra.0.constprop.6>
1c00958e:	b7cd                	j	1c009570 <__rt_io_uart_flush.constprop.5+0x66>
1c009590:	40f2                	lw	ra,28(sp)
1c009592:	4462                	lw	s0,24(sp)
1c009594:	44d2                	lw	s1,20(sp)
1c009596:	4942                	lw	s2,16(sp)
1c009598:	49b2                	lw	s3,12(sp)
1c00959a:	4a22                	lw	s4,8(sp)
1c00959c:	6105                	addi	sp,sp,32
1c00959e:	8082                	ret

1c0095a0 <memcpy>:
1c0095a0:	00a5e733          	or	a4,a1,a0
1c0095a4:	fa273733          	p.bclr	a4,a4,29,2
1c0095a8:	87aa                	mv	a5,a0
1c0095aa:	c709                	beqz	a4,1c0095b4 <memcpy+0x14>
1c0095ac:	962e                	add	a2,a2,a1
1c0095ae:	00c59f63          	bne	a1,a2,1c0095cc <memcpy+0x2c>
1c0095b2:	8082                	ret
1c0095b4:	fa263733          	p.bclr	a4,a2,29,2
1c0095b8:	fb75                	bnez	a4,1c0095ac <memcpy+0xc>
1c0095ba:	962e                	add	a2,a2,a1
1c0095bc:	00c59363          	bne	a1,a2,1c0095c2 <memcpy+0x22>
1c0095c0:	8082                	ret
1c0095c2:	0045a70b          	p.lw	a4,4(a1!)
1c0095c6:	00e7a22b          	p.sw	a4,4(a5!)
1c0095ca:	bfcd                	j	1c0095bc <memcpy+0x1c>
1c0095cc:	0015c70b          	p.lbu	a4,1(a1!)
1c0095d0:	00e780ab          	p.sb	a4,1(a5!)
1c0095d4:	bfe9                	j	1c0095ae <memcpy+0xe>

1c0095d6 <memmove>:
1c0095d6:	40b507b3          	sub	a5,a0,a1
1c0095da:	00c7e763          	bltu	a5,a2,1c0095e8 <memmove+0x12>
1c0095de:	962a                	add	a2,a2,a0
1c0095e0:	87aa                	mv	a5,a0
1c0095e2:	00c79f63          	bne	a5,a2,1c009600 <memmove+0x2a>
1c0095e6:	8082                	ret
1c0095e8:	167d                	addi	a2,a2,-1
1c0095ea:	00c507b3          	add	a5,a0,a2
1c0095ee:	95b2                	add	a1,a1,a2
1c0095f0:	0605                	addi	a2,a2,1
1c0095f2:	004640fb          	lp.setup	x1,a2,1c0095fa <memmove+0x24>
1c0095f6:	fff5c70b          	p.lbu	a4,-1(a1!)
1c0095fa:	fee78fab          	p.sb	a4,-1(a5!)
1c0095fe:	8082                	ret
1c009600:	0015c70b          	p.lbu	a4,1(a1!)
1c009604:	00e780ab          	p.sb	a4,1(a5!)
1c009608:	bfe9                	j	1c0095e2 <memmove+0xc>

1c00960a <strchr>:
1c00960a:	0ff5f593          	andi	a1,a1,255
1c00960e:	00054703          	lbu	a4,0(a0)
1c009612:	87aa                	mv	a5,a0
1c009614:	0505                	addi	a0,a0,1
1c009616:	00b70563          	beq	a4,a1,1c009620 <strchr+0x16>
1c00961a:	fb75                	bnez	a4,1c00960e <strchr+0x4>
1c00961c:	c191                	beqz	a1,1c009620 <strchr+0x16>
1c00961e:	4781                	li	a5,0
1c009620:	853e                	mv	a0,a5
1c009622:	8082                	ret

1c009624 <__rt_putc_debug_bridge>:
1c009624:	1141                	addi	sp,sp,-16
1c009626:	c422                	sw	s0,8(sp)
1c009628:	1c001437          	lui	s0,0x1c001
1c00962c:	c226                	sw	s1,4(sp)
1c00962e:	c606                	sw	ra,12(sp)
1c009630:	84aa                	mv	s1,a0
1c009632:	df440413          	addi	s0,s0,-524 # 1c000df4 <__hal_debug_struct>
1c009636:	485c                	lw	a5,20(s0)
1c009638:	c791                	beqz	a5,1c009644 <__rt_putc_debug_bridge+0x20>
1c00963a:	06400513          	li	a0,100
1c00963e:	8afff0ef          	jal	ra,1c008eec <rt_time_wait_us>
1c009642:	bfd5                	j	1c009636 <__rt_putc_debug_bridge+0x12>
1c009644:	4c1c                	lw	a5,24(s0)
1c009646:	00178713          	addi	a4,a5,1
1c00964a:	97a2                	add	a5,a5,s0
1c00964c:	00978e23          	sb	s1,28(a5)
1c009650:	cc18                	sw	a4,24(s0)
1c009652:	4c14                	lw	a3,24(s0)
1c009654:	08000793          	li	a5,128
1c009658:	00f68463          	beq	a3,a5,1c009660 <__rt_putc_debug_bridge+0x3c>
1c00965c:	00a4b663          	p.bneimm	s1,10,1c009668 <__rt_putc_debug_bridge+0x44>
1c009660:	c701                	beqz	a4,1c009668 <__rt_putc_debug_bridge+0x44>
1c009662:	c858                	sw	a4,20(s0)
1c009664:	00042c23          	sw	zero,24(s0)
1c009668:	4c1c                	lw	a5,24(s0)
1c00966a:	e799                	bnez	a5,1c009678 <__rt_putc_debug_bridge+0x54>
1c00966c:	4422                	lw	s0,8(sp)
1c00966e:	40b2                	lw	ra,12(sp)
1c009670:	4492                	lw	s1,4(sp)
1c009672:	0141                	addi	sp,sp,16
1c009674:	c52ff06f          	j	1c008ac6 <__rt_bridge_printf_flush>
1c009678:	40b2                	lw	ra,12(sp)
1c00967a:	4422                	lw	s0,8(sp)
1c00967c:	4492                	lw	s1,4(sp)
1c00967e:	0141                	addi	sp,sp,16
1c009680:	8082                	ret

1c009682 <__rt_putc_uart>:
1c009682:	1101                	addi	sp,sp,-32
1c009684:	c62a                	sw	a0,12(sp)
1c009686:	ce06                	sw	ra,28(sp)
1c009688:	3d39                	jal	1c0094a6 <__rt_io_uart_wait_pending>
1c00968a:	1c0017b7          	lui	a5,0x1c001
1c00968e:	df478793          	addi	a5,a5,-524 # 1c000df4 <__hal_debug_struct>
1c009692:	4f94                	lw	a3,24(a5)
1c009694:	4532                	lw	a0,12(sp)
1c009696:	00168713          	addi	a4,a3,1 # 1a100001 <__rt_udma_callback_data+0x1a0ffd09>
1c00969a:	cf98                	sw	a4,24(a5)
1c00969c:	97b6                	add	a5,a5,a3
1c00969e:	00a78e23          	sb	a0,28(a5)
1c0096a2:	08000793          	li	a5,128
1c0096a6:	00f70463          	beq	a4,a5,1c0096ae <__rt_putc_uart+0x2c>
1c0096aa:	00a53563          	p.bneimm	a0,10,1c0096b4 <__rt_putc_uart+0x32>
1c0096ae:	40f2                	lw	ra,28(sp)
1c0096b0:	6105                	addi	sp,sp,32
1c0096b2:	bda1                	j	1c00950a <__rt_io_uart_flush.constprop.5>
1c0096b4:	40f2                	lw	ra,28(sp)
1c0096b6:	6105                	addi	sp,sp,32
1c0096b8:	8082                	ret

1c0096ba <tfp_putc.isra.3>:
1c0096ba:	1c0017b7          	lui	a5,0x1c001
1c0096be:	1141                	addi	sp,sp,-16
1c0096c0:	f707a783          	lw	a5,-144(a5) # 1c000f70 <__rt_iodev>
1c0096c4:	c422                	sw	s0,8(sp)
1c0096c6:	c606                	sw	ra,12(sp)
1c0096c8:	842a                	mv	s0,a0
1c0096ca:	0427b663          	p.bneimm	a5,2,1c009716 <tfp_putc.isra.3+0x5c>
1c0096ce:	3965                	jal	1c009386 <rt_is_fc>
1c0096d0:	c149                	beqz	a0,1c009752 <tfp_putc.isra.3+0x98>
1c0096d2:	1c0017b7          	lui	a5,0x1c001
1c0096d6:	f8878613          	addi	a2,a5,-120 # 1c000f88 <__rt_putc_host_buffer_index>
1c0096da:	4214                	lw	a3,0(a2)
1c0096dc:	1c010537          	lui	a0,0x1c010
1c0096e0:	00168713          	addi	a4,a3,1
1c0096e4:	c218                	sw	a4,0(a2)
1c0096e6:	06c50613          	addi	a2,a0,108 # 1c01006c <__rt_putc_host_buffer>
1c0096ea:	008646a3          	p.sb	s0,a3(a2)
1c0096ee:	07f00613          	li	a2,127
1c0096f2:	f8878793          	addi	a5,a5,-120
1c0096f6:	06c50693          	addi	a3,a0,108
1c0096fa:	00c70463          	beq	a4,a2,1c009702 <tfp_putc.isra.3+0x48>
1c0096fe:	04a43a63          	p.bneimm	s0,10,1c009752 <tfp_putc.isra.3+0x98>
1c009702:	0006c723          	p.sb	zero,a4(a3)
1c009706:	4422                	lw	s0,8(sp)
1c009708:	40b2                	lw	ra,12(sp)
1c00970a:	0007a023          	sw	zero,0(a5)
1c00970e:	06c50513          	addi	a0,a0,108
1c009712:	0141                	addi	sp,sp,16
1c009714:	aabd                	j	1c009892 <semihost_write0>
1c009716:	1c0017b7          	lui	a5,0x1c001
1c00971a:	f8c7a783          	lw	a5,-116(a5) # 1c000f8c <_rt_io_uart>
1c00971e:	c789                	beqz	a5,1c009728 <tfp_putc.isra.3+0x6e>
1c009720:	4422                	lw	s0,8(sp)
1c009722:	40b2                	lw	ra,12(sp)
1c009724:	0141                	addi	sp,sp,16
1c009726:	bfb1                	j	1c009682 <__rt_putc_uart>
1c009728:	1c0017b7          	lui	a5,0x1c001
1c00972c:	e047a783          	lw	a5,-508(a5) # 1c000e04 <__hal_debug_struct+0x10>
1c009730:	c78d                	beqz	a5,1c00975a <tfp_putc.isra.3+0xa0>
1c009732:	6609                	lui	a2,0x2
1c009734:	f14027f3          	csrr	a5,mhartid
1c009738:	f8060613          	addi	a2,a2,-128 # 1f80 <__rt_udma_callback_data+0x1c88>
1c00973c:	00379713          	slli	a4,a5,0x3
1c009740:	078a                	slli	a5,a5,0x2
1c009742:	ee873733          	p.bclr	a4,a4,23,8
1c009746:	8ff1                	and	a5,a5,a2
1c009748:	97ba                	add	a5,a5,a4
1c00974a:	1a10f737          	lui	a4,0x1a10f
1c00974e:	00a767a3          	p.sw	a0,a5(a4)
1c009752:	40b2                	lw	ra,12(sp)
1c009754:	4422                	lw	s0,8(sp)
1c009756:	0141                	addi	sp,sp,16
1c009758:	8082                	ret
1c00975a:	4422                	lw	s0,8(sp)
1c00975c:	40b2                	lw	ra,12(sp)
1c00975e:	0141                	addi	sp,sp,16
1c009760:	b5d1                	j	1c009624 <__rt_putc_debug_bridge>

1c009762 <fputc_locked>:
1c009762:	1141                	addi	sp,sp,-16
1c009764:	c422                	sw	s0,8(sp)
1c009766:	842a                	mv	s0,a0
1c009768:	0ff57513          	andi	a0,a0,255
1c00976c:	c606                	sw	ra,12(sp)
1c00976e:	37b1                	jal	1c0096ba <tfp_putc.isra.3>
1c009770:	8522                	mv	a0,s0
1c009772:	40b2                	lw	ra,12(sp)
1c009774:	4422                	lw	s0,8(sp)
1c009776:	0141                	addi	sp,sp,16
1c009778:	8082                	ret

1c00977a <_prf_locked>:
1c00977a:	1101                	addi	sp,sp,-32
1c00977c:	ce06                	sw	ra,28(sp)
1c00977e:	c02a                	sw	a0,0(sp)
1c009780:	c62e                	sw	a1,12(sp)
1c009782:	c432                	sw	a2,8(sp)
1c009784:	c236                	sw	a3,4(sp)
1c009786:	3185                	jal	1c0093e6 <__rt_io_lock>
1c009788:	4692                	lw	a3,4(sp)
1c00978a:	4622                	lw	a2,8(sp)
1c00978c:	45b2                	lw	a1,12(sp)
1c00978e:	4502                	lw	a0,0(sp)
1c009790:	2425                	jal	1c0099b8 <_prf>
1c009792:	c02a                	sw	a0,0(sp)
1c009794:	3909                	jal	1c0093a6 <__rt_io_unlock>
1c009796:	40f2                	lw	ra,28(sp)
1c009798:	4502                	lw	a0,0(sp)
1c00979a:	6105                	addi	sp,sp,32
1c00979c:	8082                	ret

1c00979e <exit>:
1c00979e:	1141                	addi	sp,sp,-16
1c0097a0:	c422                	sw	s0,8(sp)
1c0097a2:	1a104437          	lui	s0,0x1a104
1c0097a6:	c04a                	sw	s2,0(sp)
1c0097a8:	0a040793          	addi	a5,s0,160 # 1a1040a0 <__rt_udma_callback_data+0x1a103da8>
1c0097ac:	c606                	sw	ra,12(sp)
1c0097ae:	c226                	sw	s1,4(sp)
1c0097b0:	c1f54933          	p.bset	s2,a0,0,31
1c0097b4:	0127a023          	sw	s2,0(a5)
1c0097b8:	1c0017b7          	lui	a5,0x1c001
1c0097bc:	f707a783          	lw	a5,-144(a5) # 1c000f70 <__rt_iodev>
1c0097c0:	0027be63          	p.bneimm	a5,2,1c0097dc <exit+0x3e>
1c0097c4:	c519                	beqz	a0,1c0097d2 <exit+0x34>
1c0097c6:	00020537          	lui	a0,0x20
1c0097ca:	02350513          	addi	a0,a0,35 # 20023 <__rt_udma_callback_data+0x1fd2b>
1c0097ce:	20e9                	jal	1c009898 <semihost_exit>
1c0097d0:	a001                	j	1c0097d0 <exit+0x32>
1c0097d2:	00020537          	lui	a0,0x20
1c0097d6:	02650513          	addi	a0,a0,38 # 20026 <__rt_udma_callback_data+0x1fd2e>
1c0097da:	bfd5                	j	1c0097ce <exit+0x30>
1c0097dc:	1c0014b7          	lui	s1,0x1c001
1c0097e0:	df448493          	addi	s1,s1,-524 # 1c000df4 <__hal_debug_struct>
1c0097e4:	ae2ff0ef          	jal	ra,1c008ac6 <__rt_bridge_printf_flush>
1c0097e8:	0124a623          	sw	s2,12(s1)
1c0097ec:	a9cff0ef          	jal	ra,1c008a88 <__rt_bridge_send_notif>
1c0097f0:	449c                	lw	a5,8(s1)
1c0097f2:	dff9                	beqz	a5,1c0097d0 <exit+0x32>
1c0097f4:	07440413          	addi	s0,s0,116
1c0097f8:	401c                	lw	a5,0(s0)
1c0097fa:	83a5                	srli	a5,a5,0x9
1c0097fc:	f837b7b3          	p.bclr	a5,a5,28,3
1c009800:	fe77bce3          	p.bneimm	a5,7,1c0097f8 <exit+0x5a>
1c009804:	aa4ff0ef          	jal	ra,1c008aa8 <__rt_bridge_clear_notif>
1c009808:	b7e1                	j	1c0097d0 <exit+0x32>

1c00980a <abort>:
1c00980a:	1141                	addi	sp,sp,-16
1c00980c:	557d                	li	a0,-1
1c00980e:	c606                	sw	ra,12(sp)
1c009810:	3779                	jal	1c00979e <exit>

1c009812 <__rt_io_init>:
1c009812:	1c0017b7          	lui	a5,0x1c001
1c009816:	f807a423          	sw	zero,-120(a5) # 1c000f88 <__rt_putc_host_buffer_index>
1c00981a:	1c0017b7          	lui	a5,0x1c001
1c00981e:	de478793          	addi	a5,a5,-540 # 1c000de4 <__rt_io_fc_lock>
1c009822:	0007a223          	sw	zero,4(a5)
1c009826:	0007a023          	sw	zero,0(a5)
1c00982a:	0007a623          	sw	zero,12(a5)
1c00982e:	1c0017b7          	lui	a5,0x1c001
1c009832:	f807a623          	sw	zero,-116(a5) # 1c000f8c <_rt_io_uart>
1c009836:	1c0017b7          	lui	a5,0x1c001
1c00983a:	f807a023          	sw	zero,-128(a5) # 1c000f80 <__rt_io_event_current>
1c00983e:	1c0017b7          	lui	a5,0x1c001
1c009842:	f707a783          	lw	a5,-144(a5) # 1c000f70 <__rt_iodev>
1c009846:	0217be63          	p.bneimm	a5,1,1c009882 <__rt_io_init+0x70>
1c00984a:	1c0095b7          	lui	a1,0x1c009
1c00984e:	1141                	addi	sp,sp,-16
1c009850:	4601                	li	a2,0
1c009852:	42658593          	addi	a1,a1,1062 # 1c009426 <__rt_io_start>
1c009856:	4501                	li	a0,0
1c009858:	c606                	sw	ra,12(sp)
1c00985a:	ffdfe0ef          	jal	ra,1c008856 <__rt_cbsys_add>
1c00985e:	1c0095b7          	lui	a1,0x1c009
1c009862:	4e458593          	addi	a1,a1,1252 # 1c0094e4 <__rt_io_stop>
1c009866:	4601                	li	a2,0
1c009868:	4505                	li	a0,1
1c00986a:	fedfe0ef          	jal	ra,1c008856 <__rt_cbsys_add>
1c00986e:	1c0017b7          	lui	a5,0x1c001
1c009872:	40b2                	lw	ra,12(sp)
1c009874:	f807a223          	sw	zero,-124(a5) # 1c000f84 <__rt_io_pending_flush>
1c009878:	4585                	li	a1,1
1c00987a:	4501                	li	a0,0
1c00987c:	0141                	addi	sp,sp,16
1c00987e:	b4eff06f          	j	1c008bcc <rt_event_alloc>
1c009882:	8082                	ret

1c009884 <__internal_semihost>:
1c009884:	01f01013          	slli	zero,zero,0x1f
1c009888:	00100073          	ebreak
1c00988c:	40705013          	srai	zero,zero,0x7
1c009890:	8082                	ret

1c009892 <semihost_write0>:
1c009892:	85aa                	mv	a1,a0
1c009894:	4511                	li	a0,4
1c009896:	b7fd                	j	1c009884 <__internal_semihost>

1c009898 <semihost_exit>:
1c009898:	85aa                	mv	a1,a0
1c00989a:	4561                	li	a0,24
1c00989c:	b7e5                	j	1c009884 <__internal_semihost>

1c00989e <printf>:
1c00989e:	7139                	addi	sp,sp,-64
1c0098a0:	d432                	sw	a2,40(sp)
1c0098a2:	862a                	mv	a2,a0
1c0098a4:	1c009537          	lui	a0,0x1c009
1c0098a8:	d22e                	sw	a1,36(sp)
1c0098aa:	d636                	sw	a3,44(sp)
1c0098ac:	4589                	li	a1,2
1c0098ae:	1054                	addi	a3,sp,36
1c0098b0:	76250513          	addi	a0,a0,1890 # 1c009762 <fputc_locked>
1c0098b4:	ce06                	sw	ra,28(sp)
1c0098b6:	d83a                	sw	a4,48(sp)
1c0098b8:	da3e                	sw	a5,52(sp)
1c0098ba:	dc42                	sw	a6,56(sp)
1c0098bc:	de46                	sw	a7,60(sp)
1c0098be:	c636                	sw	a3,12(sp)
1c0098c0:	3d6d                	jal	1c00977a <_prf_locked>
1c0098c2:	40f2                	lw	ra,28(sp)
1c0098c4:	6121                	addi	sp,sp,64
1c0098c6:	8082                	ret

1c0098c8 <_to_x>:
1c0098c8:	872a                	mv	a4,a0
1c0098ca:	87aa                	mv	a5,a0
1c0098cc:	4325                	li	t1,9
1c0098ce:	02c5f8b3          	remu	a7,a1,a2
1c0098d2:	02700513          	li	a0,39
1c0098d6:	02c5d5b3          	divu	a1,a1,a2
1c0098da:	0ff8f813          	andi	a6,a7,255
1c0098de:	01136363          	bltu	t1,a7,1c0098e4 <_to_x+0x1c>
1c0098e2:	4501                	li	a0,0
1c0098e4:	03080813          	addi	a6,a6,48
1c0098e8:	9542                	add	a0,a0,a6
1c0098ea:	00a780ab          	p.sb	a0,1(a5!)
1c0098ee:	f1e5                	bnez	a1,1c0098ce <_to_x+0x6>
1c0098f0:	03000613          	li	a2,48
1c0098f4:	40e78533          	sub	a0,a5,a4
1c0098f8:	00d54763          	blt	a0,a3,1c009906 <_to_x+0x3e>
1c0098fc:	fe078fab          	p.sb	zero,-1(a5!)
1c009900:	00f76663          	bltu	a4,a5,1c00990c <_to_x+0x44>
1c009904:	8082                	ret
1c009906:	00c780ab          	p.sb	a2,1(a5!)
1c00990a:	b7ed                	j	1c0098f4 <_to_x+0x2c>
1c00990c:	00074603          	lbu	a2,0(a4) # 1a10f000 <__rt_udma_callback_data+0x1a10ed08>
1c009910:	0007c683          	lbu	a3,0(a5)
1c009914:	fec78fab          	p.sb	a2,-1(a5!)
1c009918:	00d700ab          	p.sb	a3,1(a4!)
1c00991c:	b7d5                	j	1c009900 <_to_x+0x38>

1c00991e <_rlrshift>:
1c00991e:	411c                	lw	a5,0(a0)
1c009920:	4154                	lw	a3,4(a0)
1c009922:	fc17b733          	p.bclr	a4,a5,30,1
1c009926:	01f69613          	slli	a2,a3,0x1f
1c00992a:	8385                	srli	a5,a5,0x1
1c00992c:	8fd1                	or	a5,a5,a2
1c00992e:	97ba                	add	a5,a5,a4
1c009930:	8285                	srli	a3,a3,0x1
1c009932:	00e7b733          	sltu	a4,a5,a4
1c009936:	9736                	add	a4,a4,a3
1c009938:	c11c                	sw	a5,0(a0)
1c00993a:	c158                	sw	a4,4(a0)
1c00993c:	8082                	ret

1c00993e <_ldiv5>:
1c00993e:	4118                	lw	a4,0(a0)
1c009940:	4154                	lw	a3,4(a0)
1c009942:	00270793          	addi	a5,a4,2
1c009946:	00e7b733          	sltu	a4,a5,a4
1c00994a:	4615                	li	a2,5
1c00994c:	9736                	add	a4,a4,a3
1c00994e:	02c755b3          	divu	a1,a4,a2
1c009952:	42b61733          	p.msu	a4,a2,a1
1c009956:	01d71693          	slli	a3,a4,0x1d
1c00995a:	0037d713          	srli	a4,a5,0x3
1c00995e:	8f55                	or	a4,a4,a3
1c009960:	02c75733          	divu	a4,a4,a2
1c009964:	01d75693          	srli	a3,a4,0x1d
1c009968:	070e                	slli	a4,a4,0x3
1c00996a:	42e617b3          	p.msu	a5,a2,a4
1c00996e:	02c7d7b3          	divu	a5,a5,a2
1c009972:	973e                	add	a4,a4,a5
1c009974:	95b6                	add	a1,a1,a3
1c009976:	00f737b3          	sltu	a5,a4,a5
1c00997a:	97ae                	add	a5,a5,a1
1c00997c:	c118                	sw	a4,0(a0)
1c00997e:	c15c                	sw	a5,4(a0)
1c009980:	8082                	ret

1c009982 <_get_digit>:
1c009982:	419c                	lw	a5,0(a1)
1c009984:	03000713          	li	a4,48
1c009988:	02f05563          	blez	a5,1c0099b2 <_get_digit+0x30>
1c00998c:	17fd                	addi	a5,a5,-1
1c00998e:	c19c                	sw	a5,0(a1)
1c009990:	411c                	lw	a5,0(a0)
1c009992:	4729                	li	a4,10
1c009994:	4150                	lw	a2,4(a0)
1c009996:	02f706b3          	mul	a3,a4,a5
1c00999a:	02f737b3          	mulhu	a5,a4,a5
1c00999e:	42c707b3          	p.mac	a5,a4,a2
1c0099a2:	01c7d713          	srli	a4,a5,0x1c
1c0099a6:	c7c7b7b3          	p.bclr	a5,a5,3,28
1c0099aa:	03070713          	addi	a4,a4,48
1c0099ae:	c114                	sw	a3,0(a0)
1c0099b0:	c15c                	sw	a5,4(a0)
1c0099b2:	0ff77513          	andi	a0,a4,255
1c0099b6:	8082                	ret

1c0099b8 <_prf>:
1c0099b8:	714d                	addi	sp,sp,-336
1c0099ba:	14912223          	sw	s1,324(sp)
1c0099be:	15212023          	sw	s2,320(sp)
1c0099c2:	13812423          	sw	s8,296(sp)
1c0099c6:	14112623          	sw	ra,332(sp)
1c0099ca:	14812423          	sw	s0,328(sp)
1c0099ce:	13312e23          	sw	s3,316(sp)
1c0099d2:	13412c23          	sw	s4,312(sp)
1c0099d6:	13512a23          	sw	s5,308(sp)
1c0099da:	13612823          	sw	s6,304(sp)
1c0099de:	13712623          	sw	s7,300(sp)
1c0099e2:	13912223          	sw	s9,292(sp)
1c0099e6:	13a12023          	sw	s10,288(sp)
1c0099ea:	11b12e23          	sw	s11,284(sp)
1c0099ee:	cc2a                	sw	a0,24(sp)
1c0099f0:	ce2e                	sw	a1,28(sp)
1c0099f2:	84b2                	mv	s1,a2
1c0099f4:	8c36                	mv	s8,a3
1c0099f6:	4901                	li	s2,0
1c0099f8:	0004c503          	lbu	a0,0(s1)
1c0099fc:	00148b93          	addi	s7,s1,1
1c009a00:	c919                	beqz	a0,1c009a16 <_prf+0x5e>
1c009a02:	02500793          	li	a5,37
1c009a06:	14f50563          	beq	a0,a5,1c009b50 <_prf+0x198>
1c009a0a:	45f2                	lw	a1,28(sp)
1c009a0c:	4762                	lw	a4,24(sp)
1c009a0e:	9702                	jalr	a4
1c009a10:	05f53063          	p.bneimm	a0,-1,1c009a50 <_prf+0x98>
1c009a14:	597d                	li	s2,-1
1c009a16:	14c12083          	lw	ra,332(sp)
1c009a1a:	14812403          	lw	s0,328(sp)
1c009a1e:	854a                	mv	a0,s2
1c009a20:	14412483          	lw	s1,324(sp)
1c009a24:	14012903          	lw	s2,320(sp)
1c009a28:	13c12983          	lw	s3,316(sp)
1c009a2c:	13812a03          	lw	s4,312(sp)
1c009a30:	13412a83          	lw	s5,308(sp)
1c009a34:	13012b03          	lw	s6,304(sp)
1c009a38:	12c12b83          	lw	s7,300(sp)
1c009a3c:	12812c03          	lw	s8,296(sp)
1c009a40:	12412c83          	lw	s9,292(sp)
1c009a44:	12012d03          	lw	s10,288(sp)
1c009a48:	11c12d83          	lw	s11,284(sp)
1c009a4c:	6171                	addi	sp,sp,336
1c009a4e:	8082                	ret
1c009a50:	0905                	addi	s2,s2,1
1c009a52:	8a62                	mv	s4,s8
1c009a54:	84de                	mv	s1,s7
1c009a56:	8c52                	mv	s8,s4
1c009a58:	b745                	j	1c0099f8 <_prf+0x40>
1c009a5a:	0f3a8263          	beq	s5,s3,1c009b3e <_prf+0x186>
1c009a5e:	0d59e563          	bltu	s3,s5,1c009b28 <_prf+0x170>
1c009a62:	fa0a8ae3          	beqz	s5,1c009a16 <_prf+0x5e>
1c009a66:	0dba8a63          	beq	s5,s11,1c009b3a <_prf+0x182>
1c009a6a:	8ba6                	mv	s7,s1
1c009a6c:	000bca83          	lbu	s5,0(s7)
1c009a70:	1c0007b7          	lui	a5,0x1c000
1c009a74:	85d6                	mv	a1,s5
1c009a76:	56878513          	addi	a0,a5,1384 # 1c000568 <sbox+0x204>
1c009a7a:	001b8493          	addi	s1,s7,1
1c009a7e:	3671                	jal	1c00960a <strchr>
1c009a80:	fd69                	bnez	a0,1c009a5a <_prf+0xa2>
1c009a82:	02a00693          	li	a3,42
1c009a86:	0eda9763          	bne	s5,a3,1c009b74 <_prf+0x1bc>
1c009a8a:	000c2983          	lw	s3,0(s8)
1c009a8e:	004c0693          	addi	a3,s8,4
1c009a92:	0009d663          	bgez	s3,1c009a9e <_prf+0xe6>
1c009a96:	4705                	li	a4,1
1c009a98:	413009b3          	neg	s3,s3
1c009a9c:	ca3a                	sw	a4,20(sp)
1c009a9e:	0004ca83          	lbu	s5,0(s1)
1c009aa2:	8c36                	mv	s8,a3
1c009aa4:	002b8493          	addi	s1,s7,2
1c009aa8:	0c800713          	li	a4,200
1c009aac:	02e00693          	li	a3,46
1c009ab0:	04e9d9b3          	p.minu	s3,s3,a4
1c009ab4:	5d7d                	li	s10,-1
1c009ab6:	02da9463          	bne	s5,a3,1c009ade <_prf+0x126>
1c009aba:	0004c703          	lbu	a4,0(s1)
1c009abe:	02a00793          	li	a5,42
1c009ac2:	0ef71c63          	bne	a4,a5,1c009bba <_prf+0x202>
1c009ac6:	000c2d03          	lw	s10,0(s8)
1c009aca:	0485                	addi	s1,s1,1
1c009acc:	0c11                	addi	s8,s8,4
1c009ace:	0c800793          	li	a5,200
1c009ad2:	01a7d363          	ble	s10,a5,1c009ad8 <_prf+0x120>
1c009ad6:	5d7d                	li	s10,-1
1c009ad8:	0004ca83          	lbu	s5,0(s1)
1c009adc:	0485                	addi	s1,s1,1
1c009ade:	1c0007b7          	lui	a5,0x1c000
1c009ae2:	85d6                	mv	a1,s5
1c009ae4:	57078513          	addi	a0,a5,1392 # 1c000570 <sbox+0x20c>
1c009ae8:	360d                	jal	1c00960a <strchr>
1c009aea:	c501                	beqz	a0,1c009af2 <_prf+0x13a>
1c009aec:	0004ca83          	lbu	s5,0(s1)
1c009af0:	0485                	addi	s1,s1,1
1c009af2:	06700693          	li	a3,103
1c009af6:	1356c563          	blt	a3,s5,1c009c20 <_prf+0x268>
1c009afa:	06500693          	li	a3,101
1c009afe:	20dad063          	ble	a3,s5,1c009cfe <_prf+0x346>
1c009b02:	04700693          	li	a3,71
1c009b06:	0b56ce63          	blt	a3,s5,1c009bc2 <_prf+0x20a>
1c009b0a:	04500693          	li	a3,69
1c009b0e:	1edad863          	ble	a3,s5,1c009cfe <_prf+0x346>
1c009b12:	f00a82e3          	beqz	s5,1c009a16 <_prf+0x5e>
1c009b16:	02500713          	li	a4,37
1c009b1a:	64ea8963          	beq	s5,a4,1c00a16c <_prf+0x7b4>
1c009b1e:	0c800713          	li	a4,200
1c009b22:	65575d63          	ble	s5,a4,1c00a17c <_prf+0x7c4>
1c009b26:	b5fd                	j	1c009a14 <_prf+0x5c>
1c009b28:	034a8163          	beq	s5,s4,1c009b4a <_prf+0x192>
1c009b2c:	016a8b63          	beq	s5,s6,1c009b42 <_prf+0x18a>
1c009b30:	f3aa9de3          	bne	s5,s10,1c009a6a <_prf+0xb2>
1c009b34:	4785                	li	a5,1
1c009b36:	c83e                	sw	a5,16(sp)
1c009b38:	bf0d                	j	1c009a6a <_prf+0xb2>
1c009b3a:	4405                	li	s0,1
1c009b3c:	b73d                	j	1c009a6a <_prf+0xb2>
1c009b3e:	4c85                	li	s9,1
1c009b40:	b72d                	j	1c009a6a <_prf+0xb2>
1c009b42:	03000713          	li	a4,48
1c009b46:	c63a                	sw	a4,12(sp)
1c009b48:	b70d                	j	1c009a6a <_prf+0xb2>
1c009b4a:	4785                	li	a5,1
1c009b4c:	ca3e                	sw	a5,20(sp)
1c009b4e:	bf31                	j	1c009a6a <_prf+0xb2>
1c009b50:	02000713          	li	a4,32
1c009b54:	c63a                	sw	a4,12(sp)
1c009b56:	4401                	li	s0,0
1c009b58:	c802                	sw	zero,16(sp)
1c009b5a:	ca02                	sw	zero,20(sp)
1c009b5c:	4c81                	li	s9,0
1c009b5e:	02300993          	li	s3,35
1c009b62:	02d00a13          	li	s4,45
1c009b66:	03000b13          	li	s6,48
1c009b6a:	02b00d13          	li	s10,43
1c009b6e:	02000d93          	li	s11,32
1c009b72:	bded                	j	1c009a6c <_prf+0xb4>
1c009b74:	fd0a8693          	addi	a3,s5,-48
1c009b78:	4625                	li	a2,9
1c009b7a:	4981                	li	s3,0
1c009b7c:	f2d666e3          	bltu	a2,a3,1c009aa8 <_prf+0xf0>
1c009b80:	46a5                	li	a3,9
1c009b82:	45a9                	li	a1,10
1c009b84:	84de                	mv	s1,s7
1c009b86:	0014c70b          	p.lbu	a4,1(s1!)
1c009b8a:	fd070613          	addi	a2,a4,-48
1c009b8e:	8aba                	mv	s5,a4
1c009b90:	f0c6ece3          	bltu	a3,a2,1c009aa8 <_prf+0xf0>
1c009b94:	42b98733          	p.mac	a4,s3,a1
1c009b98:	fd070993          	addi	s3,a4,-48
1c009b9c:	8ba6                	mv	s7,s1
1c009b9e:	b7dd                	j	1c009b84 <_prf+0x1cc>
1c009ba0:	42ad07b3          	p.mac	a5,s10,a0
1c009ba4:	fd078d13          	addi	s10,a5,-48
1c009ba8:	84b6                	mv	s1,a3
1c009baa:	86a6                	mv	a3,s1
1c009bac:	0016c78b          	p.lbu	a5,1(a3!)
1c009bb0:	fd078593          	addi	a1,a5,-48
1c009bb4:	feb676e3          	bleu	a1,a2,1c009ba0 <_prf+0x1e8>
1c009bb8:	bf19                	j	1c009ace <_prf+0x116>
1c009bba:	4d01                	li	s10,0
1c009bbc:	4625                	li	a2,9
1c009bbe:	4529                	li	a0,10
1c009bc0:	b7ed                	j	1c009baa <_prf+0x1f2>
1c009bc2:	06300693          	li	a3,99
1c009bc6:	0cda8e63          	beq	s5,a3,1c009ca2 <_prf+0x2ea>
1c009bca:	0756cb63          	blt	a3,s5,1c009c40 <_prf+0x288>
1c009bce:	05800693          	li	a3,88
1c009bd2:	f4da96e3          	bne	s5,a3,1c009b1e <_prf+0x166>
1c009bd6:	04410b93          	addi	s7,sp,68
1c009bda:	004c0a13          	addi	s4,s8,4
1c009bde:	000c2583          	lw	a1,0(s8)
1c009be2:	845e                	mv	s0,s7
1c009be4:	000c8963          	beqz	s9,1c009bf6 <_prf+0x23e>
1c009be8:	76e1                	lui	a3,0xffff8
1c009bea:	8306c693          	xori	a3,a3,-2000
1c009bee:	04d11223          	sh	a3,68(sp)
1c009bf2:	04610413          	addi	s0,sp,70
1c009bf6:	86ea                	mv	a3,s10
1c009bf8:	4641                	li	a2,16
1c009bfa:	8522                	mv	a0,s0
1c009bfc:	31f1                	jal	1c0098c8 <_to_x>
1c009bfe:	05800693          	li	a3,88
1c009c02:	00da9863          	bne	s5,a3,1c009c12 <_prf+0x25a>
1c009c06:	86de                	mv	a3,s7
1c009c08:	45e5                	li	a1,25
1c009c0a:	0016c78b          	p.lbu	a5,1(a3!) # ffff8001 <pulp__FC+0xffff8002>
1c009c0e:	54079563          	bnez	a5,1c00a158 <_prf+0x7a0>
1c009c12:	41740433          	sub	s0,s0,s7
1c009c16:	9522                	add	a0,a0,s0
1c009c18:	01903433          	snez	s0,s9
1c009c1c:	0406                	slli	s0,s0,0x1
1c009c1e:	a0e9                	j	1c009ce8 <_prf+0x330>
1c009c20:	07000693          	li	a3,112
1c009c24:	4eda8363          	beq	s5,a3,1c00a10a <_prf+0x752>
1c009c28:	0556c163          	blt	a3,s5,1c009c6a <_prf+0x2b2>
1c009c2c:	06e00693          	li	a3,110
1c009c30:	46da8063          	beq	s5,a3,1c00a090 <_prf+0x6d8>
1c009c34:	4756c563          	blt	a3,s5,1c00a09e <_prf+0x6e6>
1c009c38:	06900693          	li	a3,105
1c009c3c:	eeda91e3          	bne	s5,a3,1c009b1e <_prf+0x166>
1c009c40:	000c2a83          	lw	s5,0(s8)
1c009c44:	004c0a13          	addi	s4,s8,4
1c009c48:	04410b13          	addi	s6,sp,68
1c009c4c:	060ad663          	bgez	s5,1c009cb8 <_prf+0x300>
1c009c50:	02d00693          	li	a3,45
1c009c54:	04d10223          	sb	a3,68(sp)
1c009c58:	80000737          	lui	a4,0x80000
1c009c5c:	415005b3          	neg	a1,s5
1c009c60:	06ea9663          	bne	s5,a4,1c009ccc <_prf+0x314>
1c009c64:	800005b7          	lui	a1,0x80000
1c009c68:	a095                	j	1c009ccc <_prf+0x314>
1c009c6a:	07500693          	li	a3,117
1c009c6e:	4cda8b63          	beq	s5,a3,1c00a144 <_prf+0x78c>
1c009c72:	07800693          	li	a3,120
1c009c76:	f6da80e3          	beq	s5,a3,1c009bd6 <_prf+0x21e>
1c009c7a:	07300693          	li	a3,115
1c009c7e:	eada90e3          	bne	s5,a3,1c009b1e <_prf+0x166>
1c009c82:	000c2583          	lw	a1,0(s8)
1c009c86:	004c0a13          	addi	s4,s8,4
1c009c8a:	86ae                	mv	a3,a1
1c009c8c:	4c81                	li	s9,0
1c009c8e:	0c8350fb          	lp.setupi	x1,200,1c009c9a <_prf+0x2e2>
1c009c92:	0016c60b          	p.lbu	a2,1(a3!)
1c009c96:	48060c63          	beqz	a2,1c00a12e <_prf+0x776>
1c009c9a:	0c85                	addi	s9,s9,1
1c009c9c:	480d5b63          	bgez	s10,1c00a132 <_prf+0x77a>
1c009ca0:	a969                	j	1c00a13a <_prf+0x782>
1c009ca2:	000c2783          	lw	a5,0(s8)
1c009ca6:	004c0a13          	addi	s4,s8,4
1c009caa:	04f10223          	sb	a5,68(sp)
1c009cae:	040102a3          	sb	zero,69(sp)
1c009cb2:	4c85                	li	s9,1
1c009cb4:	4401                	li	s0,0
1c009cb6:	a139                	j	1c00a0c4 <_prf+0x70c>
1c009cb8:	47c2                	lw	a5,16(sp)
1c009cba:	02b00693          	li	a3,43
1c009cbe:	e781                	bnez	a5,1c009cc6 <_prf+0x30e>
1c009cc0:	c815                	beqz	s0,1c009cf4 <_prf+0x33c>
1c009cc2:	02000693          	li	a3,32
1c009cc6:	04d10223          	sb	a3,68(sp)
1c009cca:	85d6                	mv	a1,s5
1c009ccc:	04510c13          	addi	s8,sp,69
1c009cd0:	86ea                	mv	a3,s10
1c009cd2:	4629                	li	a2,10
1c009cd4:	8562                	mv	a0,s8
1c009cd6:	3ecd                	jal	1c0098c8 <_to_x>
1c009cd8:	4742                	lw	a4,16(sp)
1c009cda:	9562                	add	a0,a0,s8
1c009cdc:	41650533          	sub	a0,a0,s6
1c009ce0:	ef09                	bnez	a4,1c009cfa <_prf+0x342>
1c009ce2:	e019                	bnez	s0,1c009ce8 <_prf+0x330>
1c009ce4:	01fad413          	srli	s0,s5,0x1f
1c009ce8:	0bfd2363          	p.beqimm	s10,-1,1c009d8e <_prf+0x3d6>
1c009cec:	02000713          	li	a4,32
1c009cf0:	c63a                	sw	a4,12(sp)
1c009cf2:	a871                	j	1c009d8e <_prf+0x3d6>
1c009cf4:	85d6                	mv	a1,s5
1c009cf6:	8c5a                	mv	s8,s6
1c009cf8:	bfe1                	j	1c009cd0 <_prf+0x318>
1c009cfa:	4442                	lw	s0,16(sp)
1c009cfc:	b7f5                	j	1c009ce8 <_prf+0x330>
1c009cfe:	0c1d                	addi	s8,s8,7
1c009d00:	c40c3c33          	p.bclr	s8,s8,2,0
1c009d04:	000c2883          	lw	a7,0(s8)
1c009d08:	004c2303          	lw	t1,4(s8)
1c009d0c:	0158d593          	srli	a1,a7,0x15
1c009d10:	00b31693          	slli	a3,t1,0xb
1c009d14:	800007b7          	lui	a5,0x80000
1c009d18:	8ecd                	or	a3,a3,a1
1c009d1a:	fff7c793          	not	a5,a5
1c009d1e:	01435613          	srli	a2,t1,0x14
1c009d22:	08ae                	slli	a7,a7,0xb
1c009d24:	8efd                	and	a3,a3,a5
1c009d26:	e8b63633          	p.bclr	a2,a2,20,11
1c009d2a:	d846                	sw	a7,48(sp)
1c009d2c:	da36                	sw	a3,52(sp)
1c009d2e:	7ff00593          	li	a1,2047
1c009d32:	008c0a13          	addi	s4,s8,8
1c009d36:	08b61d63          	bne	a2,a1,1c009dd0 <_prf+0x418>
1c009d3a:	00d0                	addi	a2,sp,68
1c009d3c:	8732                	mv	a4,a2
1c009d3e:	00035863          	bgez	t1,1c009d4e <_prf+0x396>
1c009d42:	02d00713          	li	a4,45
1c009d46:	04e10223          	sb	a4,68(sp)
1c009d4a:	04510713          	addi	a4,sp,69
1c009d4e:	00d8e6b3          	or	a3,a7,a3
1c009d52:	fbfa8793          	addi	a5,s5,-65
1c009d56:	00370513          	addi	a0,a4,3 # 80000003 <pulp__FC+0x80000004>
1c009d5a:	eaa1                	bnez	a3,1c009daa <_prf+0x3f2>
1c009d5c:	46e5                	li	a3,25
1c009d5e:	02f6ee63          	bltu	a3,a5,1c009d9a <_prf+0x3e2>
1c009d62:	6795                	lui	a5,0x5
1c009d64:	e4978793          	addi	a5,a5,-439 # 4e49 <__rt_udma_callback_data+0x4b51>
1c009d68:	00f71023          	sh	a5,0(a4)
1c009d6c:	04600793          	li	a5,70
1c009d70:	00f70123          	sb	a5,2(a4)
1c009d74:	000701a3          	sb	zero,3(a4)
1c009d78:	8d11                	sub	a0,a0,a2
1c009d7a:	47c2                	lw	a5,16(sp)
1c009d7c:	44079e63          	bnez	a5,1c00a1d8 <_prf+0x820>
1c009d80:	e419                	bnez	s0,1c009d8e <_prf+0x3d6>
1c009d82:	04414403          	lbu	s0,68(sp)
1c009d86:	fd340413          	addi	s0,s0,-45
1c009d8a:	00143413          	seqz	s0,s0
1c009d8e:	0c800793          	li	a5,200
1c009d92:	c8a7c1e3          	blt	a5,a0,1c009a14 <_prf+0x5c>
1c009d96:	8caa                	mv	s9,a0
1c009d98:	a635                	j	1c00a0c4 <_prf+0x70c>
1c009d9a:	679d                	lui	a5,0x7
1c009d9c:	e6978793          	addi	a5,a5,-407 # 6e69 <__rt_udma_callback_data+0x6b71>
1c009da0:	00f71023          	sh	a5,0(a4)
1c009da4:	06600793          	li	a5,102
1c009da8:	b7e1                	j	1c009d70 <_prf+0x3b8>
1c009daa:	46e5                	li	a3,25
1c009dac:	00f6ea63          	bltu	a3,a5,1c009dc0 <_prf+0x408>
1c009db0:	6791                	lui	a5,0x4
1c009db2:	14e78793          	addi	a5,a5,334 # 414e <__rt_udma_callback_data+0x3e56>
1c009db6:	00f71023          	sh	a5,0(a4)
1c009dba:	04e00793          	li	a5,78
1c009dbe:	bf4d                	j	1c009d70 <_prf+0x3b8>
1c009dc0:	6799                	lui	a5,0x6
1c009dc2:	16e78793          	addi	a5,a5,366 # 616e <__rt_udma_callback_data+0x5e76>
1c009dc6:	00f71023          	sh	a5,0(a4)
1c009dca:	06e00793          	li	a5,110
1c009dce:	b74d                	j	1c009d70 <_prf+0x3b8>
1c009dd0:	04600593          	li	a1,70
1c009dd4:	00ba9463          	bne	s5,a1,1c009ddc <_prf+0x424>
1c009dd8:	06600a93          	li	s5,102
1c009ddc:	011665b3          	or	a1,a2,a7
1c009de0:	8dd5                	or	a1,a1,a3
1c009de2:	c5d1                	beqz	a1,1c009e6e <_prf+0x4b6>
1c009de4:	80000737          	lui	a4,0x80000
1c009de8:	8ed9                	or	a3,a3,a4
1c009dea:	da36                	sw	a3,52(sp)
1c009dec:	d846                	sw	a7,48(sp)
1c009dee:	c0260c13          	addi	s8,a2,-1022
1c009df2:	02d00693          	li	a3,45
1c009df6:	00034b63          	bltz	t1,1c009e0c <_prf+0x454>
1c009dfa:	47c2                	lw	a5,16(sp)
1c009dfc:	02b00693          	li	a3,43
1c009e00:	e791                	bnez	a5,1c009e0c <_prf+0x454>
1c009e02:	04410b13          	addi	s6,sp,68
1c009e06:	c419                	beqz	s0,1c009e14 <_prf+0x45c>
1c009e08:	02000693          	li	a3,32
1c009e0c:	04d10223          	sb	a3,68(sp)
1c009e10:	04510b13          	addi	s6,sp,69
1c009e14:	4b81                	li	s7,0
1c009e16:	55f9                	li	a1,-2
1c009e18:	04bc4f63          	blt	s8,a1,1c009e76 <_prf+0x4be>
1c009e1c:	0b804563          	bgtz	s8,1c009ec6 <_prf+0x50e>
1c009e20:	1808                	addi	a0,sp,48
1c009e22:	0c05                	addi	s8,s8,1
1c009e24:	3ced                	jal	1c00991e <_rlrshift>
1c009e26:	fe4c3de3          	p.bneimm	s8,4,1c009e20 <_prf+0x468>
1c009e2a:	000d5363          	bgez	s10,1c009e30 <_prf+0x478>
1c009e2e:	4d19                	li	s10,6
1c009e30:	c05ab5b3          	p.bclr	a1,s5,0,5
1c009e34:	04700513          	li	a0,71
1c009e38:	0ca59263          	bne	a1,a0,1c009efc <_prf+0x544>
1c009e3c:	4c01                	li	s8,0
1c009e3e:	000c9463          	bnez	s9,1c009e46 <_prf+0x48e>
1c009e42:	01a03c33          	snez	s8,s10
1c009e46:	55f5                	li	a1,-3
1c009e48:	00bbc663          	blt	s7,a1,1c009e54 <_prf+0x49c>
1c009e4c:	001d0593          	addi	a1,s10,1
1c009e50:	0b75db63          	ble	s7,a1,1c009f06 <_prf+0x54e>
1c009e54:	06700593          	li	a1,103
1c009e58:	14ba8663          	beq	s5,a1,1c009fa4 <_prf+0x5ec>
1c009e5c:	04500a93          	li	s5,69
1c009e60:	001d0593          	addi	a1,s10,1
1c009e64:	4541                	li	a0,16
1c009e66:	d62a                	sw	a0,44(sp)
1c009e68:	04a5cdb3          	p.min	s11,a1,a0
1c009e6c:	a075                	j	1c009f18 <_prf+0x560>
1c009e6e:	4c01                	li	s8,0
1c009e70:	b769                	j	1c009dfa <_prf+0x442>
1c009e72:	1808                	addi	a0,sp,48
1c009e74:	346d                	jal	1c00991e <_rlrshift>
1c009e76:	33333737          	lui	a4,0x33333
1c009e7a:	5352                	lw	t1,52(sp)
1c009e7c:	33270713          	addi	a4,a4,818 # 33333332 <__l2_shared_end+0x17323246>
1c009e80:	58c2                	lw	a7,48(sp)
1c009e82:	0c05                	addi	s8,s8,1
1c009e84:	fe6767e3          	bltu	a4,t1,1c009e72 <_prf+0x4ba>
1c009e88:	4515                	li	a0,5
1c009e8a:	031535b3          	mulhu	a1,a0,a7
1c009e8e:	426505b3          	p.mac	a1,a0,t1
1c009e92:	031508b3          	mul	a7,a0,a7
1c009e96:	d846                	sw	a7,48(sp)
1c009e98:	da2e                	sw	a1,52(sp)
1c009e9a:	1bfd                	addi	s7,s7,-1
1c009e9c:	4501                	li	a0,0
1c009e9e:	800007b7          	lui	a5,0x80000
1c009ea2:	fff7c793          	not	a5,a5
1c009ea6:	00b7f663          	bleu	a1,a5,1c009eb2 <_prf+0x4fa>
1c009eaa:	d535                	beqz	a0,1c009e16 <_prf+0x45e>
1c009eac:	d846                	sw	a7,48(sp)
1c009eae:	da2e                	sw	a1,52(sp)
1c009eb0:	b79d                	j	1c009e16 <_prf+0x45e>
1c009eb2:	01f8d313          	srli	t1,a7,0x1f
1c009eb6:	00159513          	slli	a0,a1,0x1
1c009eba:	00a365b3          	or	a1,t1,a0
1c009ebe:	0886                	slli	a7,a7,0x1
1c009ec0:	1c7d                	addi	s8,s8,-1
1c009ec2:	4505                	li	a0,1
1c009ec4:	bfe9                	j	1c009e9e <_prf+0x4e6>
1c009ec6:	1808                	addi	a0,sp,48
1c009ec8:	3c9d                	jal	1c00993e <_ldiv5>
1c009eca:	58c2                	lw	a7,48(sp)
1c009ecc:	55d2                	lw	a1,52(sp)
1c009ece:	1c7d                	addi	s8,s8,-1
1c009ed0:	0b85                	addi	s7,s7,1
1c009ed2:	4501                	li	a0,0
1c009ed4:	80000737          	lui	a4,0x80000
1c009ed8:	fff74713          	not	a4,a4
1c009edc:	00b77663          	bleu	a1,a4,1c009ee8 <_prf+0x530>
1c009ee0:	dd15                	beqz	a0,1c009e1c <_prf+0x464>
1c009ee2:	d846                	sw	a7,48(sp)
1c009ee4:	da2e                	sw	a1,52(sp)
1c009ee6:	bf1d                	j	1c009e1c <_prf+0x464>
1c009ee8:	01f8d313          	srli	t1,a7,0x1f
1c009eec:	00159513          	slli	a0,a1,0x1
1c009ef0:	00a365b3          	or	a1,t1,a0
1c009ef4:	0886                	slli	a7,a7,0x1
1c009ef6:	1c7d                	addi	s8,s8,-1
1c009ef8:	4505                	li	a0,1
1c009efa:	bfe9                	j	1c009ed4 <_prf+0x51c>
1c009efc:	06600593          	li	a1,102
1c009f00:	4c01                	li	s8,0
1c009f02:	f4ba9fe3          	bne	s5,a1,1c009e60 <_prf+0x4a8>
1c009f06:	01ab85b3          	add	a1,s7,s10
1c009f0a:	06600a93          	li	s5,102
1c009f0e:	f405dbe3          	bgez	a1,1c009e64 <_prf+0x4ac>
1c009f12:	45c1                	li	a1,16
1c009f14:	d62e                	sw	a1,44(sp)
1c009f16:	4d81                	li	s11,0
1c009f18:	4301                	li	t1,0
1c009f1a:	080003b7          	lui	t2,0x8000
1c009f1e:	dc1a                	sw	t1,56(sp)
1c009f20:	de1e                	sw	t2,60(sp)
1c009f22:	1dfd                	addi	s11,s11,-1
1c009f24:	09fdb363          	p.bneimm	s11,-1,1c009faa <_prf+0x5f2>
1c009f28:	55c2                	lw	a1,48(sp)
1c009f2a:	5562                	lw	a0,56(sp)
1c009f2c:	58d2                	lw	a7,52(sp)
1c009f2e:	5372                	lw	t1,60(sp)
1c009f30:	952e                	add	a0,a0,a1
1c009f32:	00b535b3          	sltu	a1,a0,a1
1c009f36:	989a                	add	a7,a7,t1
1c009f38:	95c6                	add	a1,a1,a7
1c009f3a:	da2e                	sw	a1,52(sp)
1c009f3c:	d82a                	sw	a0,48(sp)
1c009f3e:	f605b5b3          	p.bclr	a1,a1,27,0
1c009f42:	c981                	beqz	a1,1c009f52 <_prf+0x59a>
1c009f44:	1808                	addi	a0,sp,48
1c009f46:	9f9ff0ef          	jal	ra,1c00993e <_ldiv5>
1c009f4a:	1808                	addi	a0,sp,48
1c009f4c:	9d3ff0ef          	jal	ra,1c00991e <_rlrshift>
1c009f50:	0b85                	addi	s7,s7,1
1c009f52:	06600593          	li	a1,102
1c009f56:	001b0d93          	addi	s11,s6,1
1c009f5a:	08ba9463          	bne	s5,a1,1c009fe2 <_prf+0x62a>
1c009f5e:	05705d63          	blez	s7,1c009fb8 <_prf+0x600>
1c009f62:	017b0db3          	add	s11,s6,s7
1c009f66:	106c                	addi	a1,sp,44
1c009f68:	1808                	addi	a0,sp,48
1c009f6a:	a19ff0ef          	jal	ra,1c009982 <_get_digit>
1c009f6e:	00ab00ab          	p.sb	a0,1(s6!)
1c009f72:	ffbb1ae3          	bne	s6,s11,1c009f66 <_prf+0x5ae>
1c009f76:	4b81                	li	s7,0
1c009f78:	000c9463          	bnez	s9,1c009f80 <_prf+0x5c8>
1c009f7c:	020d0163          	beqz	s10,1c009f9e <_prf+0x5e6>
1c009f80:	001d8b13          	addi	s6,s11,1
1c009f84:	02e00613          	li	a2,46
1c009f88:	00cd8023          	sb	a2,0(s11)
1c009f8c:	8cea                	mv	s9,s10
1c009f8e:	8dda                	mv	s11,s6
1c009f90:	03000893          	li	a7,48
1c009f94:	1cfd                	addi	s9,s9,-1
1c009f96:	03fcb663          	p.bneimm	s9,-1,1c009fc2 <_prf+0x60a>
1c009f9a:	01ab0db3          	add	s11,s6,s10
1c009f9e:	060c1c63          	bnez	s8,1c00a016 <_prf+0x65e>
1c009fa2:	a8c1                	j	1c00a072 <_prf+0x6ba>
1c009fa4:	06500a93          	li	s5,101
1c009fa8:	bd65                	j	1c009e60 <_prf+0x4a8>
1c009faa:	1828                	addi	a0,sp,56
1c009fac:	993ff0ef          	jal	ra,1c00993e <_ldiv5>
1c009fb0:	1828                	addi	a0,sp,56
1c009fb2:	96dff0ef          	jal	ra,1c00991e <_rlrshift>
1c009fb6:	b7b5                	j	1c009f22 <_prf+0x56a>
1c009fb8:	03000593          	li	a1,48
1c009fbc:	00bb0023          	sb	a1,0(s6)
1c009fc0:	bf65                	j	1c009f78 <_prf+0x5c0>
1c009fc2:	0d85                	addi	s11,s11,1
1c009fc4:	000b8663          	beqz	s7,1c009fd0 <_prf+0x618>
1c009fc8:	ff1d8fa3          	sb	a7,-1(s11)
1c009fcc:	0b85                	addi	s7,s7,1
1c009fce:	b7d9                	j	1c009f94 <_prf+0x5dc>
1c009fd0:	106c                	addi	a1,sp,44
1c009fd2:	1808                	addi	a0,sp,48
1c009fd4:	c446                	sw	a7,8(sp)
1c009fd6:	9adff0ef          	jal	ra,1c009982 <_get_digit>
1c009fda:	fead8fa3          	sb	a0,-1(s11)
1c009fde:	48a2                	lw	a7,8(sp)
1c009fe0:	bf55                	j	1c009f94 <_prf+0x5dc>
1c009fe2:	106c                	addi	a1,sp,44
1c009fe4:	1808                	addi	a0,sp,48
1c009fe6:	99dff0ef          	jal	ra,1c009982 <_get_digit>
1c009fea:	00ab0023          	sb	a0,0(s6)
1c009fee:	03000593          	li	a1,48
1c009ff2:	00b50363          	beq	a0,a1,1c009ff8 <_prf+0x640>
1c009ff6:	1bfd                	addi	s7,s7,-1
1c009ff8:	000c9463          	bnez	s9,1c00a000 <_prf+0x648>
1c009ffc:	000d0b63          	beqz	s10,1c00a012 <_prf+0x65a>
1c00a000:	002b0d93          	addi	s11,s6,2
1c00a004:	02e00593          	li	a1,46
1c00a008:	00bb00a3          	sb	a1,1(s6)
1c00a00c:	9d6e                	add	s10,s10,s11
1c00a00e:	07bd1863          	bne	s10,s11,1c00a07e <_prf+0x6c6>
1c00a012:	000c0f63          	beqz	s8,1c00a030 <_prf+0x678>
1c00a016:	03000593          	li	a1,48
1c00a01a:	fffd8713          	addi	a4,s11,-1
1c00a01e:	00074603          	lbu	a2,0(a4) # 80000000 <pulp__FC+0x80000001>
1c00a022:	06b60563          	beq	a2,a1,1c00a08c <_prf+0x6d4>
1c00a026:	02e00593          	li	a1,46
1c00a02a:	00b61363          	bne	a2,a1,1c00a030 <_prf+0x678>
1c00a02e:	8dba                	mv	s11,a4
1c00a030:	c05ab733          	p.bclr	a4,s5,0,5
1c00a034:	04500613          	li	a2,69
1c00a038:	02c71d63          	bne	a4,a2,1c00a072 <_prf+0x6ba>
1c00a03c:	87d6                	mv	a5,s5
1c00a03e:	00fd8023          	sb	a5,0(s11)
1c00a042:	02b00793          	li	a5,43
1c00a046:	000bd663          	bgez	s7,1c00a052 <_prf+0x69a>
1c00a04a:	41700bb3          	neg	s7,s7
1c00a04e:	02d00793          	li	a5,45
1c00a052:	00fd80a3          	sb	a5,1(s11)
1c00a056:	47a9                	li	a5,10
1c00a058:	02fbc733          	div	a4,s7,a5
1c00a05c:	02fbe6b3          	rem	a3,s7,a5
1c00a060:	03070713          	addi	a4,a4,48
1c00a064:	03068693          	addi	a3,a3,48
1c00a068:	00ed8123          	sb	a4,2(s11)
1c00a06c:	00dd81a3          	sb	a3,3(s11)
1c00a070:	0d91                	addi	s11,s11,4
1c00a072:	00c8                	addi	a0,sp,68
1c00a074:	000d8023          	sb	zero,0(s11)
1c00a078:	40ad8533          	sub	a0,s11,a0
1c00a07c:	b9fd                	j	1c009d7a <_prf+0x3c2>
1c00a07e:	106c                	addi	a1,sp,44
1c00a080:	1808                	addi	a0,sp,48
1c00a082:	901ff0ef          	jal	ra,1c009982 <_get_digit>
1c00a086:	00ad80ab          	p.sb	a0,1(s11!)
1c00a08a:	b751                	j	1c00a00e <_prf+0x656>
1c00a08c:	8dba                	mv	s11,a4
1c00a08e:	b771                	j	1c00a01a <_prf+0x662>
1c00a090:	000c2783          	lw	a5,0(s8)
1c00a094:	004c0a13          	addi	s4,s8,4
1c00a098:	0127a023          	sw	s2,0(a5) # 80000000 <pulp__FC+0x80000001>
1c00a09c:	ba6d                	j	1c009a56 <_prf+0x9e>
1c00a09e:	004c0a13          	addi	s4,s8,4
1c00a0a2:	000c2583          	lw	a1,0(s8)
1c00a0a6:	00dc                	addi	a5,sp,68
1c00a0a8:	040c8263          	beqz	s9,1c00a0ec <_prf+0x734>
1c00a0ac:	03000693          	li	a3,48
1c00a0b0:	04d10223          	sb	a3,68(sp)
1c00a0b4:	04510513          	addi	a0,sp,69
1c00a0b8:	e99d                	bnez	a1,1c00a0ee <_prf+0x736>
1c00a0ba:	040102a3          	sb	zero,69(sp)
1c00a0be:	4401                	li	s0,0
1c00a0c0:	0dfd3063          	p.bneimm	s10,-1,1c00a180 <_prf+0x7c8>
1c00a0c4:	04410b93          	addi	s7,sp,68
1c00a0c8:	0d3cc063          	blt	s9,s3,1c00a188 <_prf+0x7d0>
1c00a0cc:	89e6                	mv	s3,s9
1c00a0ce:	41790433          	sub	s0,s2,s7
1c00a0d2:	01740933          	add	s2,s0,s7
1c00a0d6:	980980e3          	beqz	s3,1c009a56 <_prf+0x9e>
1c00a0da:	45f2                	lw	a1,28(sp)
1c00a0dc:	001bc50b          	p.lbu	a0,1(s7!)
1c00a0e0:	47e2                	lw	a5,24(sp)
1c00a0e2:	9782                	jalr	a5
1c00a0e4:	93f528e3          	p.beqimm	a0,-1,1c009a14 <_prf+0x5c>
1c00a0e8:	19fd                	addi	s3,s3,-1
1c00a0ea:	b7e5                	j	1c00a0d2 <_prf+0x71a>
1c00a0ec:	853e                	mv	a0,a5
1c00a0ee:	86ea                	mv	a3,s10
1c00a0f0:	4621                	li	a2,8
1c00a0f2:	40f50433          	sub	s0,a0,a5
1c00a0f6:	fd2ff0ef          	jal	ra,1c0098c8 <_to_x>
1c00a0fa:	9522                	add	a0,a0,s0
1c00a0fc:	4401                	li	s0,0
1c00a0fe:	c9fd28e3          	p.beqimm	s10,-1,1c009d8e <_prf+0x3d6>
1c00a102:	02000793          	li	a5,32
1c00a106:	c63e                	sw	a5,12(sp)
1c00a108:	b159                	j	1c009d8e <_prf+0x3d6>
1c00a10a:	000c2583          	lw	a1,0(s8)
1c00a10e:	77e1                	lui	a5,0xffff8
1c00a110:	8307c793          	xori	a5,a5,-2000
1c00a114:	46a1                	li	a3,8
1c00a116:	4641                	li	a2,16
1c00a118:	04610513          	addi	a0,sp,70
1c00a11c:	04f11223          	sh	a5,68(sp)
1c00a120:	fa8ff0ef          	jal	ra,1c0098c8 <_to_x>
1c00a124:	004c0a13          	addi	s4,s8,4
1c00a128:	0509                	addi	a0,a0,2
1c00a12a:	4401                	li	s0,0
1c00a12c:	be75                	j	1c009ce8 <_prf+0x330>
1c00a12e:	000d4463          	bltz	s10,1c00a136 <_prf+0x77e>
1c00a132:	05acccb3          	p.min	s9,s9,s10
1c00a136:	920c80e3          	beqz	s9,1c009a56 <_prf+0x9e>
1c00a13a:	8666                	mv	a2,s9
1c00a13c:	00c8                	addi	a0,sp,68
1c00a13e:	c62ff0ef          	jal	ra,1c0095a0 <memcpy>
1c00a142:	be8d                	j	1c009cb4 <_prf+0x2fc>
1c00a144:	000c2583          	lw	a1,0(s8)
1c00a148:	86ea                	mv	a3,s10
1c00a14a:	4629                	li	a2,10
1c00a14c:	00c8                	addi	a0,sp,68
1c00a14e:	004c0a13          	addi	s4,s8,4
1c00a152:	f76ff0ef          	jal	ra,1c0098c8 <_to_x>
1c00a156:	b75d                	j	1c00a0fc <_prf+0x744>
1c00a158:	f9f78613          	addi	a2,a5,-97 # ffff7f9f <pulp__FC+0xffff7fa0>
1c00a15c:	0ff67613          	andi	a2,a2,255
1c00a160:	aac5e5e3          	bltu	a1,a2,1c009c0a <_prf+0x252>
1c00a164:	1781                	addi	a5,a5,-32
1c00a166:	fef68fa3          	sb	a5,-1(a3)
1c00a16a:	b445                	j	1c009c0a <_prf+0x252>
1c00a16c:	45f2                	lw	a1,28(sp)
1c00a16e:	4762                	lw	a4,24(sp)
1c00a170:	02500513          	li	a0,37
1c00a174:	9702                	jalr	a4
1c00a176:	89f52fe3          	p.beqimm	a0,-1,1c009a14 <_prf+0x5c>
1c00a17a:	0905                	addi	s2,s2,1
1c00a17c:	8a62                	mv	s4,s8
1c00a17e:	b8e1                	j	1c009a56 <_prf+0x9e>
1c00a180:	02000793          	li	a5,32
1c00a184:	c63e                	sw	a5,12(sp)
1c00a186:	bf3d                	j	1c00a0c4 <_prf+0x70c>
1c00a188:	4752                	lw	a4,20(sp)
1c00a18a:	cf01                	beqz	a4,1c00a1a2 <_prf+0x7ea>
1c00a18c:	019b8833          	add	a6,s7,s9
1c00a190:	02000713          	li	a4,32
1c00a194:	417807b3          	sub	a5,a6,s7
1c00a198:	f337dbe3          	ble	s3,a5,1c00a0ce <_prf+0x716>
1c00a19c:	00e800ab          	p.sb	a4,1(a6!)
1c00a1a0:	bfd5                	j	1c00a194 <_prf+0x7dc>
1c00a1a2:	41998c33          	sub	s8,s3,s9
1c00a1a6:	001c8613          	addi	a2,s9,1
1c00a1aa:	85de                	mv	a1,s7
1c00a1ac:	018b8533          	add	a0,s7,s8
1c00a1b0:	c26ff0ef          	jal	ra,1c0095d6 <memmove>
1c00a1b4:	4732                	lw	a4,12(sp)
1c00a1b6:	02000793          	li	a5,32
1c00a1ba:	00f70363          	beq	a4,a5,1c00a1c0 <_prf+0x808>
1c00a1be:	ca22                	sw	s0,20(sp)
1c00a1c0:	47d2                	lw	a5,20(sp)
1c00a1c2:	9c3e                	add	s8,s8,a5
1c00a1c4:	00fb8ab3          	add	s5,s7,a5
1c00a1c8:	417a87b3          	sub	a5,s5,s7
1c00a1cc:	f187d1e3          	ble	s8,a5,1c00a0ce <_prf+0x716>
1c00a1d0:	4732                	lw	a4,12(sp)
1c00a1d2:	00ea80ab          	p.sb	a4,1(s5!)
1c00a1d6:	bfcd                	j	1c00a1c8 <_prf+0x810>
1c00a1d8:	4442                	lw	s0,16(sp)
1c00a1da:	be55                	j	1c009d8e <_prf+0x3d6>

1c00a1dc <__rt_uart_wait_tx_done.isra.3>:
1c00a1dc:	1a102737          	lui	a4,0x1a102
1c00a1e0:	09870713          	addi	a4,a4,152 # 1a102098 <__rt_udma_callback_data+0x1a101da0>
1c00a1e4:	431c                	lw	a5,0(a4)
1c00a1e6:	8bc1                	andi	a5,a5,16
1c00a1e8:	eb95                	bnez	a5,1c00a21c <__rt_uart_wait_tx_done.isra.3+0x40>
1c00a1ea:	1a102737          	lui	a4,0x1a102
1c00a1ee:	0a070713          	addi	a4,a4,160 # 1a1020a0 <__rt_udma_callback_data+0x1a101da8>
1c00a1f2:	431c                	lw	a5,0(a4)
1c00a1f4:	fc17b7b3          	p.bclr	a5,a5,30,1
1c00a1f8:	ffed                	bnez	a5,1c00a1f2 <__rt_uart_wait_tx_done.isra.3+0x16>
1c00a1fa:	1a10a7b7          	lui	a5,0x1a10a
1c00a1fe:	81478593          	addi	a1,a5,-2028 # 1a109814 <__rt_udma_callback_data+0x1a10951c>
1c00a202:	80478613          	addi	a2,a5,-2044
1c00a206:	6691                	lui	a3,0x4
1c00a208:	80878793          	addi	a5,a5,-2040
1c00a20c:	032350fb          	lp.setupi	x1,50,1c00a218 <__rt_uart_wait_tx_done.isra.3+0x3c>
1c00a210:	c194                	sw	a3,0(a1)
1c00a212:	c214                	sw	a3,0(a2)
1c00a214:	10500073          	wfi
1c00a218:	c394                	sw	a3,0(a5)
1c00a21a:	8082                	ret
1c00a21c:	10500073          	wfi
1c00a220:	b7d1                	j	1c00a1e4 <__rt_uart_wait_tx_done.isra.3+0x8>

1c00a222 <__rt_uart_setfreq_before>:
1c00a222:	1c0017b7          	lui	a5,0x1c001
1c00a226:	f5c7a783          	lw	a5,-164(a5) # 1c000f5c <__rt_uart>
1c00a22a:	cf99                	beqz	a5,1c00a248 <__rt_uart_setfreq_before+0x26>
1c00a22c:	1141                	addi	sp,sp,-16
1c00a22e:	c606                	sw	ra,12(sp)
1c00a230:	3775                	jal	1c00a1dc <__rt_uart_wait_tx_done.isra.3>
1c00a232:	005007b7          	lui	a5,0x500
1c00a236:	40b2                	lw	ra,12(sp)
1c00a238:	1a102737          	lui	a4,0x1a102
1c00a23c:	0799                	addi	a5,a5,6
1c00a23e:	0af72223          	sw	a5,164(a4) # 1a1020a4 <__rt_udma_callback_data+0x1a101dac>
1c00a242:	4501                	li	a0,0
1c00a244:	0141                	addi	sp,sp,16
1c00a246:	8082                	ret
1c00a248:	4501                	li	a0,0
1c00a24a:	8082                	ret

1c00a24c <__rt_uart_setup.isra.4>:
1c00a24c:	1c001737          	lui	a4,0x1c001
1c00a250:	fa472703          	lw	a4,-92(a4) # 1c000fa4 <__rt_freq_domains+0x4>
1c00a254:	00155793          	srli	a5,a0,0x1
1c00a258:	97ba                	add	a5,a5,a4
1c00a25a:	02a7d7b3          	divu	a5,a5,a0
1c00a25e:	17fd                	addi	a5,a5,-1
1c00a260:	07c2                	slli	a5,a5,0x10
1c00a262:	3067e793          	ori	a5,a5,774
1c00a266:	1a102737          	lui	a4,0x1a102
1c00a26a:	0af72223          	sw	a5,164(a4) # 1a1020a4 <__rt_udma_callback_data+0x1a101dac>
1c00a26e:	8082                	ret

1c00a270 <__rt_uart_setfreq_after>:
1c00a270:	1c0017b7          	lui	a5,0x1c001
1c00a274:	f5c78793          	addi	a5,a5,-164 # 1c000f5c <__rt_uart>
1c00a278:	4398                	lw	a4,0(a5)
1c00a27a:	cb09                	beqz	a4,1c00a28c <__rt_uart_setfreq_after+0x1c>
1c00a27c:	4788                	lw	a0,8(a5)
1c00a27e:	1141                	addi	sp,sp,-16
1c00a280:	c606                	sw	ra,12(sp)
1c00a282:	37e9                	jal	1c00a24c <__rt_uart_setup.isra.4>
1c00a284:	40b2                	lw	ra,12(sp)
1c00a286:	4501                	li	a0,0
1c00a288:	0141                	addi	sp,sp,16
1c00a28a:	8082                	ret
1c00a28c:	4501                	li	a0,0
1c00a28e:	8082                	ret

1c00a290 <soc_eu_fcEventMask_setEvent>:
1c00a290:	02000793          	li	a5,32
1c00a294:	02f54733          	div	a4,a0,a5
1c00a298:	1a1066b7          	lui	a3,0x1a106
1c00a29c:	02f56533          	rem	a0,a0,a5
1c00a2a0:	0691                	addi	a3,a3,4
1c00a2a2:	070a                	slli	a4,a4,0x2
1c00a2a4:	9736                	add	a4,a4,a3
1c00a2a6:	4785                	li	a5,1
1c00a2a8:	4314                	lw	a3,0(a4)
1c00a2aa:	00a797b3          	sll	a5,a5,a0
1c00a2ae:	fff7c793          	not	a5,a5
1c00a2b2:	8ff5                	and	a5,a5,a3
1c00a2b4:	c31c                	sw	a5,0(a4)
1c00a2b6:	8082                	ret

1c00a2b8 <rt_uart_conf_init>:
1c00a2b8:	000997b7          	lui	a5,0x99
1c00a2bc:	96878793          	addi	a5,a5,-1688 # 98968 <__rt_udma_callback_data+0x98670>
1c00a2c0:	c11c                	sw	a5,0(a0)
1c00a2c2:	57fd                	li	a5,-1
1c00a2c4:	c15c                	sw	a5,4(a0)
1c00a2c6:	8082                	ret

1c00a2c8 <__rt_uart_open>:
1c00a2c8:	1141                	addi	sp,sp,-16
1c00a2ca:	c606                	sw	ra,12(sp)
1c00a2cc:	c422                	sw	s0,8(sp)
1c00a2ce:	c226                	sw	s1,4(sp)
1c00a2d0:	c04a                	sw	s2,0(sp)
1c00a2d2:	30047973          	csrrci	s2,mstatus,8
1c00a2d6:	cd85                	beqz	a1,1c00a30e <__rt_uart_open+0x46>
1c00a2d8:	4198                	lw	a4,0(a1)
1c00a2da:	1c0017b7          	lui	a5,0x1c001
1c00a2de:	f5c78413          	addi	s0,a5,-164 # 1c000f5c <__rt_uart>
1c00a2e2:	00451613          	slli	a2,a0,0x4
1c00a2e6:	9432                	add	s0,s0,a2
1c00a2e8:	4014                	lw	a3,0(s0)
1c00a2ea:	f5c78793          	addi	a5,a5,-164
1c00a2ee:	c68d                	beqz	a3,1c00a318 <__rt_uart_open+0x50>
1c00a2f0:	c589                	beqz	a1,1c00a2fa <__rt_uart_open+0x32>
1c00a2f2:	418c                	lw	a1,0(a1)
1c00a2f4:	4418                	lw	a4,8(s0)
1c00a2f6:	04e59863          	bne	a1,a4,1c00a346 <__rt_uart_open+0x7e>
1c00a2fa:	0685                	addi	a3,a3,1
1c00a2fc:	00d7e623          	p.sw	a3,a2(a5)
1c00a300:	8522                	mv	a0,s0
1c00a302:	40b2                	lw	ra,12(sp)
1c00a304:	4422                	lw	s0,8(sp)
1c00a306:	4492                	lw	s1,4(sp)
1c00a308:	4902                	lw	s2,0(sp)
1c00a30a:	0141                	addi	sp,sp,16
1c00a30c:	8082                	ret
1c00a30e:	00099737          	lui	a4,0x99
1c00a312:	96870713          	addi	a4,a4,-1688 # 98968 <__rt_udma_callback_data+0x98670>
1c00a316:	b7d1                	j	1c00a2da <__rt_uart_open+0x12>
1c00a318:	4785                	li	a5,1
1c00a31a:	c01c                	sw	a5,0(s0)
1c00a31c:	c418                	sw	a4,8(s0)
1c00a31e:	c048                	sw	a0,4(s0)
1c00a320:	1a102737          	lui	a4,0x1a102
1c00a324:	4314                	lw	a3,0(a4)
1c00a326:	00a797b3          	sll	a5,a5,a0
1c00a32a:	8fd5                	or	a5,a5,a3
1c00a32c:	00251493          	slli	s1,a0,0x2
1c00a330:	c31c                	sw	a5,0(a4)
1c00a332:	8526                	mv	a0,s1
1c00a334:	3fb1                	jal	1c00a290 <soc_eu_fcEventMask_setEvent>
1c00a336:	00148513          	addi	a0,s1,1
1c00a33a:	3f99                	jal	1c00a290 <soc_eu_fcEventMask_setEvent>
1c00a33c:	4408                	lw	a0,8(s0)
1c00a33e:	3739                	jal	1c00a24c <__rt_uart_setup.isra.4>
1c00a340:	30091073          	csrw	mstatus,s2
1c00a344:	bf75                	j	1c00a300 <__rt_uart_open+0x38>
1c00a346:	4401                	li	s0,0
1c00a348:	bf65                	j	1c00a300 <__rt_uart_open+0x38>

1c00a34a <rt_uart_close>:
1c00a34a:	1141                	addi	sp,sp,-16
1c00a34c:	c606                	sw	ra,12(sp)
1c00a34e:	c422                	sw	s0,8(sp)
1c00a350:	c226                	sw	s1,4(sp)
1c00a352:	300474f3          	csrrci	s1,mstatus,8
1c00a356:	411c                	lw	a5,0(a0)
1c00a358:	17fd                	addi	a5,a5,-1
1c00a35a:	c11c                	sw	a5,0(a0)
1c00a35c:	e785                	bnez	a5,1c00a384 <rt_uart_close+0x3a>
1c00a35e:	842a                	mv	s0,a0
1c00a360:	3db5                	jal	1c00a1dc <__rt_uart_wait_tx_done.isra.3>
1c00a362:	1a102737          	lui	a4,0x1a102
1c00a366:	005007b7          	lui	a5,0x500
1c00a36a:	0a470693          	addi	a3,a4,164 # 1a1020a4 <__rt_udma_callback_data+0x1a101dac>
1c00a36e:	0799                	addi	a5,a5,6
1c00a370:	c29c                	sw	a5,0(a3)
1c00a372:	4050                	lw	a2,4(s0)
1c00a374:	4785                	li	a5,1
1c00a376:	4314                	lw	a3,0(a4)
1c00a378:	00c797b3          	sll	a5,a5,a2
1c00a37c:	fff7c793          	not	a5,a5
1c00a380:	8ff5                	and	a5,a5,a3
1c00a382:	c31c                	sw	a5,0(a4)
1c00a384:	30049073          	csrw	mstatus,s1
1c00a388:	40b2                	lw	ra,12(sp)
1c00a38a:	4422                	lw	s0,8(sp)
1c00a38c:	4492                	lw	s1,4(sp)
1c00a38e:	0141                	addi	sp,sp,16
1c00a390:	8082                	ret

1c00a392 <__rt_uart_init>:
1c00a392:	1c00a5b7          	lui	a1,0x1c00a
1c00a396:	1141                	addi	sp,sp,-16
1c00a398:	4601                	li	a2,0
1c00a39a:	22258593          	addi	a1,a1,546 # 1c00a222 <__rt_uart_setfreq_before>
1c00a39e:	4511                	li	a0,4
1c00a3a0:	c606                	sw	ra,12(sp)
1c00a3a2:	c422                	sw	s0,8(sp)
1c00a3a4:	cb2fe0ef          	jal	ra,1c008856 <__rt_cbsys_add>
1c00a3a8:	1c00a5b7          	lui	a1,0x1c00a
1c00a3ac:	842a                	mv	s0,a0
1c00a3ae:	4601                	li	a2,0
1c00a3b0:	27058593          	addi	a1,a1,624 # 1c00a270 <__rt_uart_setfreq_after>
1c00a3b4:	4515                	li	a0,5
1c00a3b6:	ca0fe0ef          	jal	ra,1c008856 <__rt_cbsys_add>
1c00a3ba:	1c0017b7          	lui	a5,0x1c001
1c00a3be:	f407ae23          	sw	zero,-164(a5) # 1c000f5c <__rt_uart>
1c00a3c2:	8d41                	or	a0,a0,s0
1c00a3c4:	c10d                	beqz	a0,1c00a3e6 <__rt_uart_init+0x54>
1c00a3c6:	f1402673          	csrr	a2,mhartid
1c00a3ca:	1c000537          	lui	a0,0x1c000
1c00a3ce:	40565593          	srai	a1,a2,0x5
1c00a3d2:	f265b5b3          	p.bclr	a1,a1,25,6
1c00a3d6:	f4563633          	p.bclr	a2,a2,26,5
1c00a3da:	57850513          	addi	a0,a0,1400 # 1c000578 <sbox+0x214>
1c00a3de:	cc0ff0ef          	jal	ra,1c00989e <printf>
1c00a3e2:	c28ff0ef          	jal	ra,1c00980a <abort>
1c00a3e6:	40b2                	lw	ra,12(sp)
1c00a3e8:	4422                	lw	s0,8(sp)
1c00a3ea:	0141                	addi	sp,sp,16
1c00a3ec:	8082                	ret

1c00a3ee <_endtext>:
	...
