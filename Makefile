sim-aes-sw:
	make -C sw/aes_cpu clean all run

sim-aes-hw:
	make -C sw/aes_hwpe clean all run

asic:
	make -C impl/ pnr

clean:
	make -C sw/ clean
	make -C impl/ clean
	make -C tb/ clean

.PHONY: clean sim-aes-sw sim-aes-hw asic
