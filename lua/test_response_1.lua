-- test_response_1

--写响应头
ngx.header.a = "1"
--多个响应头可以使用table
ngx.header.b = {2,3}
--输出相应
ngx.say("a","b","</br>")
ngx.print("c","d","<br/>")
--200 状态吗退出
return ngx.exit(200)
