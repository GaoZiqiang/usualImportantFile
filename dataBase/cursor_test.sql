use test;

delimiter @
create procedure test_cursor(in param int(10),out result varchar(90))
begin
    declare name varchar(20);
    declare pass varchar(20);
    declare done int;
    declare cur_test CURSOR for select user_name,user_pass from users;
    declare continute handler FOR SQLSTATE '02000' SET done  = 1;

    if param then
        select concat_ws(',',user_name,user_pass) into result from test.users where id=param;
    else
        open cur_test;
        repeat
            fetch cur_test into name,pass;
            select concat_ws(',',result,name,pass) into result;
        until done end repeat;
        close cur_test;
    end if;
end;
@
