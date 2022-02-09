# PreventDDL

This extension installs an event trigger much like the one documented in the
Postgres
[event-trigger-example](https://www.postgresql.org/docs/current/event-trigger-example.html)
page.

The main difference is that this extension introduces a GUC to control if
the DDL prevention is enabled or disabled.

Typical usage looks like:

```
# alter system set preventddl.enable to true;
# select pg_reload_conf();
```

## Build

The extension is built like most Postgres extensions:

```
$ make
$ make install
```

When using several Postgres installations on your build machine, it might be
necessary to choose a specific `pg_config` version at build time. Then you
can edit the following snippet with the `pg_config` that you want to use:

```
$ make PG_CONFIG=~/local/bin/pg_config clean install
```

The build dependencies are the usual Postgres extension build dependencies,
which depends on the operating system in use. For debian the following
should do the trick:

```
$ sudo apt-get install postgresql-server-dev-all
```

## Install

Add the `preventddl` library to your
[session_preload_libraries](https://postgresqlco.nf/doc/en/param/session_preload_libraries/)
setting, and reload your Postgres service.
