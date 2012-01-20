require 'fileutils'

# upload with:
# curl -v -F "data=@/path/to/filename"  http://localhost:4567/user/filename
# or just go to http://localhost:4567/user/filename with a browser

get '/file_upload/:filename' do
  if admin?
    erb :file_new
  else
    response.set_cookie("error", :value => "You have to be a logged-in administrator to do that.", :expires => (Time.new.gmtime + 3), :path => '/')
    redirect "/"
  end
end

post '/upload' do
  userdir = File.join("#{Dir.pwd}/public/groupfiles", @group)
  unless params[:file] &&
    (tmpfile = params[:file][:tempfile]) &&
    (name = params[:file][:filename])
    @error = "No file selected"
  end
    FileUtils.mkdir_p(userdir)
    path = File.join(userdir, name)
    File.open(path, "wb") { |f| f.write(tmpfile.read) }
end