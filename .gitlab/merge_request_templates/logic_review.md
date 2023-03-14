**Merge request description**

- Điền nội dung làm trong cái MR này vào đây (thêm mới thì tính năng nào?, sửa thì fix bug nào?, issue gì? vân vân mây mây)

**Checklist**
**format code**
* Code không được có warning > các warning cần được fix nhiều nhất có thể (vì warning là đang làm chưa đúng hoặc có thể phát sinh lỗi)
*  [ ] Self check
*  [ ] Reviewer check
* Check null view/dữ liệu trong trường hợp gọi từ API hoặc các tác vụ bất đồng bộ
*  [ ] Self check
*  [ ] Reviewer check
* Khi code cần chú ý đến vòng đời của dữ liệu, StatefulWidget
*  [ ] Self check
*  [ ] Reviewer check

* Xóa các phần code unused, import thừa.
*  [ ] Self check
*  [ ] Reviewer check
* Quy định về số LOC (lines of code) trên 1 class > do nếu class quá dài dẫn đến khó khăn về đọc và bảo trì > mỗi class cần ít hơn 1000 LOC, trường hợp xử lý phức tạp cần tách thành các lớp con, util, manager, helper hoặc extend để xử lý
*  [ ] Self check
*  [ ] Reviewer check
* Quy định về số LOC (lines of code) trên 1 method > do nếu method quá dài dẫn đến khó khăn về đọc và bảo trì > mỗi method cần ít hơn 100 LOC, nên chia nhỏ thành các method với chức năng xử lý tương ứng, không nên viết gộp chung vào một method.
*  [ ] Self check
*  [ ] Reviewer check
* Các logic xử lý chung hoặc trùng lặp cần viết thành hàm để tái sử dụng.
*  [ ] Self check
*  [ ] Reviewer check

* Tên biến, tên hàm cần có ý nghĩa riêng và đúng với chức năng của biến, hàm đó; cần bổ sung comment nếu cần thiết để tránh nhầm lẫn.
*  [ ] Self check
*  [ ] Reviewer check
* Những phần chưa xử lý hoặc dummy dữ liệu cần đánh todo và comment đầy đủ.
*  [ ] Self check
*  [ ] Reviewer check


**Hướng dẫn comment review**

Nhớ để ý lần này sửa chỗ nào thì comment code vào chỗ đó, commnent đầu hàm.

1.Người review comment các hạng mục cần chỉnh sửa 

> ex:
> 1. Sửa line 1
> 2. Sửa line 2 đến 100

2.Người sửa thực hiện sửa và comment lại các thông tin sau:

- Defect Origin: Nguyên nhân gây bug - Một trong các giá trị sau:

`Requirement
Design
Coding
Testing
Deployment
Customer support
Other`

- Defect Type: Loại bug - Một trong các giá trị sau:

`Data defect
Environment defect
Code defect
Design defect
UI defect
Function defect
Others`

- Cause analysis: Nguyên nhân

- Cause Category: Phân loại nguyên nhân - Một trong các giá trị sau:

`REQ_Missing or Incomplete
DES_Missing or Incomplete
SKI_Lack of professional skill/ technology expertise
COM_Missing confirmation/ Comunication
IMP_Insufficent analysis before implementation
COM_ Translate
SKILL_Carelessness`

- Corrective Action: Phương án sửa

- Time: Thời gian sửa comment

> ex:
>
> Issue 1
> - Defect Origin: Coding
> - Defect Type: Code defect
> - Cause analysis: Do chưa refactor lại code
> - Cause Category: SKILL_Carelessness
> - Corrective Action: Refactor lại code
> - Time: 30m
>
> Issue 2
> ...