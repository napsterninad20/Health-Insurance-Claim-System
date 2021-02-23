DELIMITER //

CREATE PROCEDURE GetMemberInfo1()
       BEGIN
       select m.member_first_name, m.member_last_name, m.member_dob, m.gender, m.claim_id,
	   s.claim_status, s.type
	from 
		((member m inner join claim c on m.claim_id = c.claim_id) 
				inner join status s on s.status_id = c.status_id)
	where s.claim_status = "paid";
       END //

DELIMITER ;

call GetMemberInfo1();