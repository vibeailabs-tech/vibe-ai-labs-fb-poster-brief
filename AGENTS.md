# Vibe AI Labs — workspace skill

Chuỗi nội dung: `fb-writing` (bài Facebook) → `poster-layout` (bố cục poster) → `design-brief` (brief thiết kế). Skill `post-to-brief` chạy cả chuỗi, có bước duyệt sau bài viết và sau bố cục.

## Vị trí file

- `.devin/skills/fb-writing`, `poster-layout`, `design-brief` là **symlink** tới bản gốc:
  - `1. fb-writing/`
  - `2. poster-layout/.devin/skills/poster-layout/`
  - `3. brief-design/skill/`
- `.devin/skills/post-to-brief/` là thư mục thật.
- `brandkit` ở gốc là symlink tới `3. brief-design/brandkit/`.
- Công cụ sửa file không ghi qua symlink: khi sửa skill hoặc brandkit, dùng đường dẫn gốc ở trên. Tìm kiếm đệ quy từ gốc cũng bỏ qua symlink, nên hãy tìm thẳng trong `brandkit/`.
- Kết quả mỗi lần chạy chuỗi nằm trong `outputs/<ngày>-<tên-ngắn>/`.

## Quy tắc chung

- `poster-layout` chỉ trả một bản phác họa bằng chữ (một khung chứa đúng các dòng chữ của poster, dòng lớn nhất được đánh dấu). Nó không đọc brandkit, không đếm từ, không chia vùng hay giải thích.
- Giới hạn chữ trên poster lấy theo `brandkit/07_Copy_Library/poster-copy-library.md` (tiêu đề ≤ 8 từ, tổng ≤ 30 từ, ≤ 40 từ với danh sách/sự kiện). `design-brief` là bước kiểm tra các mức này.
- Workspace chỉ giữ bản mới nhất của mỗi skill. Các bản snapshot cũ và thư mục `*-workspace` đã bị xoá ngày 2026-11-11; không có git nên không khôi phục được.

## Lệnh kiểm tra

- Liệt kê skill Devin nhận được: `devin skills list`
- Rà bài Facebook: `python3 ".devin/skills/fb-writing/scripts/check_post.py" <file> --type content|service`
- Đọc PDF trong brandkit khi không có `pdftotext`: `swift ".devin/skills/design-brief/scripts/pdf_text.swift" <file.pdf>`
