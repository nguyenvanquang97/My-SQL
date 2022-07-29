use classic_model;

-- Liệt kê tên các văn phòng theo tên thành phố và số lượng nhân viên thuộc các văn phòng đó
select distinct(o.city),count(e.employeeNumber)
from offices o inner join employees e
on o.officeCode = e.officeCode
group by o.officeCode;

-- Liệt kê nước nào có số lượng văn phòng nhiều nhất
create or replace view count_offices_by_country as(
select distinct (o.country) as country,count(o.officeCode) as
 numbers_offices
from offices o
group by o.country);

select  max(numbers_offices) 
from count_offices_by_country ;

select * from count_offices_by_country
where numbers_offices=(select  max(numbers_offices) 
from count_offices_by_country) ;

-- Liệt kê tình trạng các đơn hàng và số lượng đơn hàng thuộc tình trạng đó
select distinct (status),count(orderNumber)
from orders
group by status;

-- Liệt kê productLine và số lượng sản phẩm thuộc các line đó
select distinct (pl.productline) as productlines,
count(p.productline) as products_number
from productlines pl inner join products p
on pl.productLine = p.productLine
group by pl.productline;

-- Liệt kê thông tin những đơn hàng bị hủy gồm: id đơn hàng, id khách hàng, tên khách hàng, orderDate, requireDate, nguyên nhân đơn hàng bị hủy (comment)
select o.orderNumber,c.customerNumber,c.customerName,o.orderDate
,o.requiredDate,o.comments
from orders o inner join customers c
on o.customerNumber = c.customerNumber;

-- Liệt kê id đơn hàng, id khách hàng, tên khách hàng, orderDate, requireDate, sản phẩm (id, tên, số lượng) , comment của đơn hàng có id 10165
select o.orderNumber,c.customerNumber,c.customerName,o.orderDate
,o.requiredDate,
json_arrayagg(json_object('id',p.productCode , 'name',p.productName,'quantilyOrdered',od.quantityOrdered)) as product,o.comments as comments
from orders o inner join customers c
on o.customerNumber = c.customerNumber
inner join orderdetails od on o.orderNumber =od.orderNumber
inner join products p on p.productCode = od.productCode
where o.orderNumber = 10165
group by p.productCode;

-- Liệt kê thông tin các nhân viên thực hiện công việc Sales Rep làm việc ở văn phòng San Francisco
select * from
employees e inner join offices o
on e.officeCode = o.officeCode
where e.jobTitle = 'Sales Rep' and o.city ='San Francisco'
;

-- Liệt kê thông 5 khách hàng order nhiều nhất

create or replace view count_oroder_of_customer as(
select distinct(c.customerNumber),(c.customerName),
count(o.orderNumber) as orderNumber
from orders o inner join customers c
on o.customerNumber = c.customerNumber
group by c.customerNumber
order by orderNumber desc
)
;

select * from count_oroder_of_customer
limit 5;

-- Tạo store procedure lấy ra thông tin id đơn hàng, id khách hàng, tên khách hàng, orderDate, requireDate, shippedDate, sản phẩm (id, tên, số lượng), comment, với tham số truyền vào là status

create or replace view no_name as(
select o.orderNumber,c.customerNumber,c.customerName,o.orderDate
,o.requiredDate,
json_arrayagg(json_object('id',p.productCode , 'name',p.productName,'quantilyOrdered',od.quantityOrdered)) as product,o.comments as comments,o.status as status
from orders o inner join customers c
on o.customerNumber = c.customerNumber
inner join orderdetails od on o.orderNumber =od.orderNumber
inner join products p on p.productCode = od.productCode
group by p.productCode);

drop  procedure sp_show_order_by_status;
DELIMITER $$
create procedure sp_show_order_by_status(
in status_input text
)
begin
select* from no_name nn
inner join orders o 
on o.orderNumber =nn.orderNumber 
where nn.status =  status_input;
end $$
DELIMITER ;

call sp_show_order_by_status('Shipped');




