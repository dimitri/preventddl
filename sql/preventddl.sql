create extension preventddl;

-- ensure the GUC definition is loaded
load 'preventddl';

show preventddl.enable;

select name, setting, vartype, context
  from pg_settings
 where name = 'preventddl.enable';

set preventddl.enable to true;

-- should fail
create table foo(f1 int, f2 text);

set preventddl.enable to false;

-- should work now
create table foo(f1 int, f2 text);
