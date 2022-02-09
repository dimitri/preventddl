-- preventddl extension

-- complain if script is sourced in psql, rather than via create extension
\echo use "create extension preventddl" to load this file. \quit

create schema if not exists preventddl;

create or replace function preventddl.no_ddl()
 returns event_trigger
 language plpgsql as
$$
declare
  noddl bool := current_setting('preventddl.enable');
begin
  if noddl
  then
   raise exception 'prevent ddl is enabled, command not allowed';
  end if;
end;
$$;

create event trigger preventddl
                  on ddl_command_start
        when tag in ('alter aggregate',
                     'alter collation',
                     'alter conversion',
                     'alter domain',
                     'alter default privileges',
                     'alter extension',
                     'alter foreign data wrapper',
                     'alter foreign table',
                     'alter function',
                     'alter language',
                     'alter large object',
                     'alter materialized view',
                     'alter operator',
                     'alter operator class',
                     'alter operator family',
                     'alter policy',
                     'alter procedure',
                     'alter publication',
                     'alter schema',
                     'alter sequence',
                     'alter server',
                     'alter statistics',
                     'alter subscription',
                     'alter table',
                     'alter text search configuration',
                     'alter text search dictionary',
                     'alter text search parser',
                     'alter text search template',
                     'alter trigger',
                     'alter type',
                     'alter user mapping',
                     'alter view',
                     'comment',
                     'create access method',
                     'create aggregate',
                     'create cast',
                     'create collation',
                     'create conversion',
                     'create domain',
                     'create extension',
                     'create foreign data wrapper',
                     'create foreign table',
                     'create function',
                     'create index',
                     'create language',
                     'create materialized view',
                     'create operator',
                     'create operator class',
                     'create operator family',
                     'create policy',
                     'create procedure',
                     'create publication',
                     'create rule',
                     'create schema',
                     'create sequence',
                     'create server',
                     'create statistics',
                     'create subscription',
                     'create table',
                     'create table as',
                     'create text search configuration',
                     'create text search dictionary',
                     'create text search parser',
                     'create text search template',
                     'create trigger',
                     'create type',
                     'create user mapping',
                     'create view',
                     'drop access method',
                     'drop aggregate',
                     'drop cast',
                     'drop collation',
                     'drop conversion',
                     'drop domain',
                     'drop extension',
                     'drop foreign data wrapper',
                     'drop foreign table',
                     'drop function',
                     'drop index',
                     'drop language',
                     'drop materialized view',
                     'drop operator',
                     'drop operator class',
                     'drop operator family',
                     'drop owned',
                     'drop policy',
                     'drop procedure',
                     'drop publication',
                     'drop rule',
                     'drop schema',
                     'drop sequence',
                     'drop server',
                     'drop statistics',
                     'drop subscription',
                     'drop table',
                     'drop text search configuration',
                     'drop text search dictionary',
                     'drop text search parser',
                     'drop text search template',
                     'drop trigger',
                     'drop type',
                     'drop user mapping',
                     'drop view')
    execute function preventddl.no_ddl();
