CREATE TABLE main_category(
    main_category_no NUMBER CONSTRAINT main_category_PK PRIMARY KEY NOT NULL
    , main_category_name VARCHAR(100) null
);

CREATE TABLE sub_category(
    sub_category_no NUMBER CONSTRAINT sub_category_PK PRIMARY KEY NOT NULL
    , main_category_no NUMBER NOT NULL
    , CONSTRAINT main_category_FK_sub_category FOREIGN KEY(main_category_no) REFERENCES main_category(main_category_no)
    
);

CREATE TABLE user_info(
    user_no NUMBER CONSTRAINT user_info_PK PRIMARY KEY NOT NULL
    , user_id VARCHAR2(100) NOT NULL UNIQUE
    , user_pw VARCHAR2(100) NOT NULL
    , user_gender VARCHAR2(10)
    , user_birthday DATE
    , user_phone VARCHAR2(50)
    , user_name VARCHAR2(50)
    , user_email VARCHAR2(100)
    , main_address VARCHAR2(1000)
    , sub_address VARCHAR2(1000)
    , user_post NUMBER
    , user_secession NUMBER
    , user_date_created DATE DEFAULT SYSDATE
);

CREATE TABLE admin(
    admin_no NUMBER CONSTRAINT admin_PK PRIMARY KEY NOT NULL
    , user_no NUMBER NOT NULL
    , CONSTRAINT user_info_FK_admin FOREIGN KEY(user_no) REFERENCES user_info(user_no)
);

CREATE TABLE teacher(
    teacher_no NUMBER CONSTRAINT teacher_PK PRIMARY KEY NOT NULL
    , user_no NUMBER NOT NULL
    , CONSTRAINT user_info_FK_teacher FOREIGN KEY(user_no) REFERENCES user_info(user_no)
    , teacher_img VARCHAR2(4000)
    , teacher_info LONG
    , teacher_career VARCHAR(4000)
);

CREATE TABLE teacher_apply(
    apply_no NUMBER CONSTRAINT teacher_apply_PK PRIMARY KEY NOT NULL
    , teacher_no NUMBER NOT NULL
    , CONSTRAINT teacher_FK_teacher_apply FOREIGN KEY(teacher_no) REFERENCES teacher(teacher_no)
    , pass_or_not VARCHAR2(10)
);

CREATE TABLE teacher_licence(
    licence_no NUMBER CONSTRAINT teacher_licence_PK PRIMARY KEY NOT NULL
    , teacher_no NUMBER NOT NULL
    , CONSTRAINT teacher_FK_teacher_licence FOREIGN KEY(teacher_no) REFERENCES teacher(teacher_no)
);

CREATE TABLE class(
    class_no NUMBER CONSTRAINT class_PK PRIMARY KEY NOT NULL
    , teacher_no NUMBER 
    , CONSTRAINT teacher_FK_class FOREIGN KEY(teacher_no) REFERENCES teacher(teacher_no)
    , main_category_no NUMBER 
    , CONSTRAINT main_category_FK_class FOREIGN KEY(main_category_no) REFERENCES main_category(main_category_no)
    , sub_category_no NUMBER 
    , CONSTRAINT sub_category_FK_class FOREIGN KEY(sub_category_no) REFERENCES sub_category(sub_category_no)
    , teacher VARCHAR2(50)
    , class_name VARCHAR2(500)
    , class_start DATE
    , class_end DATE
    , max_count NUMBER
    , expense NUMBER
    , class_info VARCHAR(4000)
    , curriculum VARCHAR(4000)
    , on_off number
    , content LONG
    , delete_boolean number  
);

CREATE TABLE class_video(
    video_no NUMBER CONSTRAINT class_video_PK PRIMARY KEY NOT NULL
    , class_no NUMBER NOT NULL
    , CONSTRAINT class_FK_class_video FOREIGN KEY(class_no) REFERENCES class(class_no)
    , video_lesson number
    , origin_name VARCHAR2(4000)
    , stored_name VARCHAR2(4000)
);    

CREATE TABLE class_list(
    list_no NUMBER CONSTRAINT class_list_PK PRIMARY KEY NOT NULL
    , user_no NUMBER NOT NULL
    , CONSTRAINT user_info_FK_class_list FOREIGN KEY(user_no) REFERENCES user_info(user_no)
    , class_no NUMBER NOT NULL
    , CONSTRAINT class_FK_class_list FOREIGN KEY(class_no) REFERENCES class(class_no)
    , teacher_no NUMBER 
    , CONSTRAINT teacher_FK_class_list FOREIGN KEY(teacher_no) REFERENCES teacher(teacher_no)
    
);

CREATE TABLE address(
    address_no NUMBER CONSTRAINT address_PK PRIMARY KEY NOT NULL
    , class_no NUMBER NOT NULL
    , CONSTRAINT class_FK_adress FOREIGN KEY(class_no) REFERENCES class(class_no)
    , latutude NUMBER 
    , longitude NUMBER
    , adress_name VARCHAR(500)
);    

CREATE TABLE question_answer(
    question_no NUMBER CONSTRAINT question_answer_PK PRIMARY KEY NOT NULL
    , user_no NUMBER NOT NULL
    , CONSTRAINT user_info_FK_question_answer FOREIGN KEY(user_no) REFERENCES user_info(user_no)
    , class_no NUMBER NOT NULL
    , CONSTRAINT class_FK_question_answer FOREIGN KEY(class_no) REFERENCES class(class_no)
    , question_name VARCHAR2(500)
    , question_content LONG 
    , question_date DATE DEFAULT SYSDATE
    , answer VARCHAR2(10)
    , answer_content VARCHAR2(4000)
);   

