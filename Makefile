# ========================================================================== #

CC := gcc
CFLAGS := -ggdb -Wall -Werror
LIB_CFLAGS := -fpic
BIN_LDFLAGS := -L. -Wl,-rpath,.
SO_FLAGS := -shared


# -------------------------------------------------------------------------- #

.DEFAULT_GOAL = main
.PHONY: clean


libfoo.o: libfoo.c
	${CC} ${CFLAGS} ${LIB_CFLAGS} -c $< -o $@


libwrap.o: libwrap.c
	${CC} ${CFLAGS} ${LIB_CFLAGS} -c $< -o $@


libfoo.so: libfoo.o libfoo.version
	${CC} ${SO_FLAGS} -Wl,--version-script=libfoo.version $< -o $@


libwrap.so: libwrap.o libwrap.version libfoo.so
	${CC} ${SO_FLAGS} -Wl,--version-script=libwrap.version -L. -lfoo $< -o $@


main: main.c libfoo.so
	${CC} ${CFLAGS} ${BIN_LDFLAGS} -lfoo $< -o $@


main-w: main.c libfoo.so libwrap.so
	${CC} ${CFLAGS} ${BIN_LDFLAGS} -lwrap -lfoo $< -o $@


clean:
	rm -f main main-w libfoo.so libfoo.o libwrap.so libwrap.o



# ========================================================================== #
