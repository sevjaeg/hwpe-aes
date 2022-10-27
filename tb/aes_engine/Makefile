TEST_CASES := \
	behavioural \
	post-synth \
	post-synth-mac_top_wrap \
	post-layout \
	post-layout-power

clean:
	$(foreach dir, $(TEST_CASES), make -C $(dir) clean;)

.PHONY : clean
