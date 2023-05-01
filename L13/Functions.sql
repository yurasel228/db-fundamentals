--return initial_diagnosis and doctor_id from hospitalizations table by patient_id.
--If ID is incorect return message in output.
CREATE or replace FUNCTION hospitalization_by_id_patient(id int4)
RETURNS TABLE(diagnosis varchar(255), doctor_id_ int)
AS 
$$
begin
	RETURN QUERY SELECT initial_diagnosis as diagnosis, doctor_id as doctor_id_
	FROM hospitalizations WHERE patient_id = id;
  if not found then
     raise notice'The id could not be found';
  end if;
end;
$$ 
LANGUAGE plpgsql;

------------------------------



CREATE or replace FUNCTION sale(quantity int, 
list_price decimal(10,2), discount decimal(4,2)
)
RETURNS decimal(10,2)
LANGUAGE plpgsql
as
$$
begin
	RETURN quantity * list_price * (1-discount);
end
$$

select * from sale(2, 5, 0.2);
drop function  hospitalizations_by_id_patient(int4);