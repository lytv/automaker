# Hướng dẫn Sử dụng Tính năng Prompt Customization trong Automaker

Dưới đây là giải thích chi tiết về từng chế độ trong màn hình "Prompt Customization" mà bạn đang xem. Tính năng này cho phép bạn can thiệp sâu vào cách AI suy nghĩ và hành động trong từng tình huống cụ thể.

## 1. Auto Mode (Chế độ Tự động)

**Dùng khi nào?**
Đây là chế độ quan trọng nhất, được kích hoạt khi bạn yêu cầu Agent tự động thực hiện một task (coding, sửa lỗi, v.v.).

**Các tùy chọn:**

- **Planning: Lite Mode**: Dùng cho các task nhỏ, nhanh. AI sẽ lập một kế hoạch ngắn gọn và làm ngay. Customize prompt này nếu bạn muốn thay đổi cấu trúc kế hoạch mặc định.
- **Planning: Lite with Approval**: Giống Lite nhưng bắt buộc đợi bạn gõ "Approved". Dùng khi bạn muốn kiểm soát chặt chẽ hơn trước khi AI viết code.
- **Planning: Spec Mode**: Dùng cho task trung bình/lớn. AI sẽ viết một bản đặc tả (Specification) chi tiết gồm: Vấn đề, Giải pháp, Tiêu chí nghiệm thu (Acceptance Criteria), và danh sách Task con.
- **Planning: Full SDD Mode**: Chế độ cao cấp nhất cho tính năng phức tạp. AI sẽ viết một tài liệu thiết kế phần mềm (SDD) đầy đủ với các pha (Phase 1, 2, 3), phân tích rủi ro, v.v.

**Lưu ý:** Nếu sửa các prompt này, bạn **PHẢI** giữ lại các từ khóa hệ thống như `[PLAN_GENERATED]` hoặc `[SPEC_GENERATED]`, nếu không Agent sẽ bị lỗi luồng hoạt động.

---

## 2. Agent (Chế độ Trò chuyện)

**Dùng khi nào?**
Khi bạn chat trực tiếp với Agent (ví dụ: hỏi đáp, nhờ giải thích code, hoặc chạy lệnh thủ công) thông qua giao diện "Agent Runner".

**Tại sao cần chỉnh?**

- Để thay đổi "tính cách" của Agent.
- Để thêm các quy tắc chung cho toàn bộ dự án (ví dụ: "Luôn luôn trả lời bằng tiếng Việt", "Không bao giờ dùng thư viện X", "Luôn viết Unit Test bằng Jest").
- Đây là **System Prompt** nền tảng cho mọi cuộc hội thoại.

---

## 3. Backlog Plan (Lập kế hoạch Backlog)

**Dùng khi nào?**
Khi bạn dùng tính năng "Plan" trên bảng Kanban để AI tự động sắp xếp, thêm, bớt hoặc chỉnh sửa các ticket/nhiệm vụ trong Backlog dựa trên yêu cầu mới.

**Cảnh báo quan trọng!**

- Prompt này yêu cầu đầu ra là **JSON cực kỳ nghiêm ngặt**.
- **Chỉ nên sửa nếu bạn là Advanced User** và hiểu rõ cấu trúc JSON mà hệ thống cần.
- Nếu sửa sai, tính năng "Plan" trên bảng Kanban sẽ bị hỏng hoàn toàn (không parse được dữ liệu).

---

## 4. Enhancement (Tính năng Nâng cao)

**Dùng khi nào?**
Khi bạn đang viết mô tả cho một task/ticket và nhấn nút "Enhance" (biểu tượng cây đũa thần) để AI viết lại mô tả cho hay hơn. Tab này định nghĩa "cách viết lại" đó.

**Các chế độ con:**

- **Improve Mode (Cải thiện)**: Dùng khi bạn chỉ viết một câu ngắn gọn (vd: "làm nút login"). AI sẽ viết lại thành một mô tả chuyên nghiệp, rõ ràng hơn.
- **Technical Mode (Kỹ thuật)**: Dùng khi bạn muốn bổ sung chi tiết kỹ thuật. AI sẽ thêm phần "Technical Implementation", gợi ý stack công nghệ, API endpoint, cấu trúc dữ liệu.
- **Simplify Mode (Đơn giản hóa)**: Dùng khi mô tả quá dài dòng. AI sẽ tóm tắt lại các ý chính, loại bỏ từ thừa nhưng vẫn giữ đủ ý.
- **Acceptance Criteria Mode (Tiêu chí nghiệm thu)**: Dùng để bổ sung phần "Testing". AI sẽ thêm danh sách "Given-When-Then" để QA hoặc Developer biết cách test tính năng này.

## Tóm lại:

- Muốn chỉnh cách AI **code và làm việc**: Sửa **Auto Mode**.
- Muốn chỉnh cách AI **trò chuyện**: Sửa **Agent**.
- Muốn chỉnh cách AI **quản lý task/ticket**: Sửa **Backlog Plan** (Cẩn thận!).
- Muốn chỉnh cách AI **viết/sửa nội dung ticket**: Sửa **Enhancement**.
