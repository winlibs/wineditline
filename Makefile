# MAKEFILE for linux GCC
#
# Cross-compile via something like: make CROSS_COMPILE=x86_64-w64-mingw32-

ifeq ($V,1)
silent=
silent_stdout=
else
silent=@
silent_stdout= > /dev/null
endif

LIBNAME=libwineditline.a

CFLAGS=-I./src/ -I./src/mingw_extra

CROSS_COMPILE=

ifeq ($(CC),cc)
  CC := $(CROSS_COMPILE)gcc
endif
LD:=$(CROSS_COMPILE)ld
AR:=$(CROSS_COMPILE)ar
RANLIB:=$(CROSS_COMPILE)ranlib
ARFLAGS:=r

default: $(LIBNAME)

%.o:%.c $(HEADERS)
ifneq ($V,1)
	@echo "   * $(CC) $@"
endif
	$(silent) $(CC) $(CFLAGS) -c $< -o $@

TSOURCES = $(wildcard src/*_test*.c)
SOURCES = $(filter-out $(TSOURCES),$(wildcard src/*.c))
HEADERS = $(wildcard src/*.h)

OBJECTS = $(SOURCES:.c=.o)

$(LIBNAME): $(OBJECTS)
ifneq ($V,1)
	@echo "   * ${AR} $@"
endif
	${silent} $(AR) $(ARFLAGS) $@ $(OBJECTS)
ifneq ($V,1)
	@echo "   * ${RANLIB} $@"
endif
	${silent} $(RANLIB) $@

TOBJECTS = $(TSOURCES:.c=.o)
TEXES = $(TOBJECTS:.o=.exe)

%.exe:%.o $(LIBNAME) $(TOBJECTS)
	$(CC) -L. $< -lwineditline -o $@

test: $(TEXES)

clean:
	find . -type f    -name "*.o"   \
               -o -name "*.lo"  \
               -o -name "*.a"   \
               -o -name "*.la"  \
               -o -name "*.obj" \
               -o -name "*.lib" \
               -o -name "*.exe" \
               -o -name "*.dll" \
               -o -name "*.so"  \
               -o -name "*.gcov"\
               -o -name "*.gcda"\
               -o -name "*.gcno"\
               -o -name "*.il"  \
               -o -name "*.dyn" \
               -o -name "*.dpi"  | xargs rm -f
	find . -type d -name "*.libs" | xargs rm -rf
	rm -f $(APPS)
