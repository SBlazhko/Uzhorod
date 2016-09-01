require 'sinatra'

get "/" do
     "
     <h1>Hello, Sinatra!</h1>
  <form action='/', method='get'>
  <button type=submit>GET</button>
  </form>
  <form action='/', method='post'>
  <button type=submit>POST</button>
  </form>
  <form action='/', method='post'>
  <input name='_method', type='hidden', value='put'>
  <button type=submit>PUT</button>
  </form>
  <form action='/', method='post'>
  <input name='_method', type='hidden', value='delete'>
  <button type=submit>DELETE</button>
  </form>
     "
end

post '/' do
  redirect to '/'
end

put '/' do
    redirect to '/'
end

delete '/' do
  redirect to '/'
end





