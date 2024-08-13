ROOT_PATH := $(CURDIR)
BUILD_DIR := build
DOWNLOADS_DIR := downloads

# Targets
all: rnnoise

# Make rnnoise
rnnoise: mkdir
	@echo "Building rnnoise"
	cmake -B build && cd build && make -j$(nproc)

rnnoise-examples: rnnoise
	@echo "Building rnnoise examples"
	cmake -B build -DRNNOISE_COMPILE_DEMO=ON && cd build && make -j$(nproc)

# Make build directory
mkdir:
	@echo Mkdir ${BUILD_DIR}
	@install -d ${BUILD_DIR}

# Clean
clean: 
	@echo "Cleaning"
	@rm -rf ${BUILD_DIR}
	@rm -rf ${DOWNLOADS_DIR}

