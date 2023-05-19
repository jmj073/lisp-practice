MAKEFLAGS += -rR

BUILD_DIR := build
SOURCE := $(firstword $(filter %.ss %.scm,$(shell ls -c)))
TARGET := $(BUILD_DIR)/$(basename $(SOURCE)).out

CC := csc -O5# chicken scheme

test: FORCE $(TARGET)
	@$(TARGET)

$(TARGET): $(SOURCE) | $(BUILD_DIR)
	@$(CC) -o $@ $^

clean: FORCE
	rm -r $(BUILD_DIR)

$(BUILD_DIR):
	mkdir $@

FORCE:

.PHONY: FORCE