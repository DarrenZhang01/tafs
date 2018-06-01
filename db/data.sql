INSERT INTO ta_feedback.users VALUES('abcd1000', 'admin', 'abcd0000', null);
INSERT INTO ta_feedback.users VALUES('abcd1001', 'admin', 'abcd0001', null);
INSERT INTO ta_feedback.users VALUES('abcd1002', 'admin', 'abcd0002', null);
INSERT INTO ta_feedback.users VALUES('abcd1003', 'admin', 'abcd0003', null);
INSERT INTO ta_feedback.users VALUES('abcd1004', 'admin', 'abcd0004', null);
INSERT INTO ta_feedback.users VALUES('abcd1005', 'admin', 'abcd0005', null);
INSERT INTO ta_feedback.users VALUES('abcd1006', 'admin', 'abcd0006', null);
INSERT INTO ta_feedback.users VALUES('abcd1007', 'admin', 'abcd0007', null);
INSERT INTO ta_feedback.users VALUES('abcd1008', 'admin', 'abcd0008', null);
INSERT INTO ta_feedback.users VALUES('abcd1009', 'admin', 'abcd0009', null);


INSERT INTO ta_feedback.users VALUES('abcd2000', 'prof', 'abcd3000', null);
INSERT INTO ta_feedback.users VALUES('abcd2001', 'prof', 'abcd3001', null);
INSERT INTO ta_feedback.users VALUES('abcd2002', 'prof', 'abcd3002', null);
INSERT INTO ta_feedback.users VALUES('abcd2003', 'prof', 'abcd3003', null);
INSERT INTO ta_feedback.users VALUES('abcd2004', 'prof', 'abcd3004', null);
INSERT INTO ta_feedback.users VALUES('abcd2005', 'prof', 'abcd3005', null);
INSERT INTO ta_feedback.users VALUES('abcd2006', 'prof', 'abcd3006', null);
INSERT INTO ta_feedback.users VALUES('abcd2007', 'prof', 'abcd3007', null);
INSERT INTO ta_feedback.users VALUES('abcd2008', 'prof', 'abcd3008', null);
INSERT INTO ta_feedback.users VALUES('abcd2009', 'prof', 'abcd3009', null);


INSERT INTO ta_feedback.users VALUES('abcd4000', 'prof', 'abcd5000', null);
INSERT INTO ta_feedback.users VALUES('abcd4001', 'prof', 'abcd5001', null);
INSERT INTO ta_feedback.users VALUES('abcd4002', 'prof', 'abcd5002', null);
INSERT INTO ta_feedback.users VALUES('abcd4003', 'prof', 'abcd5003', null);
INSERT INTO ta_feedback.users VALUES('abcd4004', 'prof', 'abcd5004', null);
INSERT INTO ta_feedback.users VALUES('abcd4005', 'prof', 'abcd5005', null);
INSERT INTO ta_feedback.users VALUES('abcd4006', 'prof', 'abcd5006', null);
INSERT INTO ta_feedback.users VALUES('abcd4007', 'prof', 'abcd5007', null);
INSERT INTO ta_feedback.users VALUES('abcd4008', 'prof', 'abcd5008', null);
INSERT INTO ta_feedback.users VALUES('abcd4009', 'prof', 'abcd5009', null);


INSERT INTO ta_feedback.departments VALUES('CSC');
INSERT INTO ta_feedback.departments VALUES('MAT');
INSERT INTO ta_feedback.departments VALUES('POL');
INSERT INTO ta_feedback.departments VALUES('PSY');
INSERT INTO ta_feedback.departments VALUES('BIO');
INSERT INTO ta_feedback.departments VALUES('STA');
INSERT INTO ta_feedback.departments VALUES('HIS');
INSERT INTO ta_feedback.departments VALUES('PHY');
INSERT INTO ta_feedback.departments VALUES('CHM');
INSERT INTO ta_feedback.departments VALUES('ENG');


