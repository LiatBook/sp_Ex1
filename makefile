# CC = gcc
# AR=ar
# CFLAGS = -Wall
# LFLAGS= -shared
# SFLAGS=rcu
# FPIC=-fPIC
# RANLIB=ranlib


# Loop=advancedClassificationLoop
# Rec=advancedClassificationRecursion
# MAIN = main
# HTYPE = NumClass.h
# BASIC = basicClassification


# 1LIB_LOOP = libclassloops.a
# 2LIB_LOOP = libclassloops.so
# 1LIB_REC = libclassres.a
# 2LIB_REC = libclassres.so

# .PHONY: all clean loops recursives recursived loopd

# all:loops loopd recursives recursived mains maindrec maindloop

# loops: $(1LIB_LOOP)
#      $(1LIB_LOOP): $(Loop).o $(BASIC).o
#       $(AR)$(SFLAGS) $@ $^
#       $(RANLIB) $@

# recursives:$(1LIB_REC)
#      $(1LIB_LOOP): $(Rec).o $(BASIC).o
#       $(AR) $(SFLAGS) $@ $^
#      $(RANLIB) $@
 
# recursived: $(2LIB_REC)
#      $(2LIB_REC): $(Rec).o $(BASIC).o
#      $(CC) $(LFLAGS) $(CFLAGS) $^ -o$@

# loopd: $(2LIB_LOOP)
#      $(2LIB_LOOP): $(Loop).o $(BASIC).o
#      $(CC) $(LFLAGS) $(CFLAGS) $^ -o$@

# mains: $(MAIN).o $(1LIB_REC)
#      $(CC) $(CFLAGS) $<./$(1LIB_REC) -o $@

# maindloop: $(MAIN).o $(2LIB_LOOP)
#      $(CC) $(CFLAGS) $< .-$(2LIB_LOOP) -o $@

# maindrec: $(MAIN).O $(2LIB_REC)
#      $(CC) $(CFLAGS) $< .-$(2LIB_REC) -o $@

# clean:
#      rm -f *.o *.a *.so mains maindrec maindloop

CC = gcc
AR = ar

# Flags setup
CFLAGS = -Wall -g
LFLAGS = -shared
SFLAGS = rcs
FP = -fPIC
MATHLIB = -lm

# File names
MAIN = main.c
HEADER = NumClass.h
LIBB = basicClassification.c
LOOP_LIB = advancedClassificationLoop.c
REC_LIB = advancedClassificationRecursion.c
LIBL1 = libclassloops.a
LIBREC1 = libclassrec.a
LIBL2 = libclassloops.so
LIBREC2 = libclassrec.so

# Phony tag for non-targeted commands
.PHONY: all clean loops recursives recursived loopd

# Build everything 
all: mains maindloop maindrec loops recursives recursived loopd

# Marcos to build libraries
loops: $(LIBL1)

recursives: $(LIBREC1)

recursived: $(LIBREC2)

loopd: $(LIBL2)

# Build main programs

# The main program with static libary of recursive implametation
mains: $(MAIN:.c=.o) $(LIBREC1)
	$(CC) $(CFLAGS) $< ./$(LIBREC1) $(MATHLIB) -o $@

# The main program with dynamic libary of loops implametation
maindloop: $(MAIN:.c=.o) $(LIBL2)
	$(CC) $(CFLAGS) $< ./$(LIBL2) $(MATHLIB) -o $@

# The main program with dynamic libary of recursive implametation
maindrec: $(MAIN:.c=.o) $(LIBREC2)
	$(CC) $(CFLAGS) $< ./$(LIBREC2) $(MATHLIB) -o $@

# Compile the main program to an object file
$(MAIN:.c=.o): $(MAIN) $(HEADER)
	$(CC) $(CFLAGS) -c $^

# Building all necessary libraries
$(LIBREC2): $(REC_LIB:.c=.o) $(LIBB:.c=.o)
	$(CC) $(LFLAGS) $(CFLAGS) $^ -o $@

$(LIBL2): $(LOOP_LIB:.c=.o) $(LIBB:.c=.o)
	$(CC) $(LFLAGS) $(CFLAGS) $^ -o $@

$(LIBL1): $(LOOP_LIB:.c=.o) $(LIBB:.c=.o)
	$(AR) $(SFLAGS) $@ $^

$(LIBREC1): $(REC_LIB:.c=.o) $(LIBB:.c=.o)
	$(AR) $(SFLAGS) $@ $^

$(LOOP_LIB:.c=.o): $(LOOP_LIB) $(HEADER)
	$(CC) $(CFLAGS) -c $^ $(FP)

$(REC_LIB:.c=.o): $(REC_LIB) $(HEADER)
	$(CC) $(CFLAGS) -c $^ $(FP)

$(LIBB:.c=.o): $(LIBB) $(HEADER)
	$(CC) $(CFLAGS) -c $^ $(FP)

# Clean command to cleanup all the compiled files (*.o, *.a, *.so, *.gch, mains, maindloop and maindrec)
clean:
	rm -f mains maindloop maindrec *.o *.a *.so *.gch


