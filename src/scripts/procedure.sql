-- Increate participants of course one unit
CREATE OR REPLACE PROCEDURE increase_one_participant_course(course_id_increase INT)
LANGUAGE PLPGSQL
AS $$
BEGIN
   UPDATE course SET participants = participants + 1 WHERE course_id = course_id_increase;
END;
$$;

-- Procedure like comment
CREATE OR REPLACE PROCEDURE proc_like_comment(arg_user_id INT ,arg_comment_id INT) 
LANGUAGE PLPGSQL
AS $$
BEGIN
   INSERT INTO likes (user_id, comment_id) VALUES (arg_user_id, arg_comment_id);
   UPDATE comment SET total_like = total_like + 1 WHERE comment.comment_id = arg_comment_id;
END;
$$;

-- Procedure unlike comment
CREATE OR REPLACE PROCEDURE proc_unlike_comment(arg_user_id INT ,arg_comment_id INT) 
LANGUAGE PLPGSQL
AS $$
BEGIN
   DELETE FROM likes WHERE user_id = arg_user_id AND comment_id = arg_comment_id;
   UPDATE comment SET total_like = total_like - 1 WHERE comment.comment_id = arg_comment_id;
END;
$$;


