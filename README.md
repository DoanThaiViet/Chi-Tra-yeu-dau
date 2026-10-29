# Gửi Chị Trà · Đêm Gala PV-NEXT 2025

Phim tự chạy (khoảng 2,5 phút) do lớp **Lãnh đạo tương lai Petrovietnam 2025 (PV-NEXT 2025)** làm tặng chị Lê Thị Lam Trà.

## Mở phim

- **Trên máy:** bấm đúp `MO-PHIM.bat`. Một cửa sổ máy chủ nhỏ sẽ mở (cứ để đó) và trình duyệt tự mở phim. Đóng cửa sổ máy chủ để tắt.
- **Trên GitHub Pages:** bật Pages cho repo (nhánh `main`, thư mục gốc). Trang chủ tự chuyển vào `tri-an-chi-tra/phim.html`.

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
index.html           chuyển hướng vào phim
tri-an-chi-tra/
  phim.html          toàn bộ phim, chỉnh nội dung trong khối CONFIG cuối file
  anh/               ảnh đã thu nhỏ (cạnh dài 2400 px)
  video/             video nền hoa nở (CC0) và 3 đoạn video của chị (WebM)
```

## Chỉnh nội dung

Mở `tri-an-chi-tra/phim.html`, tìm `const CONFIG` ở cuối file:

- `bgVideo`, `memoryVideo`: video nền và chuỗi video giữa phim
- `photos`, `timeline`, `album`: ảnh và chữ của từng cảnh
- `notes`: lời nhắn của học viên (`who: ''` nếu không ghi tên)
- `music`: nhạc nền, ví dụ `'nhac/nen.mp3'` (tạo thư mục `tri-an-chi-tra/nhac/`)
