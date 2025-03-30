# not using standard Makefile template because this makefile creates shared
# objects and weird stuff
CC = clang
WARNINGS = -Wall -Wextra -Werror -Wno-error=unused-parameter -Wmissing-declarations -Wmissing-variable-declarations -Wno-deprecated-declarations -Wno-unused-result
CFLAGS_COMMON = $(WARNINGS) -std=c99 -D_GNU_SOURCE -lm
CFLAGS_RELEASE_NO_LINK = $(WARNINGS) -std=c99 -D_GNU_SOURCE -O3
CFLAGS_RELEASE = $(CFLAGS_COMMON) -O3
CFLAGS_DEBUG = $(CFLAGS_COMMON) -O0 -g -DDEBUG

TESTER_SRC = $(filter-out testers/tester-utils.c, $(wildcard testers/*.c))
TESTERS = $(patsubst %.c, %, $(TESTER_SRC))


all: alloc.so contest-alloc.so mreplace mcontest $(TESTERS:testers/%=testers_exe/%)

alloc.so: alloc.c
	$(CC) $^ $(CFLAGS_DEBUG) -o $@ -shared -fPIC -lm

mreplace: mcontest.c
	$(CC) $^ $(CFLAGS_RELEASE) -o $@ -ldl -lpthread

mcontest: mcontest.c contest.h
	$(CC) $< $(CFLAGS_RELEASE) -o $@ -ldl -lpthread -DCONTEST_MODE


# testers compiled in debug mode to prevent compiler from optimizing away the
# behavior we are trying to test
testers_exe/%: testers/%.c testers_exe/tester-utils.o
	@mkdir -p testers_exe/
	$(CC) $< testers_exe/tester-utils.o $(CFLAGS_DEBUG) -o $@
  

testers_exe/tester-utils.o: testers/tester-utils.c testers/tester-utils.h
	@mkdir -p testers_exe/
	$(CC) -c $< $(CFLAGS_RELEASE_NO_LINK) -o $@
	

.PHONY : clean
clean:
	-rm -rf *.o alloc.so mreplace mcontest testers_exe/
