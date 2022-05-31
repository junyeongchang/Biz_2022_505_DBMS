-- cookcook 화면

create table tbl_content(
    postSeq int PRIMARY key,
	contentsTitle nvarchar2(100),
	contentsArticle nvarchar2(200),
	contentPhoto nvarchar2(100)
);

insert into tbl_content(postSeq,contentsTitle,contentsArticle,contentPhoto) values(3,'6464yjd6','6yk4uyfk64','');