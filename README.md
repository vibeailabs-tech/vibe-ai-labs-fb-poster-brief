# Vibe AI Labs — FB post → poster → design brief

Bộ skill cho agent (Devin, Claude Code và các agent đọc `SKILL.md`) để đi từ một ý tưởng đến bài Facebook, bố cục poster và design brief cho designer, theo đúng thương hiệu **Vibe AI Labs** (Marketing × AI × Creative).

```
fb-writing  →  poster-layout  →  design-brief
 bài viết        bố cục poster      brief thiết kế
     └──────────── post-to-brief (chạy cả chuỗi, dừng duyệt sau mỗi bước) ───┘
```

## Các skill

| Skill | Làm gì | Bản gốc |
|---|---|---|
| `fb-writing` | Viết bài Facebook tiếng Việt (bài nội dung hoặc bài dịch vụ) đúng định vị, giọng văn và quy tắc dữ liệu của thương hiệu. Có script rà lỗi. | `1. fb-writing/` |
| `poster-layout` | Từ một bài viết, phác họa bằng chữ những dòng sẽ nằm trên poster (một khung, dòng lớn nhất được đánh dấu). | `2. poster-layout/.devin/skills/poster-layout/` |
| `design-brief` | Đọc brandkit và viết design brief sẵn sàng cho designer; khi nhận bố cục đã duyệt thì giữ nguyên chữ và chỉ thêm lớp thiết kế, ghép với template của kit. | `3. brief-design/skill/` |
| `post-to-brief` | Điều phối cả ba bước, dừng chờ duyệt sau bài viết và sau bố cục, lưu kết quả vào `outputs/`. | `.devin/skills/post-to-brief/` |

## Cấu trúc thư mục

```
.
├── .devin/skills/
│   ├── fb-writing     → ../../1. fb-writing                              (symlink)
│   ├── poster-layout  → ../../2. poster-layout/.devin/skills/poster-layout (symlink)
│   ├── design-brief   → ../../3. brief-design/skill                       (symlink)
│   └── post-to-brief/                                                     (thư mục thật)
├── 1. fb-writing/          SKILL.md, references/, scripts/check_post.py, evals/
├── 2. poster-layout/       skill poster-layout + evals
├── 3. brief-design/
│   ├── skill/              SKILL.md, scripts/pdf_text.swift
│   └── brandkit/           Design Team Kit (poster) v1.0
├── brandkit → 3. brief-design/brandkit                                    (symlink)
├── outputs/                kết quả mỗi lần chạy: outputs/<ngày>-<tên-ngắn>/
└── AGENTS.md               quy tắc cho agent làm việc trong workspace
```

Sửa skill hoặc brandkit thì sửa ở đường dẫn gốc, không sửa qua symlink.

## Brandkit

`brandkit/` (Vibe AI Labs Design Team Kit v1.0) gồm: logo SVG/PNG, bảng màu và font (Plus Jakarta Sans, Inter — giấy phép OFL), 6 layout poster R1–R6 × 4 tỉ lệ × 2 tông, component, nền, 26 icon, thư viện chữ cho poster, quy cách xuất file và checklist QA. Bắt đầu từ `brandkit/00_START_HERE/README.md`.

Quy tắc chính cho poster: một thông điệp, một CTA, headline ≤ 8 từ, tổng ≤ 30 từ (≤ 40 với poster danh sách/sự kiện) — xem `brandkit/07_Copy_Library/poster-copy-library.md`.

## Cách dùng

1. Clone repo và mở agent tại thư mục gốc (Devin đọc skill trong `.devin/skills/`).
2. Kiểm tra skill đã được nhận: `devin skills list`.
3. Gõ yêu cầu, ví dụ:
   - "viết bài fb giới thiệu dịch vụ chatbot" → `fb-writing`
   - "bài này lên bố cục poster" → `poster-layout`
   - "viết design brief cho poster Facebook vuông từ bố cục này" → `design-brief`
   - "viết bài rồi làm poster và brief luôn" → `post-to-brief`

## Lệnh hữu ích

```bash
# Rà bài Facebook
python3 ".devin/skills/fb-writing/scripts/check_post.py" <file> --type content|service

# Đọc PDF trong brandkit khi không có pdftotext (macOS)
swift ".devin/skills/design-brief/scripts/pdf_text.swift" <file.pdf>
```

## Liên hệ

Vibe AI Labs · vibeailabs@gmail.com · https://www.facebook.com/vibe.ai.labs/
