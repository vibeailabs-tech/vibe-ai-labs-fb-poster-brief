---
name: post-to-brief
description: Chạy trọn chuỗi nội dung của Vibe AI Labs theo ba bước có duyệt - viết bài Facebook (fb-writing), lên bố cục poster từ bài đã duyệt (poster-layout), rồi viết design brief từ bố cục đã duyệt (design-brief). Sau mỗi bước dừng lại chờ người dùng duyệt, sửa hoặc dừng. Dùng skill này khi người dùng muốn đi từ ý tưởng hoặc bài viết đến brief thiết kế trong một lần - ví dụ "viết bài rồi làm poster luôn", "làm trọn bộ bài + poster", "bài này làm tiếp bố cục và brief", "chạy chuỗi", "từ bài viết đến design brief", "content kèm poster" - kể cả khi họ đã có sẵn bài hoặc bố cục và chỉ muốn làm tiếp các bước sau. Nếu người dùng chỉ cần đúng một việc (chỉ viết bài, chỉ lên bố cục, chỉ viết brief) thì dùng skill riêng của việc đó.
argument-hint: "<chủ đề, bài viết có sẵn, hoặc đường dẫn file>"
---

# Từ bài viết đến design brief

Skill này không tự viết bài, chia bố cục hay viết brief. Nó điều phối ba skill đã có, theo đúng thứ tự, và giữ cho mỗi bước làm việc trên đúng bản mà người dùng đã duyệt ở bước trước.

```
1. fb-writing    → bài viết       → người dùng duyệt
2. poster-layout → bố cục poster  → người dùng duyệt
3. design-brief  → design brief
```

Lý do có bước duyệt: mỗi bước chắt lọc bước trước. Bài chưa ổn mà đã lên bố cục thì bố cục sai theo; bố cục chưa ổn mà đã viết brief thì designer dựng nhầm. Vì vậy không tự đi tiếp khi chưa có câu trả lời rõ ràng của người dùng, kể cả khi bản nháp trông đã tốt.

## Trước khi bắt đầu

1. **Xác định điểm vào.** Người dùng đưa chủ đề hoặc yêu cầu viết thì bắt đầu từ bước 1. Họ đưa bài đã viết xong (dán vào hoặc đưa file) thì coi bài đó là bản đã duyệt và bắt đầu từ bước 2. Họ đưa bố cục đã có thì bắt đầu từ bước 3. Không rõ thì hỏi một câu.
2. **Kiểm tra brandkit.** Bước 2 và bước 3 cần thư mục `brandkit/` trong thư mục làm việc. Không thấy thì báo ngay từ đầu, đừng để đến bước 3 mới vướng.
3. **Tạo thư mục cho lần chạy:** `outputs/<YYYY-MM-DD>-<tên-ngắn-không-dấu>/`. Nếu thư mục của chủ đề này đã có từ phiên trước, đọc các file trong đó và làm tiếp từ bước còn thiếu thay vì làm lại.

Các file trong thư mục đó:

| File | Nội dung | Ghi khi nào |
|---|---|---|
| `1-bai-viet.md` | Đúng phần bài sẽ đăng, không kèm tiêu đề "BÀI VIẾT FACEBOOK" hay ghi chú | Sau khi bài được duyệt |
| `ghi-chu.md` | Ghi chú đi kèm bài (thông tin do người dùng cung cấp, số liệu chưa xác minh, giả định) | Cùng lúc với bài, nếu có ghi chú |
| `2-bo-cuc.md` | Bản bố cục đầy đủ | Sau khi bố cục được duyệt |
| `3-design-brief.md` | Design brief | Khi viết xong bước 3 |

Chỉ ghi file khi bước đó đã được duyệt. Nhờ vậy một file có mặt trong thư mục luôn có nghĩa là "bản này đã được duyệt", và bước sau đọc file chứ không dựa vào trí nhớ về cuộc trò chuyện, nơi có thể còn lẫn các bản nháp cũ.

## Bước 1: Bài viết

Gọi skill `fb-writing` và làm theo toàn bộ hướng dẫn của nó, kể cả câu hỏi chọn loại bài, các câu hỏi brief và bước chạy `check_post.py`. Skill điều phối không nới lỏng quy tắc nào của nó.

Trình bày bài cho người dùng, rồi hỏi duyệt (xem "Cách hỏi duyệt").

## Bước 2: Bố cục poster

