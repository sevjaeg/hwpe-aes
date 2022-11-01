TEST_CASES := \
	behavioural \
	post-synth \
	post-synth-mac_top_wrap \
	post-layout \
	post-layout-power

behavioural:
	make -C behavioural cli

post-synth:
	make -C post-synth cli

post-layout:
	make -C post-layout cli

power:
	make -C post-layout-power cli

clean:
	$(foreach dir, $(TEST_CASES), make -C $(dir) clean;)

.PHONY : clean behavioural post-synth post-layout power
