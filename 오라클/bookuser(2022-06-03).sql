create table tbl_books(
    isbn VARCHAR2(13) primary key,
    title NVARCHAR2(50) not null,
    author NVARCHAR2(50) not null,
    publisher NVARCHAR2(50) not null,
    price NUMBER,
    discount NUMBER,
    description NVARCHAR2(2000),
    pubdate VARCHAR2(10),
    link VARCHAR2(120),
    image VARCHAR2(120)
);

INSERT INTO tbl_books(
			isbn,
    		title,
		    author,
		    publisher
		   
		) 
		values(
        '123412423',
    		'자바',
		    '자바자바',
		    '출판사'
			
		    
		);
select * from tbl_books;
