drop database if exists indexTest;
create database indexTest;
use indexTest;

SET max_heap_table_size = 1024*1024*2000;
CREATE TABLE indexTable (
`id` int(11) NOT NULL auto_increment,
`name` varchar(50) default NULL,
PRIMARY KEY (`id`)
);


delimiter @
create procedure insert_indexTable(in item integer)
begin
declare counter int;
set counter = item;
while counter >= 1 do
insert into indexTable values(counter,concat('Record.',counter));
set counter = counter - 1;
end while;
end
@

delimiter @
call insert_indexTable(1000);
@
