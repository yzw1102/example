local function close_redis(red)
    if not red then
        return
    end
    
    local ok,err = red:close()
    if not ok then
        ngx.say("close redis error: " , err)
    end
end

local redis = require("resty.redis")

-- 创建实例
local red = redis:new()
-- 设置超时
red:set_timeout(1000)
--建立连接
local ip  = "127.0.0.1"
local port = 6379
local ok,err = red:connect(ip,port)
if not ok then
    ngx.say("connect to redis err : " , err)
    return close_redis(red)
end

--调用api进行处理
ok,err = red:set("msg","hello world")
if not ok then
    ngx.say("set msg error : ", err)
    return close_redis(red)
end

--调用api获取数据
local resp,err = red:get("msg")
if not resp then
    ngx.say("get msg error : ", err)
    return close(red)
end

--得到数据为空时处理

if resp == ngx.null then
    resp = 'default'
end
ngx.say("msg : ",resp)

close_redis(red)
