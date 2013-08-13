EMACS ?= emacs
CASK ?= cask

all: test

test: clean-elc unit ecukes

unit:
	${CASK} exec ert-runner run -l test/commander-init.el test/ert-loader.el

ecukes:
	${CASK} exec ecukes --script features --dbg

compile:
	${CASK} exec ${EMACS} -Q -batch -f batch-byte-compile commander.el

clean-elc:
	rm -f commander.elc

.PHONY:	all test unit compile clean-elc ecukes
