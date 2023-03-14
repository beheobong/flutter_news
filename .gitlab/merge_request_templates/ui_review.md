**Merge request description**

- Điền nội dung làm trong cái MR này vào đây (thêm mới thì tính năng nào?, sửa thì fix bug nào?, issue gì? vân vân mây mây)

**Checklist**

**Code giao diện**
* Icon asset: bé nhất yêu cầu là 64px
*  [ ] Self check
*  [ ] Reviewer check

* Không được dùng TextStyle(), phải dùng Styles.copyStyle()
*  [ ] Self check
*  [ ] Reviewer check

* color trong Styles là duy nhất (tức là khi thêm color mới phải check xem đã có chưa và merge code từ dev về cx phải check lại 1 lần nữa)
*  [ ] Self check
*  [ ] Reviewer check

* trong view chính ko đc đẻ bất kỳ 1 biến hoặc 1 function nào (phải đc khởi tạo ở presenter)
*  [ ] Self check
*  [ ] Reviewer check

* size icon cố gắng là 1 trong số size sau: 10, 16, 18, 24, 36, 48, 64, 72, 96...
*  [ ] Self check
*  [ ] Reviewer check

* Không được dùng Color(0xfff), phải dùng Styles.colorxxx
*  [ ] Self check
*  [ ] Reviewer check

* Trong view nhiều item giống nhau cần tạo 1 function view chung tránh code dài dòng
*  [ ] Self check
*  [ ] Reviewer check

* Không được dùng Padding trong các view hỗ trợ sẵn padding như: ListView, Gridview, Container, Singlechildscrollview...
*  [ ] Self check
*  [ ] Reviewer check

* Ưu tiên dùng view theo thứ tự SizeBox, Padding, Container: 
*  [ ] Self check
*  [ ] Reviewer check

*  [ ]***Trường hợp có 2 textfield trở lên***

*  Check validate và gõ kỹ tự phải ẩn hết validate đi (nếu có validate): 
*  [ ] Self check
*  [ ] Reviewer check

* Click ngoài vùng textfield phẩn ẩn phím ảo (keyboard)
*  [ ] Self check
*  [ ] Reviewer check

* Dùng TextFormField
*  [ ] Self check
*  [ ] Reviewer check

* keyboard actions and next focus field (Tức là click submit ở phím ảo phải next TextFormField đc nếu TextFormField chưa ở dưới cùng)
https://medium.com/codechai/flutter-keyboard-actions-and-next-focus-field-3260dc4c694
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