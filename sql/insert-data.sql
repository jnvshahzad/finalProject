INSERT INTO role (role_name) 
VALUES ('admin'), ('sme'), 
('trainer'), ('requestor');

INSERT INTO skills (skill_name,skill_duration) 
VALUES ('HTML5',10), ('CSS3',5),
('Core Java',45), ('SQL',6), 
('Javascript',4), ('JDBC',2),
('Unit Testing',3), ('Advanced Java',15),
('ES6', 20), ('Angular',30),
('React',45),('Firebase',15);

#Inserting admin data values
INSERT INTO user(usr_first_name, usr_last_name, usr_age, usr_gender, usr_contact_number, usr_address, usr_userId, usr_password, usr_role)
VALUES ('Rahul','Wadhwa',21,'Male', 8989898989, 'Action Area I, Newtown, West Bengal', 34565, 'initial',
(SELECT role_id FROM role WHERE role_name="admin"));

INSERT INTO user(usr_first_name, usr_last_name, usr_age, usr_gender, usr_contact_number, usr_address, usr_userId, usr_password, usr_role)
VALUES ('Vipin','Chauhan',21,'Male', 8459898989, 'Action Area I, Newtown, West Bengal', 1234565, 'pass',
(SELECT role_id FROM role WHERE role_name="trainer"));

use trainer_pool;

select * from user_skills;

desc user_skills;

show create table user_requests;

select * from request;

insert into request(req_requestorId,req_subject,req_start_date,req_end_date,req_city,req_batch_size,req_amount,req_status)
values(121213,"Math",'2019-05-02','2019-08-02',"Ajmer",11,20000,"NA");

select * from user ;
select * from request;
update request set req_status="NA" where req_id=500001;
-- List of Visible request for trainer;
select req_id,usr_userId from user,request where usr_userId=34565 and  usr_start_avail<=req_start_date and usr_end_avail>=req_end_date and req_status="NA"; 

-- After accepting request show Approved request user_requests
-- After Accept update request

update request set req_status="A" where req_id=500001;
insert into user_requests values(3000002,500001);
desc user_requests;

update user set usr_start_avail='2019-02-01', usr_end_avail='2019-06-01' where usr_userId=34565;
update user set usr_start_avail='2019-02-01', usr_end_avail='2019-06-01' where usr_userId=1234565;

select * from  user;

CREATE TABLE `user_requests` (
  `user_id` int(11) NOT NULL,
  `req_id` int(200) NOT NULL,
  PRIMARY KEY (`req_id`)
  
);
select * from user_requests;
desc user_requests;