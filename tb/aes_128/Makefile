TEST_CASES := \
	sim-behavioural \
	sim-post-synth \
	sim-post-layout

clean:
	$(foreach dir, $(TEST_CASES), make -C $(dir) clean;)

.PHONY : clean
