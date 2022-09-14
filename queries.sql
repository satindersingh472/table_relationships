
SELECT name, email, created_at, username  from blogger b where date(created_at) > '2020-01-01';
update blogger set password = 'bad_password' where password = 'pass'

SELECT bp.content,bp.title,b.username
from blogger b inner join blog_post bp on b.id = bp.blogger_id; 

SELECT bpc.content, bp.title,b.username
from blogger b inner join blog_post bp on b.id = bp.blogger_id inner join blog_post_comment bpc  on  bp.id = bpc.blog_post_id; 

SELECT id,content from blog_post_comment bpc where content like '%delete me%';
DELETE from blog_post_comment where content like '%delete me%';


