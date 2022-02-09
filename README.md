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
