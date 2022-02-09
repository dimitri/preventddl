/*-------------------------------------------------------------------------
 *
 * preventddl.c
 *	  Register our GUC properly so that it's listed in pg_settings etc.
 *
 * Copyright (c) Citus Data, Inc.
 *-------------------------------------------------------------------------
 */

#include "postgres.h"
#include "utils/guc.h"

PG_MODULE_MAGIC;

#define GUC_STANDARD 0

bool EnablePreventDDL = false;

void _PG_init(void);

void
_PG_init(void)
{
	DefineCustomBoolVariable(
		"preventddl.enable",
		gettext_noop("Enable DDL prevention."),
		gettext_noop("When enabled, DDL commands are prevented and raise "
					 "an exception instead of doing what they are expected to."),
		&EnablePreventDDL,
		false,
		PGC_USERSET,
		GUC_STANDARD,
		NULL, NULL, NULL);
}
