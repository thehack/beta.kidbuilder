require 'fileutils'

# upload with:
# curl -v -F "data=@/path/to/filename"  http://localhost:4567/user/filename
# or just go to http://localhost:4567/user/filename with a browser

get '/:name/file_upload/:filename' do
  erb :file_new
end

post '/:name/upload' do
  userdir = File.join("#{Dir.pwd}/public/groupfiles", params[:name])
  unless params[:file] &&
    (tmpfile = params[:file][:tempfile]) &&
    (name = params[:file][:filename])
    @error = "No file selected"
  end
    FileUtils.mkdir_p(userdir)
#    directory = "public/" + group
    path = File.join(userdir, name)
    File.open(path, "wb") { |f| f.write(tmpfile.read) }
end