TEST_CASES := \
	behavioural \
	post-synth-mac_engine

behavioural:
	make -C behavioural cli

post-synth:
	make -C post-synth-mac_engine cli

clean:
	$(foreach dir, $(TEST_CASES), make -C $(dir) clean;)

.PHONY : clean behavioural post-synth
