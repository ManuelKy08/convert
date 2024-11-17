require 'sinatra'
require 'fileutils'

DOWNLOAD_FOLDER = "./downloads"
FileUtils.mkdir_p(DOWNLOAD_FOLDER) unless Dir.exist?(DOWNLOAD_FOLDER)

get '/' do
  erb :index
end

post '/download' do
  url = params[:url]
  format = params[:format]

  if url.nil? || url.strip.empty?
    return "<p style='color:red;'>Masukkan URL YouTube yang valid!</p>"
  end

  output_path = "#{DOWNLOAD_FOLDER}/%(title)s.#{format}"
  command = if format == "mp3"
              "yt-dlp -x --audio-format mp3 -o '#{output_path}' #{url}"
            else
              "yt-dlp -f 'bestvideo+bestaudio' --merge-output-format mp4 -o '#{output_path}' #{url}"
            end

  puts "Menjalankan perintah: #{command}"
  success = system(command)

  if success
    "<p style='color:green;'>File berhasil diunduh! Cek folder: <b>#{DOWNLOAD_FOLDER}</b></p>"
  else
    "<p style='color:red;'>Terjadi kesalahan saat mengunduh file. Cek log di terminal.</p>"
  end
end

__END__

@@ index
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>YT Unduh</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: linear-gradient(135deg, #ff416c, #ff4b2b);
      color: white;
      margin: 0;
      padding: 0;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    h1 {
      font-size: 3rem;
      margin-bottom: 1rem;
    }

    form {
      background: white;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
      text-align: center;
    }

    label {
      display: block;
      margin-bottom: 0.5rem;
      color: #333;
    }

    input[type="text"], select {
      width: 100%;
      padding: 10px;
      margin-bottom: 1rem;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    button {
      background: #ff4b2b;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 1rem;
      transition: background 0.3s ease;
    }

    button:hover {
      background: #ff6e50;
    }
  </style>
</head>
<body>
  <h1>Convert Downloads Mp3/Mp4</h1>
  <form action="/download" method="POST">
    <label for="url">Masukkan link Youtube Mu!:</label>
    <input type="text" name="url" id="url" required placeholder="https://www.youtube.com/...">

    <label for="format">Pilih Format:</label>
    <select name="format" id="format">
      <option value="mp3">MP3</option>
      <option value="mp4">MP4</option>
    </select>

    <button type="submit">Download</button>
  </form>
</body>
</html>