INSERT INTO ta_feedback.courses VALUES('CSC100', 'rbk', 'CSC');
INSERT INTO ta_feedback.courses VALUES('CSC101', 'stn', 'CSC');
INSERT INTO ta_feedback.courses VALUES('CSC102', 'doo', 'CSC');
INSERT INTO ta_feedback.courses VALUES('CSC103', 'wrx', 'CSC');
INSERT INTO ta_feedback.courses VALUES('CSC104', 'juo', 'CSC');
INSERT INTO ta_feedback.courses VALUES('CSC105', 'dtz', 'CSC');
INSERT INTO ta_feedback.courses VALUES('CSC106', 'igc', 'CSC');
INSERT INTO ta_feedback.courses VALUES('CSC107', 'apw', 'CSC');
INSERT INTO ta_feedback.courses VALUES('CSC108', 'apt', 'CSC');
INSERT INTO ta_feedback.courses VALUES('CSC109', 'tyr', 'CSC');


INSERT INTO ta_feedback.sections(course_code, term, meeting_time, room, section_code) VALUES('CSC100', 201709, '2008-11-09', 'BA1170', 'LEC0101');
INSERT INTO ta_feedback.sections(course_code, term, meeting_time, room, section_code) VALUES('CSC100', 201807, '2008-11-09', 'BA1130', 'LEC0102');
INSERT INTO ta_feedback.sections(course_code, term, meeting_time, room, section_code) VALUES('CSC100', 201801, '2008-11-09', 'BA1170', 'LEC0103');
INSERT INTO ta_feedback.sections(course_code, term, meeting_time, room, section_code) VALUES('CSC100', 201807, '2008-11-09', 'LM161', 'LEC0104');
INSERT INTO ta_feedback.sections(course_code, term, meeting_time, room, section_code) VALUES('CSC100', 201709, '2008-11-09', 'LM159', 'LEC0501');
INSERT INTO ta_feedback.sections(course_code, term, meeting_time, room, section_code) VALUES('CSC108', 201807, '2008-11-09', 'BA1180', 'LEC0101');
INSERT INTO ta_feedback.sections(course_code, term, meeting_time, room, section_code) VALUES('CSC108', 201801, '2008-11-09', 'BA1160', 'LEC0102');
INSERT INTO ta_feedback.sections(course_code, term, meeting_time, room, section_code) VALUES('CSC108', 201805, '2008-11-09', 'LM159', 'LEC0103');
INSERT INTO ta_feedback.sections(course_code, term, meeting_time, room, section_code) VALUES('CSC108', 201709, '2008-11-09', 'LM161', 'LEC0104');
INSERT INTO ta_feedback.sections(course_code, term, meeting_time, room, section_code) VALUES('CSC108', 201805, '2008-11-09', 'BA1170', 'LEC0501');


INSERT INTO ta_feedback.user_associations(utorid, course_code, section_id) VALUES ('abcd2002', 'CSC105', 8);
INSERT INTO ta_feedback.user_associations(utorid, course_code, section_id) VALUES ('abcd4009', 'CSC104', 6);
INSERT INTO ta_feedback.user_associations(utorid, course_code, section_id) VALUES ('abcd1001', 'CSC104', 1);
INSERT INTO ta_feedback.user_associations(utorid, course_code, section_id) VALUES ('abcd1009', 'CSC105', 2);
INSERT INTO ta_feedback.user_associations(utorid, course_code, section_id) VALUES ('abcd4001', 'CSC100', 8);
INSERT INTO ta_feedback.user_associations(utorid, course_code, section_id) VALUES ('abcd1005', 'CSC100', 3);
INSERT INTO ta_feedback.user_associations(utorid, course_code, section_id) VALUES ('abcd2002', 'CSC100', 9);
INSERT INTO ta_feedback.user_associations(utorid, course_code, section_id) VALUES ('abcd4004', 'CSC101', 3);
INSERT INTO ta_feedback.user_associations(utorid, course_code, section_id) VALUES ('abcd1000', 'CSC100', 5);
INSERT INTO ta_feedback.user_associations(utorid, course_code, section_id) VALUES ('abcd4003', 'CSC102', 7);


