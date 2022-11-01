TEST_CASES := \
	sim-behavioural \
	sim-post-synth \
	sim-post-layout \
	vivado

clean:
	$(foreach dir, $(TEST_CASES), make -C $(dir) clean;)

.PHONY : clean
