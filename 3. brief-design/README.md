# Design Brief Workspace

```
Design Brief Workspace/
├── skill/        ← skill design-brief (SKILL.md + scripts/)
├── brandkit/     ← DÁN BRANDKIT VÀO ĐÂY (đang để trống)
└── .claude/skills/design-brief → ../../skill   (để Claude Code nhận ra skill)
```

## Cách dùng

1. Dán toàn bộ brandkit vào `brandkit/` (giữ nguyên cấu trúc thư mục của brandkit).
2. Mở Claude Code tại thư mục `Design Brief Workspace/`.
3. Gõ yêu cầu thiết kế, ví dụ: "làm poster giới thiệu dịch vụ chatbot cho Facebook". Skill sẽ đọc `brandkit/`, hỏi lại phần còn thiếu, rồi trả design brief.
4. Đổi brandkit: xóa nội dung `brandkit/` và dán brandkit mới vào.

PDF: cần `pdftotext` (`brew install poppler`); nếu chưa có, skill dùng `skill/scripts/pdf_text.swift` (macOS).