INSERT INTO ta_feedback.questions(answer_type, content) VALUES ('binary', 'shp');
INSERT INTO ta_feedback.questions(answer_type, content) VALUES ('binary', 'cay');
INSERT INTO ta_feedback.questions(answer_type, content) VALUES ('binary', 'mac');
INSERT INTO ta_feedback.questions(answer_type, content) VALUES ('open_ended', 'goa');
INSERT INTO ta_feedback.questions(answer_type, content) VALUES ('open_ended', 'fyq');
INSERT INTO ta_feedback.questions(answer_type, content) VALUES ('binary', 'rgu');
INSERT INTO ta_feedback.questions(answer_type, content) VALUES ('binary', 'pkh');
INSERT INTO ta_feedback.questions(answer_type, content) VALUES ('scale', 'toc');
INSERT INTO ta_feedback.questions(answer_type, content) VALUES ('binary', 'xlu');
INSERT INTO ta_feedback.questions(answer_type, content) VALUES ('scale', 'hso');


INSERT INTO ta_feedback.surveys(name, course_code, term, default_time_window, default_start_time) VALUES ('hbo', 'CSC103', 201801, '00:00:00', '2008-11-09');
INSERT INTO ta_feedback.surveys(name, course_code, term, default_time_window, default_start_time) VALUES ('nqs', 'CSC103', 201709, '00:00:00', '2008-11-09');
INSERT INTO ta_feedback.surveys(name, course_code, term, default_time_window, default_start_time) VALUES ('dby', 'CSC102', 201701, '00:00:00', '2008-11-09');
INSERT INTO ta_feedback.surveys(name, course_code, term, default_time_window, default_start_time) VALUES ('tlr', 'CSC103', 201809, '00:00:00', '2008-11-09');
INSERT INTO ta_feedback.surveys(name, course_code, term, default_time_window, default_start_time) VALUES ('bbq', 'CSC102', 201809, '00:00:00', '2008-11-09');
INSERT INTO ta_feedback.surveys(name, course_code, term, default_time_window, default_start_time) VALUES ('kul', 'CSC104', 201801, '00:00:00', '2008-11-09');
INSERT INTO ta_feedback.surveys(name, course_code, term, default_time_window, default_start_time) VALUES ('ott', 'CSC103', 201801, '00:00:00', '2008-11-09');
INSERT INTO ta_feedback.surveys(name, course_code, term, default_time_window, default_start_time) VALUES ('rsp', 'CSC102', 201805, '00:00:00', '2008-11-09');
INSERT INTO ta_feedback.surveys(name, course_code, term, default_time_window, default_start_time) VALUES ('scx', 'CSC104', 201805, '00:00:00', '2008-11-09');
INSERT INTO ta_feedback.surveys(name, course_code, term, default_time_window, default_start_time) VALUES ('flk', 'CSC105', 201701, '00:00:00', '2008-11-09');


