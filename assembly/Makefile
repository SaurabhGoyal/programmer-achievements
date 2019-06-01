# Usage:
# make        # compile and build all binary
# make clean  # remove ALL binaries and objects

# Makefile inspired by tutorial given at https://opensource.com/article/18/8/what-how-makefile

COMPILER=nasm
COMPILER_FLAGS=-f macho64
LINKER=ld
LINKER_FLAGS=-e _main -macosx_version_min 10.8 -lSystem
SOURCE_DIRECTORY=src
BINARY_DIRECTORY=bin

SRCS := $(wildcard ${SOURCE_DIRECTORY}/*.asm)
BINS := $(SRCS:${SOURCE_DIRECTORY}/%.asm=${BINARY_DIRECTORY}/%)

.PHONY = all

all: ${BINS}

${BINARY_DIRECTORY}/%: ${BINARY_DIRECTORY}/%.o | ${BINARY_DIRECTORY}
	@echo '$< -> $@'
	@${LINKER} ${LINKER_FLAGS} $< -o $@

${BINARY_DIRECTORY}/%.o: ${SOURCE_DIRECTORY}/%.asm | ${BINARY_DIRECTORY}
	@echo '$< -> $@'
	@${COMPILER} ${COMPILER_FLAGS} $< -o $@

${BINARY_DIRECTORY}:
	mkdir -p $@

clean:
	@echo "Cleaning up..."
	rm -f ${BINARY_DIRECTORY}/*
	@echo "Done."

