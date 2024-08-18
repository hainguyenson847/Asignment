INSERT INTO Accounts (Username, FullName, Password, Role, Image, Email, BirthDay, Address, Phone, status) VALUES
('user01', N'Nguyễn Văn An', 'password123', 2, 'img/avatar/Default_Avatar.jpg', 'nguyenvana@example.com', '1990-01-15', N'Số 1, Đường Lê Lợi, Hà Nội', '0912345678', 1),
('user02', N'Trần Thị Bích', 'password123', 2, 'img/avatar/Default_Avatar.jpg', 'tranthib@example.com', '1985-03-22', N'Số 10, Đường Trần Hưng Đạo, TP. Hồ Chí Minh', '0912345679', 1),
('user03', N'Lê Văn Cường', 'password123', 2, 'img/avatar/Default_Avatar.jpg', 'levanc@example.com', '1992-06-10', N'Số 15, Đường Hai Bà Trưng, Đà Nẵng', '0912345680', 1),
('user04', N'Phạm Thị Dương', 'password123', 2, 'img/avatar/Default_Avatar.jpg', 'phamthid@example.com', '1995-09-18', N'Số 20, Đường Phạm Ngũ Lão, Cần Thơ', '0912345681', 1),
('user05', N'Hoàng Văn Em', 'password123', 2, 'img/avatar/Default_Avatar.jpg', 'hoangvane@example.com', '1988-12-25', N'Số 25, Đường Lý Tự Trọng, Hải Phòng', '0912345682', 1),
('user06', N'Vũ Thị Phú', 'password123', 2, 'img/avatar/Default_Avatar.jpg', 'vuthif@example.com', '1991-11-02', N'Số 30, Đường Nguyễn Huệ, Hà Nội', '0912345683', 1),
('user07', N'Đỗ Văn Giang', 'password123', 2, 'img/avatar/Default_Avatar.jpg', 'dovang@example.com', '1987-08-14', N'Số 35, Đường Hùng Vương, TP. Hồ Chí Minh', '0912345684', 1),
('user08', N'Bùi Thị Hà', 'password123', 2, 'img/avatar/Default_Avatar.jpg', 'buithih@example.com', '1993-04-07', N'Số 40, Đường Bạch Đằng, Đà Nẵng', '0912345685', 1),
('user09', N'Ngô Văn Yên', 'password123', 2, 'img/avatar/Default_Avatar.jpg', 'ngovani@example.com', '1996-07-20', N'Số 45, Đường Nguyễn Du, Cần Thơ', '0912345686', 1),
('user10', N'Phan Thị Khải', 'password123', 2, 'img/avatar/Default_Avatar.jpg', 'phanthik@example.com', '1994-02-13', N'Số 50, Đường Võ Thị Sáu, Hải Phòng', '0912345687', 1);


INSERT INTO Accounts (Username, FullName, Password, Role, Email) VALUES
('he186086', N'Nguyễn Sơn Hải', '12345678', 2, 'he186086@fpt.edu.vn')


insert into Categories(CategoryName) values
('Cat Food'),
('Cat chain'),
('Cat cage')

delete from Accounts
DBCC CHECKIDENT ('Categories', RESEED, 0);

select * from Categories

select * from Categories where Cid = 1

select GETDATE() from Products
getdat
delete from Products
DBCC CHECKIDENT ('Products', RESEED, 0);

