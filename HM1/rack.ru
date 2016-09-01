require 'rack'

@name = "Sergey"
run lambda{|env| [200,{},["Hello, #{@name}"]]}
