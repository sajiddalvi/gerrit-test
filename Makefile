# This is a basic Makefile for compiling a C program.
CC = gcc
CFLAGS = -Wall -g
TARGET = main
SOURCE_DIR = src
BUILD_DIR = out
SOURCES = $(wildcard $(SOURCE_DIR)/*.c)
OBJECTS = $(SOURCES:.c=.o)

OBJECT_DIR = $(BUILD_DIR)/$(SOURCE_DIR)/objects
SOURCES = $(wildcard $(SOURCE_DIR)/*.c)
OBJECTS = $(addprefix $(OBJECT_DIR)/, $(notdir $(SOURCES:.c=.o)))

# Default rule:  Compiles the program.
$(TARGET): $(OBJECTS) | $(BUILD_DIR) # Add dependency on BUILD_DIR
	$(CC) $(CFLAGS) -o $(BUILD_DIR)/$(TARGET) $(OBJECTS)

# Rule to compile object files (.o) from source files (.c)
$(OBJECT_DIR)/%.o: $(SOURCE_DIR)/%.c | $(OBJECT_DIR) # Add dependency on OBJECT_DIR
	$(CC) $(CFLAGS) -c -o $@ $<

# Create the output directories as needed
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(OBJECT_DIR):
	mkdir -p $(OBJECT_DIR)

# Clean rule:  Removes the output directory and its contents.
clean:
	rm -rf $(BUILD_DIR)

# Phony targets:  These are not actual files.  They're just labels for commands.
.PHONY: clean