select * from Accounts
--PRODUCT
-- pid
-- pName
-- img
-- price
-- description
-- quantity
-- discount
-- sold
-- releaseDate
-- cid
-- status
insert into Products(ProductName, Image, SalePrice, Description, Quantity, Discount, Sold, ReleaseDate, Cid, status) values
(N'Thức ăn hạt cho mèo mọi lứa tuổi KAMT Hàn Quốc 400g ( túi chiết )', 'img/products/CatFood/1-1.jpg', 40000, N'Công thức chứa chất xơ tự nhiên và bột củ cải đường giúp kiểm soát chứng rụng lông. Vitamin A và taurine cho đôi mắt tươi sáng, khỏe và thị lực tốt. Chất chống oxy hóa quan trọng và giàu đạm chất lượng cao giúp pé cưng hấp thụ tối đa dinh dưỡng từ các thực phẩm có ích, tránh lãng phí thức ăn. Giúp mèo dễ dàng tiêu hóa.', 20, 0.2, 0, '2023-12-25', 1, 1),
(N'Mister Donut T2- Thức ăn hạt cho mèo trưởng thành', 'img/products/CatFood/1-2.jpg', 265000, N'Topping 9 loại thịt trộn sẵn, cho bé cưng khám phá bữa ăn hấp dẫn không thể chối từ. Sản phẩm mới nâng cấp của Mister Donut, tiếp nối thành công của Dòng T1 dành cho mèo con và mèo mẹ. Tăng topping lên nhiều lần, chiếm 10% trọng lượng sản phẩm. Nâng cấp công thức, cải thiện sự ngon miệng cho mèo cưng. Sản phẩm đạt chứng nhận FDA và ISO 9001 của Hoa Kỳ.', 30, 0, 0, '2023-09-20', 1, 1),
(N'Me-o Thức ăn hạt cho mèo dành cho mèo con dưới 12 tháng', 'img/products/CatFood/1-3.jpg', 47000, N'Sau khi cai sữa, thức ăn Me-o Kitten được khuyến khích trộn với sữa hoặc nước ấm, để tạo điều khiện thuận lợi cho việc thay đổi từ dạng thức ăn lỏng sang sử dụng thức ăn khô. Vào lúc tròn 12 tuần tuổi nên giảm số lượng thức ăn lỏng thêm vào, để mèo con có thể sử dụng thức ăn khô khi bước qua 24 tuần tuổi.', 30, 0, 0, '2023-09-20', 1, 1),
(N'Catsrang- Thức ăn hạt cho mèo mọi lứa tuổi (từ 3 tháng trở lên)', 'img/products/CatFood/1-4.jpg', 57000, N'Thức ăn hạt cho mèo mọi lứa tuổi CATSRANG là sản phẩm phổ biến trên thị trường thức ăn cho mèo hiện nay. Fusion Group tự hào là nơi mang đến cho bạn sản phẩm chính hãng, chất lượng với mức giá cả vô cùng hấp dẫn.', 30, 0, 0, '2023-09-20', 1, 1),
(N'SP1742- Thức Ăn Hạt Cho Mèo catsrang hàn kitten', 'img/products/CatFood/1-5.jpg', 72000, N'Tùy từng thời kì phát triển của thú cưng mà có những loại thức ăn khác nhau. Đối với mèo nhỏ, hệ tiêu hóa của chúng vẫn còn yếu và khó hấp thụ thức ăn hơn  cả vì thế cần một loại thức ăn riêng phù hợp với hệ tiêu hóa và phát triển của mèo con.', 30, 0, 0, '2023-09-20', 1, 1),
(N'Thức ăn hạt cho mèo Royal canin Indoor', 'img/products/CatFood/1-6.jpg', 125000
, N'Thức ăn cho mèo ROYAL CANIN Indoor hỗ trợ sức khoẻ của mèo bằng cách cung cấp dinh dưỡng chính xác dựa trên sự hiểu biết đúng đắn về các nhu cầu cụ thể với hơn 40 năm nghiên cứu. Mèo sống trong nhà có lối sống ít vận động, nhu cầu năng lượng thấp hơn và nguy cơ béo phì cao hơn nên thức ăn cần hỗ trợ được những vấn đề sau:

Giảm mùi hôi cho mèo
Hỗ trợ trọng lượng khỏe mạnh
Giúp điều chỉnh búi lông
Hỗ trợ hệ tiêu hóa
100% dinh dưỡng cân bằng
100% đảm bảo an toàn
ROYAL CANIN INDOOR dành cho mèo trưởng thành sống trong nhà từ 1 đến 7 tuổi.'
, 10, 0, 0, '2024-05-20', 1, 1),
(N'Catsrang- Thức ăn hạt cho mèo mọi lứa tuổi (từ 3 tháng trở lên)', 'img/products/CatFood/1-7.jpg', 57000
, N'Chúng tôi chỉ đưa đến tay người tiêu dùng sản phẩm chất lượng và được tin tưởng bởi những khách hàng đã sử dụng. Thức ăn cho mèo CATSRANG mà chúng tôi cung cấp đảm bảo đầy đủ dưỡng chất cần có cho mọi loại mèo: taurine, vitamin, sắt… Sản phẩm này giúp bộ lông và da của mọi chủng loại mèo đều trở nên đẹp đẽ hơn bao giờ hết. Ngoài ra, với những dưỡng chất cung cấp, thức ăn này còn giúp giảm thiểu tình trạng quáng gà ở các chú mèo.'
, 6, 0, 0, '2024-05-20', 1, 1),
(N'Thức ăn hạt cho mèo Royal canin Hairball Care/ Hair & Skin', 'img/products/CatFood/1-8.jpg', 139000
, N'- Giải quyết búi lông

- Sức khỏe tiêu hóa

- Sức khỏe răng miệng '
, 6, 0.1, 0, '2023-08-20', 1, 1),
(N'Thức ăn hạt cho mèo Me-O GOLD Persian 1.2kg (Tiêu búi lông)', 'img/products/CatFood/1-9.jpg', 160000
, N'Nguyên Liệu Chính: Thịt gà, gạo, bột bắp gluten, bột phụ phẩm gia cầm, mỡ gia cầm, bột gạo, chất xơ (cellulose dạng bột), bột cá, khoáng chất (kali clorua, kẽm hữu cơ, mangan hữu cơ, đồng hữu cơ, sắt hữu cơ, selen hữu cơ, kali iodua), dầu cá, tảo bẹ, men bia khô, Lecithin, Fruto-oligosaccharide (FOS, vitamin (vitamin A, D, E, K, Thiamin (B1), Riboflavin (B2), Niacin (B3), axit panthothenic ( B5), Pyridoxine (B6), Cobalamin (B12), Biotin, Axit folic, Choline), DL- Methionine, Taurine, Chất chống oxy hóa.'
, 6, 0.15, 0, '2024-05-16', 1, 1),
(N'PVN272 - Vòng cổ tròn kích thước 0.6 kèm chuông thời trang cho chó mèo thú cưng nhỏ có thể thu to nhỏ vừa cổ thú cưng', 'img/products/CatChain/2-1.jpg', 40000
, N'Với thiết kế dày dặn và chắc chắn, chiếc vòng cổ này sẽ nằm thật gọn gàng và êm ái trên cổ chú thú cưng của bạn, sẵn sàng cho mọi chuyến đi dạo hoặc chạy bộ đầy hứng khởi phía trước. Ngoài tác dụng giúp bạn giữ chặt và theo sát chú thú cưng của mình, màu sắc tươi tắn và thời trang của chiếc vòng cổ còn là điểm nhấn nổi bật để chú thú cưng của bạn trông thật “sành điệu”.', 3, 0, 0, '2023-11-20', 2, 1),
(N'Dây dắt tròn có kèm đai yên ngựa đính nơ chất liệu vải dù chắc chắn đẹp mắt dành cho chó mèo thú cưng', 'img/products/CatChain/2-2.jpg', 78000
, N'- Hình thức đẹp mắt, màu sắc tươi sáng của dây dắt chó còn rất phù hợp, giúp tô điểm thêm vẻ đẹp của các chú chó kể cả với các màu lông khác nhau.
- Bền chắc, giá hợp lý: Chất liệu vải dù giúp dây dắt chó có yếm và tay cầm trợ lực có sự chắc chắn, tạo độ bền rất cao so với các sản phẩm dây dắt chó làm bằng chất liệu khác. Bên cạnh đó thiết kế dày dặn cũng tăng thêm độ bền của dây dắt chó và tạo cảm giác thoải mái, êm ái cho thú cưng của bạn.', 6, 0.1, 0, '2023-04-20', 2, 1),
(N'PVN268 - Dây dắt kèm yên ngựa họa tiết caro dành cho chó mèo thú cưng, có thể thu to nhỏ tùy ý, phù hợp với thú cưng nhỏ và vừa', 'img/products/CatChain/2-3.jpg', 45000
, N'ĐẶC ĐIỂM NỔI BẬT
- Hình thức đẹp mắt, màu sắc tươi sáng của dây dắt chó còn rất phù hợp, giúp tô điểm thêm vẻ đẹp của các chú chó kể cả với các màu lông khác nhau.
- Bền chắc, giá hợp lý: Chất liệu vải dù giúp dây dắt chó có yếm và tay cầm trợ lực có sự chắc chắn, tạo độ bền rất cao so với các sản phẩm dây dắt chó làm bằng chất liệu khác. Bên cạnh đó thiết kế dày dặn cũng tăng thêm độ bền của dây dắt chó và tạo cảm giác thoải mái, êm ái cho thú cưng của bạn.'
, 6, 0.15, 0, '2024-05-20', 2, 1),

(N'SP368 - Dây dắt yên ngựa Largura Panda', 'img/products/CatChain/2-4.jpg', 150000
, N'Bộ dây dắt kèm yếm cao cấp Largura panda ngoài có tác dụng giúp bạn giữ chặt và theo sát thú cưng  còn được các nhà thiết kế sáng tạo mang tính thẩm mỹ phù hợp với xu thế thời trang.
Sản phẩm đã được kiểm định độ bền, chất liệu nhựa và kim loại chống gỉ.
Khóa 2 nấc tạo độ an toàn cao nhất cho thú cưng của bạn.
Ngoài ra, sản phẩm còn có khả năng chống oxy hóa và ăn mòn theo thời gian cao.'
, 7, 0.25, 0, '2024-03-20', 2, 1),
(N'SP312 - Dây dắt trợ lực phản quang thời thượng', 'img/products/CatChain/2-5.jpg', 160000
, N'Khi bạn dẫn chó cưng của mình ra đường thì dây xích chó rất quan trọng. Nếu nói về dây xích chó thì hầu hết chúng ta đều sẽ nghĩ tới, đó là một vật dụng để “giữ chân” chú chó của chúng ta tại một chỗ, vì quậy, hay vì sợ … mất trộm.

Tuy nhiên đó mới chỉ là một nửa, dây xích còn một công dụng nữa thường bị lãng quên, không để ý tới: dùng để dắt chú chó đi dạo, đi tập luyện, hay đi vệ sinh.

Chính vì vậy, ngoài việc chọn mua một sợi xích cứng nhắc với mục tiêu là giữ chân, chúng ta cần để ý trong một số trường hợp khác. Dây dắt cần phải phù hợp với giống chó, thể trạng chó, tính tình của chó để đảm bảo sự an toàn và thoải mái.'
, 4, 0.4, 0, '2024-01-20', 2, 1),
(N'SP733 - Vòng cổ da 2 lớp Vạn Đạt', 'img/products/CatChain/2-6.jpg', 130000
, N'oại dây dắt này thường được dùng cho những chú chó cỡ trung và cỡ lớn với trọng lượng từ 15 kg trở lên, những bạn cún này thường giật hoặc kéo dây khi được chủ dẫn ra đường. Những bé này thường rất hiếu động mỗi khi gặp vật lạ hoặc chú cún lạ nào đó. Lực kéo của chúng cũng rất mạnh, có thể làm té ngã cả người lớn, với người phụ nữ hoặc người lớn tuổi thì rất nguy hiểm. Dây dắt xích inox là sự lựa chọn hoàn hảo trong những trường hợp như thế.'
, 3, 0.1, 0, '2024-02-05', 2, 1),
(N'SP1269 - Vòng cổ LED tròn', 'img/products/CatChain/2-7.jpg', 78000
, N'òng Cổ LED Dog Collar - Đèn sạc USB

 Hiệu ứng LED giúp cho thú cưng của bạn an toàn hơn khi đi du lịch hoặc đi vào ban đêm!'
, 6, 0, 0, '2024-04-30', 2, 1),
(N'SP284 - Dây dắt da 3 khúc móc đồng cao cấp', 'img/products/CatChain/2-8.jpg', 290000
, N'Mẫu dây dắt da với chất liệu da thật , đồng nguyên chất. Đây chắc chắn là chiếc dây sang chảnh cho các bạn và cún trong những chuyến hành trình.'
, 3, 0.1, 0, '2023-07-03', 2, 1),
(N'Cửa lồng quây sắt mỏng', 'img/products/CatCage/3-1.jpg', 32000
, N'- Kích thước: 35x35cm, khi có chốt sẽ là 37*37cm.
- Màu sắc: màu đen đơn giản, được sơn tĩnh điện tránh gỉ sét với thời gian lâu dài.
- Nan sắt có đường kính 4mm, chịu được tải trọng 30kg, chịu được các bé chó mèo cắn.'
, 6, 0, 0, '2024-06-20', 3, 1),
(N'Nhà nhựa hình chữ nhật cho chó mèo che mưa, nắng 2 size', 'img/products/CatCage/3-2.jpg', 900000
, N'Nhà nhựa hình chữ nhật 61*42*41cm

Nhà nhựa hình chữ nhật có cửa 86*67*57cm'
, 3, 0.15, 0, '2024-05-20', 3, 1),
(N'Lồng vận chuyển hàng không đây đủ phụ kiện cho thú cưng', 'img/products/CatCage/3-3.jpg', 265000
, N'Lồng Hàng Không XDB - 435 
Kích Thước: 48x31x30cm'
, 2, 0.1, 0, '2024-02-11', 3, 1),
(N'Balo Vận Chuyển Chó Mèo - Balo Vận Chuyển Chó Mèo Size Lớn thương hiệu MIKA PET', 'img/products/CatCage/3-4.jpg', 320000
, N'*Thông tin chi tiết :

- Chất liệu : VẢI oxford / PVC
- Kích thước: 37 x 25 x 37
+ balo cho mèo : <10kg
+ balo cho chó : <4kg'
, 1, 0.05, 0, '2023-05-20', 3, 1),
(N'Balo mặt mèo có cửa kéo tròn bên trên', 'img/products/CatCage/3-5.jpg', 320000
, N'Chiếc balo đa dạng màu sắc này sẽ giúp Sen dễ lựa chọn theo cá tính của riêng mình
Ngoài chiếc túi nhỏ phía trước có thể đựng được một vài đồ ăn vặt
Chiếc túi phù hợp cho bốn mùa, dù nắng nóng hay trời lạnh, Sen đều có thể yên tâm cùng Boss ra ngoài.
Với thiết kế đơn giản, chất liệu bằng vải dễ dàng vệ sinh kèm theo đó là quai đeo chắc chắn.'
, 2, 0.1, 0, '2024-04-10', 3, 1),
(N'Balo vận chuyển mặt lưới kèm dây móc', 'img/products/CatCage/3-6.jpg', 280000
, N'*Thông tin chi tiết :

- Chất liệu : VẢI oxford / PVC
- Kích thước: 37 x 25 x 37
+ balo cho mèo : <10kg
+ balo cho chó : <4kg
- Màu sắc : Hồng , Xám , Xanh dương, vàng'
, 6, 0.15, 0, '2023-10-20', 3, 1)


select * from OrderDetail where Oid = 1

select * from [Order] where status = 0 and UserName = 'user01' order by Oid desc
select * from OrderDetail
select * from Products 

select top 1 oid from [order] order by Oid desc

insert into [Order](Date, UserName, TotalPrice, status) values
('2024-03-20', 'user01', 0, 0)

delete from [Order] where Oid = 7 in(4, 5,6)

delete from OrderDetail where Oid = 1

insert into OrderDetail values
(1, 1, 7)

SELECT Top 1 [OID] FROM [dbo].[Order] ORDER BY [OID] DESC
insert into OrderDetail values
(3, 3, 3),
(3, 4, 2),
(3, 5, 1)


delete from [Order] where oid = 3


update Accounts
set Password = '123456'
where Username = 'user01'

update [Order]
set status = 1
where Oid = 2

select * from Products where ProductName like N'%thức%'

select * from Products where Pid = '1'

delete from [Order]
DBCC CHECKIDENT ('[Order]', RESEED, 0);
delete from OrderDetail
delete from Products
DBCC CHECKIDENT ('Products', RESEED, 0);
select * from Products


delete from Order where oid = 2

select * from Accounts where Username = 'user01'
select * from Accounts where Username ='user01'

select * from [Order] where UserName = 'user01'