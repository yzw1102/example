--1、获取全局共享变量
local shared_data = ngx.shared.shared_data
--2、获取字典值
--shared_data.delete(shared_data,"i")
local i = shared_data:get("i")
if not i then
    i = 1
    -- 3、惰性赋值
    shared_data.set(shared_data,"i",i)
    ngx.say("lazy set : ", i , "<br/>")
end

--4 递增
i = shared_data:incr("i",1)
ngx.say("i=",i,"<br/>")
ngx.say("get i : ", shared_data:get("i"))
