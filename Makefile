AMP = @

GCC = ${AMP}gcc
INCLUDE_FLAG = -Iinclude
LINK_FLAG = -lexample

RM = ${AMP}rm -f

COLORLOG_NAMES = 
COLORLOG_NAMES += colorlog_common

COLORLOG_OBJ_NAMES = ${addsuffix .o, ${COLORLOG_NAMES}}
COLORLOG_OBJS = ${addprefix build/, ${COLORLOG_OBJ_NAMES}}

MAIN_SRC = src/main.c
MAIN_OBJ = build/main.o

BIN = build/colorlog

default: ${BIN}

debug:
	${eval AMP := }

${MAIN_OBJ}: ${MAIN_SRC}
	${GCC} -c $< -o $@ ${INCLUDE_FLAG}

${COLORLOG_OBJS}: build/%.o: src/%.c include/%.h
	${GCC} -c $< -o $@ ${INCLUDE_FLAG}

${BIN}: ${MAIN_OBJ} ${COLORLOG_OBJS}
	${GCC} $^ -o $@

redo: clean default

run: ${BIN}
	@${BIN}

move:
	sudo cp ${BIN} /usr/bin

clean:
	${RM} ${BIN}
	${RM} ${MAIN_OBJ}
	${RM} ${COLORLOG_OBJS}


