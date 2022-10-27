TEST_CASES := \
	aes_128 \
	aes_engine \
	stack_unstack

clean:
	$(foreach dir, $(TEST_CASES), make -C $(dir) clean;)

.PHONY : clean
