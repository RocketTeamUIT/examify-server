-- exam_series
insert into exam_series (name, total_exam, public_date, author, created_by) values ('ETS 2022', 0, '2021/12/13', 'Educational Testing Service', 1);
insert into exam_series (name, total_exam, public_date, author, created_by) values ('ETS 2021', 0, '2020/12/13', 'Educational Testing Service', 1);


-- exam
insert into exam (exam_series_id, name, audio, duration, file_download) values (1, 'ETS TOEIC 2022 TEST 1', 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_ets_2022_test01.mp3', 7200, 'https://www.africau.edu/images/default/sample.pdf');
insert into exam (exam_series_id, name, audio, duration, file_download) values (1, 'ETS TOEIC 2022 TEST 2', 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_ets_2022_test01.mp3', 7200, 'https://www.africau.edu/images/default/sample.pdf');
insert into exam (exam_series_id, name, audio, duration, file_download) values (1, 'ETS TOEIC 2022 TEST 3', 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_ets_2022_test01.mp3', 7200, 'https://www.africau.edu/images/default/sample.pdf');
insert into exam (exam_series_id, name, audio, duration, file_download) values (1, 'ETS TOEIC 2022 TEST 4', 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_ets_2022_test01.mp3', 7200, 'https://www.africau.edu/images/default/sample.pdf');
insert into exam (exam_series_id, name, audio, duration, file_download) values (1, 'ETS TOEIC 2022 TEST 5', 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_ets_2022_test01.mp3', 7200, 'https://www.africau.edu/images/default/sample.pdf');
insert into exam (exam_series_id, name, audio, duration, file_download) values (1, 'ETS TOEIC 2022 TEST 6', 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_ets_2022_test01.mp3', 7200, 'https://www.africau.edu/images/default/sample.pdf');
insert into exam (exam_series_id, name, audio, duration, file_download) values (1, 'ETS TOEIC 2022 TEST 7', 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_ets_2022_test01.mp3', 7200, 'https://www.africau.edu/images/default/sample.pdf');
insert into exam (exam_series_id, name, audio, duration, file_download) values (1, 'ETS TOEIC 2022 TEST 8', 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_ets_2022_test01.mp3', 7200, 'https://www.africau.edu/images/default/sample.pdf');
insert into exam (exam_series_id, name, audio, duration, file_download) values (1, 'ETS TOEIC 2022 TEST 9', 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_ets_2022_test01.mp3', 7200, 'https://www.africau.edu/images/default/sample.pdf');
insert into exam (exam_series_id, name, audio, duration, file_download) values (1, 'ETS TOEIC 2022 TEST 10', 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_ets_2022_test01.mp3', 7200, 'https://www.africau.edu/images/default/sample.pdf');
insert into exam (exam_series_id, name, audio, duration, file_download) values (2, 'ETS TOEIC 2022 TEST 1', 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_ets_2022_test01.mp3', 7200, 'https://www.africau.edu/images/default/sample.pdf');
insert into exam (exam_series_id, name, audio, duration, file_download) values (2, 'ETS TOEIC 2022 TEST 2', 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_ets_2022_test01.mp3', 7200, 'https://www.africau.edu/images/default/sample.pdf');

-- part
insert into part (exam_id, name, numeric_order) values (1, 'Part 1', 1);
insert into part (exam_id, name, numeric_order) values (1, 'Part 2', 2);
insert into part (exam_id, name, numeric_order) values (1, 'Part 3', 3);
insert into part (exam_id, name, numeric_order) values (1, 'Part 4', 4);
insert into part (exam_id, name, numeric_order) values (1, 'Part 5', 5);
insert into part (exam_id, name, numeric_order) values (1, 'Part 6', 6);
insert into part (exam_id, name, numeric_order) values (1, 'Part 7', 7);

-- hashtag
insert into hashtag (name) values ('[Part 1] Tranh tả người');
insert into hashtag (name) values ('[Part 1] Tranh tả vật');
insert into hashtag (name) values ('[Part 2] Câu hỏi 5W1H - what/ which');
insert into hashtag (name) values ('[Part 2] Câu hỏi 5W1H - who');
insert into hashtag (name) values ('[Part 2] Câu hỏi 5W1H - where');
insert into hashtag (name) values ('[Part 2] Câu hỏi 5W1H - when');
insert into hashtag (name) values ('[Part 2] Câu hỏi 5W1H - how');
insert into hashtag (name) values ('[Part 2] Câu hỏi 5W1H - why');
insert into hashtag (name) values ('[Part 2] Câu hỏi Yes/ No');
insert into hashtag (name) values ('[Part 2] Câu hỏi gián tiếp');
insert into hashtag (name) values ('[Part 2] Câu hỏi đuôi');
insert into hashtag (name) values ('[Part 2] Câu hỏi lựa chọn');
insert into hashtag (name) values ('[Part 2] Câu hỏi đề nghị, yêu cầu');
insert into hashtag (name) values ('[Part 2] Câu trần thuật');
insert into hashtag (name) values ('[Part 3] Câu hỏi về thông tin, danh tính người nói');
insert into hashtag (name) values ('[Part 3] Câu hỏi về chi tiết cuộc đối thoại');
insert into hashtag (name) values ('[Part 3] Câu hỏi về hành động trong tương lai');
insert into hashtag (name) values ('[Part 3] Câu hỏi kết hợp biểu đồ, bản đồ');
insert into hashtag (name) values ('[Part 3] Câu hỏi về ngụ ý câu nói');
insert into hashtag (name) values ('[Part 3] Nội dung: Company - General Office Work');
insert into hashtag (name) values ('[Part 3] Nội dung: Company - Greetings');
insert into hashtag (name) values ('[Part 3] Nội dung: Company - Events');
insert into hashtag (name) values ('[Part 3] Nội dung: Company - Facilities');
insert into hashtag (name) values ('[Part 3] Nội dung: Shopping');
insert into hashtag (name) values ('[Part 3] Nội dung: Order, shipping');
insert into hashtag (name) values ('[Part 3] Nội dung: Housing');
insert into hashtag (name) values ('[Part 4] Câu hỏi về chủ đề, mục đích');
insert into hashtag (name) values ('[Part 4] Câu hỏi về thông tin, danh tính người nói');
insert into hashtag (name) values ('[Part 4] Câu hỏi về chi tiết cuộc đối thoại');
insert into hashtag (name) values ('[Part 4] Câu hỏi về hành động trong tương lai');
insert into hashtag (name) values ('[Part 4] Câu hỏi kết hợp biểu đồ, bản đồ');
insert into hashtag (name) values ('[Part 4] Câu hỏi về ngụ ý câu nói');
insert into hashtag (name) values ('[Part 4] Hình thức: Telephone message');
insert into hashtag (name) values ('[Part 4] Hình thức: Advertisement');
insert into hashtag (name) values ('[Part 4] Hình thức: Announcement');
insert into hashtag (name) values ('[Part 4] Hình thức: Radio broadcast');
insert into hashtag (name) values ('[Part 4] Hình thức: Speech/ talk');
insert into hashtag (name) values ('[Part 5] Câu hỏi từ loại');
insert into hashtag (name) values ('[Part 5] Câu hỏi ngữ pháp');
insert into hashtag (name) values ('[Part 5] Câu hỏi từ vựng ');
insert into hashtag (name) values ('[Part 5] Câu hỏi từ loại');
insert into hashtag (name) values ('[Part 6] Câu hỏi ngữ pháp');
insert into hashtag (name) values ('[Part 6] Câu hỏi từ vựng');
insert into hashtag (name) values ('[Part 6] Câu hỏi điền câu');
insert into hashtag (name) values ('[Part 6] Hình thức: Thư điện tử/ thư tay (Email/ Letter)');
insert into hashtag (name) values ('[Part 6] Hình thức: Thông báo/ văn bản hướng dẫn (Notice/ Announcement Information)');
insert into hashtag (name) values ('[Part 7] Câu hỏi tìm thông tin: câu hỏi 5W1H');
insert into hashtag (name) values ('[Part 7] Câu hỏi tìm thông tin: câu hỏi NOT/ TRUE');
insert into hashtag (name) values ('[Part 7] Câu hỏi suy luận: câu hỏi về chủ đề, mục đích');
insert into hashtag (name) values ('[Part 7] Câu hỏi suy luận: câu hỏi 5W1H ');
insert into hashtag (name) values ('[Part 7] Câu hỏi suy luận: câu hỏi NOT/ TRUE');
insert into hashtag (name) values ('[Part 7] Câu hỏi điền câu');
insert into hashtag (name) values ('[Part 7] Cấu trúc: một đoạn');
insert into hashtag (name) values ('[Part 7] Cấu trúc: nhiều đoạn');
insert into hashtag (name) values ('[Part 7] Hình thức: Thư điện tử/ thư tay (Email/ Letter)');
insert into hashtag (name) values ('[Part 7] Hình thức: Bài báo (Article/ Review)');
insert into hashtag (name) values ('[Part 7] Hình thức: Quảng cáo (Advertisement)');
insert into hashtag (name) values ('[Part 7] Hình thức: Thông báo/ văn bản hướng dẫn (Notice/ Announcement information)');
insert into hashtag (name) values ('[Part 7] Hình thức: Chuỗi tin nhắn (Text message)');
insert into hashtag (name) values ('[Part 7] Câu hỏi tìm từ đồng nghĩa');
insert into hashtag (name) values ('[Part 7] Câu hỏi suy luận: câu hỏi về ngụ ý câu nói');

-- set_question
insert into set_question (part_id, title, numeric_order, audio) values (1, '', 1, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_1.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (1, '', 2, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_2.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (1, '', 3, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_3.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (1, '', 4, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_4.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (1, '', 5, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_5.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (1, '', 6, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_6.mp3');

insert into set_question (part_id, title, numeric_order, audio) values (2, '', 1, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_7.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (2, '', 2, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_8.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (2, '', 3, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_9.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (2, '', 4, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_10.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (2, '', 5, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_11.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (2, '', 6, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_12.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (2, '', 7, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_13.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (2, '', 8, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_14.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (2, '', 9, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_15.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (2, '', 10, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_16.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (2, '', 11, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_17.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (2, '', 12, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_18.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (2, '', 13, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_19.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (2, '', 14, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_20.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (2, '', 15, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_21.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (2, '', 16, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_22.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (2, '', 17, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_23.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (2, '', 18, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_24.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (2, '', 19, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_25.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (2, '', 20, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_26.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (2, '', 21, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_27.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (2, '', 22, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_28.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (2, '', 23, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_29.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (2, '', 24, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_30.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (2, '', 25, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_31.mp3');

insert into set_question (part_id, title, numeric_order, audio) values (3, '', 1, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_32_34.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (3, '', 2, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_35_37.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (3, '', 3, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_38_40.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (3, '', 4, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_41_43.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (3, '', 5, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_44_46.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (3, '', 6, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_47_49.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (3, '', 7, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_50_52.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (3, '', 8, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_53_55.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (3, '', 9, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_56_58.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (3, '', 10, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_59_61.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (3, '', 11, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_62_64.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (3, '', 12, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_65_67.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (3, '', 13, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_68_70.mp3');

insert into set_question (part_id, title, numeric_order, audio) values (4, '', 1, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_71_73.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (4, '', 2, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_74_76.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (4, '', 3, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_77_79.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (4, '', 4, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_80_82.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (4, '', 5, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_83_85.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (4, '', 6, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_86_88.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (4, '', 7, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_89_91.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (4, '', 8, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_92_94.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (4, '', 9, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_95_97.mp3');
insert into set_question (part_id, title, numeric_order, audio) values (4, '', 10, 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_98_100.mp3');

insert into set_question (part_id, title, numeric_order) values (5, '', 1);
insert into set_question (part_id, title, numeric_order) values (5, '', 2);
insert into set_question (part_id, title, numeric_order) values (5, '', 3);
insert into set_question (part_id, title, numeric_order) values (5, '', 4);
insert into set_question (part_id, title, numeric_order) values (5, '', 5);
insert into set_question (part_id, title, numeric_order) values (5, '', 6);
insert into set_question (part_id, title, numeric_order) values (5, '', 7);
insert into set_question (part_id, title, numeric_order) values (5, '', 8);
insert into set_question (part_id, title, numeric_order) values (5, '', 9);
insert into set_question (part_id, title, numeric_order) values (5, '', 10);
insert into set_question (part_id, title, numeric_order) values (5, '', 11);
insert into set_question (part_id, title, numeric_order) values (5, '', 12);
insert into set_question (part_id, title, numeric_order) values (5, '', 13);
insert into set_question (part_id, title, numeric_order) values (5, '', 14);
insert into set_question (part_id, title, numeric_order) values (5, '', 15);
insert into set_question (part_id, title, numeric_order) values (5, '', 16);
insert into set_question (part_id, title, numeric_order) values (5, '', 17);
insert into set_question (part_id, title, numeric_order) values (5, '', 18);
insert into set_question (part_id, title, numeric_order) values (5, '', 19);
insert into set_question (part_id, title, numeric_order) values (5, '', 20);
insert into set_question (part_id, title, numeric_order) values (5, '', 21);
insert into set_question (part_id, title, numeric_order) values (5, '', 22);
insert into set_question (part_id, title, numeric_order) values (5, '', 23);
insert into set_question (part_id, title, numeric_order) values (5, '', 24);
insert into set_question (part_id, title, numeric_order) values (5, '', 25);
insert into set_question (part_id, title, numeric_order) values (5, '', 26);
insert into set_question (part_id, title, numeric_order) values (5, '', 27);
insert into set_question (part_id, title, numeric_order) values (5, '', 28);
insert into set_question (part_id, title, numeric_order) values (5, '', 29);
insert into set_question (part_id, title, numeric_order) values (5, '', 30);

insert into set_question (part_id, title, numeric_order) values (6, 'refer to the following notice.', 1);
insert into set_question (part_id, title, numeric_order) values (6, 'refer to the following customer review.', 2);
insert into set_question (part_id, title, numeric_order) values (6, 'refer to the following letter.', 3);
insert into set_question (part_id, title, numeric_order) values (6, 'refer to the following e-mail.', 4);

insert into set_question (part_id, title, numeric_order) values (7, 'refer to the following Web page.', 1);
insert into set_question (part_id, title, numeric_order) values (7, 'refer to the following job advertisement.', 2);
insert into set_question (part_id, title, numeric_order) values (7, 'refer to the following report.', 3);
insert into set_question (part_id, title, numeric_order) values (7, 'refer to the following e-mail.', 4);
insert into set_question (part_id, title, numeric_order) values (7, 'refer to the following article.', 5);
insert into set_question (part_id, title, numeric_order) values (7, 'refer to the following text-message chain.', 6);
insert into set_question (part_id, title, numeric_order) values (7, 'refer to the following e-mail.', 7);
insert into set_question (part_id, title, numeric_order) values (7, 'refer to the following information.', 8);
insert into set_question (part_id, title, numeric_order) values (7, 'refer to the following letter.', 9);
insert into set_question (part_id, title, numeric_order) values (7, 'refer to the following online chat discussion.', 10);
insert into set_question (part_id, title, numeric_order) values (7, 'refer to the following article and letter.', 11);
insert into set_question (part_id, title, numeric_order) values (7, 'refer to the following Web page and review.', 12);
insert into set_question (part_id, title, numeric_order) values (7, 'refer to the following e-mails and notice.', 13);
insert into set_question (part_id, title, numeric_order) values (7, 'refer to the following article, e-mail, and plan.', 14);
insert into set_question (part_id, title, numeric_order) values (7, 'refer to the following e-mails and price list.', 15);



-- question
-- Part 1
insert into question (set_question_id, hashtag_id, name, order_qn, explain) values (1, 1, '', 1, '<figure class="table"><table><tbody><tr><td><strong>Câu</strong></td><td><strong>ĐA</strong></td><td><strong>Lời thoại</strong></td><td><strong>Lí do loại/chọn</strong></td><td><strong>Dịch nghĩa</strong></td></tr><tr><td><strong>1</strong></td><td>A</td><td>He’s parking a truck</td><td>Sai verb</td><td><i>Anh ấy đang đậu xe tải</i></td></tr><tr><td>&nbsp;</td><td><strong>B</strong></td><td><strong>He’s lifting some furniture</strong></td><td>Đúng verb</td><td><strong>Anh ấy đang nâng đồ nội thất lên</strong></td></tr><tr><td>&nbsp;</td><td>C</td><td>He’s starting an engine</td><td>Sai verb</td><td><i>Anh ấy đang bắt đầu khởi động máy</i></td></tr><tr><td>&nbsp;</td><td>D</td><td>He’s driving a car</td><td>Sai verb</td><td><i>Anh ấy đang lái xe</i></td></tr></tbody></table></figure><p>&nbsp;</p><p>Từ vựng:</p><ol><li>parking(v): đậu, đỗ&nbsp;</li><li>lift(v): nâng</li><li>start an engine: khởi động máy</li></ol>');
insert into question (set_question_id, hashtag_id, name, order_qn, explain) values (2, 1, '', 2, '<figure class="table"><table><tbody><tr><td><strong>Câu</strong></td><td><strong>ĐA</strong></td><td><strong>Lời thoại</strong></td><td><strong>Lí do loại/chọn</strong></td><td><strong>Dịch nghĩa</strong></td></tr><tr><td><strong>2</strong></td><td>A</td><td>Some curtains have been closed</td><td>Sai verb (đúng phải là opened)</td><td><i>Rèn cửa bị đóng lại</i></td></tr><tr><td>&nbsp;</td><td>B</td><td>Some jackets have been laid on a chair</td><td>Không xuất hiện jackets trong tranh</td><td><i>Một vài cái áo khoác được đặt trên một cái</i> <i>ghế</i></td></tr><tr><td>&nbsp;</td><td><strong>C</strong></td><td><strong>Some people are gathered around a</strong> <strong>desk</strong></td><td>Đúng verb</td><td><strong>Một vài người đang tập hợp xunh quanh</strong> <strong>một cái bàn</strong></td></tr><tr><td>&nbsp;</td><td>D</td><td>Someone is turning on a lamp</td><td>Không ai chạm vào đèn</td><td><i>Một người nào đó đang bật đèn bàn</i></td></tr></tbody></table></figure>');
insert into question (set_question_id, hashtag_id, name, order_qn, explain) values (3, 1, '', 3, '<figure class="table"><table><tbody><tr><td><strong>Câu</strong></td><td><strong>ĐA</strong></td><td><strong>Lời thoại</strong></td><td><strong>Lí do loại/chọn</strong></td><td><strong>Dịch nghĩa</strong></td></tr><tr><td><strong>3</strong></td><td>A</td><td>One of the women is reaching into her bag</td><td>Sai verb (đúng phải là wearing/ carrying her bag)</td><td><i>Một người phụ nữ đang tiếp cận (lục tìm) bên trong túi xách của cô ấy.</i></td></tr><tr><td>&nbsp;</td><td><strong>B</strong></td><td><strong>The women are waiting in line</strong></td><td>Đúng verb</td><td><strong>Những người phụ nữ đang đợi thành một</strong> <strong>hàng</strong></td></tr><tr><td>&nbsp;</td><td>C</td><td>The man is leading a tour group</td><td>Sai verb</td><td><i>Người đàn ông đang dẫn dắt một nhóm</i> <i>người</i></td></tr><tr><td>&nbsp;</td><td>D</td><td>The man is opening a cash register</td><td>Sai verb</td><td><i>Người đàn ông đang mở máy tính tiền</i></td></tr></tbody></table></figure>');
insert into question (set_question_id, hashtag_id, name, order_qn, explain) values (4, 1, '', 4, '<figure class="table"><table><tbody><tr><td><strong>Câu</strong></td><td><strong>ĐA</strong></td><td><strong>Lời thoại</strong></td><td><strong>Lí do loại/chọn</strong></td><td><strong>Dịch nghĩa</strong></td></tr><tr><td>4</td><td><strong>A</strong></td><td><strong>The man is bending over a bicycle</strong></td><td>Đúng verb</td><td><strong>Người đàn ông đang cúi người xuống chiếc xe đạp</strong></td></tr><tr><td>&nbsp;</td><td>B</td><td>A wheel has been propped against a stack of bricks.</td><td>Sai verb</td><td><i>Một bánh xe được chống đỡ khỏi một chồng</i> <i>gạch</i></td></tr><tr><td>&nbsp;</td><td>C</td><td>The man is collecting some pieces of wood</td><td>Sai verb</td><td><i>Người đàn ông đang thu thập một vài miếng</i> <i>gỗ</i></td></tr><tr><td>&nbsp;</td><td>D</td><td>A handrail is being installed</td><td>Sai verb (không ai đụng vào lan can, nên lan can không thể nào đang được lắp đặt)</td><td><i>Một cái lan can cầu thang đang được lắp đặt</i></td></tr></tbody></table></figure>');
insert into question (set_question_id, hashtag_id, name, order_qn, explain) values (5, 2, '', 5, '<figure class="table"><table><tbody><tr><td><strong>Câu</strong></td><td><strong>ĐA</strong></td><td><strong>Lời thoại</strong></td><td><strong>Lí do loại/chọn</strong></td><td><strong>Dịch nghĩa</strong></td></tr><tr><td><strong>5</strong></td><td>A</td><td>An armchair has been placed under a window</td><td>Không xuất hiện window trong tranh</td><td><i>Một cái ghế được đặt ở phía dưới cửa sổ</i></td></tr><tr><td>&nbsp;</td><td>B</td><td>Some reading materials have fallen on the floor.</td><td>Không xuất hiện reading materials trong tranh</td><td><i>Một vài tài liệu đọc (sách) đã rơi xuống sàn</i></td></tr><tr><td>&nbsp;</td><td>C</td><td>Some flowers are being watered.</td><td>Loại being V3 với tranh không người.</td><td><i>Một vài bông hoa đang được tưới nước</i></td></tr><tr><td>&nbsp;</td><td><strong>D</strong></td><td><strong>Some picture frames are hanging on</strong> <strong>a wall</strong></td><td>&nbsp;</td><td><strong>Một vài khung ảnh đang treo trên tường.</strong></td></tr></tbody></table></figure>');
insert into question (set_question_id, hashtag_id, name, order_qn, explain) values (6, 2, '', 6, '<figure class="table"><table><tbody><tr><td><strong>Câu</strong></td><td><strong>ĐA</strong></td><td><strong>Lời thoại</strong></td><td><strong>Lí do loại/chọn</strong></td><td><strong>Dịch nghĩa</strong></td></tr><tr><td><strong>6</strong></td><td>A</td><td>She’s adjusting the height of an umbrella.</td><td>Sai Verb</td><td><i>Cô ấy đang điều chỉnh độ cao của chiếc ô</i></td></tr><tr><td>&nbsp;</td><td>B</td><td>She’s inspecting the tires on a vending cart.</td><td>Sai verb</td><td><i>Cô ấy đang kiểm tra lốp xe trên chiếc xe đẩy</i> <i>bán hàng</i></td></tr><tr><td>&nbsp;</td><td><strong>C</strong></td><td><strong>There’s a mobile food stand on a</strong> <strong>walkway.</strong></td><td>Đúng tình huống</td><td><strong>Có một quầy bán đồ ăn di động trên</strong> <strong>đường đi</strong></td></tr><tr><td>&nbsp;</td><td>D</td><td>There are some cooking utensils on the ground.</td><td>Không có gì trên mặt đất cả</td><td><i>Có một vài dụng cụ nấu ăn trên mặt đất</i></td></tr></tbody></table></figure>');

-- Part 2
insert into question (set_question_id, hashtag_id, name, order_qn, explain) values (7, 3, '', 7, '<figure class="table"><table><tbody><tr><td><strong>Câu</strong></td><td><strong>ĐA</strong></td><td><strong>Lời thoại</strong></td><td><strong>Lí do loại/chọn</strong></td><td><strong>Dịch nghĩa</strong></td></tr><tr><td>7</td><td>&nbsp;</td><td><strong>Why </strong>was this afternoon’s meeting cancelled?</td><td>&nbsp;</td><td>Tại sao cuộc họp chiều nay bị hủy?</td></tr><tr><td>&nbsp;</td><td>A</td><td>whim 206 I think</td><td>Không hợp nghĩa</td><td>206 tôi nghĩ vậy</td></tr><tr><td>&nbsp;</td><td><strong>B</strong></td><td>Because the manager is out of the office.</td><td>Hợp nghĩa</td><td>Bởi vì quản lý không có ở văn phòng</td></tr><tr><td>&nbsp;</td><td>C</td><td>Let’s review the itinerary for our trip</td><td>Không hợp nghĩa</td><td>Hãy xem xét lịch trình cho chuyến đi của chúng ta.</td></tr></tbody></table></figure>');
insert into question (set_question_id, hashtag_id, name, order_qn, explain) values (8, 3, '', 8, '<figure class="table"><table><tbody><tr><td><strong>Câu</strong></td><td><strong>ĐA</strong></td><td><strong>Lời thoại</strong></td><td><strong>Lí do loại/chọn</strong></td><td><strong>Dịch nghĩa</strong></td></tr><tr><td>8</td><td>&nbsp;</td><td>You use the company fitness center, <strong>don’t you?</strong></td><td>&nbsp;</td><td>Bạn sử dụng phòng tập thể hình của công ty phải không?</td></tr><tr><td>&nbsp;</td><td><strong>A</strong></td><td>Yes. Every now and then</td><td>Hợp nghĩa</td><td>Vâng, thỉnh thoảng ạ.</td></tr><tr><td>&nbsp;</td><td>B</td><td>Please send her the text on the page.</td><td>Không hợp nghĩa</td><td>Làm ơn gửi cho cô ấy đoạn văn bản trên trang này.</td></tr><tr><td>&nbsp;</td><td>C</td><td>I think it fits you well.</td><td>Bẫy đồng âm fit &gt;&lt; fitness</td><td>Tôi nghĩ nó rất vừa vặn với bạn</td></tr></tbody></table></figure>');
insert into question (set_question_id, hashtag_id, name, order_qn, explain) values (9, 3, '', 9, '<figure class="table"><table><tbody><tr><td><strong>Câu</strong></td><td><strong>ĐA</strong></td><td><strong>Lời thoại</strong></td><td><strong>Lí do loại/chọn</strong></td><td><strong>Dịch nghĩa</strong></td></tr><tr><td>9</td><td>&nbsp;</td><td><strong>Do you have </strong>the images from the graphics department?</td><td>&nbsp;</td><td>Bạn có những bức ảnh từ phòng đồ họa không?</td></tr><tr><td>&nbsp;</td><td>A</td><td>Okay, that won’t be a problem.</td><td>Không hợp nghĩa</td><td>Được rồi, đó không phải là vấn đề</td></tr><tr><td>&nbsp;</td><td>B</td><td>A high definition camera.</td><td>Không hợp nghĩa</td><td>Một chiếc camera độ nét cao</td></tr><tr><td>&nbsp;</td><td><strong>C</strong></td><td>No, they’re not ready yet.</td><td>Hợp nghĩa</td><td>Không, chúng vẫn chưa sẵn sàng</td></tr></tbody></table></figure>');
insert into question (set_question_id, hashtag_id, name, order_qn, explain) values (10, 4, '', 10, '<figure class="table"><table><tbody><tr><td><strong>Câu</strong></td><td><strong>ĐA</strong></td><td><strong>Lời thoại</strong></td><td><strong>Lí do loại/chọn</strong></td><td><strong>Dịch nghĩa</strong></td></tr><tr><td>10</td><td>&nbsp;</td><td><strong>When </strong>are you moving to your new office?</td><td>&nbsp;</td><td>Khi nào bạn chuyển tới văn phòng mới?</td></tr><tr><td>&nbsp;</td><td>A</td><td>The office printer over there.</td><td>Bẫy đồng âm office</td><td>Máy in văn phòng ở đằng kia</td></tr><tr><td>&nbsp;</td><td>B</td><td>The water bill is high this month.</td><td>Không hợp nghĩa</td><td>Hóa đơn nước tháng này cao quá.</td></tr><tr><td>&nbsp;</td><td><strong>C</strong></td><td>The schedule is being revised.</td><td>Hợp nghĩa (câu trả lời gián tiếp)</td><td>Lịch trình đang được sửa đổi (nên chưa biết khi nào để trả lời).</td></tr></tbody></table></figure>');
insert into question (set_question_id, hashtag_id, name, order_qn) values (11, 6, '', 11);
insert into question (set_question_id, hashtag_id, name, order_qn) values (12, 7, '', 12);
insert into question (set_question_id, hashtag_id, name, order_qn) values (13, 4, '', 13);
insert into question (set_question_id, hashtag_id, name, order_qn) values (14, 4, '', 14);
insert into question (set_question_id, hashtag_id, name, order_qn) values (15, 4, '', 15);
insert into question (set_question_id, hashtag_id, name, order_qn) values (16, 5, '', 16);
insert into question (set_question_id, hashtag_id, name, order_qn) values (17, 5, '', 17);
insert into question (set_question_id, hashtag_id, name, order_qn) values (18, 5, '', 18);
insert into question (set_question_id, hashtag_id, name, order_qn) values (19, 6, '', 19);
insert into question (set_question_id, hashtag_id, name, order_qn) values (20, 6, '', 20);
insert into question (set_question_id, hashtag_id, name, order_qn) values (21, 7, '', 21);
insert into question (set_question_id, hashtag_id, name, order_qn) values (22, 3, '', 22);
insert into question (set_question_id, hashtag_id, name, order_qn) values (23, 4, '', 23);
insert into question (set_question_id, hashtag_id, name, order_qn) values (24, 3, '', 24);
insert into question (set_question_id, hashtag_id, name, order_qn) values (25, 7, '', 25);
insert into question (set_question_id, hashtag_id, name, order_qn) values (26, 5, '', 26);
insert into question (set_question_id, hashtag_id, name, order_qn) values (27, 4, '', 27);
insert into question (set_question_id, hashtag_id, name, order_qn) values (28, 4, '', 28);
insert into question (set_question_id, hashtag_id, name, order_qn) values (29, 5, '', 29);
insert into question (set_question_id, hashtag_id, name, order_qn) values (30, 3, '', 30);
insert into question (set_question_id, hashtag_id, name, order_qn) values (31, 7, '', 31);

-- Part 3
insert into question (set_question_id, hashtag_id, name, order_qn) values (32, 15 , 'What is the woman preparing for?', 32);
insert into question (set_question_id, hashtag_id, name, order_qn) values (32, 26 , 'Who most likely is the man?', 33);
insert into question (set_question_id, hashtag_id, name, order_qn) values (32, 16 , 'What does the woman want to pick up on Friday morning?', 34);
insert into question (set_question_id, hashtag_id, name, order_qn) values (33, 16 , 'What task is the man responsible for?', 35);
insert into question (set_question_id, hashtag_id, name, order_qn) values (33, 18 , 'What does the woman want to do next year?', 36);
insert into question (set_question_id, hashtag_id, name, order_qn) values (33, 26 , 'What does the man ask the woman to do?', 37);
insert into question (set_question_id, hashtag_id, name, order_qn) values (34, 24 , 'What does the woman need a suit for?', 38);
insert into question (set_question_id, hashtag_id, name, order_qn) values (34, 15 , 'What does the woman dislike about a suit on a display?', 39);
insert into question (set_question_id, hashtag_id, name, order_qn) values (34, 16 , 'What does the man say that the price includes?', 40);
insert into question (set_question_id, hashtag_id, name, order_qn) values (35, 26 , 'What kind of a business does the man most likely work for?', 41);
insert into question (set_question_id, hashtag_id, name, order_qn) values (35, 26 , 'What does the woman say she is concerned about?', 42);
insert into question (set_question_id, hashtag_id, name, order_qn) values (35, 24 , 'What does the woman agree to let the man do?', 43);
insert into question (set_question_id, hashtag_id, name, order_qn) values (36, 23 , 'Who most likely is Axel Schmidt?', 44);
insert into question (set_question_id, hashtag_id, name, order_qn) values (36, 23 , 'What renovation does the woman mention?', 45);
insert into question (set_question_id, hashtag_id, name, order_qn) values (36, 23 , 'What does the woman encourage the man to do?', 46);
insert into question (set_question_id, hashtag_id, name, order_qn) values (37, 15 , 'What is the woman preparing for?', 47);

insert into question (set_question_id, hashtag_id, name, order_qn) values (37, 15 ,'Why is the woman surprised?', 48);
insert into question (set_question_id, hashtag_id, name, order_qn) values (37, 17 ,'Why does the woman say, "The slides are available on our company intranet"?', 49);
insert into question (set_question_id, hashtag_id, name, order_qn) values (38, 17 ,'According to the woman, what will happen at the end of November?', 50);
insert into question (set_question_id, hashtag_id, name, order_qn) values (38, 17,'What does the man want to know?', 51);
insert into question (set_question_id, hashtag_id, name, order_qn) values (38, 18 ,'What does the woman say the company will pay for?', 52);
insert into question (set_question_id, hashtag_id, name, order_qn) values (39, 18 ,'What industry do the speakers work in?', 53);
insert into question (set_question_id, hashtag_id, name, order_qn) values (39, 18 ,'What does the woman say a project will do for a city?', 54);
insert into question (set_question_id, hashtag_id, name, order_qn) values (39, 19 ,'What does Gerhard say needs to be done?', 55);
insert into question (set_question_id, hashtag_id, name, order_qn) values (40, 19 ,'What does the woman imply when she says, "I dont have much to do"?', 56);
insert into question (set_question_id, hashtag_id, name, order_qn) values (40, 19 ,'What does the man notice about some medication?', 57);
insert into question (set_question_id, hashtag_id, name, order_qn) values (40, 19 ,'What does the man suggest doing in the future?', 58);

insert into question (set_question_id, hashtag_id, name, order_qn) values (41, 20 ,'Who most likely is the woman?', 59);
insert into question (set_question_id, hashtag_id, name, order_qn) values (41, 20 ,'What kind of document are the speakers discussing?', 60);
insert into question (set_question_id, hashtag_id, name, order_qn) values (41, 21 ,'Why must the document be revised by the end of the month?', 61);
insert into question (set_question_id, hashtag_id, name, order_qn) values (42, 21 ,'Look at the graphic. How much did the man''s company charge for its service?', 62);
insert into question (set_question_id, hashtag_id, name, order_qn) values (42, 20 ,'Why does the man apologize?', 63);
insert into question (set_question_id, hashtag_id, name, order_qn) values (42, 19 ,'What does the woman like about a venue?', 64);
insert into question (set_question_id, hashtag_id, name, order_qn) values (43, 19 ,'Why is the man surprised?', 65);
insert into question (set_question_id, hashtag_id, name, order_qn) values (43, 18 ,'Look at the graphic. In which section does the woman have seats?', 66);
insert into question (set_question_id, hashtag_id, name, order_qn) values (43, 18 ,'What is the woman doing this weekend?', 67);
insert into question (set_question_id, hashtag_id, name, order_qn) values (44, 18 ,'Who most likely is the man?', 68);
insert into question (set_question_id, hashtag_id, name, order_qn) values (44, 17 ,'Look at the graphic. Which name needs to be changed?', 69);
insert into question (set_question_id, hashtag_id, name, order_qn) values (44, 17 ,'What does the woman say she is going to do tomorrow?', 70);

-- Part 4
insert into question (set_question_id, hashtag_id, name, order_qn) values (45, 30,'What kind of business is the speaker most likely calling?', 71);
insert into question (set_question_id, hashtag_id, name, order_qn) values (45, 32,'What does the speaker say about her appointment?', 72);
insert into question (set_question_id, hashtag_id, name, order_qn) values (45, 28,'What is the speaker interested in learning more about?', 73);
insert into question (set_question_id, hashtag_id, name, order_qn) values (46, 27,'What is being advertised?', 74);
insert into question (set_question_id, hashtag_id, name, order_qn) values (46, 27,'What will participants receive?', 75);
insert into question (set_question_id, hashtag_id, name, order_qn) values (46, 36,'What can the listeners do on a Web site?', 76);
insert into question (set_question_id, hashtag_id, name, order_qn) values (47, 35,'Where does the announcement take place?', 77);
insert into question (set_question_id, hashtag_id, name, order_qn) values (47, 35,'LWhy does the speaker apologize?', 78);
insert into question (set_question_id, hashtag_id, name, order_qn) values (47, 36,'What does the speaker offer the listeners?', 79);
insert into question (set_question_id, hashtag_id, name, order_qn) values (48, 30,'What event is taking place?', 80);
insert into question (set_question_id, hashtag_id, name, order_qn) values (48, 30,'Why does the speaker say, "And over 300 people are here"?', 81);
insert into question (set_question_id, hashtag_id, name, order_qn) values (48, 31,'What does the speaker ask the listeners to do?', 82);
 
insert into question (set_question_id, hashtag_id, name, order_qn) values (49, 31,'What is the purpose of the plan?', 83);
insert into question (set_question_id, hashtag_id, name, order_qn) values (49, 32,'Who does the speaker say will receive a discount?', 84);
insert into question (set_question_id, hashtag_id, name, order_qn) values (49, 32,'What will happen after three months?', 85);
insert into question (set_question_id, hashtag_id, name, order_qn) values (50, 27,'What event is the speaker discussing?', 86);
insert into question (set_question_id, hashtag_id, name, order_qn) values (50, 37,'Why does the speaker say, "tickets are almost sold out"?', 87);
insert into question (set_question_id, hashtag_id, name, order_qn) values (50, 37,'What will happen tomorrow morning?', 88);
insert into question (set_question_id, hashtag_id, name, order_qn) values (51, 35,'What type of business does the speaker work for?', 89);
insert into question (set_question_id, hashtag_id, name, order_qn) values (51, 35,'What does the speaker say is an advantage of the new material?', 90);
insert into question (set_question_id, hashtag_id, name, order_qn) values (51, 29,'What will the listeners do next?', 91);
insert into question (set_question_id, hashtag_id, name, order_qn) values (52, 29,'Which department does the speaker work in?', 92);
insert into question (set_question_id, hashtag_id, name, order_qn) values (52, 30,'Why does the speaker say, "there is a need for a skilled software engineer"?', 93);
insert into question (set_question_id, hashtag_id, name, order_qn) values (52, 33,'What does the speaker want to discuss with the listener?', 94);
insert into question (set_question_id, hashtag_id, name, order_qn) values (53, 34,'Why are guests invited on the speakers radio show?', 95);
insert into question (set_question_id, hashtag_id, name, order_qn) values (53, 35,'What can the listeners do on a Web site?', 96);
insert into question (set_question_id, hashtag_id, name, order_qn) values (53, 32,'Look at the graphic. Which day is this episode being aired?', 97);
insert into question (set_question_id, hashtag_id, name, order_qn) values (54, 31,'Look at the graphic. Where will the scarves and ties be displayed?', 98);
insert into question (set_question_id, hashtag_id, name, order_qn) values (54, 30,'What should be displayed near the cash registers?', 99);
insert into question (set_question_id, hashtag_id, name, order_qn) values (54, 29,'What should the listener expect to receive in an e-mail?', 100);

-- Part 5
insert into question (set_question_id, hashtag_id, name, order_qn) values (55, 41 ,'Mougey Fine Gifts is known for its large range of _____ goods.', 101);
insert into question (set_question_id, hashtag_id, name, order_qn) values (56, 41 ,'Income levels are rising in the _____ and surrounding areas.', 102);
insert into question (set_question_id, hashtag_id, name, order_qn) values (57, 38 ,'Since we had a recent rate change, expect _____ next electricity bill to be slightly lower.', 103);
insert into question (set_question_id, hashtag_id, name, order_qn) values (58, 39 ,'Hotel guests have a lovely view of the ocean _____ the south-facing windows.', 104);
insert into question (set_question_id, hashtag_id, name, order_qn) values (59, 40 ,'Mr. Kim would like _____ a meeting about the Jasper account as soon as possible.', 105);
insert into question (set_question_id, hashtag_id, name, order_qn) values (60, 38 ,'The factory is _____ located near the train station.', 106);
insert into question (set_question_id, hashtag_id, name, order_qn) values (61, 38 ,'Because of transportation _____ due to winter weather, some conference participants may arrive late.', 107);
insert into question (set_question_id, hashtag_id, name, order_qn) values (62, 38 ,'Proper maintenance of your heating equipment ensures that small issues can be fixed _____ they become big ones.', 108);
insert into question (set_question_id, hashtag_id, name, order_qn) values (63, 39 ,'The information on the Web site of Croyell Decorators is _____ organized.', 109);
insert into question (set_question_id, hashtag_id, name, order_qn) values (64, 41 ,'The Copley Corporation is frequently _____ as a company that employs workers from all over the world.', 110);
insert into question (set_question_id, hashtag_id, name, order_qn) values (65, 41 ,'Payments made _____ 4:00 P.M. will be processed on the following business day.', 111);
insert into question (set_question_id, hashtag_id, name, order_qn) values (66, 41,'Greenfiddle Water Treatment hires engineers who have _____ mathematics skills.', 112);
insert into question (set_question_id, hashtag_id, name, order_qn) values (67, 38,'After _____ the neighborhood, Mr. Park decided not to move his café to Thomasville.', 113);
insert into question (set_question_id, hashtag_id, name, order_qn) values (68, 39,'The average precipitation in Campos _____ the past three years has been 7 centimeters.', 114);
insert into question (set_question_id, hashtag_id, name, order_qn) values (69, 41,'Improving efficiency at Perwon Manufacturing will require a _____ revision of existing processes.', 115);
insert into question (set_question_id, hashtag_id, name, order_qn) values (70, 41,'Conference attendees will share accommodations _____ they submit a special request for a single room.', 116);
insert into question (set_question_id, hashtag_id, name, order_qn) values (71, 40,'To receive _____, please be sure the appropriate box is checked on the magazine order form.', 117);
insert into question (set_question_id, hashtag_id, name, order_qn) values (72, 39,'Donations to the Natusi Wildlife Reserve rise when consumers feel _____ about the economy.', 118);
insert into question (set_question_id, hashtag_id, name, order_qn) values (73, 38,'When _____ applied, Tilda`s Restorative Cream reduces the appearance of fine lines and wrinkles.', 119);
insert into question (set_question_id, hashtag_id, name, order_qn) values (74, 40,'The marketing director confirmed that the new software program would be ready to _____ by November', 120);
insert into question (set_question_id, hashtag_id, name, order_qn) values (75, 41,'Satinesse Seat Covers will refund your order _____ you are not completely satisfied.', 121);
insert into question (set_question_id, hashtag_id, name, order_qn) values (76, 38,'In the last five years, production at the Harris facility has almost doubled in_____.', 122);
insert into question (set_question_id, hashtag_id, name, order_qn) values (77, 39,'Ms. Tsai will _____ the installation of the new workstations with the vendor.', 123);
insert into question (set_question_id, hashtag_id, name, order_qn) values (78, 40,'An upgrade in software would _____ increase the productivity of our administrative staff.', 124);
insert into question (set_question_id, hashtag_id, name, order_qn) values (79, 41,'The Rustic Diner`s chef does allow patrons to make menu _____.', 125);
insert into question (set_question_id, hashtag_id, name, order_qn) values (80, 40,'Ms. Rodriguez noted that it is important to _____ explicit policies regarding the use of company computers.', 126);
insert into question (set_question_id, hashtag_id, name, order_qn) values (81, 39,'_____ Peura Insurance has located a larger office space, it will begin negotiating the rental agreement.', 127);
insert into question (set_question_id, hashtag_id, name, order_qn) values (82, 38,'Mr. Tanaka`s team worked _____ for months to secure a lucrative government contract.', 128);
insert into question (set_question_id, hashtag_id, name, order_qn) values (83, 37,'Though Sendak Agency`s travel insurance can be purchased over the phone, most of _____ plans are bought online.', 129);
insert into question (set_question_id, hashtag_id, name, order_qn) values (84, 38,'Garstein Furniture specializes in functional products that are inexpensive _____ beautifully crafted.', 130);

-- Part 6
insert into question (set_question_id, hashtag_id, name, order_qn) values (85, 42,'', 131);
insert into question (set_question_id, hashtag_id, name, order_qn) values (85, 46,'', 132);
insert into question (set_question_id, hashtag_id, name, order_qn) values (85, 44,'', 133);
insert into question (set_question_id, hashtag_id, name, order_qn) values (85, 43,'', 134);
insert into question (set_question_id, hashtag_id, name, order_qn) values (86, 44,'', 135);
insert into question (set_question_id, hashtag_id, name, order_qn) values (86, 46,'', 136);
insert into question (set_question_id, hashtag_id, name, order_qn) values (86, 44,'', 137);
insert into question (set_question_id, hashtag_id, name, order_qn) values (86, 42,'', 138);
insert into question (set_question_id, hashtag_id, name, order_qn) values (87, 43,'', 139);
insert into question (set_question_id, hashtag_id, name, order_qn) values (87, 46,'', 140);
insert into question (set_question_id, hashtag_id, name, order_qn) values (87, 43,'', 141);
insert into question (set_question_id, hashtag_id, name, order_qn) values (87, 44,'', 142);
insert into question (set_question_id, hashtag_id, name, order_qn) values (88, 44,'', 143);
insert into question (set_question_id, hashtag_id, name, order_qn) values (88, 44,'', 144);
insert into question (set_question_id, hashtag_id, name, order_qn) values (88, 45,'', 145);
insert into question (set_question_id, hashtag_id, name, order_qn) values (88, 45,'', 146);

-- Part 7
insert into question (set_question_id, hashtag_id, name, order_qn) values (89, 49,'What is the purpose of the announcement?', 147);
insert into question (set_question_id, hashtag_id, name, order_qn) values (89, 50,'According to Mr. Clifford, what has the airline temporarily increased?', 148);
insert into question (set_question_id, hashtag_id, name, order_qn) values (90, 61,'What are applicants for this position required to have?', 149);
insert into question (set_question_id, hashtag_id, name, order_qn) values (90, 61,'What is true about the job?', 150);
insert into question (set_question_id, hashtag_id, name, order_qn) values (91, 60,'What is true about the software testing?', 151);
insert into question (set_question_id, hashtag_id, name, order_qn) values (91, 47,'What action was difficult for users to complete?', 152);
insert into question (set_question_id, hashtag_id, name, order_qn) values (92, 55,'What is indicated about Ms. Atiyeh`s previous appearance at Mutamark?', 153);
insert into question (set_question_id, hashtag_id, name, order_qn) values (92, 54,'How many people can the Koros Hall accommodate?', 154);
insert into question (set_question_id, hashtag_id, name, order_qn) values (92, 56,'When will Ms. Atiyeh most likely appear at the Mutamark conference?', 155);
insert into question (set_question_id, hashtag_id, name, order_qn) values (93, 55,'What kind of business most likely is Saenger, Inc.?', 156);
insert into question (set_question_id, hashtag_id, name, order_qn) values (93, 54,'What is indicated about the monorail?', 157);
insert into question (set_question_id, hashtag_id, name, order_qn) values (93, 55,'In which of the positions marked [1], [2], [3], and [4] does the following sentence best belong? "Along the way, the line will stop at nine stations."', 158);
insert into question (set_question_id, hashtag_id, name, order_qn) values (94, 61,'At 3:01 P.M., what does Ms. McCall most likely mean when she writes, "No problem"?', 159);
insert into question (set_question_id, hashtag_id, name, order_qn) values (94, 60,'What type of work does Ms. McCall most likely do?', 160);
insert into question (set_question_id, hashtag_id, name, order_qn) values (95, 47,'What is suggested about the craft fair?', 161);
insert into question (set_question_id, hashtag_id, name, order_qn) values (95, 52,'What is NOT mentioned as a requirement for selling at the craft fair?', 162);

insert into question (set_question_id, hashtag_id, name, order_qn) values (95, 53,'What does Ms. Renaldo most likely sell?', 163);
insert into question (set_question_id, hashtag_id, name, order_qn) values (95, 54,'In which of the positions marked [1], [2], [3], and [4] does the following sentence best belong? "Make sure they clearly represent the items you wish to offer for purchase at the event."', 164);
insert into question (set_question_id, hashtag_id, name, order_qn) values (96, 57,'In what industry does Sleep Soundly Solutions operate?', 165);
insert into question (set_question_id, hashtag_id, name, order_qn) values (96, 58,'What new product is being offered by Sleep Soundly Solutions?', 166);
insert into question (set_question_id, hashtag_id, name, order_qn) values (96, 50,'The word "meet" in paragraph 3, line 3, is closest in meaning to', 167);
insert into question (set_question_id, hashtag_id, name, order_qn) values (97, 59,'What is one purpose of the letter?', 168);
insert into question (set_question_id, hashtag_id, name, order_qn) values (97, 59,'The word "established" in paragraph 1, line 3, is closest in meaning to', 169);
insert into question (set_question_id, hashtag_id, name, order_qn) values (97, 49,'What is suggested about Dr. Geerlings?', 170);
insert into question (set_question_id, hashtag_id, name, order_qn) values (97, 49,'What is NOT indicated about JATA in the letter?', 171);
insert into question (set_question_id, hashtag_id, name, order_qn) values (98, 53,'For what type of company do the writers work?', 172);
insert into question (set_question_id, hashtag_id, name, order_qn) values (98, 54,'At 8:59 A.M., what does Ms. Randolph most likely mean when she writes, "Not at all"?', 173);
insert into question (set_question_id, hashtag_id, name, order_qn) values (98, 58,'What is indicated about Mr. Erickson?', 174);
insert into question (set_question_id, hashtag_id, name, order_qn) values (98, 58,'According to the discussion, what is important to Mr. Peters about a new hire?', 175);
insert into question (set_question_id, hashtag_id, name, order_qn) values (99, 49,'What is NOT recommended in the article?', 176);
insert into question (set_question_id, hashtag_id, name, order_qn) values (99, 49,'Why are blinds mentioned?', 177);
insert into question (set_question_id, hashtag_id, name, order_qn) values (99, 50,'What is indicated about the magazine?', 178);
insert into question (set_question_id, hashtag_id, name, order_qn) values (99, 51,'What is suggested about Ms. Testa?', 179);

insert into question (set_question_id, hashtag_id, name, order_qn) values (99, 47,'What is suggested about Moveable, Inc.`s products?', 180);
insert into question (set_question_id, hashtag_id, name, order_qn) values (100, 49,'How does Tour 1 differ from all the other tours?', 181);
insert into question (set_question_id, hashtag_id, name, order_qn) values (100, 61,'What is included in the cost of the tours?', 182);
insert into question (set_question_id, hashtag_id, name, order_qn) values (100, 52,'What tour did Ms. Bouton most likely take?', 183);
insert into question (set_question_id, hashtag_id, name, order_qn) values (100, 53,'What does the review suggest about Ms. Bouton?', 184);
insert into question (set_question_id, hashtag_id, name, order_qn) values (100, 54,'Why was Ms. Bouton disappointed with the tour?', 185);
insert into question (set_question_id, hashtag_id, name, order_qn) values (101, 55,'What most likely is the topic of the seminar on June 11 ?', 186);
insert into question (set_question_id, hashtag_id, name, order_qn) values (101, 55,'What iS suggested about Mr. Morgan?', 187);
insert into question (set_question_id, hashtag_id, name, order_qn) values (101, 56,'What is the purpose of the notice?', 188);
insert into question (set_question_id, hashtag_id, name, order_qn) values (101, 54,'According to the second e-mail, what does Mr. Morgan suggest changing?', 189);
insert into question (set_question_id, hashtag_id, name, order_qn) values (101, 53,'How much did Mr. Morgan spend on the book he showed to Ms. Tsu?', 190);
insert into question (set_question_id, hashtag_id, name, order_qn) values (102, 54,'What is the purpose of the article?', 191);
insert into question (set_question_id, hashtag_id, name, order_qn) values (102, 56,'What positive aspect of the Anton Building does Ms. Yadav mention?', 192);
insert into question (set_question_id, hashtag_id, name, order_qn) values (102, 55,'What is suggested about JPD in Ms. Bautista`s e-mail?', 193);
insert into question (set_question_id, hashtag_id, name, order_qn) values (102, 47,'What information about the building does Ms. Bautista request from Mr. Rowell?', 194);
insert into question (set_question_id, hashtag_id, name, order_qn) values (102, 59,'What space would Lenoiva most likely choose to rent?', 195);
insert into question (set_question_id, hashtag_id, name, order_qn) values (103, 59,'What does Ms. Jefferson mention in the first e-mail?', 196);
insert into question (set_question_id, hashtag_id, name, order_qn) values (103, 60,'What rental option best meets Ms. Jefferson`s needs?', 197);
insert into question (set_question_id, hashtag_id, name, order_qn) values (103, 57,'What is the hourly rate of DGC`s newest rental option?', 198);
insert into question (set_question_id, hashtag_id, name, order_qn) values (103, 57,'What is indicated about DGC in the price list?', 199);
insert into question (set_question_id, hashtag_id, name, order_qn) values (103, 57,'According to the price list, what is true about all boats?', 200);


-- choice
-- qn 1
insert into choice (question_id, order_choice, name, key) values (1, 1, '', false);
insert into choice (question_id, order_choice, name, key) values (1, 2, '', true);
insert into choice (question_id, order_choice, name, key) values (1, 3, '', false);
insert into choice (question_id, order_choice, name, key) values (1, 4, '', false);
-- qn 2
insert into choice (question_id, order_choice, name, key) values (2, 1, '', false);
insert into choice (question_id, order_choice, name, key) values (2, 2, '', false);
insert into choice (question_id, order_choice, name, key) values (2, 3, '', true);
insert into choice (question_id, order_choice, name, key) values (2, 4, '', false);
-- qn 3
insert into choice (question_id, order_choice, name, key) values (3, 1, '', false);
insert into choice (question_id, order_choice, name, key) values (3, 2, '', true);
insert into choice (question_id, order_choice, name, key) values (3, 3, '', false);
insert into choice (question_id, order_choice, name, key) values (3, 4, '', false);
-- qn 4
insert into choice (question_id, order_choice, name, key) values (4, 1, '', true);
insert into choice (question_id, order_choice, name, key) values (4, 2, '', false);
insert into choice (question_id, order_choice, name, key) values (4, 3, '', false);
insert into choice (question_id, order_choice, name, key) values (4, 4, '', false);
-- qn 5
insert into choice (question_id, order_choice, name, key) values (5, 1, '', false);
insert into choice (question_id, order_choice, name, key) values (5, 2, '', false);
insert into choice (question_id, order_choice, name, key) values (5, 3, '', false);
insert into choice (question_id, order_choice, name, key) values (5, 4, '', true);
-- qn 6
insert into choice (question_id, order_choice, name, key) values (6, 1, '', false);
insert into choice (question_id, order_choice, name, key) values (6, 2, '', false);
insert into choice (question_id, order_choice, name, key) values (6, 3, '', true);
insert into choice (question_id, order_choice, name, key) values (6, 4, '', false);
-- qn 7
insert into choice (question_id, order_choice, name, key) values (7, 1, '', false);
insert into choice (question_id, order_choice, name, key) values (7, 2, '', true);
insert into choice (question_id, order_choice, name, key) values (7, 3, '', false);
-- qn 8
insert into choice (question_id, order_choice, name, key) values (8, 1, '', true);
insert into choice (question_id, order_choice, name, key) values (8, 2, '', false);
insert into choice (question_id, order_choice, name, key) values (8, 3, '', false);
-- qn 9
insert into choice (question_id, order_choice, name, key) values (9, 1, '', false);
insert into choice (question_id, order_choice, name, key) values (9, 2, '', false);
insert into choice (question_id, order_choice, name, key) values (9, 3, '', true);
-- qn 10
insert into choice (question_id, order_choice, name, key) values (10, 1, '', false);
insert into choice (question_id, order_choice, name, key) values (10, 2, '', false);
insert into choice (question_id, order_choice, name, key) values (10, 3, '', true);
-- qn 11
insert into choice (question_id, order_choice, name, key) values (11, 1, '', true);
insert into choice (question_id, order_choice, name, key) values (11, 2, '', false);
insert into choice (question_id, order_choice, name, key) values (11, 3, '', false);
-- qn 12
insert into choice (question_id, order_choice, name, key) values (12, 1, '', false);
insert into choice (question_id, order_choice, name, key) values (12, 2, '', true);
insert into choice (question_id, order_choice, name, key) values (12, 3, '', false);
-- qn 13
insert into choice (question_id, order_choice, name, key) values (13, 1, '', false);
insert into choice (question_id, order_choice, name, key) values (13, 2, '', false);
insert into choice (question_id, order_choice, name, key) values (13, 3, '', true);
-- qn 14
insert into choice (question_id, order_choice, name, key) values (14, 1, '', true);
insert into choice (question_id, order_choice, name, key) values (14, 2, '', false);
insert into choice (question_id, order_choice, name, key) values (14, 3, '', false);
-- qn 15
insert into choice (question_id, order_choice, name, key) values (15, 1, '', false);
insert into choice (question_id, order_choice, name, key) values (15, 2, '', true);
insert into choice (question_id, order_choice, name, key) values (15, 3, '', false);
-- qn 16
insert into choice (question_id, order_choice, name, key) values (16, 1, '', true);
insert into choice (question_id, order_choice, name, key) values (16, 2, '', false);
insert into choice (question_id, order_choice, name, key) values (16, 3, '', false);
-- qn 17
insert into choice (question_id, order_choice, name, key) values (17, 1, '', false);
insert into choice (question_id, order_choice, name, key) values (17, 2, '', false);
insert into choice (question_id, order_choice, name, key) values (17, 3, '', true);
-- qn 18
insert into choice (question_id, order_choice, name, key) values (18, 1, '', false);
insert into choice (question_id, order_choice, name, key) values (18, 2, '', true);
insert into choice (question_id, order_choice, name, key) values (18, 3, '', false);
-- qn 19
insert into choice (question_id, order_choice, name, key) values (19, 1, '', false);
insert into choice (question_id, order_choice, name, key) values (19, 2, '', false);
insert into choice (question_id, order_choice, name, key) values (19, 3, '', true);
-- qn 20
insert into choice (question_id, order_choice, name, key) values (20, 1, '', true);
insert into choice (question_id, order_choice, name, key) values (20, 2, '', false);
insert into choice (question_id, order_choice, name, key) values (20, 3, '', false);
-- qn 21
insert into choice (question_id, order_choice, name, key) values (21, 1, '', false);
insert into choice (question_id, order_choice, name, key) values (21, 2, '', false);
insert into choice (question_id, order_choice, name, key) values (21, 3, '', true);
-- qn 22
insert into choice (question_id, order_choice, name, key) values (22, 1, '', false);
insert into choice (question_id, order_choice, name, key) values (22, 2, '', true);
insert into choice (question_id, order_choice, name, key) values (22, 3, '', false);
-- qn 23
insert into choice (question_id, order_choice, name, key) values (23, 1, '', true);
insert into choice (question_id, order_choice, name, key) values (23, 2, '', false);
insert into choice (question_id, order_choice, name, key) values (23, 3, '', false);
-- qn 24
insert into choice (question_id, order_choice, name, key) values (24, 1, '', false);
insert into choice (question_id, order_choice, name, key) values (24, 2, '', true);
insert into choice (question_id, order_choice, name, key) values (24, 3, '', false);
-- qn 25
insert into choice (question_id, order_choice, name, key) values (25, 1, '', false);
insert into choice (question_id, order_choice, name, key) values (25, 2, '', false);
insert into choice (question_id, order_choice, name, key) values (25, 3, '', true);
-- qn 26
insert into choice (question_id, order_choice, name, key) values (26, 1, '', false);
insert into choice (question_id, order_choice, name, key) values (26, 2, '', false);
insert into choice (question_id, order_choice, name, key) values (26, 3, '', true);
-- qn 27
insert into choice (question_id, order_choice, name, key) values (27, 1, '', true);
insert into choice (question_id, order_choice, name, key) values (27, 2, '', false);
insert into choice (question_id, order_choice, name, key) values (27, 3, '', false);
-- qn 28
insert into choice (question_id, order_choice, name, key) values (28, 1, '', true);
insert into choice (question_id, order_choice, name, key) values (28, 2, '', false);
insert into choice (question_id, order_choice, name, key) values (28, 3, '', false);
-- qn 29
insert into choice (question_id, order_choice, name, key) values (29, 1, '', true);
insert into choice (question_id, order_choice, name, key) values (29, 2, '', false);
insert into choice (question_id, order_choice, name, key) values (29, 3, '', false);
-- qn 30
insert into choice (question_id, order_choice, name, key) values (30, 1, '', false);
insert into choice (question_id, order_choice, name, key) values (30, 2, '', true);
insert into choice (question_id, order_choice, name, key) values (30, 3, '', false);
-- qn 31
insert into choice (question_id, order_choice, name, key) values (31, 1, '', false);
insert into choice (question_id, order_choice, name, key) values (31, 2, '', false);
insert into choice (question_id, order_choice, name, key) values (31, 3, '', true);
-- qn 32
insert into choice (question_id, order_choice, name, key) values (32, 1, 'A move to a new a city', false);
insert into choice (question_id, order_choice, name, key) values (32, 2, 'A business trip', false);
insert into choice (question_id, order_choice, name, key) values (32, 3, 'A building tour', false);
insert into choice (question_id, order_choice, name, key) values (32, 4, 'A meeting with visiting colleagues', true);
-- qn 33
insert into choice (question_id, order_choice, name, key) values (33, 1, 'An accountant', false);
insert into choice (question_id, order_choice, name, key) values (33, 2, 'An administrative assistant', true);
insert into choice (question_id, order_choice, name, key) values (33, 3, 'A marketing director', false);
insert into choice (question_id, order_choice, name, key) values (33, 4, 'A company president', false);
-- qn 34
insert into choice (question_id, order_choice, name, key) values (34, 1, 'A building map', false);
insert into choice (question_id, order_choice, name, key) values (34, 2, 'A room key', true);
insert into choice (question_id, order_choice, name, key) values (34, 3, 'An ID card', false);
insert into choice (question_id, order_choice, name, key) values (34, 4, 'A parking pass', false);
-- qn 35
insert into choice (question_id, order_choice, name, key) values (35, 1, 'Writing a budget', true);
insert into choice (question_id, order_choice, name, key) values (35, 2, 'Reviewing job applications', false);
insert into choice (question_id, order_choice, name, key) values (35, 3, 'Organizing a company newsletter', false);
insert into choice (question_id, order_choice, name, key) values (35, 4, 'Updating an employee handbook', false);
-- qn 36
insert into choice (question_id, order_choice, name, key) values (36, 1, 'Organize a trade show', false);
insert into choice (question_id, order_choice, name, key) values (36, 2, 'Open a new store', false);
insert into choice (question_id, order_choice, name, key) values (36, 3, 'Redesign a product catalog', false);
insert into choice (question_id, order_choice, name, key) values (36, 4, 'Hire some team members', true);
-- qn 37
insert into choice (question_id, order_choice, name, key) values (37, 1, 'Order some business cards', false);
insert into choice (question_id, order_choice, name, key) values (37, 2, 'Write a press release', false);
insert into choice (question_id, order_choice, name, key) values (37, 3, 'Provide some additional details', true);
insert into choice (question_id, order_choice, name, key) values (37, 4, 'Set up a meeting time', false);
-- qn 38
insert into choice (question_id, order_choice, name, key) values (38, 1, 'A job interview', true);
insert into choice (question_id, order_choice, name, key) values (38, 2, 'A fashion show', false);
insert into choice (question_id, order_choice, name, key) values (38, 3, 'A family celebration', false);
insert into choice (question_id, order_choice, name, key) values (38, 4, 'A television appearance', false);
-- qn 39
insert into choice (question_id, order_choice, name, key) values (39, 1, 'The fabric', false);
insert into choice (question_id, order_choice, name, key) values (39, 2, 'The price', false);
insert into choice (question_id, order_choice, name, key) values (39, 3, 'The style', false);
insert into choice (question_id, order_choice, name, key) values (39, 4, 'The color', true);
-- qn 40
insert into choice (question_id, order_choice, name, key) values (40, 1, 'Some accessories', false);
insert into choice (question_id, order_choice, name, key) values (40, 2, 'Alterations', true);
insert into choice (question_id, order_choice, name, key) values (40, 3, 'Sales tax', false);
insert into choice (question_id, order_choice, name, key) values (40, 4, 'Delivery', false);
-- qn 41
insert into choice (question_id, order_choice, name, key) values (41, 1, 'A legal consulting firm', false);
insert into choice (question_id, order_choice, name, key) values (41, 2, 'An architecture firm', false);
insert into choice (question_id, order_choice, name, key) values (41, 3, 'A film production company', true);
insert into choice (question_id, order_choice, name, key) values (41, 4, 'A book publishing company', false);
-- qn 42
insert into choice (question_id, order_choice, name, key) values (42, 1, 'The length of a project', true);
insert into choice (question_id, order_choice, name, key) values (42, 2, 'The cost of an order', false);
insert into choice (question_id, order_choice, name, key) values (42, 3, 'The opinion of the public', false);
insert into choice (question_id, order_choice, name, key) values (42, 4, 'The skills of some workers', false);
-- qn 43
insert into choice (question_id, order_choice, name, key) values (43, 1, 'Submit an application', false);
insert into choice (question_id, order_choice, name, key) values (43, 2, 'Speak at a meeting', true);
insert into choice (question_id, order_choice, name, key) values (43, 3, 'Review some books', false);
insert into choice (question_id, order_choice, name, key) values (43, 4, 'Measure a space', false);
-- qn 44
insert into choice (question_id, order_choice, name, key) values (44, 1, 'A store manager', false);
insert into choice (question_id, order_choice, name, key) values (44, 2, 'A construction worker', false);
insert into choice (question_id, order_choice, name, key) values (44, 3, 'A journalist', false);
insert into choice (question_id, order_choice, name, key) values (44, 4, 'An artist', true);
-- qn 45
insert into choice (question_id, order_choice, name, key) values (45, 1, 'Some walls are being painted.', false);
insert into choice (question_id, order_choice, name, key) values (45, 2, 'Some floors are being replaced.', true);
insert into choice (question_id, order_choice, name, key) values (45, 3, 'Some windows are being installed.', false);
insert into choice (question_id, order_choice, name, key) values (45, 4, 'Some light fixtures are being repaired.', false);
-- qn 46
insert into choice (question_id, order_choice, name, key) values (46, 1, 'Visit a gift shop', true);
insert into choice (question_id, order_choice, name, key) values (46, 2, 'Send a package', false);
insert into choice (question_id, order_choice, name, key) values (46, 3, 'Wait for a bus', false);
insert into choice (question_id, order_choice, name, key) values (46, 4, 'Take a photograph', false);
-- qn 47
insert into choice (question_id, order_choice, name, key) values (47, 1, 'Electronics', false);
insert into choice (question_id, order_choice, name, key) values (47, 2, 'Clothing', false);
insert into choice (question_id, order_choice, name, key) values (47, 3, 'Food', false);
insert into choice (question_id, order_choice, name, key) values (47, 4, 'Automobiles', true);
-- qn 48
insert into choice (question_id, order_choice, name, key) values (48, 1, 'Some software is expensive.', false);
insert into choice (question_id, order_choice, name, key) values (48, 2, 'A color is very bright.', false);
insert into choice (question_id, order_choice, name, key) values (48, 3, 'The man has completed a report.', true);
insert into choice (question_id, order_choice, name, key) values (48, 4, 'The man bought a new car.', false);
-- qn 49
insert into choice (question_id, order_choice, name, key) values (49, 1, 'To request assistance reviewing a document', false);
insert into choice (question_id, order_choice, name, key) values (49, 2, 'To recommend using a document as a reference', true);
insert into choice (question_id, order_choice, name, key) values (49, 3, 'To report that a task has been completed', false);
insert into choice (question_id, order_choice, name, key) values (49, 4, 'To indicate that a file is in the wrong location', false);
-- qn 50
insert into choice (question_id, order_choice, name, key) values (50, 1, 'An executive will visit.', false);
insert into choice (question_id, order_choice, name, key) values (50, 2, 'An employee will retire.', true);
insert into choice (question_id, order_choice, name, key) values (50, 3, 'A product will be released.', false);
insert into choice (question_id, order_choice, name, key) values (50, 4, 'A study will be completed.', false);
-- qn 51
insert into choice (question_id, order_choice, name, key) values (51, 1, 'Where he would be working', false);
insert into choice (question_id, order_choice, name, key) values (51, 2, 'When he would be starting a job', true);
insert into choice (question_id, order_choice, name, key) values (51, 3, 'How to get to an office building', false);
insert into choice (question_id, order_choice, name, key) values (51, 4, 'Why an event time has changed', false);
-- qn 52
insert into choice (question_id, order_choice, name, key) values (52, 1, 'A work vehicle', false);
insert into choice (question_id, order_choice, name, key) values (52, 2, 'A private office', false);
insert into choice (question_id, order_choice, name, key) values (52, 3, 'Moving expenses', true);
insert into choice (question_id, order_choice, name, key) values (52, 4, 'Visitors` meals', false);
-- qn 53
insert into choice (question_id, order_choice, name, key) values (53, 1, 'Manufacturing', false);
insert into choice (question_id, order_choice, name, key) values (53, 2, 'Agriculture', false);
insert into choice (question_id, order_choice, name, key) values (53, 3, 'Transportation', false);
insert into choice (question_id, order_choice, name, key) values (53, 4, 'Construction', true);
-- qn 54
insert into choice (question_id, order_choice, name, key) values (54, 1, 'Increase tourism', false);
insert into choice (question_id, order_choice, name, key) values (54, 2, 'Generate electricity', true);
insert into choice (question_id, order_choice, name, key) values (54, 3, 'Preserve natural resources', false);
insert into choice (question_id, order_choice, name, key) values (54, 4, 'Improve property values', false);
-- qn 55
insert into choice (question_id, order_choice, name, key) values (55, 1, 'Permits need to be approved.', true);
insert into choice (question_id, order_choice, name, key) values (55, 2, 'Employees need to be trained.', false);
insert into choice (question_id, order_choice, name, key) values (55, 3, 'Materials need to be ordered.', false);
insert into choice (question_id, order_choice, name, key) values (55, 4, 'Inspections need to be made.', false);
-- qn 56
insert into choice (question_id, order_choice, name, key) values (56, 1, 'She has time to help.', true);
insert into choice (question_id, order_choice, name, key) values (56, 2, 'She plans to leave work early.', false);
insert into choice (question_id, order_choice, name, key) values (56, 3, 'Her computer is not working.', false);
insert into choice (question_id, order_choice, name, key) values (56, 4, 'She has not received an assignment.', false);
-- qn 57
insert into choice (question_id, order_choice, name, key) values (57, 1, 'It needs to be refrigerated.', false);
insert into choice (question_id, order_choice, name, key) values (57, 2, 'It has expired.', false);
insert into choice (question_id, order_choice, name, key) values (57, 3, 'The dosage has changed.', false);
insert into choice (question_id, order_choice, name, key) values (57, 4, 'The supply is limited.', true);
-- qn 58
insert into choice (question_id, order_choice, name, key) values (58, 1, 'Installing some shelves', false);
insert into choice (question_id, order_choice, name, key) values (58, 2, 'Confirming with a doctor', false);
insert into choice (question_id, order_choice, name, key) values (58, 3, 'Increasing an order amount', true);
insert into choice (question_id, order_choice, name, key) values (58, 4, 'Recommending a different medication', false);
-- qn 59
insert into choice (question_id, order_choice, name, key) values (59, 1, 'A travel agent', false);
insert into choice (question_id, order_choice, name, key) values (59, 2, 'A bank teller', false);
insert into choice (question_id, order_choice, name, key) values (59, 3, 'A lawyer', true);
insert into choice (question_id, order_choice, name, key) values (59, 4, 'A mail-room worker', false);
-- qn 60
insert into choice (question_id, order_choice, name, key) values (60, 1, 'A user agreement', true);
insert into choice (question_id, order_choice, name, key) values (60, 2, 'An employment contract', false);
insert into choice (question_id, order_choice, name, key) values (60, 3, 'A list of travel expenses', false);
insert into choice (question_id, order_choice, name, key) values (60, 4, 'An insurance certificate', false);
-- qn 61
insert into choice (question_id, order_choice, name, key) values (61, 1, 'To be included in a personnel file a', false);
insert into choice (question_id, order_choice, name, key) values (61, 2, 'To use in a merger negotiation', false);
insert into choice (question_id, order_choice, name, key) values (61, 3, 'To meet a production deadline', false);
insert into choice (question_id, order_choice, name, key) values (61, 4, 'To avoid paying a fine', true);
-- qn 62
insert into choice (question_id, order_choice, name, key) values (62, 1, '$4,456', false);
insert into choice (question_id, order_choice, name, key) values (62, 2, '$1,300', false);
insert into choice (question_id, order_choice, name, key) values (62, 3, '$10,200', true);
insert into choice (question_id, order_choice, name, key) values (62, 4, '$400', false);
-- qn 63
insert into choice (question_id, order_choice, name, key) values (63, 1, 'Business hours have changed.', false);
insert into choice (question_id, order_choice, name, key) values (63, 2, 'A price was wrong.', false);
insert into choice (question_id, order_choice, name, key) values (63, 3, 'Some staff arrived late.', true);
insert into choice (question_id, order_choice, name, key) values (63, 4, 'A request could not be fulfilled.', false);
-- qn 64
insert into choice (question_id, order_choice, name, key) values (64, 1, 'It has a nice view.', true);
insert into choice (question_id, order_choice, name, key) values (64, 2, 'It is conveniently located.', false);
insert into choice (question_id, order_choice, name, key) values (64, 3, 'It is tastefully decorated.', false);
insert into choice (question_id, order_choice, name, key) values (64, 4, 'It can host large events.', false);
-- qn 65
insert into choice (question_id, order_choice, name, key) values (65, 1, 'A popular band is coming to town.', false);
insert into choice (question_id, order_choice, name, key) values (65, 2, 'The woman plays a musical instrument.', false);
insert into choice (question_id, order_choice, name, key) values (65, 3, 'The woman was able to get concert tickets.', true);
insert into choice (question_id, order_choice, name, key) values (65, 4, 'Some musicians a scheduled a second concert.', false);
-- qn 66
insert into choice (question_id, order_choice, name, key) values (66, 1, 'Section 1', false);
insert into choice (question_id, order_choice, name, key) values (66, 2, 'Section 2', false);
insert into choice (question_id, order_choice, name, key) values (66, 3, 'Section 3', true);
insert into choice (question_id, order_choice, name, key) values (66, 4, 'Section 4', false);
-- qn 67
insert into choice (question_id, order_choice, name, key) values (67, 1, 'Practicing with her band', false);
insert into choice (question_id, order_choice, name, key) values (67, 2, 'Entering a radio contest', false);
insert into choice (question_id, order_choice, name, key) values (67, 3, 'Moving to Boston', false);
insert into choice (question_id, order_choice, name, key) values (67, 4, 'Attending a party', true);
-- qn 68
insert into choice (question_id, order_choice, name, key) values (68, 1, 'A maintenance worker', false);
insert into choice (question_id, order_choice, name, key) values (68, 2, 'A property manager', true);
insert into choice (question_id, order_choice, name, key) values (68, 3, 'A real estate agent', false);
insert into choice (question_id, order_choice, name, key) values (68, 4, 'A bank employee', false);
-- qn 69
insert into choice (question_id, order_choice, name, key) values (69, 1, 'Tanaka', false);
insert into choice (question_id, order_choice, name, key) values (69, 2, 'Zhao', false);
insert into choice (question_id, order_choice, name, key) values (69, 3, 'Mukherjee', true);
insert into choice (question_id, order_choice, name, key) values (69, 4, 'Tremblay', false);
-- qn 70
insert into choice (question_id, order_choice, name, key) values (70, 1, 'Fill out a registration form', true);
insert into choice (question_id, order_choice, name, key) values (70, 2, 'Meet with some neighbors', false);
insert into choice (question_id, order_choice, name, key) values (70, 3, 'Order some furniture', false);
insert into choice (question_id, order_choice, name, key) values (70, 4, 'Make a payment', false);
-- qn 71
insert into choice (question_id, order_choice, name, key) values (71, 1, 'A hair salon', false);
insert into choice (question_id, order_choice, name, key) values (71, 2, 'An insurance company', false);
insert into choice (question_id, order_choice, name, key) values (71, 3, 'A car dealership', false);
insert into choice (question_id, order_choice, name, key) values (71, 4, 'An eye doctor`s office', true);
-- qn 72
insert into choice (question_id, order_choice, name, key) values (72, 1, 'It is too far away.', false);
insert into choice (question_id, order_choice, name, key) values (72, 2, 'It needs to be rescheduled.', true);
insert into choice (question_id, order_choice, name, key) values (72, 3, 'It is too expensive.', false);
insert into choice (question_id, order_choice, name, key) values (72, 4, 'It should be with a different a person.', false);
-- qn 73
insert into choice (question_id, order_choice, name, key) values (73, 1, 'Payment methods', false);
insert into choice (question_id, order_choice, name, key) values (73, 2, 'Delivery options', false);
insert into choice (question_id, order_choice, name, key) values (73, 3, 'A warranty', true);
insert into choice (question_id, order_choice, name, key) values (73, 4, 'A job opening', false);
-- qn 74
insert into choice (question_id, order_choice, name, key) values (74, 1, 'A factory tour', true);
insert into choice (question_id, order_choice, name, key) values (74, 2, 'A baking competition', false);
insert into choice (question_id, order_choice, name, key) values (74, 3, 'A grand opening', false);
insert into choice (question_id, order_choice, name, key) values (74, 4, 'An art show', false);
-- qn 75
insert into choice (question_id, order_choice, name, key) values (75, 1, 'A poster', false);
insert into choice (question_id, order_choice, name, key) values (75, 2, 'A promotional mug', false);
insert into choice (question_id, order_choice, name, key) values (75, 3, 'A company T-shirt', false);
insert into choice (question_id, order_choice, name, key) values (75, 4, 'A photograph', true);
-- qn 76
insert into choice (question_id, order_choice, name, key) values (76, 1, 'Find a recipe', false);
insert into choice (question_id, order_choice, name, key) values (76, 2, 'Fill out an entry form', false);
insert into choice (question_id, order_choice, name, key) values (76, 3, 'View a product list', false);
insert into choice (question_id, order_choice, name, key) values (76, 4, 'Download a coupon', true);
-- qn 77
insert into choice (question_id, order_choice, name, key) values (77, 1, 'At a sports arena', false);
insert into choice (question_id, order_choice, name, key) values (77, 2, 'At a concert hall', false);
insert into choice (question_id, order_choice, name, key) values (77, 3, 'At an art museum', false);
insert into choice (question_id, order_choice, name, key) values (77, 4, 'At a movie theater', true);
-- qn 78
insert into choice (question_id, order_choice, name, key) values (78, 1, 'A presenter has been delayed.', false);
insert into choice (question_id, order_choice, name, key) values (78, 2, 'Some lights have gone out.', false);
insert into choice (question_id, order_choice, name, key) values (78, 3, 'A sound system is broken.', true);
insert into choice (question_id, order_choice, name, key) values (78, 4, 'A construction project is noisy.', false);
-- qn 79
insert into choice (question_id, order_choice, name, key) values (79, 1, 'A promotional item', false);
insert into choice (question_id, order_choice, name, key) values (79, 2, 'A parking voucher', false);
insert into choice (question_id, order_choice, name, key) values (79, 3, 'Discounted snacks', false);
insert into choice (question_id, order_choice, name, key) values (79, 4, 'Free tickets', true);
-- qn 80
insert into choice (question_id, order_choice, name, key) values (80, 1, 'A technology conference', true);
insert into choice (question_id, order_choice, name, key) values (80, 2, 'A product demonstration', false);
insert into choice (question_id, order_choice, name, key) values (80, 3, 'A company fund-raiser', false);
insert into choice (question_id, order_choice, name, key) values (80, 4, 'A training workshop', false);
-- qn 81
insert into choice (question_id, order_choice, name, key) values (81, 1, 'To propose moving to a larger venue', false);
insert into choice (question_id, order_choice, name, key) values (81, 2, 'To indicate that some advertising was successful', true);
insert into choice (question_id, order_choice, name, key) values (81, 3, 'To emphasize the importance of working quickly', false);
insert into choice (question_id, order_choice, name, key) values (81, 4, 'To suggest more volunteers are needed', false);
-- qn 82
insert into choice (question_id, order_choice, name, key) values (82, 1, 'Provide feedback', false);
insert into choice (question_id, order_choice, name, key) values (82, 2, 'Silence mobile phones', false);
insert into choice (question_id, order_choice, name, key) values (82, 3, 'Review an event program', true);
insert into choice (question_id, order_choice, name, key) values (82, 4, 'Enjoy some refreshments', false);
-- qn 83
insert into choice (question_id, order_choice, name, key) values (83, 1, 'To support local businesses', false);
insert into choice (question_id, order_choice, name, key) values (83, 2, 'To promote tourism', false);
insert into choice (question_id, order_choice, name, key) values (83, 3, 'To decrease traffic', true);
insert into choice (question_id, order_choice, name, key) values (83, 4, 'To reduce government spending', false);
-- qn 84
insert into choice (question_id, order_choice, name, key) values (84, 1, 'Commuters', true);
insert into choice (question_id, order_choice, name, key) values (84, 2, 'Senior citizens', false);
insert into choice (question_id, order_choice, name, key) values (84, 3, 'Students', false);
insert into choice (question_id, order_choice, name, key) values (84, 4, 'City officials', false);
-- qn 85
insert into choice (question_id, order_choice, name, key) values (85, 1, 'A survey will be distributed.', false);
insert into choice (question_id, order_choice, name, key) values (85, 2, 'A new director will take over.', false);
insert into choice (question_id, order_choice, name, key) values (85, 3, 'A bus line will be added.', false);
insert into choice (question_id, order_choice, name, key) values (85, 4, 'A program evaluation will take place.', true);
-- qn 86
insert into choice (question_id, order_choice, name, key) values (86, 1, 'A sports competition', false);
insert into choice (question_id, order_choice, name, key) values (86, 2, 'A music festival', true);
insert into choice (question_id, order_choice, name, key) values (86, 3, 'A cooking demonstration', false);
insert into choice (question_id, order_choice, name, key) values (86, 4, 'A historical play', false);
-- qn 87
insert into choice (question_id, order_choice, name, key) values (87, 1, 'To encourage the listeners to enter a contest', true);
insert into choice (question_id, order_choice, name, key) values (87, 2, 'To suggest that the listeners arrive early', false);
insert into choice (question_id, order_choice, name, key) values (87, 3, 'To complain that an event space is too small', false);
insert into choice (question_id, order_choice, name, key) values (87, 4, 'To praise the results of a marketing plan', false);
-- qn 88
insert into choice (question_id, order_choice, name, key) values (88, 1, 'A new venue will open.', false);
insert into choice (question_id, order_choice, name, key) values (88, 2, 'A prize winner will be announced.', false);
insert into choice (question_id, order_choice, name, key) values (88, 3, 'An interview will take place.', true);
insert into choice (question_id, order_choice, name, key) values (88, 4, 'A video will be filmed.', false);
-- qn 89
insert into choice (question_id, order_choice, name, key) values (89, 1, 'A computer company', false);
insert into choice (question_id, order_choice, name, key) values (89, 2, 'A construction firm', false);
insert into choice (question_id, order_choice, name, key) values (89, 3, 'A furniture manufacturer', true);
insert into choice (question_id, order_choice, name, key) values (89, 4, 'An office-supply distributor', false);
-- qn 90
insert into choice (question_id, order_choice, name, key) values (90, 1, 'It is inexpensive.', false);
insert into choice (question_id, order_choice, name, key) values (90, 2, 'It is durable.', true);
insert into choice (question_id, order_choice, name, key) values (90, 3, 'It is lightweight.', false);
insert into choice (question_id, order_choice, name, key) values (90, 4, 'It comes in many colors.', false);
-- qn 91
insert into choice (question_id, order_choice, name, key) values (91, 1, 'Sign up for a mailing list', false);
insert into choice (question_id, order_choice, name, key) values (91, 2, 'Watch an instructional video', false);
insert into choice (question_id, order_choice, name, key) values (91, 3, 'Enter a contest', false);
insert into choice (question_id, order_choice, name, key) values (91, 4, 'Look at a sample', true);
-- qn 92
insert into choice (question_id, order_choice, name, key) values (92, 1, 'Product Development', false);
insert into choice (question_id, order_choice, name, key) values (92, 2, 'Human Resources', true);
insert into choice (question_id, order_choice, name, key) values (92, 3, 'Legal', false);
insert into choice (question_id, order_choice, name, key) values (92, 4, 'Accounting', false);
-- qn 93
insert into choice (question_id, order_choice, name, key) values (93, 1, 'To recommend an employee sign up for more training', false);
insert into choice (question_id, order_choice, name, key) values (93, 2, 'To indicate that a project deadline will be extended', false);
insert into choice (question_id, order_choice, name, key) values (93, 3, 'To approve a request to transfer', true);
insert into choice (question_id, order_choice, name, key) values (93, 4, 'To suggest consulting with an expert', false);
-- qn 94
insert into choice (question_id, order_choice, name, key) values (94, 1, 'Some sales results', false);
insert into choice (question_id, order_choice, name, key) values (94, 2, 'Some client feedback', false);
insert into choice (question_id, order_choice, name, key) values (94, 3, 'An office renovation', false);
insert into choice (question_id, order_choice, name, key) values (94, 4, 'A work schedule', true);
-- qn 95
insert into choice (question_id, order_choice, name, key) values (95, 1, 'To discuss their businesses', true);
insert into choice (question_id, order_choice, name, key) values (95, 2, 'To talk about local history', false);
insert into choice (question_id, order_choice, name, key) values (95, 3, 'To teach communication skills', false);
insert into choice (question_id, order_choice, name, key) values (95, 4, 'To offer travel tips', false);
-- qn 96
insert into choice (question_id, order_choice, name, key) values (96, 1, 'View photos of famous guests', false);
insert into choice (question_id, order_choice, name, key) values (96, 2, 'Sign up for a special service', false);
insert into choice (question_id, order_choice, name, key) values (96, 3, 'Read about upcoming programs', false);
insert into choice (question_id, order_choice, name, key) values (96, 4, 'Listen to previous episodes', true);
-- qn 97
insert into choice (question_id, order_choice, name, key) values (97, 1, 'Tuesday', false);
insert into choice (question_id, order_choice, name, key) values (97, 2, 'Wednesday', false);
insert into choice (question_id, order_choice, name, key) values (97, 3, 'Thursday', true);
insert into choice (question_id, order_choice, name, key) values (97, 4, 'Friday', false);
-- qn 98
insert into choice (question_id, order_choice, name, key) values (98, 1, 'On Shelf 1', true);
insert into choice (question_id, order_choice, name, key) values (98, 2, 'On Shelf 2', false);
insert into choice (question_id, order_choice, name, key) values (98, 3, 'On Shelf 3', false);
insert into choice (question_id, order_choice, name, key) values (98, 4, 'On Shelf 4', false);
-- qn 99
insert into choice (question_id, order_choice, name, key) values (99, 1, 'Coupons', false);
insert into choice (question_id, order_choice, name, key) values (99, 2, 'Hats', false);
insert into choice (question_id, order_choice, name, key) values (99, 3, 'Gloves', false);
insert into choice (question_id, order_choice, name, key) values (99, 4, 'Socks', true);
-- qn 100
insert into choice (question_id, order_choice, name, key) values (100, 1, 'A payment schedule', false);
insert into choice (question_id, order_choice, name, key) values (100, 2, 'Photographs', false);
insert into choice (question_id, order_choice, name, key) values (100, 3, 'Shipping information', true);
insert into choice (question_id, order_choice, name, key) values (100, 4, 'Display measurements', false);
-- qn 101
insert into choice (question_id, order_choice, name, key) values (101, 1, 'regional', true);
insert into choice (question_id, order_choice, name, key) values (101, 2, 'regionally', false);
insert into choice (question_id, order_choice, name, key) values (101, 3, 'region', false);
insert into choice (question_id, order_choice, name, key) values (101, 4, 'regions', false);
-- qn 102
insert into choice (question_id, order_choice, name, key) values (102, 1, 'family', false);
insert into choice (question_id, order_choice, name, key) values (102, 2, 'world', false);
insert into choice (question_id, order_choice, name, key) values (102, 3, 'company', false);
insert into choice (question_id, order_choice, name, key) values (102, 4, 'city', true);
-- qn 103
insert into choice (question_id, order_choice, name, key) values (103, 1, 'you', false);
insert into choice (question_id, order_choice, name, key) values (103, 2, 'yours', false);
insert into choice (question_id, order_choice, name, key) values (103, 3, 'yourself', false);
insert into choice (question_id, order_choice, name, key) values (103, 4, 'your', true);
-- qn 104
insert into choice (question_id, order_choice, name, key) values (104, 1, 'up', false);
insert into choice (question_id, order_choice, name, key) values (104, 2, 'except', false);
insert into choice (question_id, order_choice, name, key) values (104, 3, 'onto', false);
insert into choice (question_id, order_choice, name, key) values (104, 4, 'through', true);
-- qn 105
insert into choice (question_id, order_choice, name, key) values (105, 1, 'to arrange', true);
insert into choice (question_id, order_choice, name, key) values (105, 2, 'arranging', false);
insert into choice (question_id, order_choice, name, key) values (105, 3, 'having arranged', false);
insert into choice (question_id, order_choice, name, key) values (105, 4, 'arrangement', false);
-- qn 106
insert into choice (question_id, order_choice, name, key) values (106, 1, 'regularly', false);
insert into choice (question_id, order_choice, name, key) values (106, 2, 'conveniently', true);
insert into choice (question_id, order_choice, name, key) values (106, 3, 'brightly', false);
insert into choice (question_id, order_choice, name, key) values (106, 4, 'collectively', false);
-- qn 107
insert into choice (question_id, order_choice, name, key) values (107, 1, 'are delayed', false);
insert into choice (question_id, order_choice, name, key) values (107, 2, 'to delay', false);
insert into choice (question_id, order_choice, name, key) values (107, 3, 'delays', true);
insert into choice (question_id, order_choice, name, key) values (107, 4, 'had delayed', false);
-- qn 108
insert into choice (question_id, order_choice, name, key) values (108, 1, 'as a result', false);
insert into choice (question_id, order_choice, name, key) values (108, 2, 'in addition', false);
insert into choice (question_id, order_choice, name, key) values (108, 3, 'although', false);
insert into choice (question_id, order_choice, name, key) values (108, 4, 'before', true);
-- qn 109
insert into choice (question_id, order_choice, name, key) values (109, 1, 'clear', false);
insert into choice (question_id, order_choice, name, key) values (109, 2, 'clearing', false);
insert into choice (question_id, order_choice, name, key) values (109, 3, 'clearest', false);
insert into choice (question_id, order_choice, name, key) values (109, 4, 'clearly', true);
-- qn 110
insert into choice (question_id, order_choice, name, key) values (110, 1, 'recognized', true);
insert into choice (question_id, order_choice, name, key) values (110, 2, 'permitted', false);
insert into choice (question_id, order_choice, name, key) values (110, 3, 'prepared', false);
insert into choice (question_id, order_choice, name, key) values (110, 4, 'controlled', false);
-- qn 111
insert into choice (question_id, order_choice, name, key) values (111, 1, 'later', false);
insert into choice (question_id, order_choice, name, key) values (111, 2, 'after', true);
insert into choice (question_id, order_choice, name, key) values (111, 3, 'than', false);
insert into choice (question_id, order_choice, name, key) values (111, 4, 'often', false);
-- qn 112
insert into choice (question_id, order_choice, name, key) values (112, 1, 'adjusted', false);
insert into choice (question_id, order_choice, name, key) values (112, 2, 'advanced', true);
insert into choice (question_id, order_choice, name, key) values (112, 3, 'eager', false);
insert into choice (question_id, order_choice, name, key) values (112, 4, 'faithful', false);
-- qn 113
insert into choice (question_id, order_choice, name, key) values (113, 1, 'evaluation', false);
insert into choice (question_id, order_choice, name, key) values (113, 2, 'evaluate', false);
insert into choice (question_id, order_choice, name, key) values (113, 3, 'evaluating', true);
insert into choice (question_id, order_choice, name, key) values (113, 4, 'evaluated', false);
-- qn 114
insert into choice (question_id, order_choice, name, key) values (114, 1, 'on', false);
insert into choice (question_id, order_choice, name, key) values (114, 2, 'for', true);
insert into choice (question_id, order_choice, name, key) values (114, 3, 'to', false);
insert into choice (question_id, order_choice, name, key) values (114, 4, 'under', false);
-- qn 115
insert into choice (question_id, order_choice, name, key) values (115, 1, 'create', false);
insert into choice (question_id, order_choice, name, key) values (115, 2, 'creativity', false);
insert into choice (question_id, order_choice, name, key) values (115, 3, 'creation', false);
insert into choice (question_id, order_choice, name, key) values (115, 4, 'creative', true);
-- qn 116
insert into choice (question_id, order_choice, name, key) values (116, 1, 'even', false);
insert into choice (question_id, order_choice, name, key) values (116, 2, 'unless', true);
insert into choice (question_id, order_choice, name, key) values (116, 3, 'similarly', false);
insert into choice (question_id, order_choice, name, key) values (116, 4, 'also', false);
-- qn 117
insert into choice (question_id, order_choice, name, key) values (117, 1, 'renew', false);
insert into choice (question_id, order_choice, name, key) values (117, 2, 'renewed', false);
insert into choice (question_id, order_choice, name, key) values (117, 3, 'renewals', true);
insert into choice (question_id, order_choice, name, key) values (117, 4, 'to renew', false);
-- qn 118
insert into choice (question_id, order_choice, name, key) values (118, 1, 'careful', false);
insert into choice (question_id, order_choice, name, key) values (118, 2, 'helpful', false);
insert into choice (question_id, order_choice, name, key) values (118, 3, 'confident', true);
insert into choice (question_id, order_choice, name, key) values (118, 4, 'durable', false);
-- qn 119
insert into choice (question_id, order_choice, name, key) values (119, 1, 'consistent', false);
insert into choice (question_id, order_choice, name, key) values (119, 2, 'consist', false);
insert into choice (question_id, order_choice, name, key) values (119, 3, 'consistently', true);
insert into choice (question_id, order_choice, name, key) values (119, 4, 'consisting', false);
-- qn 120
insert into choice (question_id, order_choice, name, key) values (120, 1, 'launch', true);
insert into choice (question_id, order_choice, name, key) values (120, 2, 'facilitate', false);
insert into choice (question_id, order_choice, name, key) values (120, 3, 'arise', false);
insert into choice (question_id, order_choice, name, key) values (120, 4, 'exert', false);
-- qn 121
insert into choice (question_id, order_choice, name, key) values (121, 1, 'if', true);
insert into choice (question_id, order_choice, name, key) values (121, 2, 'yet', false);
insert into choice (question_id, order_choice, name, key) values (121, 3, 'until', false);
insert into choice (question_id, order_choice, name, key) values (121, 4, 'neither', false);
-- qn 122
insert into choice (question_id, order_choice, name, key) values (122, 1, 'majority', false);
insert into choice (question_id, order_choice, name, key) values (122, 2, 'edition', false);
insert into choice (question_id, order_choice, name, key) values (122, 3, 'volume', true);
insert into choice (question_id, order_choice, name, key) values (122, 4, 'economy', false);
-- qn 123
insert into choice (question_id, order_choice, name, key) values (123, 1, 'coordinated', false);
insert into choice (question_id, order_choice, name, key) values (123, 2, 'to coordinate', false);
insert into choice (question_id, order_choice, name, key) values (123, 3, 'coordination', false);
insert into choice (question_id, order_choice, name, key) values (123, 4, 'be coordinating', true);
-- qn 124
insert into choice (question_id, order_choice, name, key) values (124, 1, 'significantly', true);
insert into choice (question_id, order_choice, name, key) values (124, 2, 'persuasively', false);
insert into choice (question_id, order_choice, name, key) values (124, 3, 'proficiently', false);
insert into choice (question_id, order_choice, name, key) values (124, 4, 'gladly', false);
-- qn 125
insert into choice (question_id, order_choice, name, key) values (125, 1, 'substituted', false);
insert into choice (question_id, order_choice, name, key) values (125, 2, 'substituting', false);
insert into choice (question_id, order_choice, name, key) values (125, 3, 'substitutions', true);
insert into choice (question_id, order_choice, name, key) values (125, 4, 'substitute', false);
-- qn 126
insert into choice (question_id, order_choice, name, key) values (126, 1, 'inform', false);
insert into choice (question_id, order_choice, name, key) values (126, 2, 'succeed', false);
insert into choice (question_id, order_choice, name, key) values (126, 3, 'estimate', false);
insert into choice (question_id, order_choice, name, key) values (126, 4, 'establish', true);
-- qn 127
insert into choice (question_id, order_choice, name, key) values (127, 1, 'Happily', false);
insert into choice (question_id, order_choice, name, key) values (127, 2, 'Now that', true);
insert into choice (question_id, order_choice, name, key) values (127, 3, 'Despite', false);
insert into choice (question_id, order_choice, name, key) values (127, 4, 'In fact', false);
-- qn 128
insert into choice (question_id, order_choice, name, key) values (128, 1, 'readily', false);
insert into choice (question_id, order_choice, name, key) values (128, 2, 'diligently', true);
insert into choice (question_id, order_choice, name, key) values (128, 3, 'curiously', false);
insert into choice (question_id, order_choice, name, key) values (128, 4, 'extremely', false);
-- qn 129
insert into choice (question_id, order_choice, name, key) values (129, 1, 'whose', false);
insert into choice (question_id, order_choice, name, key) values (129, 2, 'his', false);
insert into choice (question_id, order_choice, name, key) values (129, 3, 'its', true);
insert into choice (question_id, order_choice, name, key) values (129, 4, 'this', false);
-- qn 130
insert into choice (question_id, order_choice, name, key) values (130, 1, 'thus', false);
insert into choice (question_id, order_choice, name, key) values (130, 2, 'as well as', true);
insert into choice (question_id, order_choice, name, key) values (130, 3, 'at last', false);
insert into choice (question_id, order_choice, name, key) values (130, 4, 'accordingly', false);
-- qn 131
insert into choice (question_id, order_choice, name, key) values (131, 1, 'serve', false);
insert into choice (question_id, order_choice, name, key) values (131, 2, 'served', false);
insert into choice (question_id, order_choice, name, key) values (131, 3, 'server', false);
insert into choice (question_id, order_choice, name, key) values (131, 4, 'service', true);
-- qn 132
insert into choice (question_id, order_choice, name, key) values (132, 1, 'Along', false);
insert into choice (question_id, order_choice, name, key) values (132, 2, 'During', true);
insert into choice (question_id, order_choice, name, key) values (132, 3, 'Without', false);
insert into choice (question_id, order_choice, name, key) values (132, 4, 'Between', false);
-- qn 133
insert into choice (question_id, order_choice, name, key) values (133, 1, 'apologize', true);
insert into choice (question_id, order_choice, name, key) values (133, 2, 'organize', false);
insert into choice (question_id, order_choice, name, key) values (133, 3, 'realize', false);
insert into choice (question_id, order_choice, name, key) values (133, 4, 'recognize', false);
-- qn 134
insert into choice (question_id, order_choice, name, key) values (134, 1, 'If you would like to join our property management team, call us today.', false);
insert into choice (question_id, order_choice, name, key) values (134, 2, 'Thank you for your patience while the main lobby is being painted.', false);
insert into choice (question_id, order_choice, name, key) values (134, 3, 'Please do not attempt to access the north lobby on these days.', false);
insert into choice (question_id, order_choice, name, key) values (134, 4, 'Questions or comments may be directed to the Management office.', true);
-- qn 135
insert into choice (question_id, order_choice, name, key) values (135, 1, 'quickly', true);
insert into choice (question_id, order_choice, name, key) values (135, 2, 'quicken', false);
insert into choice (question_id, order_choice, name, key) values (135, 3, 'quickest', false);
insert into choice (question_id, order_choice, name, key) values (135, 4, 'quickness', false);
-- qn 136
insert into choice (question_id, order_choice, name, key) values (136, 1, 'as far as', false);
insert into choice (question_id, order_choice, name, key) values (136, 2, 'even though', true);
insert into choice (question_id, order_choice, name, key) values (136, 3, 'such as', false);
insert into choice (question_id, order_choice, name, key) values (136, 4, 'whether', false);
-- qn 137
insert into choice (question_id, order_choice, name, key) values (137, 1, 'Of course, the shop is busiest on Saturdays.', false);
insert into choice (question_id, order_choice, name, key) values (137, 2, 'The suit fits me perfectly too.', true);
insert into choice (question_id, order_choice, name, key) values (137, 3, 'I made another purchase.', false);
insert into choice (question_id, order_choice, name, key) values (137, 4, 'He used to sell shirts.', false);
-- qn 138
insert into choice (question_id, order_choice, name, key) values (138, 1, 'former', false);
insert into choice (question_id, order_choice, name, key) values (138, 2, 'temporary', false);
insert into choice (question_id, order_choice, name, key) values (138, 3, 'superb', true);
insert into choice (question_id, order_choice, name, key) values (138, 4, 'best', false);
-- qn 139
insert into choice (question_id, order_choice, name, key) values (139, 1, 'In the event of bad weather, the animals will be inside.', false);
insert into choice (question_id, order_choice, name, key) values (139, 2, 'There are no exceptions to this policy.', true);
insert into choice (question_id, order_choice, name, key) values (139, 3, 'Ones younger than that can find much to enjoy.', false);
insert into choice (question_id, order_choice, name, key) values (139, 4, 'This fee includes lunch and a small a souvenir.', false);
-- qn 140
insert into choice (question_id, order_choice, name, key) values (140, 1, 'legal', false);
insert into choice (question_id, order_choice, name, key) values (140, 2, 'artistic', false);
insert into choice (question_id, order_choice, name, key) values (140, 3, 'athletic', false);
insert into choice (question_id, order_choice, name, key) values (140, 4, 'educational', true);
-- qn 141
insert into choice (question_id, order_choice, name, key) values (141, 1, 'events', true);
insert into choice (question_id, order_choice, name, key) values (141, 2, 'plays', false);
insert into choice (question_id, order_choice, name, key) values (141, 3, 'treatments', false);
insert into choice (question_id, order_choice, name, key) values (141, 4, 'trips', false);
-- qn 142
insert into choice (question_id, order_choice, name, key) values (142, 1, 'they', false);
insert into choice (question_id, order_choice, name, key) values (142, 2, 'me', true);
insert into choice (question_id, order_choice, name, key) values (142, 3, 'her', false);
insert into choice (question_id, order_choice, name, key) values (142, 4, 'one', false);
-- qn 143
insert into choice (question_id, order_choice, name, key) values (143, 1, 'prouder', false);
insert into choice (question_id, order_choice, name, key) values (143, 2, 'proudly', false);
insert into choice (question_id, order_choice, name, key) values (143, 3, 'pride', false);
insert into choice (question_id, order_choice, name, key) values (143, 4, 'proud', true);
-- qn 144
insert into choice (question_id, order_choice, name, key) values (144, 1, 'They include general and cosmetic procedures.', true);
insert into choice (question_id, order_choice, name, key) values (144, 2, 'We have relocated from neighboring Hillsborough.', false);
insert into choice (question_id, order_choice, name, key) values (144, 3, 'The Web site is a creation of A to Z Host Builders.', false);
insert into choice (question_id, order_choice, name, key) values (144, 4, 'Several of them are surprisingly expensive.', false);
-- qn 145
insert into choice (question_id, order_choice, name, key) values (145, 1, 'scheduled', false);
insert into choice (question_id, order_choice, name, key) values (145, 2, 'to schedule', true);
insert into choice (question_id, order_choice, name, key) values (145, 3, 'scheduling', false);
insert into choice (question_id, order_choice, name, key) values (145, 4, 'being scheduled', false);
-- qn 146
insert into choice (question_id, order_choice, name, key) values (146, 1, 'shoppers', false);
insert into choice (question_id, order_choice, name, key) values (146, 2, 'residents', false);
insert into choice (question_id, order_choice, name, key) values (146, 3, 'patients', true);
insert into choice (question_id, order_choice, name, key) values (146, 4, 'tenants', false);
-- qn 147
insert into choice (question_id, order_choice, name, key) values (147, 1, 'To report on airport renovations', false);
insert into choice (question_id, order_choice, name, key) values (147, 2, 'To give an update on a technical problem', true);
insert into choice (question_id, order_choice, name, key) values (147, 3, 'To introduce a new reservation system', false);
insert into choice (question_id, order_choice, name, key) values (147, 4, 'To advertise airline routes to some new cities', false);
-- qn 148
insert into choice (question_id, order_choice, name, key) values (148, 1, 'The number of flights available', false);
insert into choice (question_id, order_choice, name, key) values (148, 2, 'Dining options on flights', false);
insert into choice (question_id, order_choice, name, key) values (148, 3, 'Assistance for customers at airports', true);
insert into choice (question_id, order_choice, name, key) values (148, 4, 'Prices for international flights', false);
-- qn 149
insert into choice (question_id, order_choice, name, key) values (149, 1, 'Experience in video production', false);
insert into choice (question_id, order_choice, name, key) values (149, 2, 'Certain pieces of equipment', true);
insert into choice (question_id, order_choice, name, key) values (149, 3, 'A university degree in language studies', false);
insert into choice (question_id, order_choice, name, key) values (149, 4, 'An office with a reception area', false);
-- qn 150
insert into choice (question_id, order_choice, name, key) values (150, 1, 'It is a full-time position.', false);
insert into choice (question_id, order_choice, name, key) values (150, 2, 'It pays a fixed salary.', false);
insert into choice (question_id, order_choice, name, key) values (150, 3, 'It involves some foreign travel.', false);
insert into choice (question_id, order_choice, name, key) values (150, 4, 'It offers a choice of assignments.', true);
-- qn 151
insert into choice (question_id, order_choice, name, key) values (151, 1, 'It included multiple versions of Konserted.', false);
insert into choice (question_id, order_choice, name, key) values (151, 2, 'It was done over several days.', true);
insert into choice (question_id, order_choice, name, key) values (151, 3, 'It required participants to complete a survey.', false);
insert into choice (question_id, order_choice, name, key) values (151, 4, 'It took place at a series of concerts.', false);
-- qn 152
insert into choice (question_id, order_choice, name, key) values (152, 1, 'Searching for an event', false);
insert into choice (question_id, order_choice, name, key) values (152, 2, 'Searching for friends', false);
insert into choice (question_id, order_choice, name, key) values (152, 3, 'Inviting friends to a performance', true);
insert into choice (question_id, order_choice, name, key) values (152, 4, 'Posting reviews to a Web site', false);
-- qn 153
insert into choice (question_id, order_choice, name, key) values (153, 1, 'It was very well attended.', true);
insert into choice (question_id, order_choice, name, key) values (153, 2, 'It was moved to a larger venue.', false);
insert into choice (question_id, order_choice, name, key) values (153, 3, 'It featured a musical performance.', false);
insert into choice (question_id, order_choice, name, key) values (153, 4, 'It took place at the Koros Hall.', false);
-- qn 154
insert into choice (question_id, order_choice, name, key) values (154, 1, '40', false);
insert into choice (question_id, order_choice, name, key) values (154, 2, '50', false);
insert into choice (question_id, order_choice, name, key) values (154, 3, '120', false);
insert into choice (question_id, order_choice, name, key) values (154, 4, '270', true);
-- qn 155
insert into choice (question_id, order_choice, name, key) values (155, 1, 'On September 17', false);
insert into choice (question_id, order_choice, name, key) values (155, 2, 'On September 18', false);
insert into choice (question_id, order_choice, name, key) values (155, 3, 'On September 19', false);
insert into choice (question_id, order_choice, name, key) values (155, 4, 'On September 20', true);
-- qn 156
insert into choice (question_id, order_choice, name, key) values (156, 1, 'A construction firm', true);
insert into choice (question_id, order_choice, name, key) values (156, 2, 'A real estate agency', false);
insert into choice (question_id, order_choice, name, key) values (156, 3, 'A cargo-handling company', false);
insert into choice (question_id, order_choice, name, key) values (156, 4, 'A financial services provider', false);
-- qn 157
insert into choice (question_id, order_choice, name, key) values (157, 1, 'It needs more funding from investors.', false);
insert into choice (question_id, order_choice, name, key) values (157, 2, 'It will take years to finish.', true);
insert into choice (question_id, order_choice, name, key) values (157, 3, 'It was proposed by airport officials.', false);
insert into choice (question_id, order_choice, name, key) values (157, 4, 'It offers discounted tickets to city residents.', false);
-- qn 158
insert into choice (question_id, order_choice, name, key) values (158, 1, '[1]', true);
insert into choice (question_id, order_choice, name, key) values (158, 2, '[2]', false);
insert into choice (question_id, order_choice, name, key) values (158, 3, '[3]', false);
insert into choice (question_id, order_choice, name, key) values (158, 4, '[4]', false);
-- qn 159
insert into choice (question_id, order_choice, name, key) values (159, 1, 'She did not have any issues logging on to her computer.', false);
insert into choice (question_id, order_choice, name, key) values (159, 2, 'She does not think a document has errors.', false);
insert into choice (question_id, order_choice, name, key) values (159, 3, 'She is willing to review a document.', true);
insert into choice (question_id, order_choice, name, key) values (159, 4, 'She has time to meet representatives from Keyes Elegant Home.', false);
-- qn 160
insert into choice (question_id, order_choice, name, key) values (160, 1, 'Marketing', true);
insert into choice (question_id, order_choice, name, key) values (160, 2, 'Accounting', false);
insert into choice (question_id, order_choice, name, key) values (160, 3, 'Legal consulting', false);
insert into choice (question_id, order_choice, name, key) values (160, 4, 'Information technology services', false);
-- qn 161
insert into choice (question_id, order_choice, name, key) values (161, 1, 'It takes place in downtown Staffordsville.', false);
insert into choice (question_id, order_choice, name, key) values (161, 2, 'It is being held for the first time.', false);
insert into choice (question_id, order_choice, name, key) values (161, 3, 'It specializes in locally produced crafts.', false);
insert into choice (question_id, order_choice, name, key) values (161, 4, 'It will be held outdoors.', true);
-- qn 162
insert into choice (question_id, order_choice, name, key) values (162, 1, 'Sharing a space with another participant', true);
insert into choice (question_id, order_choice, name, key) values (162, 2, 'Paying a fee to participate', false);
insert into choice (question_id, order_choice, name, key) values (162, 3, 'Submitting images of the crafts', false);
insert into choice (question_id, order_choice, name, key) values (162, 4, 'Providing one`s own tenting', false);
-- qn 163
insert into choice (question_id, order_choice, name, key) values (163, 1, 'Sketches', false);
insert into choice (question_id, order_choice, name, key) values (163, 2, 'Photographs', false);
insert into choice (question_id, order_choice, name, key) values (163, 3, 'Pottery', false);
insert into choice (question_id, order_choice, name, key) values (163, 4, 'Jewelry', true);
-- qn 164
insert into choice (question_id, order_choice, name, key) values (164, 1, '[1]', true);
insert into choice (question_id, order_choice, name, key) values (164, 2, '[2]', false);
insert into choice (question_id, order_choice, name, key) values (164, 3, '[3]', false);
insert into choice (question_id, order_choice, name, key) values (164, 4, '[4]', false);
-- qn 165
insert into choice (question_id, order_choice, name, key) values (165, 1, 'Real estate', false);
insert into choice (question_id, order_choice, name, key) values (165, 2, 'Life insurance', false);
insert into choice (question_id, order_choice, name, key) values (165, 3, 'Home security', true);
insert into choice (question_id, order_choice, name, key) values (165, 4, 'Furniture moving', false);
-- qn 166
insert into choice (question_id, order_choice, name, key) values (166, 1, 'An outdoor motion sensor', false);
insert into choice (question_id, order_choice, name, key) values (166, 2, 'A smartphone application', true);
insert into choice (question_id, order_choice, name, key) values (166, 3, 'Home installation service', false);
insert into choice (question_id, order_choice, name, key) values (166, 4, 'Fire detection equipment', false);
-- qn 167
insert into choice (question_id, order_choice, name, key) values (167, 1, 'greet', false);
insert into choice (question_id, order_choice, name, key) values (167, 2, 'touch', false);
insert into choice (question_id, order_choice, name, key) values (167, 3, 'satisfy', true);
insert into choice (question_id, order_choice, name, key) values (167, 4, 'experience', false);
-- qn 168
insert into choice (question_id, order_choice, name, key) values (168, 1, 'To announce a name change', true);
insert into choice (question_id, order_choice, name, key) values (168, 2, 'To honor distinguished alumni', false);
insert into choice (question_id, order_choice, name, key) values (168, 3, 'To suggest revisions to a curriculum', false);
insert into choice (question_id, order_choice, name, key) values (168, 4, 'To list an individual`s accomplishments', false);
-- qn 169
insert into choice (question_id, order_choice, name, key) values (169, 1, 'affected', false);
insert into choice (question_id, order_choice, name, key) values (169, 2, 'founded', true);
insert into choice (question_id, order_choice, name, key) values (169, 3, 'confirmed', false);
insert into choice (question_id, order_choice, name, key) values (169, 4, 'settled', false);
-- qn 170
insert into choice (question_id, order_choice, name, key) values (170, 1, 'She plans to attend JATA`s anniversary celebration.', false);
insert into choice (question_id, order_choice, name, key) values (170, 2, 'She has taught courses in cybersecurity,', false);
insert into choice (question_id, order_choice, name, key) values (170, 3, 'She can take part in JATA`s logo design contest.', true);
insert into choice (question_id, order_choice, name, key) values (170, 4, 'She served on JATA`s Board of Trustees.', false);
-- qn 171
insert into choice (question_id, order_choice, name, key) values (171, 1, 'Its professors live on campus.', true);
insert into choice (question_id, order_choice, name, key) values (171, 2, 'Its students have access to modern equipment.', false);
insert into choice (question_id, order_choice, name, key) values (171, 3, 'It will be twenty years old on June 1.', false);
insert into choice (question_id, order_choice, name, key) values (171, 4, 'It is attended by international students.', false);
-- qn 172
insert into choice (question_id, order_choice, name, key) values (172, 1, 'A book publisher', false);
insert into choice (question_id, order_choice, name, key) values (172, 2, 'A newspaper', true);
insert into choice (question_id, order_choice, name, key) values (172, 3, 'A film production company', false);
insert into choice (question_id, order_choice, name, key) values (172, 4, 'A job-placement firm', false);
-- qn 173
insert into choice (question_id, order_choice, name, key) values (173, 1, 'She would like to participate in an interview.', false);
insert into choice (question_id, order_choice, name, key) values (173, 2, 'She does not think Mr. Erickson should be hired.', false);
insert into choice (question_id, order_choice, name, key) values (173, 3, 'She feels comfortable fulfilling a request.', true);
insert into choice (question_id, order_choice, name, key) values (173, 4, 'She has not read Mr. Erickson`s writing.', false);
-- qn 174
insert into choice (question_id, order_choice, name, key) values (174, 1, 'He has never been on a job interview before.', false);
insert into choice (question_id, order_choice, name, key) values (174, 2, 'He has held many different types of jobs.', true);
insert into choice (question_id, order_choice, name, key) values (174, 3, 'He is taking over Mr. Peters` position.', false);
insert into choice (question_id, order_choice, name, key) values (174, 4, 'He is a former colleague of Ms. Montaine.', false);
-- qn 175
insert into choice (question_id, order_choice, name, key) values (175, 1, 'Prior news reporting experience', false);
insert into choice (question_id, order_choice, name, key) values (175, 2, 'Ability to begin working immediately', false);
insert into choice (question_id, order_choice, name, key) values (175, 3, 'Communicating well with colleagues', false);
insert into choice (question_id, order_choice, name, key) values (175, 4, 'Staying with the company over the long term', true);
-- qn 176
insert into choice (question_id, order_choice, name, key) values (176, 1, 'Using plants to decorate cubicles', false);
insert into choice (question_id, order_choice, name, key) values (176, 2, 'Walking outdoors during breaks', false);
insert into choice (question_id, order_choice, name, key) values (176, 3, 'Using a calming noise machine', true);
insert into choice (question_id, order_choice, name, key) values (176, 4, 'Decorating with personal photographs', false);
-- qn 177
insert into choice (question_id, order_choice, name, key) values (177, 1, 'Because they are relatively expensive', false);
insert into choice (question_id, order_choice, name, key) values (177, 2, 'Because they bname natural light', true);
insert into choice (question_id, order_choice, name, key) values (177, 3, 'Because they are to hard to match to furniture', false);
insert into choice (question_id, order_choice, name, key) values (177, 4, 'Because they attract dust', false);
-- qn 178
insert into choice (question_id, order_choice, name, key) values (178, 1, 'It is the only business publication in Alberta.', false);
insert into choice (question_id, order_choice, name, key) values (178, 2, 'Its publisher is hiring additional staff.', false);
insert into choice (question_id, order_choice, name, key) values (178, 3, 'Its editors would like to hear from readers.', true);
insert into choice (question_id, order_choice, name, key) values (178, 4, 'It is sponsored by a furniture company.', false);
-- qn 179
insert into choice (question_id, order_choice, name, key) values (179, 1, 'She is a professional writer.', false);
insert into choice (question_id, order_choice, name, key) values (179, 2, 'She is starting a new company.', false);
insert into choice (question_id, order_choice, name, key) values (179, 3, 'She travels frequently in her work.', false);
insert into choice (question_id, order_choice, name, key) values (179, 4, 'She read the previous issue of Alberta Business Matters.', true);
-- qn 180
insert into choice (question_id, order_choice, name, key) values (180, 1, 'They are packable.', true);
insert into choice (question_id, order_choice, name, key) values (180, 2, 'They are affordable.', false);
insert into choice (question_id, order_choice, name, key) values (180, 3, 'They are available for a short time.', false);
insert into choice (question_id, order_choice, name, key) values (180, 4, 'They are made from recycled materials.', false);
-- qn 181
insert into choice (question_id, order_choice, name, key) values (181, 1, 'It uses a double-decker bus.', false);
insert into choice (question_id, order_choice, name, key) values (181, 2, 'It includes multiple meals at famous restaurants.', false);
insert into choice (question_id, order_choice, name, key) values (181, 3, 'It allows participants to see London from the water.', true);
insert into choice (question_id, order_choice, name, key) values (181, 4, 'It takes the entire day.', false);
-- qn 182
insert into choice (question_id, order_choice, name, key) values (182, 1, 'Transportation from hotels', false);
insert into choice (question_id, order_choice, name, key) values (182, 2, 'A tour guide', true);
insert into choice (question_id, order_choice, name, key) values (182, 3, 'Breakfast at a restaurant', false);
insert into choice (question_id, order_choice, name, key) values (182, 4, 'A ticket to the London Eye', false);
-- qn 183
insert into choice (question_id, order_choice, name, key) values (183, 1, 'Tour 2', true);
insert into choice (question_id, order_choice, name, key) values (183, 2, 'Tour 3', false);
insert into choice (question_id, order_choice, name, key) values (183, 3, 'Tour 4', false);
insert into choice (question_id, order_choice, name, key) values (183, 4, 'Tour 5', false);
-- qn 184
insert into choice (question_id, order_choice, name, key) values (184, 1, 'She prefers bus tours.', false);
insert into choice (question_id, order_choice, name, key) values (184, 2, 'She speaks French.', true);
insert into choice (question_id, order_choice, name, key) values (184, 3, 'She was on a business trip.', false);
insert into choice (question_id, order_choice, name, key) values (184, 4, 'She used LTC before.', false);
-- qn 185
insert into choice (question_id, order_choice, name, key) values (185, 1, 'It was expensive.', false);
insert into choice (question_id, order_choice, name, key) values (185, 2, 'It was disorganized.', false);
insert into choice (question_id, order_choice, name, key) values (185, 3, 'It was in a very crowded area.', true);
insert into choice (question_id, order_choice, name, key) values (185, 4, 'It was in an uninteresting part of the city.', false);
-- qn 186
insert into choice (question_id, order_choice, name, key) values (186, 1, 'Financial consulting', false);
insert into choice (question_id, order_choice, name, key) values (186, 2, 'Graphic design', true);
insert into choice (question_id, order_choice, name, key) values (186, 3, 'Marketing strategies', false);
insert into choice (question_id, order_choice, name, key) values (186, 4, 'Business writing', false);
-- qn 187
insert into choice (question_id, order_choice, name, key) values (187, 1, 'He attended the seminar with a coworker.', false);
insert into choice (question_id, order_choice, name, key) values (187, 2, 'He gave a presentation at the seminar.', false);
insert into choice (question_id, order_choice, name, key) values (187, 3, 'He received free shipping on a book purchase.', true);
insert into choice (question_id, order_choice, name, key) values (187, 4, 'He paid for some books in advance.', false);
-- qn 188
insert into choice (question_id, order_choice, name, key) values (188, 1, 'To explain a problem', true);
insert into choice (question_id, order_choice, name, key) values (188, 2, 'To ask for volunteers', false);
insert into choice (question_id, order_choice, name, key) values (188, 3, 'To request payment', false);
insert into choice (question_id, order_choice, name, key) values (188, 4, 'To promote a book', false);
-- qn 189
insert into choice (question_id, order_choice, name, key) values (189, 1, 'The deadline for submitting a project', false);
insert into choice (question_id, order_choice, name, key) values (189, 2, 'The content of a book review', false);
insert into choice (question_id, order_choice, name, key) values (189, 3, 'The time of a scheduled meeting', false);
insert into choice (question_id, order_choice, name, key) values (189, 4, 'The display of some information', true);
-- qn 190
insert into choice (question_id, order_choice, name, key) values (190, 1, '$17.60', true);
insert into choice (question_id, order_choice, name, key) values (190, 2, '$14.40', false);
insert into choice (question_id, order_choice, name, key) values (190, 3, '$16.00', false);
insert into choice (question_id, order_choice, name, key) values (190, 4, '$22.40', false);
-- qn 191
insert into choice (question_id, order_choice, name, key) values (191, 1, 'To report on the benefits of mixed-use buildings', false);
insert into choice (question_id, order_choice, name, key) values (191, 2, 'To provide an update on a project', true);
insert into choice (question_id, order_choice, name, key) values (191, 3, 'To encourage residents to apply for jobs', false);
insert into choice (question_id, order_choice, name, key) values (191, 4, 'To announce a change in city policy', false);
-- qn 192
insert into choice (question_id, order_choice, name, key) values (192, 1, 'Its cost efficiency', false);
insert into choice (question_id, order_choice, name, key) values (192, 2, 'Its compliance with environmental standards', false);
insert into choice (question_id, order_choice, name, key) values (192, 3, 'The anticipated quality of the renovation work', true);
insert into choice (question_id, order_choice, name, key) values (192, 4, 'The large amount of retail space', false);
-- qn 193
insert into choice (question_id, order_choice, name, key) values (193, 1, 'It received the approval it was seeking.', true);
insert into choice (question_id, order_choice, name, key) values (193, 2, 'It has the only available office spaces for rent in Clanton.', false);
insert into choice (question_id, order_choice, name, key) values (193, 3, 'It has moved its main office to the Anton Building.', false);
insert into choice (question_id, order_choice, name, key) values (193, 4, 'It is a relatively new company.', false);
-- qn 194
insert into choice (question_id, order_choice, name, key) values (194, 1, 'The distance to the nearest train station.', false);
insert into choice (question_id, order_choice, name, key) values (194, 2, 'The other occupants` types of business', false);
insert into choice (question_id, order_choice, name, key) values (194, 3, 'The completion date of the renovation', false);
insert into choice (question_id, order_choice, name, key) values (194, 4, 'The availability of employee parking', true);
-- qn 195
insert into choice (question_id, order_choice, name, key) values (195, 1, 'Unit 2B', false);
insert into choice (question_id, order_choice, name, key) values (195, 2, 'Unit 2C', false);
insert into choice (question_id, order_choice, name, key) values (195, 3, 'Unit 2D', false);
insert into choice (question_id, order_choice, name, key) values (195, 4, 'Unit 2E', true);
-- qn 196
insert into choice (question_id, order_choice, name, key) values (196, 1, 'She has used DGC`s services before.', true);
insert into choice (question_id, order_choice, name, key) values (196, 2, 'She teaches a course in boating safety.', false);
insert into choice (question_id, order_choice, name, key) values (196, 3, 'She is a resident of Daneston.', false);
insert into choice (question_id, order_choice, name, key) values (196, 4, 'She owns her own kayak.', false);
-- qn 197
insert into choice (question_id, order_choice, name, key) values (197, 1, 'Option 1', false);
insert into choice (question_id, order_choice, name, key) values (197, 2, 'Option 2', false);
insert into choice (question_id, order_choice, name, key) values (197, 3, 'Option 3', true);
insert into choice (question_id, order_choice, name, key) values (197, 4, 'Option 4', false);
-- qn 198
insert into choice (question_id, order_choice, name, key) values (198, 1, '$11', false);
insert into choice (question_id, order_choice, name, key) values (198, 2, '$13', true);
insert into choice (question_id, order_choice, name, key) values (198, 3, '$14', false);
insert into choice (question_id, order_choice, name, key) values (198, 4, '$15', false);
-- qn 199
insert into choice (question_id, order_choice, name, key) values (199, 1, 'It is open for business all year.', false);
insert into choice (question_id, order_choice, name, key) values (199, 2, 'It may close for the day if the weather is bad.', false);
insert into choice (question_id, order_choice, name, key) values (199, 3, 'It offers special rates for groups of ten or more.', true);
insert into choice (question_id, order_choice, name, key) values (199, 4, 'It accepts reservations on its Web site.', false);
-- qn 200
insert into choice (question_id, order_choice, name, key) values (200, 1, 'They can fit three adults.', false);
insert into choice (question_id, order_choice, name, key) values (200, 2, 'They can be rented overnight.', false);
insert into choice (question_id, order_choice, name, key) values (200, 3, 'They are suitable for small children.', false);
insert into choice (question_id, order_choice, name, key) values (200, 4, 'They are equipped with life jackets.', true);

-- side
-- side - part1
insert into side (set_question_id, paragraph, seq) values (1, '<p><strong>1. M-Au</strong></p><p><strong>(A) He''s parking a truck.</strong></p><p>(B) He''s lifting some furniture.</p><p>(C) He''s starting an engine.</p><p>(D) He''s driving a car.</p>', 1);
insert into side (set_question_id, paragraph, seq) values (1, '<p>https://study4.com/media/tez_media1/img/ets_toeic_2022_test_1_1.png</p>', 2);
insert into side (set_question_id, paragraph, seq) values (2, '<p><strong>2. W-Br</strong></p><p>(A) Some curtains have been closed.</p><p>(B) Some jackets have been laid on a chair.</p><p><strong>(C) Some people are gathered around a desk.</strong></p><p>(D) Someone is turning on a lamp.</p>', 1);
insert into side (set_question_id, paragraph, seq) values (2, '<p>https://study4.com/media/tez_media1/img/ets_toeic_2022_test_1_2.png</p>', 2);
insert into side (set_question_id, paragraph, seq) values (3, '<p><strong>3. M-Cn</strong></p><p>(A) One of the women is reaching into her bag.</p><p><strong>(B) The women are waiting in a line.</strong></p><p>(C) The man is leading a tour group.</p><p>(D) The man is opening a cash register.</p>', 1);
insert into side (set_question_id, paragraph, seq) values (3, '<p>https://study4.com/media/tez_media1/img/ets_toeic_2022_test_1_3.png</p>', 2);
insert into side (set_question_id, paragraph, seq) values (4, '<p><strong>4. W-Am</strong></p><p><strong>(A) The man is bending over a bicycle.</strong></p><p>(B) A wheel has been propped against a stack of bricks.</p><p>(C) The man is collecting some pieces of wood.</p><p>(D) A handrail is being installed.</p>', 1);
insert into side (set_question_id, paragraph, seq) values (4, '<p>https://study4.com/media/tez_media1/img/ets_toeic_2022_test_1_4.png</p>', 2);
insert into side (set_question_id, paragraph, seq) values (5, '<p><strong>5. M-Am</strong></p><p>(A) An armchair has been placed under a window.</p><p>(B) Some reading materials have fallen on the floor.</p><p>(C) Some flowers are being watered.</p><p><strong>(D) Some picture frames are hanging on a wall.</strong></p>', 1);
insert into side (set_question_id, paragraph, seq) values (5, '<p>https://study4.com/media/tez_media1/img/ets_toeic_2022_test_1_5.png</p>', 2);
insert into side (set_question_id, paragraph, seq) values (6, '<p><strong>6. W-Br</strong></p><p>(A) She''s adjusting the height of an umbrella.</p><p>(B) She''s inspecting the tires on a vending cart.</p><p><strong>(C) There''s a mobile food stand on a walkway.</strong></p><p>(D) There are some cooking utensils on the ground.</p>', 1);
insert into side (set_question_id, paragraph, seq) values (6, '<p>https://study4.com/media/tez_media1/img/ets_toeic_2022_test_1_6.png</p>', 2);

-- side - part2
insert into side (set_question_id, paragraph, seq) values (7, '<p><strong>M-Au:</strong> Why was this afternoon''s meeting canceled?</p><p><strong>W-Br:</strong></p><p>(A) Room 206, I think.</p><p><strong>(B) Because the manager is out of the office.</strong></p><p>(C) Let''s review the itinerary for our trip.</p>', 1);
insert into side (set_question_id, paragraph, seq) values (8, '<p><strong>W-Br:</strong> You use the company fitness center, don''t you?</p><p><strong>M-Cn:</strong></p><p><strong>(A) Yes, every now and then.</strong></p><p>(B) Please center the text on the page.</p><p>(C) I think it fits you well.</p>', 1);
insert into side (set_question_id, paragraph, seq) values (9, '<p><strong>W-Am:</strong> Do you have the images from the graphics department?</p><p><strong>M-Au:</strong></p><p>(A) OK, that won''t be a problem.</p><p>(B) A high-definition camera.</p><p><strong>(C) No, they''re not ready yet.</strong></p>', 1);
insert into side (set_question_id, paragraph, seq) values (10, '<p><strong>M-Cn:</strong> When are you moving to your new office?</p><p><strong>W-Am:</strong></p><p>(A) The office printer over there.</p><p>(B) The water bill is high this month.</p><p><strong>(C) The schedule is being revised.</strong></p>', 1);
insert into side (set_question_id, paragraph, seq) values (11, '<p><strong>W-Am:</strong> Would you like to sign up for the company retreat?</p><p><strong>M-Au:</strong></p><p><strong>(A) Sure, I''ll write my name down.</strong></p><p>(B) Twenty people, maximum.</p><p>(C) Can replace the sign?</p>', 1);
insert into side (set_question_id, paragraph, seq) values (12, '<p><strong>M-Cn:</strong> How often do have to submit my time sheet?</p><p><strong>W-Br:</strong></p><p>(A) Five sheets of paper.</p><p><strong>(B) You need to do it once a week.</strong></p><p>(C) No, I don''t usually wear a watch.</p>', 1);
insert into side (set_question_id, paragraph, seq) values (13, '<p><strong>W-Br:</strong> I can buy a monthly gym membership, right?</p><p><strong>M-Cn:</strong></p><p>(A) A very popular exercise routine.</p><p>(B) The exercise room is on your right.</p><p><strong>(C) Yes, at the front desk.</strong></p>', 1);
insert into side (set_question_id, paragraph, seq) values (14, '<p><strong>M-Au:</strong> Have you put price tags on all the clearance items?</p><p><strong>W-Am:</strong></p><p><strong>(A) Yes, everything''s been labeled.</strong></p><p>(B) It is a little cloudy.</p><p>(C) Where is your name tag?</p>', 1);
insert into side (set_question_id, paragraph, seq) values (15, '<p><strong>W-Br:</strong> Don''t we still need to change the newspaper layout?</p><p><strong>M-Cn:</strong></p><p>(A) Down the hall on your right.</p><p><strong>(B) No, it''s already been changed.</strong></p><p>(C) A new computer program.</p>', 1);
insert into side (set_question_id, paragraph, seq) values (16, '<p><strong>W-Br:</strong> What''s the total cost of the repair work?</p><p><strong>W-Am:</strong></p><p><strong>(A) It''s free because of the warranty.</strong></p><p>(B) I have some boxes you can use.</p><p>(C) In a couple of hours.</p>', 1);
insert into side (set_question_id, paragraph, seq) values (17, '<p><strong>W-Am:</strong> Where can I get a new filing cabinet?</p><p><strong>M-Au:</strong></p><p>(A) All of the cabins have been rented.</p><p>(B) I''ll put the tiles in the corner.</p><p><strong>(C) All furniture requests must be approved first.</strong></p>', 1);
insert into side (set_question_id, paragraph, seq) values (18, '<p><strong>M-Cn:</strong> How do reset my password?</p><p><strong>W-Am:</strong></p><p>(A) By the end of the month.</p><p><strong>(B) You should call the help desk.</strong></p><p>(C) Thanks for setting the table.</p>', 1);
insert into side (set_question_id, paragraph, seq) values (19, '<p><strong>M-Au:</strong> Could you check to see if that monitor is plugged in?</p><p><strong>M-Cn:</strong></p><p>(A) I didn''t send them yet.</p><p>(B) A longer power cord.</p><p><strong>(C) Do you want me to check them all?</strong></p>', 1);
insert into side (set_question_id, paragraph, seq) values (20, '<p><strong>M-Cn:</strong> Is the new inventory process more efficient?</p><p><strong>W-Br:</strong></p><p><strong>(A) It only took me an hour.</strong></p><p>(B) Yes, she''s new here.</p><p>(C) I''ll have the fish.</p>', 1);
insert into side (set_question_id, paragraph, seq) values (21, '<p><strong>M-Au:</strong> Would you like some ice cream or cake for dessert?</p><p><strong>W-Am:</strong></p><p>(A) Because I''m hungry.</p><p>(B) Yes, I liked it.</p><p><strong>(C) I''m trying to avoid sugar.</strong></p>', 1);
insert into side (set_question_id, paragraph, seq) values (22, '<p><strong>W-Br:</strong> Who''s doing the product demonstration this afternoon?</p><p><strong>M-Au:</strong></p><p>(A) That bus station is closed, sorry.</p><p><strong>(B) I''m leaving for New York at lunchtime.</strong></p><p>(C) Let me show you a few more.</p>', 1);
insert into side (set_question_id, paragraph, seq) values (23, '<p><strong>M-Cn:</strong> Your presentation''s being reviewed at today''s managers'' meeting.</p><p><strong>W-Br:</strong></p><p><strong>(A) I didn''t have much time to complete it.</strong></p><p>(B) Next slide, please.</p><p>(C) That movie had great reviews.</p>', 1);
insert into side (set_question_id, paragraph, seq) values (24, '<p><strong>W-Br:</strong> Don''t you carry these shoes in red?</p><p><strong>M-Au:</strong></p><p>(A) I''ll lift from this end.</p><p><strong>(B) There''s a new shipment coming tomorrow.</strong></p><p>(C) I have time to read it now.</p>', 1);
insert into side (set_question_id, paragraph, seq) values (25, '<p><strong>W-Am:</strong> Would you like to have lunch with the clients?</p><p><strong>M-Cn:</strong></p><p>(A) About a three-hour flight.</p><p>(B) The first stage of the project.</p><p><strong>(C) Sure, we can go to the café downstairs.</strong></p>', 1);
insert into side (set_question_id, paragraph, seq) values (26, '<p><strong>M-Au:</strong> How about hiring an event planner to organize the holiday party?</p><p><strong>W-Br:</strong></p><p>(A) I think it''s on the lower shelf.</p><p>(B) Sure, I''d love to attend.</p><p><strong>(C) There''s not much money in the budget.</strong></p>', 1);
insert into side (set_question_id, paragraph, seq) values (27, '<p><strong>M-Cn:</strong> Isn''t that carmaker planning to start exporting electric cars?</p><p><strong>W-Am:</strong></p><p><strong>(A) Yes, I''ve heard that''s the plan.</strong></p><p>(B) A ticket to next year''s car show.</p><p>(C) Congratulations on your promotion!</p>', 1);
insert into side (set_question_id, paragraph, seq) values (28, '<p><strong>W-Am:</strong> David trained the interns to use the company database, didn''t he?&nbsp;</p><p><strong>M-Cn:</strong></p><p><strong>(A) Actually, it was Hillary.</strong></p><p>(B) An internal audit.</p><p>(C) He''s good company.</p>', 1);
insert into side (set_question_id, paragraph, seq) values (29, '<p><strong>M-Au:</strong> Who''s responsible for researching the housing market in India?&nbsp;</p><p><strong>W-Br:</strong></p><p><strong>(A) The senior director is heading up that team.</strong></p><p>(B) Every morning at ten o''clock.</p><p>(C) Yes, it''s on Main Street.</p>', 1);
insert into side (set_question_id, paragraph, seq) values (30, '<p><strong>W-Am:</strong> Have you arranged a ride to take us to the convention center, or should I?&nbsp;</p><p><strong>M-Au:</strong></p><p>(A) Unfortunately, there isn''t an extra bag.</p><p>(B) I don''t have the phone number for the taxi service.</p><p><strong>(C) We''ve accepted credit cards before.</strong></p>', 1);
insert into side (set_question_id, paragraph, seq) values (31, '<p><strong>M-Cn:</strong> These purchases should have been entered on your expense report.&nbsp;</p><p><strong>W-Br:</strong></p><p>(A) No thanks, I don''t need anything from the store.</p><p>(B) The entrance is on Thirty-First Street.</p><p><strong>(C) I thought I had until Friday to do that.</strong></p>', 1);

-- side - part3
insert into side (set_question_id, paragraph, seq) values (32, '<p><strong>W-Br</strong> Hi, it''s Martina from Accounting. <strong>(32, 33) l''d like to reserve the main conference room for a meeting I''ll be leading on Friday with colleagues from our New York office.</strong></p><p><strong>M-Cn</strong> Sure, that shouldn''t be a problem. <strong>(33) What time is the meeting?</strong></p><p><strong>W-Br</strong> It''s from nine to eleven A.M.</p><p><strong>M-Cn</strong> OK <strong>(33) I''ll block off that time slot for you. Do you need any special equipment besides a laptop and projector?</strong></p><p><strong>W-Br</strong> No, but <strong>(34) I''ll need the key so I can go in a little early and set up. Can pick that up on Friday morning?</strong></p><p><strong>M-Cn</strong> Absolutely.</p>', 1);
insert into side (set_question_id, paragraph, seq) values (33, '<p><strong>W-Am</strong> Satoshi, <strong>(35) have you already started working on the budget for next year?</strong></p><p><strong>M-Au</strong> Not yet... but I do plan to start it in the next day or so.</p><p><strong>W-Am</strong> OK, perfect. <strong>(36) I''d like to add some new engineers to my team next year if we can afford it.</strong> thought one might be enough, but I realized we''ll probably need three to handle our company''s new contracts.</p><p><strong>M-Au</strong> No problem. I can include that in the budget. <strong>(37) I''ll just need the details about the positions, including the job titles and expected salaries. Could you send that to me?</strong></p>', 1);
insert into side (set_question_id, paragraph, seq) values (34, '<p><strong>M-Cn</strong> Welcome to Business Suit Outlet. How can I help you?</p><p><strong>W-Br </strong>Hello. <strong>(38) I''m interviewing for a job next week, and I wanted to buy a new suit.</strong></p><p><strong>M-Cn</strong> Congratulations! Do you have anything particular in mind?</p><p><strong>W-Br</strong> Well, <strong>(39) there''s one in your display window that looks nice. But I don''t really like the color...</strong></p><p><strong>M-Cn</strong> That one only comes in black. But we do have suits in other colors that are fashionable and appropriate for business.</p><p><strong>W-Br</strong> OK. I can only spend 150 dollars, and I''d like a style similar to the one in the window.</p><p><strong>M-Cn</strong> Let me show you some suits in that price range. By the way, <strong>(40) any alterations needed for the suit are included in the price.</strong></p>', 1);
insert into side (set_question_id, paragraph, seq) values (35, '<p><strong>W-Br</strong> Ellenville Public Library. How can I help you?</p><p><strong>M-Cn</strong> Hi, I''m calling from the company Grover and James. <strong>(41) We''re interested in filming a scene for a movie in the lobby of the library.</strong> Its historic architecture is just what we''re looking for.</p><p><strong>W-Br</strong> Well... <strong>(42) we actually had a film shoot in a our library last year. And the thing is... they said it would take one day and it ended up taking three. I''m concerned that will happen again.</strong></p><p><strong>M-Cn</strong> I understand, but this is a very short scene.</p><p><strong>W-Br </strong>Well, <strong>(43) we have a board meeting here next week. I could give you ten minutes at the beginning to give us the details.</strong></p>', 1);
insert into side (set_question_id, paragraph, seq) values (36, '<p><strong>M-Au</strong> Excuse me, <strong>(44) I''m looking for Axel Schmidt''s painting titled The Tulips.</strong></p><p><strong>W-Am</strong> Unfortunately, his paintings aren''t on display. But it''s just temporary <strong>(45) we''re putting new flooring in that gallery.</strong> If you come back in a couple of weeks, the floors will be done, and you can see all of Schmidt''s artwork.</p><p><strong>M-Au</strong> Oh, that''s too bad. really wanted to see that painting.</p><p><strong>W-Am</strong> I''m sorry about that. But <strong>(46) we sell items featuring that painting in the gift shop. You could buy a souvenir sO you could enjoy The Tulips every day!</strong></p>', 1);
insert into side (set_question_id, paragraph, seq) values (37, '<p><strong>W-Br</strong> Hey, Dmitry. <strong>(47) Are you still working on your sales report? Collecting all the data from the car dealerships in my region is taking me such a long time.</strong> Especially because this year management wants additional information on vehicle purchases, like model and color...</p><p><strong>M-Au</strong> <strong>(48) Are you using the sales computation software? That''s what I used for my report, and it worked really well.</strong></p><p><strong>W-Br</strong> Oh- <strong>(48) you already finished it?</strong></p><p><strong>M-Au</strong> Well-I''m done collecting and analyzing the data, but <strong>(49) I''m having trouble with the presentation. We didn''t get any guidelines for that.</strong></p><p><strong>W-Br</strong> <strong>(49) Remember Julie''s presentation last year? It was very impressive.</strong> The slides are available on our company intranet.</p>', 1);
insert into side (set_question_id, paragraph, seq) values (38, '<p><strong>W-Am</strong> Thanks for coming in, Omar. <strong>(50) You might''ve heard that Rosa Garcia is retiring at the end of November. This means her position as director of information security in Singapore will be vacant.</strong> I''d like to know if you''d be interested.</p><p><strong>M-Cn</strong> Oh! That would be a promotion for me. Well, hmm. I''ll need a little time to think about it and talk t over with my family. <strong>(51) I do have a question. When would I start the position?</strong></p><p><strong>W-Am</strong> The first week of December ideally. <strong>(52) We''d pay for all your moving expenses, of course.</strong> If you decide to accept the offer.</p>', 1);
insert into side (set_question_id, paragraph, seq) values (39, '<p><strong>M-Cn</strong> Maryam, <strong>(53) did you hear that our construction company won the bid to build the river dam next to Burton City?</strong></p><p><strong>W-Br</strong> I did! This is such a major project for us... <strong>(54) the dam''s expected to produce enough electricity to power all of Burton.</strong></p><p><strong>M-Cn</strong> Right. Say, do you know when construction will begin?</p><p><strong>W-Br</strong> I don''t, but here comes the project manager now. He may have a better idea... <strong>(55) Gerhard, are there any updates on the dam construction?</strong></p><p><strong>M-Au</strong> Well, <strong>(55) we''re going to have to wait until the all permits are approved.</strong> It''ll be a while before anything else can happen.</p>', 1);
insert into side (set_question_id, paragraph, seq) values (40, '<p><strong>M-Au</strong> <strong>(56) I have a question about a customer''s prescription-he''s... oh, I''m sorry. I see you''re busy.</strong></p><p><strong>W-Am</strong> I don''t have much to do.</p><p><strong>M-Au</strong> <strong>(57) His doctor prescribed a 30-day supply of this allergy medication, but I noticed we only have enough on the shelf for fifteen days.</strong></p><p><strong>W-Am</strong> Our weekly delivery arrives early tomorrow morning. Go ahead and give him the fifteen, and ask him to please come back for the rest. It''s allergy season, so a we''re selling a lot of that medicine.</p><p><strong>M-Au </strong>Then <strong>(58) maybe we should increase the number of bottles in our next order from the distributor.</strong></p>', 1);
insert into side (set_question_id, paragraph, seq) values (41, '<p><strong>M-Cn</strong> <strong>(59) Good morning, Ms. Davis. (60) We''ve received comments from your legal team on the terms and agreements for the travel rewards credit card that we issued.</strong></p><p><strong>M-Au</strong> Could you explain the revisions we need to make to be in compliance with the law?</p><p><strong>W-Am</strong> Sure. <strong>(60) The problem with the agreement is this: it doesn''t disclose to users that if a card isn''t used for a year, the account will be suspended.</strong></p><p><strong>M-Cn</strong> Oh, that''s an oversight on our part. We''re glad you caught that.</p><p><strong>W-Am</strong> <strong>(61) We don''t want to be fined by banking regulators, so all cardholders will need to be notified by the end of the month.</strong></p>', 1);
insert into side (set_question_id, paragraph, seq) values (42, '<p><strong>M-Au</strong> Ms. Giordano, it looks like the last of the wedding guests have left. <strong>(62) My staff''s going to start packing up our dishes and loading the van.</strong></p><p><strong>W-Br</strong> That''s fine, thank you. <strong>(62) The food was delicious. My son and his new wife were very happy with your service.</strong></p><p><strong>M-Au</strong> I''m glad you enjoyed it. And, again, <strong>(63) l''m sorry that some of our waitstaff were late arriving.</strong> They said they drove right past the turnoff.</p><p><strong>W-Br </strong>I understand. The venue is difficult to see from the road. <strong>(64) I really like this location, though, with its view of the mountains from the gardens in the back.</strong></p>', 1);
insert into side (set_question_id, paragraph, seq) values (42, '<p>https://lh6.googleusercontent.com/AWbPfUpA0bKxy18rFIqOUN4vLDdpAB5aQAd99f09lqW30z5ZUsjQ7zulKtvVYspp7rCPZDWJeIeVS_MVvYjJehGoNdnxSKxaMhy0eVhtRUPFzP8qCWKqG-KAeZZ38wqzajPV1zjOnOOdDI5vtQ</p>', 2);
insert into side (set_question_id, paragraph, seq) values (43, '<p><strong>W-Am</strong> Hey, Thomas? You like concerts. <strong>(65) Any chance you''re interested in the local band showcase this weekend? I have two tickets that I don''t need.</strong></p><p><strong>M-Au (65) You got tickets to that? That''s surprising! I heard that they sold out in just a few days.</strong></p><p><strong>W-Am</strong> They did, but I actually won these in a radio contest. That''s why I''m giving them away instead of selling them. <strong>(66) Good seats, too. Right in the middle, close to the stage.</strong></p><p><strong>M-Au</strong> Sure, I''ll take them. Thanks! Why can''t you go?</p><p><strong>W-Am (67) This weekend is my parents'' anniversary. My sisters and I are planning a party for them at their home in Boston.</strong></p>', 1);
insert into side (set_question_id, paragraph, seq) values (43, '<p>https://study4.com/media/tez_media1/img/ets_toeic_2022_test_1_65_67.png</p>', 2);
insert into side (set_question_id, paragraph, seq) values (44, '<p><strong>M-Cn</strong> Hello. <strong>(68) Bellevue Apartments Management Office. Can I help you?</strong></p><p><strong>W-Am</strong> Hi. I''m Azusa Suzuki. <strong>(69) I''m a new tenant here, and live in 2A.</strong></p><p><strong>M-Cn</strong> How''s everything in your apartment so far?</p><p><strong>W-Am</strong> Very good. One thing, though... <strong>(69) When can you put my name on the building directory? It still says the previous tenant''s name.</strong></p><p><strong>M-Cn</strong> No problem. I can send someone over now. Unit 2A, you said?</p><p><strong>W-Am</strong> Yes. And, <strong>(70) I''ll be stopping by your office tomorrow with my February rent check.</strong></p><p><strong>M-Cn</strong> OK. See you then.</p>', 1);
insert into side (set_question_id, paragraph, seq) values (44, '<p>https://study4.com/media/tez_media1/img/ets_toeic_2022_test_1_68_70.png</p>', 2);

-- side - part4
insert into side (set_question_id, paragraph, seq) values (45, '<p><strong>W-Am</strong> Hello, this is Karen Smith. <strong>(71) I have an appointment with Dr. Miller for my annual eye exam on Tuesday. (72) Unfortunately, I won''t be able to make it. If possible, I''d like to reschedule for later in the week.</strong> If Dr. Miller is available in the afternoon, that would work better for me. <strong>(73) I also wanted to ask about your warranty for eyeglasses. What exactly does the warranty cover?</strong> Thank you, and please call me back at 555-0110.</p>', 1);
insert into side (set_question_id, paragraph, seq) values (46, '<p><strong>M-Cn</strong> <strong>(74) Curious about how chocolate is made? Then come visit us at Bodin''s Chocolate Factory!</strong> You''ll have a great time. <strong>(74) We offer guided tours every Saturday and Sunday at our factory, located directly across from Appleton Shopping Center.</strong> During your two-hour visit, you''ll observe the creation and packaging of Bodin''s products. And <strong>(75) each visitor will get their picture taken with Cheery, our adorable chocolate mascot, to take home as a souvenir.</strong> Right now, <strong>(76) with the coupon available on our Web site, you can bring in a group of twelve or more people for half the price. Download yours today!</strong></p>', 1);
insert into side (set_question_id, paragraph, seq) values (47, '<p><strong>W-Br</strong> Attention, everyone. <strong>(77) Unfortunately, we''ve had to stop the movie.</strong> As you''ve probably noticed, <strong>(78) we''re having technical difficulties with the audio. I''m very sorry about this</strong>--we take our sound quality seriously and want you to know we''ll have technicians here as soon as possible to resolve this issue. As you exit, <strong>(79) please stop by the customer service desk in the lobby to pick up two free tickets for your next movie.</strong> Again, my apologies for the inconvenience.</p>', 1);
insert into side (set_question_id, paragraph, seq) values (48, '<p><strong>W-Am</strong> <strong>(80) Welcome to Branson Tech''s second annual conference on computer security. (81) We decided to try something different to publicize the event this year. We advertised primarily through social media rather than by e-mail newsletters or on company Web sites.</strong> And over 300 people are here! The first presentations will begin in fifteen minutes. The talks will take place in different rooms throughout the building, So <strong>(82) please be sure to check your programs for the list of topics, speakers, and locations.</strong></p>', 1);
insert into side (set_question_id, paragraph, seq) values (49, '<p><strong>M-Au</strong> Welcome, everyone. <strong>(83) On behalf of the Department of Transportation, I''d like to announce a new experimental program to reduce traffic in Greenville.</strong> Beginning in January, there will be a ten-dollar fee for each car that enters the city. <strong>(84) There will, however, be a lower fee for people who commute to Greenville for work.</strong> They will be asked to pay five dollars rather than ten dollars. These charges are aimed at deterring drivers from coming into this very crowded area. <strong>(85) The program will be in effect for three months. After that, we will determine if the program has decreased traffic congestion enough to continue it permanently.</strong></p>', 1);
insert into side (set_question_id, paragraph, seq) values (50, '<p><strong>W-Br</strong> Thanks for tuning in to Music Today on Radio 49. First, <strong>(86) a reminder that the Classical Music Festival is this weekend. (87) Radio 49 is giving listeners a chance to win a pair of tickets by entering a contest.</strong> And tickets are almost sold out. Just go to our Web site and tell us what you enjoy most on our station, and we''ll pick a winner at random. This year is the tenth anniversary of the event, which was founded by a famous classical musician, Umesh Gupta. <strong>(88) On tomorrow morning''s program, Mr. Gupta will be here for an interview about the history of the festival.</strong> Be sure to join us for that.</p>', 1);
insert into side (set_question_id, paragraph, seq) values (51, '<p><strong>W-Am</strong> Thank you for visiting our booth here at the trade fair. <strong>(89) We''re so excited to show you our new patio furniture.</strong> You''re probably familiar with our wooden outdoor tables and chairs, and <strong>(90) we want you to know that we''ve expanded that line to include plastic furniture. This furniture is very durable.</strong> It can withstand any kind of weather and it needs no maintenance. <strong>(91) I''m going to hand out a sample of the plastic material we use. Please pass it around after you''ve had a chance to look at it.</strong></p>', 1);
insert into side (set_question_id, paragraph, seq) values (52, '<p><strong>W-Br</strong> <strong>(92) This is Noriko, the human resources supervisor here in Albany. (93) l''m calling about your request to transfer to our branch in Havertown... I know your commute is difficult, and it takes you over an hour to drive to this office. So I''ve contacted the manager at that location</strong>, and there is a need for a skilled software engineer. There are a few forms that you''ll need to fill out, though, to complete the request. <strong>(94) Now we need to talk about your work schedule to decide when you''ll start at the new location.</strong> Please call me back.</p>', 1);
insert into side (set_question_id, paragraph, seq) values (53, '<p><strong>M-Cn</strong> You''re listening to Making My Company with Mark Sullivan. <strong>(95) In each episode I invite entrepreneurs from around the world to talk about how they built their successful businesses.</strong> In celebration of our radio show''s ten-year anniversary, <strong>(96) our Web site now has all of our previously aired episodes. You can access them with the click of a button.</strong> You can even download them onto mobile devices to listen to on the go! OK, now, welcome Haru Nakamura to the show. <strong>(97) Ms. Nakamura is excited to be here today.</strong></p>', 1);
insert into side (set_question_id, paragraph, seq) values (53, '<p>https://study4.com/media/tez_media1/img/ets_toeic_2022_test_1_95_97.png</p>', 2);
insert into side (set_question_id, paragraph, seq) values (54, '<p><strong>M-Au</strong> It''s Akira, calling from the district manager''s office. The visual merchandising team wants to make a slight change to the fall display standards that we sent you yesterday. <strong>(98) They want to move the shirts with the vertical stripes-hang them instead of having them displayed on the shelf. We''ll display some colorful accessories there instead, like scarves and ties.</strong> Also, <strong>(99) hang all the socks on gridwall panels by the cash registers. </strong>Those sell best when people can grab them when they walk up to pay. <strong>(100) The thicker, cold-weather socks will be shipped to you soon. You''ll get an e-mail confirmation with the details when they''re sent.</strong></p>', 1);
insert into side (set_question_id, paragraph, seq) values (54, '<p>https://study4.com/media/tez_media1/img/ets_toeic_2022_test_1_98_100.png</p>', 2);

-- side - part6
insert into side (set_question_id, paragraph, seq) values (85, '<p><strong>NOTICE</strong></p><p>&nbsp;</p><p>To continue providing the highest level of <strong>--(131)--</strong> to our corporate tenants, we have scheduled the south lobby restrooms for maintenance this weekend, May 13 and May 14. <strong>--(132)--</strong> this time, the restrooms will be out of order, so tenants and their guests should instead use the facilities in the north lobby.</p><p>&nbsp;</p><p>We <strong>--(133)--</strong> for any inconvenience this might cause. <strong>--(134)--</strong>.</p><p>&nbsp;</p><p>Denville Property Management Partners</p>', 1);
insert into side (set_question_id, paragraph, seq) values (86, '<p>I recently received a last-minute invitation to a formal dinner. I bought a suit and needed it tailored as <strong>--(135)--</strong> as possible. A friend suggested that I use Antonio''s Tailoring Shop in downtown Auckland. When I met Antonio, he gave me his full attention <strong>--(136)--</strong> his shop was busy. He took the time to listen to me and carefully noted all my measurements. He then explained all the tailoring costs up front and assured me that he could have my suit ready in three days, but he had it done in two! <strong>--(137)--</strong>.</p><p>&nbsp;</p><p>Antonio has run his shop for over 30 years, and his experience really shows. He is a <strong>--(138)--</strong> tailor.</p><p>I highly recommend him.<br>&nbsp;</p><p>Jim Kestren, Auckland</p>', 1);
insert into side (set_question_id, paragraph, seq) values (87, '<p>Dear Director Yoshida,</p><p>&nbsp;</p><p>Thank you for your school''s interest in visiting our farm next month. Please note that children must be at least six years old to visit and tour the farm.<strong>--(139)--</strong>. I have enclosed a list of the <strong>--(140)--</strong> activities available for our young visitors. Two of these <strong>--(141)--</strong> must be scheduled in advance. They are a cheese-making class and an introduction to beekeeping. Both are very popular with our visitors.</p><p>&nbsp;</p><p>Please let <strong>--(142)--</strong> know your selection by early next week. I look forward to welcoming your group soon!</p><p>&nbsp;</p><p>Sincerely,<br>&nbsp;</p><p>Annabel Romero, Coordinator</p><p>Merrytree Family Farm</p>', 1);
insert into side (set_question_id, paragraph, seq) values (88, '<p><strong>To:</strong> Lakshmi Aiyar<br><strong>From:</strong> info@healthonity.com<br><strong>Date:</strong> February 8<br><strong>Subject:</strong> Healthonity Dental</p><p>&nbsp;</p><p>Dear Ms. Aiyar,</p><p>&nbsp;</p><p>We, the dental health professionals of the Healthonity Dental Center, are <strong>--(143)--</strong> to introduce our just-opened practice. We aim to provide access to the largest team of dental specialists in the region. On our Web site, you can see a comprehensive list of the procedures we offer. <strong>--(144)--</strong>. The members of our practice share a passion for helping people maintain beautiful and healthy smiles.</p><p>&nbsp;</p><p>Contact our center today at 305-555-0121 <strong>--(145)--</strong> an initial evaluation. All first-time <strong>--(146)--</strong> will benefit from a 50 percent discount on the cost through the end of the month.</p><p>&nbsp;</p><p>Sincerely,</p><p><br>The Team at Healthonity Dental Center</p>', 1);

-- side - part7
insert into side (seq, set_question_id, paragraph) values (1, 89, '<p>http://www.moonglowairways.com.au</p><p><strong>Special Announcement by Geoff Clifford, President of Moon Glow Airways</strong><br>&nbsp;</p><p>As many of you are aware, there was a problem with Pelman Technology, the system that handles our airline reservations. This outage has affected several airlines. It''s been a rough week, but the good news is it that it has been repaired, and we are re-setting our system. However, Moon Glow passengers may still face delays for day or two. This most likely will include longer lines at airports. We have added more on-site customer service representatives at airports in all of our destination cities to assist customers with their flights and information. We appreciate your understanding and patience.</p>');
insert into side (seq, set_question_id, paragraph) values (1, 90, '<p><strong>Video Captioners --- Work from Home</strong></p><p>Kiesel Video is seeking detail-oriented people to use our software to add text captions to a wide variety of video material, such as television programs, movies, and university lectures. We will provide free online training. Successful applicants must possess strong language skills and have a computer, a headset, and high-speed Internet access.</p><p>The position features:</p><p>- Flexible hours--you work as much or as little as you want.</p><p>- Choice of projects-we have work in many types of content.</p><p>- Good pay - our captioners earn $350 to $1,100 a week, depending on the assignment.</p><p>Apply today at www.kieselvideo.com/jobs</p>');
insert into side (seq, set_question_id, paragraph) values (1, 91, '<p>February 1</p><p>&nbsp;</p><p>SOFTWARE TESTING REPORT</p><p>&nbsp;</p><p>Version of Software Program: Konserted 2.5</p><p>Testing Dates: January 10-12</p><p>Number of Participants: 8</p><p>&nbsp;</p><p>Software Testing Overview: Participants were asked to complete a series of tasks testing the functionality of the revised Konserted interface. In task number 1, participants searched for a concert in a designated area. In task number 2, participants searched for new friends on the site. In task number 3, participants invited friends to a concert. In task number 4, participants posted concert reviews, photos, and videos.&nbsp;<br>&nbsp;</p><p>Initial Findings: Task number 3 proved the most challenging, with three participants unable to complete it in under two minutes. A potential cause for this difficulty may be the choice of icons in the menu bar. Clearer, more intuitive icons could make this task easier to complete for participants.</p>');
insert into side (seq, set_question_id, paragraph) values (1, 92, '<p><strong>*E-mail*</strong></p><p>&nbsp;</p><p>To: catiyeh@mymailroom.au<br>From: achen@mutamark.au<br>Date: 1 July<br>Subject: Mutamark conference</p><p>&nbsp;</p><p>Dear Ms. Atiyeh,</p><p>&nbsp;</p><p>To follow up on our phone conversation earlier today, I would like to extend to you a formal written invitation to speak at the eighth annual Mutamark conference, scheduled to take place this year from 17 to 20 September in Zagros. Because you drew a sizeable crowd when you appeared at the conference in the past, we will be making special arrangements for your visit this time. The Blue Room at the Debeljak Hotel holds only 120, so this year we are also booking the Koros Hall, which has a capacity of 270. We can offer you a 40-to-50-minute slot on the last day of the conference, when attendance should be at its peak. Please e-mail me to confirm your acceptance and to let me know more about your audiovisual requirements. We can provide overhead projection for still images if you will be using them again.</p><p>&nbsp;</p><p>Very best regards,</p><p><br>Alex Chen, Conference Planning<br>Mutamark Headquarters, Melbourne</p>');
insert into side (seq, set_question_id, paragraph) values (1, 93, '<p><strong>Monorail Coming to Sudbury</strong></p><p>(4 Feb.) Ottawa-based Saenger, Inc., has been selected by the city of Sudbury to build a monorail system that will connect the city''s commercial district to the airport. <strong>-[1]-</strong>. Funding for the system is drawn from a combination of public agencies and private investors. <strong>-[2]-</strong>. Ticket sales for the monorail will also provide a new source of revenue for the city. <strong>-[3]-</strong>. Construction is slated to begin in early June and is expected to be completed within four years. <strong>-[4]-</strong></p>');
insert into side (seq, set_question_id, paragraph) values (1, 94, '<p><strong>Dennis Beck (2:52 P.M.)</strong></p><p>Hi, Corinne. I just want to be sure that you saw the document I sent you. It''s the combined market analysis and advertising proposal for the Keyes Elegant Home group. We''re preparing it for tomorrow''s presentation to the client.</p><p>&nbsp;</p><p><strong>Corinne McCall (2:53 P.M.)</strong></p><p>Yes, I have just downloaded it. Is this about their new line of tableware?</p><p>&nbsp;</p><p><strong>Dennis Beck (2:54 P.M.)</strong></p><p>Yes. I''d like you to read it over.</p><p>&nbsp;</p><p><strong>Corinne McCall (3:01 P.M.)</strong></p><p>No problem. Would you like me to revise anything, or do you want me to just check that it is all clear?</p><p>&nbsp;</p><p><strong>Dennis Beck (3:02 P.M.)</strong></p><p>Feel free to add information to the section "Advertising Strategies," since that is your area of expertise.</p><p>&nbsp;</p><p><strong>Corinne McCall (3:03 P.M.)</strong></p><p>Will do. I''ll get it back to you before the end of the day.</p>');
insert into side (seq, set_question_id, paragraph) values (1, 95, '<p><strong>To:</strong> Mara Renaldo<br><strong>From:</strong> Lisa Yang<br><strong>Date:</strong> May 28<br><strong>Subject: RE:</strong> Staffordsville Craft Fair</p><p>&nbsp;</p><p>Dear Ms. Renaldo,</p><p>&nbsp;</p><p>Thank you for your interest in selling your handcrafted items at the annual Staffordsville Craft Fair. Please note that all applicants must submit a $25 application fee, whether or not they want to share a space with another applicant. Moreover, all applicants must submit a minimum of four photographs of their work in order to be considered as a vendor. <strong>-[1]-.</strong></p><p>&nbsp;</p><p>In addition to photographs, we ask that you submit a rough a sketch showing how you would display your work. Since you propose to share a space with a friend, local potter Julia Berens, it would be helpful if your sketch could indicate how you are planning to use the space jointly. <strong>-[2]-.</strong></p><p>&nbsp;</p><p>Also, because we hold the fair rain or shine, all vendors must supply their own tenting to protect themselves and their wares from the possibility of rain. <strong>-[3]-.</strong></p><p>&nbsp;</p><p>Finally, please be aware that every year we receive far more applications from jewelry makers than we can accept. We hope that you will not be too discouraged if your work is not accepted this year, as you are applying for the first time. <strong>-[4]-</strong>.</p><p>&nbsp;</p><p>Thanks again, and best of luck with your application,</p><p><br>Lisa Yang</p>');
insert into side (seq, set_question_id, paragraph) values (1, 96, '<p><strong>SLEEP SOUNDLY SOLUTIONS</strong></p><p><i>Thank you for choosing Sleep Soundly Solutions!</i><br>&nbsp;</p><p>The updated control panel is linked to an integrated system that allows you to activate and disable all security systems in your home, including your Sleep Soundly motion sensor as well as your fire, smoke, and carbon monoxide detectors.&nbsp;<br>&nbsp;</p><p>All Sleep Soundly residential alarm systems have been tested thoroughly to ensure the highest quality and sensitivity, so you can sleep soundly in the knowledge that your home is protected. We have also developed a new smartphone application that will notify you of any disturbances wherever you are. The app is available for download now.<br>&nbsp;</p><p>Sleep Soundly control equipment is carefully manufactured for use with Sleep Soundly detectors and alarms. Using products manufactured by other companies may result in an alarm system that does not <i><strong>meet</strong></i> safety requirements for residential buildings or comply with local laws.</p>');
insert into side (seq, set_question_id, paragraph) values (1, 97, '<p>March 29</p><p>&nbsp;</p><p>Dr. Maritza Geerlings</p><p>Poseidonstraat 392</p><p>Paramaribo</p><p>Suriname</p><p>&nbsp;</p><p>Dear Dr. Geerlings,</p><p>&nbsp;</p><p>I am writing to thank you for your years of service on the faculty of the Jamaican Agricultural Training Academy (JATA) and to let you know about some exciting developments. As you know, JATA was originally <i><strong>established </strong></i>as a vocational school for agriculture but now offers courses in i varied array of disciplines, including cybersecurity, electrical engineering, and health information management. Our student body, which for the first ten years consisted almost exclusively of locals, is now culturally diverse, with students from across the Americas and Europe. Today''s students work with sophisticated equipment, much of which did not exist in our early days.<br>&nbsp;</p><p>To reflect these and other significant changes that JATA has undergone over time, the Board of Trustees has approved a proposal by the Faculty Senate to rename the institution the Caribbean Academy of Science and Technology. As a result, a new institutional logo will be adopted. All students and faculty members, both current and former, are invited to participate in a logo design contest. Information about the contest will be forthcoming.<br>&nbsp;</p><p>The renaming ceremony and the introduction of the new logo will take place at 11 A.M. on 1 June, the twentieth anniversary of the institution. We hope you will be able to join us.<br>&nbsp;</p><p>Sincerely,<br>&nbsp;</p><p>Audley Bartlett<br>&nbsp;</p><p>Vice President for Academic Affairs,</p><p>Jamaican Agricultural Training Academy</p><p><br>&nbsp;</p>');
insert into side (seq, set_question_id, paragraph) values (1, 98, '<p><strong>Ashley Montaine 8:54 A.M.:</strong> How did the interview with Mr. Erickson go?</p><p>&nbsp;</p><p><strong>Dan Campbell 8:55 A.M.:</strong> I really enjoyed meeting him. I think he''d be a great reporter here. He seems smart and organized, and his samples show that he''s a great writer.</p><p>&nbsp;</p><p><strong>Ashley Montaine 8:57 A.M.:</strong> Brooke, can you contact Mr. Erickson to set up the next interview? Is that a problem?<br>&nbsp;</p><p><strong>Dan Campbell 8:58 A.M.:</strong> I''d really like to work with him. It is very important that he impress Mr. Peters.<br>&nbsp;</p><p><strong>Brooke Randolph 8:59 A.M.: </strong>Not at all.<br>&nbsp;</p><p><strong>Ashley Montaine 9:00 A.M.: </strong>Thanks. I also see that he has a varied work history. That will make him a well-rounded reporter.<br>&nbsp;</p><p><strong>Brooke Randolph 9:02 A.M.:</strong> When would you like to meet with him again?<br>&nbsp;</p><p><strong>Dan Campbell 9:03 A.M.:</strong> Ashley, I believe you will participate in the next interview. Note that Mr. Peters is probably going to ask why Mr. Erickson wants to transition from freelance writing to in-house news reporting. Also, Mr. Peters will want assurances that he''s committed and will stick around for several years.</p><p>&nbsp;</p><p><strong>Ashley Montaine 9:04 A.M.:</strong> Brooke, Mr. Peters and I are both free Friday morning.<br>&nbsp;</p><p><strong>Brooke Randolph 9:06 A.M.:</strong> Great. I''ll write an e-mail shortly.</p>');
insert into side (seq, set_question_id, paragraph) values (1, 99, '<p><strong>Alberta Business Matters</strong></p><p>April issue</p><p>&nbsp;</p><h2><strong>Improve Your Office Environment Now!</strong></h2><p>Today''s office environment, featuring numerous corridors, unexciting beige or white walls, and often rows of identical, windowless cubicles, might not inspire comfort, beauty, and energy. However, there are some easy, inexpensive ways to make your office space more inviting.<br>&nbsp;</p><p><strong>Air quality</strong></p><p>- Add some green plants to the décor. Plants offer a natural filtration system, increasing oxygen levels. Nonflowering plants should be preferred, as they will not scatter pollen.</p><p>- A small, tabletop air purifier helps improve stale air and removes dust.</p><p>&nbsp;</p><p><strong>Light quality</strong></p><p>- Take breaks and go outdoors. Even just five minutes before or after lunch break will provide your eyes with a respite from artificial light sources.</p><p>- Use desktop lamps with full-spectrum lightbulbs.</p><p>- Install double-glazed windows instead of blinds to reduce glare while maintaining natural light.</p><p>&nbsp;</p><p><strong>Stress relief</strong></p><p>- Earplugs or noise-cancelling headphones can block distracting noise in an open office floor plan.</p><p>- Photographs of loved ones and places we have visited for vacation are reminders of our life away from the office. Select a few favorite pictures as important decorative elements.</p><p>-------------------------</p><p><strong>Dear readers, if you have tips to add to this list, send them in and they will be published in next month''s issue.</strong></p><p>-------------------------</p>');
insert into side (seq, set_question_id, paragraph) values (2, 99, '<p><strong>Alberta Business Matters</strong></p><p><strong>Letters to the Editor</strong></p><p>&nbsp;</p><p>It may interest your readers to know about the company I work for, called Moveable, Inc. We aspire to make dull offices more comfortable and convenient for workers, especially for today''s on-the-move employees.</p><p>&nbsp;</p><p>For example, say you work two days a week at your headquarters in Edmonton, and the rest of the week you are in a satellite office. Our "Can-Do Case" ensures that your favorite office supplies always travel with you. Our "Modular Décor Kit," weighing just 1.75 kg, contains a portable reading lamp, a miniature silk plant, and a folding photo frame with space for four pictures. Look us up online and follow us on social media, as we offer new items frequently!</p><p>&nbsp;</p><p>Best,</p><p>Maria Testa</p><p><br>&nbsp;</p>');
insert into side (seq, set_question_id, paragraph) values (1, 100, '<p>http://www.Lloydtouringcompany.co.uk</p><p>&nbsp;</p><p>Choose one of Lloyd Touring Company''s (LTC) most popular outings to see the best that London has to offer!&nbsp;</p><p><strong>Tour 1:</strong> Full-day tour of the most popular tourist sites on one of our famous red double-decker buses. See the Changing of the Guard and conclude the day with a river cruise.&nbsp;</p><p><strong>Tour 2: </strong>Full-day walking tour of London'' best shopping areas. Explore London''s famous department stores and wander along fashionable Bond and Oxford Streets.&nbsp;</p><p><strong>Tour 3:</strong> Half-day tour on a red double-decker bus, including private tour of the Tower of London and lunch at a nearby café.&nbsp;</p><p><strong>Tour 4:</strong> Half-day tour of Buckingham Palace, including the Changing of the Guard. Tour ends with a traditional fish-and-chips lunch.&nbsp;</p><p><strong>Tour 5:</strong> Full-day walking tour featuring London''s top highlights. Complete the day with a medieval banquet.<br>&nbsp;</p><p>LTC''s knowledgeable local staff members personally guide each one of our tours. Meals are not covered, except when noted in the tour description. Participants are responsible for meeting at chosen departure destination. LTC does not provide pickup from hotels. All tours can be upgraded for an additional fee to include an open-date ticket to the London Eye, London''s famous observation wheel.</p>');
insert into side (seq, set_question_id, paragraph) values (2, 100, '<p><strong>--Ella Bouton</strong><br>&nbsp;</p><p>Lloyd Touring Company Review</p><p>&nbsp;</p><p>This was my first trip to London. I decided to see all the major tourist sites on my own, but I wanted someone to help me discover the most interesting places to shop in London. My LTC tour guide, Larissa, was wonderful. She is an avid shopper herself, and at the beginning of the tour, she tried to get to know the participants. She was able to guide everyone to the shops that they were most interested in. It was such a personalized tour! And it was a bonus that Larissa also speaks French. My daughter and I were visiting from Paris, and we appreciated being able to communicate in two languages. The tour was very reasonably priced, too. I would highly recommend it. The only unpleasant part of the tour was that Oxford Street was extremely crowded when we visited, and it was difficult to walk around easily.</p>');
insert into side (seq, set_question_id, paragraph) values (1, 101, '<p><strong>To:</strong> Joseph Morgan &lt;joseph.morgan@peltergraphics.com&gt;</p><p><strong>From:</strong> administrator@costaseminars.org</p><p><strong>Date:</strong> May 31</p><p><strong>Subject:</strong> Book order</p><p>&nbsp;</p><p>Dear Mr. Morgan,</p><p>&nbsp;</p><p>Thank you for registering for Emilio Costa''s seminar on June 11 at the Rothford Business Center. We are glad you took advantage of the opportunity for conference participants to purchase some of Emilio Costa''s graphic-design books at a discounted price. The information below is a confirmation of your order. The books will be waiting for you at the check-in desk on the day of the seminar. Please note that we will accept any major credit card for payment. We are looking forward to seeing you on June 11.</p><figure class="table"><table><tbody><tr><td><strong>Quantity</strong></td><td><strong>Title</strong></td><td><strong>Price</strong></td><td><strong>Discounted Price</strong></td><td><strong>Total Price</strong></td></tr><tr><td>1</td><td>Perfect Figures: Making Data Visually Appleaing</td><td>$22.00</td><td>$17.60</td><td>$17.60<br>&nbsp;</td></tr><tr><td>1</td><td>Logos in the Information Age</td><td>$18.00</td><td>$14.40</td><td>$14.40<br>&nbsp;</td></tr><tr><td>1</td><td>Branding Strategies in Graphic Design</td><td>$20.00</td><td>$16.00</td><td>$16.00<br>&nbsp;</td></tr><tr><td>2</td><td>Best Practices in Web Design: A Euroean Perspective</td><td>$28.00</td><td>$22.40</td><td>$44.80<br>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td><strong>TOTAL DUE:</strong></td><td><strong>$92.80</strong></td></tr></tbody></table></figure>');
insert into side (seq, set_question_id, paragraph) values (2, 101, '<p><strong>Attention, Seminar Participants:</strong></p><p>Unfortunately, we do not have copies of Emilio Costa''s book <i>Branding Strategies in Graphic Design</i> with us today. For those of you who have ordered it, please give your mailing address to the volunteer at the check-in desk, and the book will be mailed to your home at no cost to you. We will charge your credit card upon shipment. We are sorry for the inconvenience.</p>');
insert into side (seq, set_question_id, paragraph) values (3, 101, '<p><strong>*E-mail*</strong></p><p><strong>To: </strong>roberta.tsu@peltergraphics.com</p><p><strong>From:</strong> joseph.morgan@peltergraphics.com</p><p><strong>Date:</strong> June 22</p><p><strong>Sent: </strong>Costa book</p><p>&nbsp;</p><p>Dear Roberta,</p><p>&nbsp;</p><p>I''m looking forward to finishing up our brochure design for Entchen Financial Consultants. Before we submit our final draft, I would like to rethink how we are presenting our data. Have you had a chance to look through the Costa book I showed you? He gives great advice on improving the clarity of financial information in marketing materials. Anyway, let''s talk about it at lunch tomorrow.</p><p>&nbsp;</p><p>Best,<br>&nbsp;</p><p>Joseph</p><p><br>&nbsp;</p>');
insert into side (seq, set_question_id, paragraph) values (1, 102, '<p><strong>Anton Building</strong></p><p>Clanton (12 October)--The planned renovation of the historic Anton Building by Jantuni Property Developers (JPD) is facing new delays. A JPD spokesperson says their negotiations with the city regarding a package of subsidies and tax incentives are ongoing and are proving somewhat contentious. According to the renovation plan, JPD must protect the historical integrity of the Anton Building while it creates a mixed-use interior, offering both office space and lower-level retail space. However, JPD''s city permit to do the project is on hold pending the current negotiations.</p><p>This is making city revitalization advocates increasingly anxious. Aditi Yadav comments. "This plan to create useful space out of an empty decaying building will go a long way to restoring vibrancy to that area of the city. I sincerely hope that JPD does not back out. In creating their offer, the City Council should consider JPD''s excellent record of beautifully restoring and maintaining several other historic buildings in Clanton."</p>');
insert into side (seq, set_question_id, paragraph) values (2, 102, '<p><strong>From:</strong> abautista@lenoiva-health.com</p><p><strong>To:</strong> t.rowell@jantunipropertydevelopers.com</p><p><strong>Date:</strong> 20 February</p><p><strong>Subject:</strong> Lease inquiry</p><p>&nbsp;</p><p>Dear Mr. Rowell,</p><p>&nbsp;</p><p>I am the owner of Lenoiva, a health-care technology company. We plan to expand our operations and we need new office space. The Anton Building is one of the locations in Clanton that we are considering. We have been informed that your restoration project of this building will be finished sometime this spring, which is good timing for us. We are particularly attracted by the easy access to public transportation services that your building offers. Do you still have spaces available for rent? We anticipate needing a space at least 300 square metres in size. Would there be any reserved parking for our employees if we rented there? We would appreciate any information you can provide.</p><p>&nbsp;</p><p>Thank you in advance,</p><p>&nbsp;</p><p><strong>Ana Bautista</strong></p><p><br>&nbsp;</p>');
insert into side (seq, set_question_id, paragraph) values (3, 102, '<figure class="image"><img src="http://res.cloudinary.com/doxsstgkc/image/upload/v1675264441/examify/image_tygie7.png"></figure>');
insert into side (seq, set_question_id, paragraph) values (1, 103, '<p><strong>From: </strong>Tanya Jefferson &lt;tjeff@keysuppliers.com&gt;</p><p><strong>To:</strong> info@danestongear.com</p><p><strong>Subject:</strong> Request for group rental information</p><p><strong>Date: </strong>May 29</p><p>&nbsp;</p><p>Hello Daneston Gear Company (DGC),<br>&nbsp;</p><p>I am the president of an activities club. This month. our 30 members intend to take a day trip to Daneston to go boating on the lake. Could you please send me information regarding your rates and offerings? We are most interested in renting boats that seat one person. Some time ago, I rented a kayak for myself from DGC, but this will be my first time renting from DGC for a group.</p><p>&nbsp;</p><p>Thank you,<br>&nbsp;</p><p>Tanya Jefferson</p>');
insert into side (seq, set_question_id, paragraph) values (2, 103, '<p><strong>From:</strong> info@danestongear.com</p><p><strong>To:</strong> Tanya Jefferson &lt;tjeff@keysuppliers.com&gt;</p><p><strong>Subject:</strong> RE: Request for group rental information</p><p><strong>Date: </strong>May 30</p><p><strong>Attachment:&nbsp;</strong> Price list</p><p>&nbsp;</p><p>Dear Ms. Jefferson,<br>&nbsp;</p><p>Thank you for contacting us regarding your group''s anticipated visit to DGC. We look forward to equipping your club for its next adventure. A price list is attached to this e-mail. If you wish to discuss our rentals in more detail, please call me at (888) 555-1578. Incidentally, we recently added a rowboat option that is an excellent choice for adults who wish to boat with their children.</p><p>&nbsp;</p><p>I will be pleased to help you when you are ready to make your reservation.<br>&nbsp;</p><p>Best,<br>&nbsp;</p><p>Adam Goldstein</p>');
insert into side (seq, set_question_id, paragraph) values (3, 103, '<p><strong>DGC Price List</strong></p><figure class="table"><table><tbody><tr><td>&nbsp;</td><td>Boat type</td><td>Hourly rate<br>&nbsp;</td><td>Additional 1/2 hour<br>&nbsp;</td></tr><tr><td><strong>Option 1</strong><br>&nbsp;</td><td>2-person canoe<br>&nbsp;</td><td>$13<br>&nbsp;</td><td>$8<br>&nbsp;</td></tr><tr><td><strong>Option 2</strong><br>&nbsp;</td><td>3-person canoe<br>&nbsp;</td><td>$15<br>&nbsp;</td><td>$8</td></tr><tr><td><strong>Option 3</strong><br>&nbsp;</td><td>1-person kayak<br>&nbsp;</td><td>$11<br>&nbsp;</td><td>$8</td></tr><tr><td><strong>Option 4</strong><br>&nbsp;</td><td>2-person kayak<br>&nbsp;</td><td>$14<br>&nbsp;</td><td>$8<br>&nbsp;</td></tr><tr><td><strong>Option 5</strong><br>&nbsp;</td><td>3- or 4-person rowboat&nbsp;(3 adults&nbsp;or 2 adults and 2 children</td><td>$13<br>&nbsp;</td><td>$9<br>&nbsp;</td></tr></tbody></table></figure><p>- We are open every day from April to October, 10:00 A.M. to 6:30 P.M</p><p>- All boats must be returned by 6:15 P.M. on the day they are rented.</p><p>- Life jackets and paddles are included in the rental fee.</p><p>- Groups of ten or more qualify for a discount if they book at least one week in advance.</p>');


-- exam_taking
insert into exam_taking (exam_id, user_id, time_finished, nums_of_correct_qn, total_question) values (1, 1, 6000, 27, 100);

-- answer_record
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 1, 2);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 2, 7);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 3, 12);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 4, 16);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 5, 20);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 6, 24);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 7, 25);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 8, 28);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 9, 31);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 10, 34);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 11, 37);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 12, 40);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 13, 43);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 14, 46);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 15, 49);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 16, 52);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 17, 55);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 18, 58);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 19, 61);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 20, 64);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 21, 67);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 22, 70);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 23, 73);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 24, 76);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 25, 79);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 26, 82);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 27, 85);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 28, 88);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 29, 91);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 30, 94);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 31, 97);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 32, 100);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 33, 104);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 34, 108);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 35, 112);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 36, 116);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 37, 120);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 38, 124);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 39, 128);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 40, 132);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 41, 136);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 42, 140);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 43, 144);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 44, 148);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 45, 152);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 46, 156);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 47, 160);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 48, 164);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 49, 168);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 50, 172);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 51, 176);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 52, 180);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 53, 184);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 54, 188);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 55, 192);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 56, 196);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 57, 200);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 58, 204);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 59, 208);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 60, 212);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 61, 216);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 62, 220);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 63, 224);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 64, 228);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 65, 232);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 66, 236);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 67, 240);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 68, 244);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 69, 248);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 70, 252);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 71, 256);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 72, 260);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 73, 264);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 74, 268);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 75, 272);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 76, 276);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 77, 280);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 78, 284);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 79, 288);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 80, 292);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 81, 296);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 82, 300);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 83, 304);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 84, 308);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 85, 312);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 86, 316);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 87, 320);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 88, 324);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 89, 328);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 90, 332);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 91, 336);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 92, 340);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 93, 344);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 94, 348);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 95, 352);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 96, 356);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 97, 360);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 98, 364);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 99, 368);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 100, 372);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 101, 376);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 102, 380);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 103, 384);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 104, 388);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 105, 392);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 106, 396);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 107, 400);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 108, 404);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 109, 408);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 110, 412);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 111, 416);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 112, 420);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 113, 424);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 114, 428);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 115, 432);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 116, 436);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 117, 440);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 118, 444);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 119, 448);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 120, 452);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 121, 456);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 122, 460);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 123, 464);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 124, 468);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 125, 472);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 126, 476);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 127, 480);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 128, 484);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 129, 488);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 130, 492);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 131, 496);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 132, 500);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 133, 504);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 134, 508);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 135, 512);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 136, 516);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 137, 520);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 138, 524);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 139, 528);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 140, 532);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 141, 536);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 142, 540);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 143, 544);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 144, 548);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 145, 552);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 146, 556);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 147, 560);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 148, 564);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 149, 568);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 150, 572);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 151, 576);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 152, 580);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 153, 584);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 154, 588);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 155, 592);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 156, 596);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 157, 600);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 158, 604);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 159, 608);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 160, 612);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 161, 616);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 162, 620);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 163, 624);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 164, 628);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 165, 632);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 166, 636);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 167, 640);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 168, 644);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 169, 648);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 170, 652);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 171, 656);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 172, 660);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 173, 664);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 174, 668);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 175, 672);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 176, 676);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 177, 680);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 178, 684);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 179, 688);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 180, 692);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 181, 696);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 182, 700);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 183, 704);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 184, 708);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 185, 712);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 186, 716);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 187, 720);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 188, 724);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 189, 728);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 190, 732);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 191, 736);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 192, 740);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 193, 744);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 194, 748);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 195, 752);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 196, 756);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 197, 760);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 198, 764);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 199, 768);
insert into answer_record (exam_taking_id, question_id, choice_id) values (1, 200, 772);

-- part_option
insert into part_option(exam_taking_id, part_id) values(1, 1);
insert into part_option(exam_taking_id, part_id) values(1, 2);
insert into part_option(exam_taking_id, part_id) values(1, 3);
insert into part_option(exam_taking_id, part_id) values(1, 5);

-- UPDATE exam SET audio = 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_1.mp3';
-- UPDATE set_question SET audio = 'https://study4.com/media/tez_media1/sound/ets_toeic_2022_test_1_1.mp3';
-- UPDATE exam SET duration = 7200 WHERE exam_id = 1;
-- UPDATE exam SET file_download = 'https://www.africau.edu/images/default/sample.pdf' WHERE exam_id = 1;