# Compiler and flags
CXX := g++
CXXFLAGS := -std=c++11 -Wall

# Directories
SRC_DIR := src
BUILD_DIR := build
BIN_DIR := bin

# Source and target
SRC := $(wildcard $(SRC_DIR)/*.cpp)
OBJ := $(patsubst $(SRC_DIR)/%.cpp,$(BUILD_DIR)/%.o,$(SRC))
TARGET := $(BIN_DIR)/my_program

# Default target
all: $(TARGET)

# Create directories if they don't exist
$(BUILD_DIR):
	@mkdir -p $(BUILD_DIR)

$(BIN_DIR):
	@mkdir -p $(BIN_DIR)

# Compile the source files into object files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Link the object files to create the final executable
$(TARGET): $(OBJ) | $(BIN_DIR)
	$(CXX) $(CXXFLAGS) $(OBJ) -o $(TARGET)

# Clean build files
clean:
	@rm -rf $(BUILD_DIR) $(BIN_DIR)

# .PHONY rule to prevent conflicts with filenames
.PHONY: all clean

# Disable built-in rules
.SUFFIXES:
