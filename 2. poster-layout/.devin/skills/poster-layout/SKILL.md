---
name: poster-layout
description: Nhận một bài viết đã có nội dung và phác họa bằng chữ những gì sẽ xuất hiện trên poster - một khung đơn giản, bên trong là đúng các dòng chữ của poster xếp từ trên xuống. Không đọc brandkit, không design brief, không màu sắc, font hay hình ảnh. Dùng skill này bất cứ khi nào người dùng đưa một bài viết, bài blog, bài đăng mạng xã hội, thông báo hay bản nháp nội dung và muốn "lên bố cục poster", "phác họa poster", "chia bố cục", "dàn nội dung lên poster / áp phích / banner / infographic", hỏi "bài này làm poster thì để chữ gì", "nên giữ hay bỏ phần nào khi đưa lên poster", hoặc nói "poster layout" - kể cả khi họ không dùng đúng chữ "bố cục".
allowed-tools:
  - read
---

# Phác họa poster từ bài viết

Người dùng đưa một bài viết. Bạn trả lại **một bản phác họa bằng chữ**: một cái khung, bên trong là đúng những dòng chữ sẽ nằm trên poster, xếp từ trên xuống theo vị trí của chúng. Chỉ vậy thôi.

Người dùng đã nói rõ họ muốn kết quả đơn giản, nhìn một lần là hiểu. Vì vậy skill này không đọc brandkit, không đếm từ, không chia vùng A/B/C, không ghi tỷ lệ phần trăm, không giải thích lý do. Mọi thứ thêm vào ngoài bản phác họa đều làm họ thấy rối.

## Đầu vào

Chỉ cần bài viết, dán trực tiếp hoặc đưa đường dẫn file (đọc toàn bộ file). Chưa có bài thì xin bài. Không hỏi gì thêm và không đọc file nào khác.

Khổ poster: mặc định dọc. Người dùng nói "vuông" hay "ngang" thì vẽ khung theo đó.

## Cách làm

1. **Tìm một ý chính.** Đọc hết bài và tự hỏi: người xem chỉ nhớ một điều thì đó là gì? Ý đó thành dòng lớn nhất. Poster chỉ có một dòng lớn nhất.
2. **Chọn rất ít chữ.** Poster để liếc, không để đọc. Thường chỉ cần: một dòng lớn nhất (khoảng 8 từ trở lại), một dòng phụ hoặc 3 đến 5 ý ngắn, một lời kêu gọi nếu bài có kêu gọi, và tên người đăng hoặc liên hệ nếu bài có. Cả poster nên gọn trong khoảng 30 đến 40 từ. Thứ gì không phục vụ ý chính thì bỏ, không cần liệt kê đã bỏ gì.
3. **Viết chữ cho poster.** Được rút gọn câu của bài, nhưng không thêm ý, số liệu hay lời hứa mà bài không nói. Con số, tên riêng, ngày giờ, địa điểm, giá, liên hệ chép đúng như bài. Bỏ emoji và không viết hoa cả câu. Các ý ngang hàng viết cùng một kiểu câu.
4. **Xếp từ trên xuống** theo thứ tự người xem sẽ đọc: thường là dòng lớn nhất ở trên, phần làm rõ ở giữa, lời kêu gọi gần cuối, tên hoặc liên hệ ở chân.

Poster cần một thông tin mà bài không có (sự kiện thiếu địa chỉ, lời kêu gọi thiếu cách liên hệ) thì không tự bịa. Viết `[cần bổ sung: ...]` vào đúng chỗ đó trong khung.

## Kết quả

Trả đúng một khối code chứa bản phác họa, không có lời mở đầu, tiêu đề, giải thích hay tổng kết:

- Khung vẽ bằng `+ - |`, mọi dòng dài bằng nhau. Khổ dọc và vuông rộng 34 ký tự, khổ ngang rộng 58 ký tự.
- Bên trong là chữ thật của poster. Dòng nào dài hơn khung thì ngắt xuống dòng ở chỗ có nghĩa.
- Các cụm chữ cách nhau một dòng trống.
- Dòng lớn nhất được đánh dấu `← lớn nhất` ở bên phải, ngoài khung. Không đánh dấu gì khác.
- Lời kêu gọi đặt trong ngoặc vuông, ví dụ `[ Đăng ký ngay ]`, để phân biệt với chữ thường.

Nếu có chỗ `[cần bổ sung: ...]` thì thêm đúng một dòng dưới khối code nhắc người dùng điền thông tin đó. Ngoài ra không viết gì thêm.

Người dùng góp ý thì sửa đúng chỗ họ nói và gửi lại cả bản phác họa.

## Ví dụ

Đầu vào: bài thông báo workshop pha cà phê của Tiệm cà phê Hiên Nhà, khoảng 450 chữ, có ngày giờ, phí, cách đăng ký, nhưng chỉ ghi địa điểm là "ngay tại tiệm".

Kết quả:

````markdown
```
+--------------------------------+
|                                |
| Nhập môn pha cà phê thủ công   |  ← lớn nhất
|                                |
| Tự tay pha V60 và phin cùng    |
| thợ rang của Hiên Nhà          |
|                                |
| Chủ nhật 22/11/2026            |
| 9:00–11:30                     |
| [cần bổ sung: địa chỉ tiệm]    |
|                                |
| 350.000 đồng, tối đa 12 người  |
|                                |
| [ Nhắn fanpage để đăng ký ]    |
|                                |
| Tiệm cà phê Hiên Nhà           |
|                                |
+--------------------------------+
```

Cần bổ sung: địa chỉ cụ thể của tiệm.
````

Ví dụ này minh họa cách trình bày. Bài khác sẽ có số cụm chữ và thứ tự khác.
