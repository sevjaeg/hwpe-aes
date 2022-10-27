TEST_CASES := \
	behavioural \
	post-synth-mac_engine

clean:
	$(foreach dir, $(TEST_CASES), make -C $(dir) clean;)

.PHONY : clean
