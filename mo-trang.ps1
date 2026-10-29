# Máy chủ cục bộ để mở trang: http://localhost:8765/tri-an-chi-tra/phim.html
# Chạy bằng cách bấm đúp file MO-PHIM.bat (hoặc: powershell -ExecutionPolicy Bypass -File mo-trang.ps1)
$root = $PSScriptRoot
$port = 8765
$l = New-Object System.Net.HttpListener
$l.Prefixes.Add("http://localhost:$port/")
$l.Start()
Write-Host "Dang chay tai http://localhost:$port/tri-an-chi-tra/phim.html  (dong cua so nay de tat)"
$types = @{ '.html'='text/html; charset=utf-8'; '.js'='text/javascript'; '.css'='text/css'; '.jpg'='image/jpeg'; '.jpeg'='image/jpeg'; '.png'='image/png'; '.webp'='image/webp'; '.mp4'='video/mp4'; '.webm'='video/webm'; '.mp3'='audio/mpeg'; '.m4a'='audio/mp4' }
while ($l.IsListening) {
  $c = $l.GetContext()
  try {
    $p = [Uri]::UnescapeDataString($c.Request.Url.AbsolutePath.TrimStart('/'))
    if ($p -eq '' -or $p.EndsWith('/')) { $p = $p + 'index.html' }
    $f = Join-Path $root $p
    if (Test-Path $f -PathType Leaf) {
      $ext = [IO.Path]::GetExtension($f).ToLower()
      if ($types[$ext]) { $c.Response.ContentType = $types[$ext] }
      $fs = [IO.File]::OpenRead($f)
      $len = $fs.Length
      $range = $c.Request.Headers['Range']
      # hỗ trợ Range để video tua / phát mượt
      if ($range -and $range -match 'bytes=(\d*)-(\d*)') {
        $start = if ($matches[1]) { [int64]$matches[1] } else { 0 }
        $end = if ($matches[2]) { [int64]$matches[2] } else { $len - 1 }
        $c.Response.StatusCode = 206
        $c.Response.AddHeader('Content-Range', "bytes $start-$end/$len")
        $c.Response.AddHeader('Accept-Ranges', 'bytes')
        $count = $end - $start + 1
        $c.Response.ContentLength64 = $count
        $fs.Seek($start, 'Begin') | Out-Null
        $buf = New-Object byte[] 65536
        while ($count -gt 0) {
          $n = $fs.Read($buf, 0, [Math]::Min($buf.Length, $count))
          if ($n -le 0) { break }
          $c.Response.OutputStream.Write($buf, 0, $n); $count -= $n
        }
      } else {
        $c.Response.AddHeader('Accept-Ranges', 'bytes')
        $c.Response.ContentLength64 = $len
        $fs.CopyTo($c.Response.OutputStream)
      }
      $fs.Close()
    } else { $c.Response.StatusCode = 404 }
  } catch {} finally { try { $c.Response.Close() } catch {} }
}