CREATE TABLE basket(
    basket_no NUMBER CONSTRAINT basket_PK PRIMARY KEY NOT NULL
    , user_no NUMBER NOT NULL
    , CONSTRAINT user_info_FK_basket FOREIGN KEY(user_no) REFERENCES user_info(user_no)
    , class_no NUMBER NOT NULL
    , CONSTRAINT class_FK_basket FOREIGN KEY(class_no) REFERENCES class(class_no)
);

CREATE TABLE order_tb(
    order_no NUMBER CONSTRAINT order_PK PRIMARY KEY NOT NULL
    , user_no NUMBER NOT NULL
    , CONSTRAINT user_info_FK_order FOREIGN KEY(user_no) REFERENCES user_info(user_no)
    , class_no NUMBER NOT NULL
    , CONSTRAINT class_FK_order FOREIGN KEY(class_no) REFERENCES class(class_no)
);
 
CREATE TABLE payment(
    pay_no NUMBER CONSTRAINT pay_PK PRIMARY KEY NOT NULL
    , order_no NUMBER NOT NULL
    , CONSTRAINT order_tb_FK_payment FOREIGN KEY(order_no) REFERENCES order_tb(order_no)
    , pay_date DATE DEFAULT SYSDATE
    , pay_acess VARCHAR2(500)
    , payment NUMBER
);    

CREATE TABLE event_board(
    event_no NUMBER CONSTRAINT event_PK PRIMARY KEY NOT NULL
    , user_no NUMBER NOT NULL
    , CONSTRAINT user_info_FK_event_board FOREIGN KEY(user_no) REFERENCES user_info(user_no)
    , event_head VARCHAR2(30)
    , event_date DATE DEFAULT SYSDATE
    , event_hit number
    , event_name VARCHAR(500)
    , event_content LONG
    , event_exist VARCHAR2(10)
);    
 
CREATE TABLE event_board_file(
    file_no NUMBER CONSTRAINT event_board_file_PK PRIMARY KEY NOT NULL
	, event_no NUMBER NOT NULL
    , CONSTRAINT event_board_FK_event_file FOREIGN KEY(event_no) REFERENCES event_board(event_no)
    , origin_name VARCHAR2(4000)
    , stored_name VARCHAR2(4000)
);

CREATE TABLE free_board(
    free_no NUMBER CONSTRAINT free_board_PK PRIMARY KEY NOT NULL
    , user_no NUMBER NOT NULL
    , CONSTRAINT user_info_FK_free_board FOREIGN KEY(user_no) REFERENCES user_info(user_no)
    , free_head VARCHAR(30)
    , free_date DATE DEFAULT SYSDATE
    , free_hit NUMBER
    , free_name VARCHAR(500)
    , free_content LONG
);    

CREATE TABLE free_board_file(
    file_no NUMBER CONSTRAINT free_board_file_PK PRIMARY KEY NOT NULL
	, free_no NUMBER NOT NULL
    , CONSTRAINT free_board_FK_free_file FOREIGN KEY(free_no) REFERENCES free_board(free_no)
    , origin_name VARCHAR2(4000)
    , stored_name VARCHAR2(4000)
);    

CREATE TABLE announce_board(
    announce_no NUMBER CONSTRAINT announce_PK PRIMARY KEY NOT NULL
	, user_no NUMBER NOT NULL
    , CONSTRAINT user_info_FK_announce_board FOREIGN KEY(user_no) REFERENCES user_info(user_no)
    , announce_head VARCHAR2(30)
    , announce_date DATE DEFAULT SYSDATE
    , announce_hit NUMBER
    , announce_name VARCHAR2(500)
    , announce_content LONG
    , announce_exist VARCHAR(10)
);

CREATE TABLE announce_board_file(
    file_no NUMBER CONSTRAINT announce_board_file_PK PRIMARY KEY NOT NULL
	, announce_no NUMBER NOT NULL
    , CONSTRAINT announce_FK_announce_file FOREIGN KEY(announce_no) REFERENCES announce_board(announce_no)
    , origin_name VARCHAR2(4000)
    , stored_name VARCHAR2(4000)
);    

CREATE TABLE question(
    question_no NUMBER CONSTRAINT question_PK PRIMARY KEY NOT NULL
	, user_no NUMBER NOT NULL
    , CONSTRAINT user_info_FK_question FOREIGN KEY(user_no) REFERENCES user_info(user_no)
    , question_category VARCHAR2(30)
    , question_name VARCHAR(500)
    , question_content LONG
    , question_date DATE DEFAULT SYSDATE
    , question_hit NUMBER
    , question_exist VARCHAR2(10)
    , answer VARCHAR(10)
    , answer_content VARCHAR(4000)
);

CREATE TABLE question_file(
    file_no NUMBER CONSTRAINT question_file_PK PRIMARY KEY NOT NULL
	, question_no NUMBER NOT NULL
    , CONSTRAINT question_FK_question_file FOREIGN KEY(question_no) REFERENCES question(question_no)
    , origin_name VARCHAR2(4000)
    , stored_name VARCHAR2(4000)
);    

CREATE TABLE general_question(
    qa_no NUMBER CONSTRAINT qa_PK PRIMARY KEY NOT NULL
	, qa_title VARCHAR2(1000)
    , qa_answer VARCHAR2(4000)
);

commit;
