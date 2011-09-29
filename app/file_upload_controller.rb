require 'fileutils'

# upload with:
# curl -v -F "data=@/path/to/filename"  http://localhost:4567/user/filename
# or just go to http://localhost:4567/user/filename with a browser

get '/file_upload/:filename' do
  erb :file_new
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