INSERT INTO ta_feedback.dept_question_choices(survey_id, department_name, term, question_id, utorid, locked, position) VALUES (6, 'CSC', 201807, 8, 'abcd4009', 1, 6);
INSERT INTO ta_feedback.dept_question_choices(survey_id, department_name, term, question_id, utorid, locked, position) VALUES (1, 'PSY', 201805, 1, 'abcd2003', 1, 2);
INSERT INTO ta_feedback.dept_question_choices(survey_id, department_name, term, question_id, utorid, locked, position) VALUES (5, 'CHM', 201805, 10, 'abcd4004', 1, 2);
INSERT INTO ta_feedback.dept_question_choices(survey_id, department_name, term, question_id, utorid, locked, position) VALUES (1, 'POL', 201709, 8, 'abcd1006', 0, 5);
INSERT INTO ta_feedback.dept_question_choices(survey_id, department_name, term, question_id, utorid, locked, position) VALUES (4, 'POL', 201709, 5, 'abcd4000', 1, 6);
INSERT INTO ta_feedback.dept_question_choices(survey_id, department_name, term, question_id, utorid, locked, position) VALUES (8, 'PSY', 201701, 7, 'abcd4008', 0, 6);
INSERT INTO ta_feedback.dept_question_choices(survey_id, department_name, term, question_id, utorid, locked, position) VALUES (10, 'CHM', 201709, 3, 'abcd4001', 0, 3);
INSERT INTO ta_feedback.dept_question_choices(survey_id, department_name, term, question_id, utorid, locked, position) VALUES (7, 'PSY', 201807, 2, 'abcd1005', 0, 1);
INSERT INTO ta_feedback.dept_question_choices(survey_id, department_name, term, question_id, utorid, locked, position) VALUES (5, 'STA', 201801, 1, 'abcd1000', 1, 5);
INSERT INTO ta_feedback.dept_question_choices(survey_id, department_name, term, question_id, utorid, locked, position) VALUES (4, 'BIO', 201701, 9, 'abcd4001', 1, 1);


INSERT INTO ta_feedback.course_question_choices(survey_id, question_id, utorid, locked, position) VALUES (2, 4, 'abcd2005', 1, 3);
INSERT INTO ta_feedback.course_question_choices(survey_id, question_id, utorid, locked, position) VALUES (1, 8, 'abcd4000', 1, 5);
INSERT INTO ta_feedback.course_question_choices(survey_id, question_id, utorid, locked, position) VALUES (8, 1, 'abcd2006', 0, 1);
INSERT INTO ta_feedback.course_question_choices(survey_id, question_id, utorid, locked, position) VALUES (5, 5, 'abcd4001', 1, 1);
INSERT INTO ta_feedback.course_question_choices(survey_id, question_id, utorid, locked, position) VALUES (7, 1, 'abcd4009', 0, 3);
INSERT INTO ta_feedback.course_question_choices(survey_id, question_id, utorid, locked, position) VALUES (4, 5, 'abcd2005', 1, 3);
INSERT INTO ta_feedback.course_question_choices(survey_id, question_id, utorid, locked, position) VALUES (9, 10, 'abcd4001', 0, 2);
INSERT INTO ta_feedback.course_question_choices(survey_id, question_id, utorid, locked, position) VALUES (10, 5, 'abcd4008', 1, 4);
INSERT INTO ta_feedback.course_question_choices(survey_id, question_id, utorid, locked, position) VALUES (9, 4, 'abcd4008', 1, 3);
INSERT INTO ta_feedback.course_question_choices(survey_id, question_id, utorid, locked, position) VALUES (3, 1, 'abcd2002', 1, 3);


INSERT INTO ta_feedback.ta_question_choices(survey_id, section_id, term, question_id, utorid, locked, position) VALUES (6, 9, 201701, 5, 'abcd2006', 0, 3);
INSERT INTO ta_feedback.ta_question_choices(survey_id, section_id, term, question_id, utorid, locked, position) VALUES (5, 5, 201709, 1, 'abcd2007', 0, 3);
INSERT INTO ta_feedback.ta_question_choices(survey_id, section_id, term, question_id, utorid, locked, position) VALUES (6, 2, 201701, 7, 'abcd1008', 1, 3);
INSERT INTO ta_feedback.ta_question_choices(survey_id, section_id, term, question_id, utorid, locked, position) VALUES (10, 4, 201801, 7, 'abcd1000', 0, 1);
INSERT INTO ta_feedback.ta_question_choices(survey_id, section_id, term, question_id, utorid, locked, position) VALUES (8, 6, 201805, 8, 'abcd2006', 1, 2);
INSERT INTO ta_feedback.ta_question_choices(survey_id, section_id, term, question_id, utorid, locked, position) VALUES (6, 7, 201701, 5, 'abcd1007', 1, 2);
INSERT INTO ta_feedback.ta_question_choices(survey_id, section_id, term, question_id, utorid, locked, position) VALUES (3, 4, 201809, 3, 'abcd1007', 0, 5);
INSERT INTO ta_feedback.ta_question_choices(survey_id, section_id, term, question_id, utorid, locked, position) VALUES (6, 6, 201805, 6, 'abcd1001', 1, 6);
INSERT INTO ta_feedback.ta_question_choices(survey_id, section_id, term, question_id, utorid, locked, position) VALUES (2, 10, 201805, 10, 'abcd4005', 0, 4);
INSERT INTO ta_feedback.ta_question_choices(survey_id, section_id, term, question_id, utorid, locked, position) VALUES (1, 9, 201805, 2, 'abcd2008', 0, 4);