Gọi skill `poster-layout`, đầu vào là file `1-bai-viet.md` (hoặc bài người dùng đưa nếu vào từ bước này).

- `poster-layout` chỉ trả một bản phác họa bằng chữ: một khung chứa đúng các dòng chữ của poster, dòng lớn nhất được đánh dấu. Nó không đọc brandkit và không đếm từ. Đừng thêm sơ đồ vùng, bảng đếm từ hay giải thích vào bản phác họa.
- Khổ poster: theo lời người dùng nếu họ đã nói. Chưa nói thì dùng khổ dọc (bước 3 sẽ chọn 4:5 cho bài đăng Facebook).
- Giới hạn chữ của brandkit (tiêu đề ≤ 8 từ, tổng ≤ 30 từ, ≤ 40 từ với danh sách hoặc sự kiện) được kiểm tra ở bước 3, không phải ở bước này. Nếu bước 3 thấy bản phác họa vượt giới hạn, nó sẽ dừng và hỏi người dùng.
- Bài viết có emoji, tiêu đề viết hoa và hashtag là bình thường với Facebook. Chúng không được theo chữ lên poster.

Trình bày bản phác họa, rồi hỏi duyệt.

## Bước 3: Design brief

Gọi skill `design-brief` và cho nó biết đây là trường hợp "bắt đầu từ bố cục đã duyệt" (mục "Starting from an approved layout" trong skill đó). Đưa cho nó:

- `2-bo-cuc.md`: bố cục đã duyệt. Chữ và các vùng trong đó được giữ nguyên.
- `1-bai-viet.md`: bài đã duyệt, dùng làm caption đi kèm poster.
- `ghi-chu.md` nếu có: các ghi chú này phải xuất hiện ở mục rủi ro và câu hỏi mở của brief.

Việc của bước này là thêm phần thiết kế và ánh xạ các vùng sang template của brandkit (R1 đến R6), không viết lại nội dung. Nếu `design-brief` phát hiện bố cục vi phạm quy tắc cứng của brandkit, nó sẽ dừng và hỏi. Khi người dùng chọn sửa bố cục thì quay lại bước 2, sửa, duyệt lại, ghi đè `2-bo-cuc.md`, rồi mới viết brief.

Viết xong, ghi `3-design-brief.md`, trình bày brief và kết thúc bằng danh sách ba file kèm những mục còn mở (thông tin cần bổ sung, ngoại lệ cần người duyệt thương hiệu đồng ý). Brief là bước cuối nên không cần hỏi duyệt để đi tiếp; người dùng góp ý thì sửa và ghi đè file.

## Cách hỏi duyệt

Sau bước 1 và bước 2, hỏi đúng một câu với ba lựa chọn. Có công cụ hỏi lựa chọn thì dùng, không thì hỏi bằng chữ:

- **Duyệt, làm bước tiếp theo**
- **Cần sửa** (người dùng nói sửa gì)
- **Dừng ở đây**

Xử lý câu trả lời:

- **Duyệt:** ghi file của bước đó rồi mới sang bước sau.
- **Cần sửa:** sửa bằng chính skill của bước đó, trình bày lại bản đầy đủ, hỏi duyệt lại. Lặp cho đến khi được duyệt hoặc người dùng dừng. Câu trả lời vừa khen vừa góp ý ("ổn rồi nhưng đổi tiêu đề") là cần sửa, chưa phải duyệt.
- **Dừng:** ghi file nếu người dùng muốn giữ bản hiện tại, nói rõ đã lưu gì ở đâu, và dừng.
- **Trả lời mơ hồ hoặc không trả lời câu hỏi:** hỏi lại, không tự suy ra là đã duyệt.

## Khi người dùng quay lại sửa bước trước

Sửa một bước làm các bước sau nó lỗi thời. Người dùng đang ở bước 2 hoặc 3 mà muốn sửa bài viết thì quay lại bước 1, duyệt lại bài, ghi đè `1-bai-viet.md`, rồi làm lại bước 2 từ bài mới. Làm tương tự khi sửa bố cục sau khi đã có brief. Trước khi làm lại, nói cho người dùng biết những file nào sẽ bị thay.

Ngoại lệ: thay đổi không chạm tới thứ bước sau đã dùng (ví dụ sửa một lỗi chính tả trong đoạn bài không lên poster) thì chỉ cần ghi đè file của bước đó và nói rõ các bước sau không bị ảnh hưởng.
