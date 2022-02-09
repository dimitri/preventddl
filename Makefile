MODULE_big = preventddl

EXTENSION= preventddl
SRC_SQL	= preventddl--0.1.sql
DATA	= $(addprefix scripts/, $(SRC_SQL))
REGRESS = preventddl

objdir	= src

DOCS	= README.preventddl
OBJS_C	= preventddl.o
OBJS	= $(addprefix src/, $(OBJS_C))

PG_CONFIG ?= pg_config
PGXS = $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)

$(OBJS): $(addprefix $(srcdir)/src/, $(INCS))

preventddl.sql.in: $(srcdir)/scripts/preventddl--0.1.sql
	cp $< >$@