INSERT INTO ta_feedback.survey_instances(user_association_id, override_token, time_window, start_time) VALUES (9, 'kct', '00:00:00', '2008-11-09');
INSERT INTO ta_feedback.survey_instances(user_association_id, override_token, time_window, start_time) VALUES (3, 'kdn', '00:00:00', '2008-11-09');
INSERT INTO ta_feedback.survey_instances(user_association_id, override_token, time_window, start_time) VALUES (1, 'oct', '00:00:00', '2008-11-09');
INSERT INTO ta_feedback.survey_instances(user_association_id, override_token, time_window, start_time) VALUES (9, 'ndm', '00:00:00', '2008-11-09');
INSERT INTO ta_feedback.survey_instances(user_association_id, override_token, time_window, start_time) VALUES (9, 'rdy', '00:00:00', '2008-11-09');
INSERT INTO ta_feedback.survey_instances(user_association_id, override_token, time_window, start_time) VALUES (10, 'fsf', '00:00:00', '2008-11-09');
INSERT INTO ta_feedback.survey_instances(user_association_id, override_token, time_window, start_time) VALUES (7, 'sbo', '00:00:00', '2008-11-09');
INSERT INTO ta_feedback.survey_instances(user_association_id, override_token, time_window, start_time) VALUES (1, 'phk', '00:00:00', '2008-11-09');
INSERT INTO ta_feedback.survey_instances(user_association_id, override_token, time_window, start_time) VALUES (5, 'nmz', '00:00:00', '2008-11-09');
INSERT INTO ta_feedback.survey_instances(user_association_id, override_token, time_window, start_time) VALUES (1, 'dno', '00:00:00', '2008-11-09');


INSERT INTO ta_feedback.responses(survey_instance_id, question_id, answer, utorid) VALUES (6, 5, 'dmp', 'abcd1002');
INSERT INTO ta_feedback.responses(survey_instance_id, question_id, answer, utorid) VALUES (7, 4, 'wbg', 'abcd1004');
INSERT INTO ta_feedback.responses(survey_instance_id, question_id, answer, utorid) VALUES (4, 2, 'vys', 'abcd4006');
INSERT INTO ta_feedback.responses(survey_instance_id, question_id, answer, utorid) VALUES (3, 6, 'cps', 'abcd1002');
INSERT INTO ta_feedback.responses(survey_instance_id, question_id, answer, utorid) VALUES (7, 7, 'tkk', 'abcd4001');
INSERT INTO ta_feedback.responses(survey_instance_id, question_id, answer, utorid) VALUES (8, 10, 'rxj', 'abcd2006');
INSERT INTO ta_feedback.responses(survey_instance_id, question_id, answer, utorid) VALUES (2, 10, 'sts', 'abcd4008');
INSERT INTO ta_feedback.responses(survey_instance_id, question_id, answer, utorid) VALUES (5, 10, 'pck', 'abcd4009');
INSERT INTO ta_feedback.responses(survey_instance_id, question_id, answer, utorid) VALUES (10, 9, 'kmf', 'abcd2005');
INSERT INTO ta_feedback.responses(survey_instance_id, question_id, answer, utorid) VALUES (5, 8, 'tgz', 'abcd2000');


