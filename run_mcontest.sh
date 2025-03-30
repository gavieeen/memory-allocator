#!/bin/bash
# Wrapper script to run mcontest with proper library loading for memory tracking

# Set environment variables to ensure proper loading of the custom allocator
export DYLD_FORCE_FLAT_NAMESPACE=1
export DYLD_INSERT_LIBRARIES="$PWD/alloc.so"

# Run mcontest with the provided arguments
./mcontest "$@"
