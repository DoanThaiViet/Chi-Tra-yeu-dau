# Gửi Chị Trà · Đêm Gala PETROVIETNAM-NEXT 2025

Phim tự chạy (khoảng 2,5 phút) do lớp **Lãnh đạo tương lai Petrovietnam 2025 (PETROVIETNAM-NEXT 2025)** làm tặng chị Lê Thị Lam Trà.

## Mở phim

- **Cách dễ nhất (USB, không cần mạng, không cần cài gì):** chép cả thư mục vào USB, sang máy khác bấm đúp `MO-PHIM.html`. Trang mở bằng Chrome hoặc Edge; font, ảnh, video và nhạc đều nằm sẵn trong thư mục. Nếu máy mở bằng trình duyệt khác, chuột phải `MO-PHIM.html` → *Open with* → Chrome hoặc Edge.
- **Trên máy có PowerShell:** bấm đúp `MO-PHIM.bat` (chạy qua máy chủ cục bộ cổng 8765).
- **Trên GitHub Pages:** bật Pages cho repo (nhánh `main`, thư mục gốc). Trang chủ tự chuyển vào `tri-an-chi-tra/phim.html`. Bản trên GitHub không có nhạc nền (file nhạc có bản quyền, chỉ để trên máy).

Bấm nút phát hoặc nhấn một phím bất kỳ để bắt đầu.

| Phím | Tác dụng |
|---|---|
| `→` / `PageDown` | Cảnh tiếp |
| `←` / `PageUp` | Cảnh trước |
| `Space` | Tạm dừng / chạy tiếp |
| `F` | Toàn màn hình |
| `M` | Bật / tắt nhạc |
| `Home` | Chạy lại từ đầu |

Thêm `?quay=1` vào cuối địa chỉ để quay màn hình thành video (ẩn mọi chữ hướng dẫn).

## Cấu trúc

```
MO-PHIM.bat          mở phim trên máy
mo-trang.ps1         máy chủ cục bộ (cổng 8765)
index.html           chuyển hướng vào phim (cho GitHub Pages)
MO-PHIM.html         bấm đúp để mở phim từ USB / ổ đĩa
tri-an-chi-tra/
  fonts/             font chữ tải sẵn (có tiếng Việt), chạy không cần mạng
  phim.html          toàn bộ phim, chỉnh nội dung trong khối CONFIG cuối file
  anh/               ảnh đã thu nhỏ (cạnh dài 2400 px)
  video/             video nền hoa nở (CC0) và đoạn video chị phát biểu (MP4)
  nhac/              nhạc nền (chỉ trên máy, không đưa lên GitHub)
```

## Chỉnh nội dung

Mở `tri-an-chi-tra/phim.html`, tìm `const CONFIG` ở cuối file:

- `bgVideo`, `memoryVideo`: video nền và chuỗi video giữa phim
- `photos`, `timeline`, `album`: ảnh và chữ của từng cảnh
- `notes`: lời nhắn của học viên (`who: ''` nếu không ghi tên)
- `music`: nhạc nền, ví dụ `'nhac/nen.mp3'` (tạo thư mục `tri-an-chi-tra/nhac/`)
