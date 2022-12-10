CREATE OR REPLACE FUNCTION fn_check_user_like(arg_user_id int, arg_comment_id int) RETURNS boolean AS 
$$
	DECLARE 
		isExist boolean;
	BEGIN
		SELECT * INTO isExist
		FROM likes
		WHERE user_id = arg_user_id AND comment_id = arg_comment_id;
		
		RETURN isExist;
	END;
$$ 
LANGUAGE plpgsql;