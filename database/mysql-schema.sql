-- مكتب وليد (TMS) — قاعدة بيانات MySQL 8 مطابقة لملف Google Sheets
-- مولَّد من تعريف واحد (dbgen/schema.py) مع سكربت الشيت وقاموس البيانات، فتبقى الثلاثة متطابقة.
-- التسمية: snake_case، جداول بصيغة الجمع، مفتاح أساسي id، مفاتيح أجنبية *_id، أعمدة تدقيق created_at/updated_at، جداول مرجعية lk_*.
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE `lk_task_status` (
  `code` VARCHAR(20) NOT NULL COMMENT 'الرمز',
  `name_ar` VARCHAR(120) NOT NULL COMMENT 'الاسم بالعربية',
  `name_en` VARCHAR(120) NOT NULL COMMENT 'الاسم بالإنجليزية',
  `sort_order` SMALLINT NULL COMMENT 'الترتيب',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='حالات المهام والتكليفات';

INSERT INTO `lk_task_status` (`code`,`name_ar`,`name_en`,`sort_order`) VALUES ('todo','لم تبدأ','Not started',1), ('doing','قيد التنفيذ','In progress',2), ('hold','متوقفة','On hold',3), ('done','مكتملة','Completed',4), ('cancel','ملغاة','Cancelled',5);

CREATE TABLE `lk_priority` (
  `code` VARCHAR(20) NOT NULL COMMENT 'الرمز',
  `name_ar` VARCHAR(120) NOT NULL COMMENT 'الاسم بالعربية',
  `name_en` VARCHAR(120) NOT NULL COMMENT 'الاسم بالإنجليزية',
  `sort_order` SMALLINT NULL COMMENT 'الترتيب',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='الأولويات';

INSERT INTO `lk_priority` (`code`,`name_ar`,`name_en`,`sort_order`) VALUES ('p1','حرجة','Critical',1), ('p2','عالية','High',2), ('p3','متوسطة','Medium',3), ('p4','منخفضة','Low',4);

CREATE TABLE `lk_project_status` (
  `code` VARCHAR(20) NOT NULL COMMENT 'الرمز',
  `name_ar` VARCHAR(120) NOT NULL COMMENT 'الاسم بالعربية',
  `name_en` VARCHAR(120) NOT NULL COMMENT 'الاسم بالإنجليزية',
  `sort_order` SMALLINT NULL COMMENT 'الترتيب',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='حالات المشاريع';

INSERT INTO `lk_project_status` (`code`,`name_ar`,`name_en`,`sort_order`) VALUES ('planned','مخطط','Planned',1), ('active','نشط','Active',2), ('hold','متوقف','On hold',3), ('done','مكتمل','Completed',4), ('cancel','ملغى','Cancelled',5);

CREATE TABLE `lk_course_status` (
  `code` VARCHAR(20) NOT NULL COMMENT 'الرمز',
  `name_ar` VARCHAR(120) NOT NULL COMMENT 'الاسم بالعربية',
  `name_en` VARCHAR(120) NOT NULL COMMENT 'الاسم بالإنجليزية',
  `sort_order` SMALLINT NULL COMMENT 'الترتيب',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='حالات الدورات';

INSERT INTO `lk_course_status` (`code`,`name_ar`,`name_en`,`sort_order`) VALUES ('planned','مخطط لها','Planned',1), ('open','التسجيل مفتوح','Registration open',2), ('running','قيد التنفيذ','Running',3), ('done','منفذة','Delivered',4), ('cancel','ملغاة','Cancelled',5);

CREATE TABLE `lk_idea_stage` (
  `code` VARCHAR(20) NOT NULL COMMENT 'الرمز',
  `name_ar` VARCHAR(120) NOT NULL COMMENT 'الاسم بالعربية',
  `name_en` VARCHAR(120) NOT NULL COMMENT 'الاسم بالإنجليزية',
  `sort_order` SMALLINT NULL COMMENT 'الترتيب',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='مراحل الأفكار';

INSERT INTO `lk_idea_stage` (`code`,`name_ar`,`name_en`,`sort_order`) VALUES ('new','جديدة','New',1), ('review','قيد الدراسة','Under review',2), ('accepted','مقبولة','Accepted',3), ('pilot','مشروع تجريبي','Pilot project',4), ('rejected','مستبعدة','Rejected',5);

CREATE TABLE `lk_person_kind` (
  `code` VARCHAR(20) NOT NULL COMMENT 'الرمز',
  `name_ar` VARCHAR(120) NOT NULL COMMENT 'الاسم بالعربية',
  `name_en` VARCHAR(120) NOT NULL COMMENT 'الاسم بالإنجليزية',
  `sort_order` SMALLINT NULL COMMENT 'الترتيب',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='أنواع الأشخاص';

INSERT INTO `lk_person_kind` (`code`,`name_ar`,`name_en`,`sort_order`) VALUES ('employee','موظف','Employee',1), ('trainer','مدرب','Trainer',2), ('trainee','متدرب','Trainee',3);

CREATE TABLE `lk_dept_status` (
  `code` VARCHAR(20) NOT NULL COMMENT 'الرمز',
  `name_ar` VARCHAR(120) NOT NULL COMMENT 'الاسم بالعربية',
  `name_en` VARCHAR(120) NOT NULL COMMENT 'الاسم بالإنجليزية',
  `sort_order` SMALLINT NULL COMMENT 'الترتيب',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='حالة القسم';

INSERT INTO `lk_dept_status` (`code`,`name_ar`,`name_en`,`sort_order`) VALUES ('active','فعال','Active',1), ('inactive','غير فعال','Inactive',2);

CREATE TABLE `lk_duty_status` (
  `code` VARCHAR(20) NOT NULL COMMENT 'الرمز',
  `name_ar` VARCHAR(120) NOT NULL COMMENT 'الاسم بالعربية',
  `name_en` VARCHAR(120) NOT NULL COMMENT 'الاسم بالإنجليزية',
  `sort_order` SMALLINT NULL COMMENT 'الترتيب',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='التواجد على رأس العمل';

INSERT INTO `lk_duty_status` (`code`,`name_ar`,`name_en`,`sort_order`) VALUES ('on','على رأس العمل','On duty',1), ('off','ليس على رأس العمل','Not on duty',2);

CREATE TABLE `lk_role` (
  `code` VARCHAR(20) NOT NULL COMMENT 'الرمز',
  `name_ar` VARCHAR(120) NOT NULL COMMENT 'الاسم بالعربية',
  `name_en` VARCHAR(120) NOT NULL COMMENT 'الاسم بالإنجليزية',
  `sort_order` SMALLINT NULL COMMENT 'الترتيب',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='الأدوار في الهيكل التنظيمي';

INSERT INTO `lk_role` (`code`,`name_ar`,`name_en`,`sort_order`) VALUES ('manager','مدير','Manager',1), ('head','رئيس قسم','Head of department',2), ('employee','موظف','Employee',3);

CREATE TABLE `lk_visibility` (
  `code` VARCHAR(20) NOT NULL COMMENT 'الرمز',
  `name_ar` VARCHAR(120) NOT NULL COMMENT 'الاسم بالعربية',
  `name_en` VARCHAR(120) NOT NULL COMMENT 'الاسم بالإنجليزية',
  `sort_order` SMALLINT NULL COMMENT 'الترتيب',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ظهور المهمة';

INSERT INTO `lk_visibility` (`code`,`name_ar`,`name_en`,`sort_order`) VALUES ('auto','حسب الهيكل التنظيمي','By org structure',1), ('private','شخصية','Personal',2), ('shared','مشتركة مع رئيس القسم','Shared with head',3);

CREATE TABLE `lk_reminder_when` (
  `code` VARCHAR(20) NOT NULL COMMENT 'الرمز',
  `name_ar` VARCHAR(120) NOT NULL COMMENT 'الاسم بالعربية',
  `name_en` VARCHAR(120) NOT NULL COMMENT 'الاسم بالإنجليزية',
  `sort_order` SMALLINT NULL COMMENT 'الترتيب',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='توقيت التذكير';

INSERT INTO `lk_reminder_when` (`code`,`name_ar`,`name_en`,`sort_order`) VALUES ('before','قبل الموعد','Before deadline',1), ('on','يوم الموعد','On due date',2), ('after','يوميًا بعد التأخر','Daily when overdue',3);

CREATE TABLE `lk_reminder_unit` (
  `code` VARCHAR(20) NOT NULL COMMENT 'الرمز',
  `name_ar` VARCHAR(120) NOT NULL COMMENT 'الاسم بالعربية',
  `name_en` VARCHAR(120) NOT NULL COMMENT 'الاسم بالإنجليزية',
  `sort_order` SMALLINT NULL COMMENT 'الترتيب',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='وحدات التذكير';

INSERT INTO `lk_reminder_unit` (`code`,`name_ar`,`name_en`,`sort_order`) VALUES ('h','ساعة','Hour',1), ('d','يوم','Day',2), ('w','أسبوع','Week',3);

CREATE TABLE `lk_channel` (
  `code` VARCHAR(20) NOT NULL COMMENT 'الرمز',
  `name_ar` VARCHAR(120) NOT NULL COMMENT 'الاسم بالعربية',
  `name_en` VARCHAR(120) NOT NULL COMMENT 'الاسم بالإنجليزية',
  `sort_order` SMALLINT NULL COMMENT 'الترتيب',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='قنوات التذكير';

INSERT INTO `lk_channel` (`code`,`name_ar`,`name_en`,`sort_order`) VALUES ('site','داخل الموقع','In app',1), ('email','البريد','Email',2), ('whatsapp','واتساب','WhatsApp',3), ('calendar','التقويم','Calendar',4);

CREATE TABLE `departments` (
  `id` VARCHAR(64) NOT NULL COMMENT 'المعرّف',
  `name` VARCHAR(190) NOT NULL COMMENT 'رمز القسم المستخدم في المهام والتقارير (مثل TD)',
  `name_ar` VARCHAR(190) NULL COMMENT 'اسم القسم بالعربية',
  `name_en` VARCHAR(190) NULL COMMENT 'اسم القسم بالإنجليزية',
  `head_id` VARCHAR(64) NULL COMMENT 'رئيس القسم',
  `status` VARCHAR(20) NULL COMMENT 'حالة القسم (فارغ = فعال)',
  `icon` VARCHAR(40) NULL COMMENT 'أيقونة القسم (فارغ = تلقائية من الاسم)',
  `description` TEXT NULL COMMENT 'وصف القسم',
  `source` VARCHAR(190) NULL COMMENT 'مصدر السجل',
  `created_at` DATETIME NULL COMMENT 'تاريخ الإنشاء (UTC)',
  `updated_at` DATETIME NULL COMMENT 'تاريخ آخر تعديل (UTC)',
  `extra_json` JSON NULL COMMENT 'حقول إضافية غير مُعرّفة في الأعمدة (للحفاظ على كل البيانات)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_departments_name` (`name`),
  KEY `ix_departments_head_id` (`head_id`),
  KEY `ix_departments_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='الأقسام والجهات';

CREATE TABLE `people` (
  `id` VARCHAR(64) NOT NULL COMMENT 'المعرّف',
  `code` VARCHAR(20) NULL COMMENT 'الرمز الظاهر (E-1)',
  `full_name` VARCHAR(190) NOT NULL COMMENT 'الاسم',
  `kind` VARCHAR(20) NULL COMMENT 'النوع',
  `role` VARCHAR(20) NULL COMMENT 'الدور في الهيكل',
  `department_id` VARCHAR(64) NULL COMMENT 'القسم',
  `reports_to_id` VARCHAR(64) NULL COMMENT 'يتبع لـ',
  `job_title` VARCHAR(190) NULL COMMENT 'الوظيفة',
  `admin_title` VARCHAR(190) NULL COMMENT 'وظيفة إدارية أخرى',
  `duty_status` VARCHAR(20) NULL COMMENT 'على رأس العمل أم لا',
  `duty_note` VARCHAR(300) NULL COMMENT 'سبب عدم التواجد / حتى تاريخ',
  `cert_folder_url` VARCHAR(1000) NULL COMMENT 'رابط مجلد الشهادات المشترك (Google Drive أو OneDrive)',
  `specialization` VARCHAR(190) NULL COMMENT 'التخصص',
  `email` VARCHAR(190) NULL COMMENT 'البريد الإلكتروني',
  `phone` VARCHAR(40) NULL COMMENT 'الجوال',
  `account_id` VARCHAR(64) NULL COMMENT 'معرّف حساب الدخول المرتبط',
  `perms_json` JSON NULL COMMENT 'ما يُسمح للموظف بتحديثه',
  `notes` TEXT NULL COMMENT 'ملاحظات',
  `source` VARCHAR(190) NULL COMMENT 'مصدر السجل',
  `created_at` DATETIME NULL COMMENT 'تاريخ الإنشاء (UTC)',
  `updated_at` DATETIME NULL COMMENT 'تاريخ آخر تعديل (UTC)',
  `extra_json` JSON NULL COMMENT 'حقول إضافية غير مُعرّفة في الأعمدة (للحفاظ على كل البيانات)',
  PRIMARY KEY (`id`),
  KEY `ix_people_code` (`code`),
  KEY `ix_people_kind` (`kind`),
  KEY `ix_people_role` (`role`),
  KEY `ix_people_department_id` (`department_id`),
  KEY `ix_people_reports_to_id` (`reports_to_id`),
  KEY `ix_people_duty_status` (`duty_status`),
  KEY `ix_people_account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='الأشخاص (موظفون ومدربون ومتدربون)';

CREATE TABLE `person_subjects` (
  `person_id` VARCHAR(64) NOT NULL COMMENT 'العنصر الأب',
  `seq` SMALLINT NULL COMMENT 'الترتيب',
  `subject` VARCHAR(190) NOT NULL COMMENT 'مادة يستطيع تدريبها',
  KEY `ix_person_subjects_person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='تابع لجدول people';

CREATE TABLE `person_certificates` (
  `person_id` VARCHAR(64) NOT NULL COMMENT 'العنصر الأب',
  `seq` SMALLINT NULL COMMENT 'الترتيب',
  `id` VARCHAR(64) NOT NULL COMMENT 'المعرّف',
  `name` VARCHAR(300) NULL COMMENT 'اسم الشهادة',
  `issuer` VARCHAR(190) NULL COMMENT 'الجهة المانحة',
  `issued_on` DATE NULL COMMENT 'تاريخ الحصول',
  `expires_on` DATE NULL COMMENT 'تاريخ الانتهاء',
  `url` VARCHAR(1000) NULL COMMENT 'رابط الشهادة (Google Drive أو OneDrive)',
  PRIMARY KEY (`id`),
  KEY `ix_person_certificates_person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='تابع لجدول people';

CREATE TABLE `projects` (
  `id` VARCHAR(64) NOT NULL COMMENT 'المعرّف',
  `code` VARCHAR(20) NULL COMMENT 'الرمز (P-1)',
  `name` VARCHAR(300) NOT NULL COMMENT 'اسم المشروع',
  `goal` TEXT NULL COMMENT 'الهدف',
  `scope` TEXT NULL COMMENT 'النطاق',
  `status` VARCHAR(20) NULL COMMENT 'الحالة',
  `owner_id` VARCHAR(64) NULL COMMENT 'المسؤول',
  `department_id` VARCHAR(64) NULL COMMENT 'القسم',
  `start_date` DATE NULL COMMENT 'تاريخ البدء',
  `due_date` DATE NULL COMMENT 'موعد التسليم',
  `manual_progress` TINYINT NULL COMMENT 'نسبة إنجاز يدوية',
  `from_idea_id` VARCHAR(64) NULL COMMENT 'الفكرة الأصلية',
  `notes` TEXT NULL COMMENT 'ملاحظات',
  `custom_json` JSON NULL COMMENT 'الحقول المخصصة',
  `created_at` DATETIME NULL COMMENT 'تاريخ الإنشاء (UTC)',
  `updated_at` DATETIME NULL COMMENT 'تاريخ آخر تعديل (UTC)',
  `extra_json` JSON NULL COMMENT 'حقول إضافية غير مُعرّفة في الأعمدة (للحفاظ على كل البيانات)',
  PRIMARY KEY (`id`),
  KEY `ix_projects_code` (`code`),
  KEY `ix_projects_status` (`status`),
  KEY `ix_projects_owner_id` (`owner_id`),
  KEY `ix_projects_department_id` (`department_id`),
  KEY `ix_projects_due_date` (`due_date`),
  KEY `ix_projects_from_idea_id` (`from_idea_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='المشاريع';

CREATE TABLE `project_phases` (
  `project_id` VARCHAR(64) NOT NULL COMMENT 'العنصر الأب',
  `seq` SMALLINT NULL COMMENT 'الترتيب',
  `id` VARCHAR(64) NOT NULL COMMENT 'المعرّف',
  `name` VARCHAR(300) NULL COMMENT 'المرحلة',
  `due_date` DATE NULL COMMENT 'الموعد',
  `is_done` BOOLEAN NULL COMMENT 'منجزة',
  PRIMARY KEY (`id`),
  KEY `ix_project_phases_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='تابع لجدول projects';

CREATE TABLE `project_deliverables` (
  `project_id` VARCHAR(64) NOT NULL COMMENT 'العنصر الأب',
  `seq` SMALLINT NULL COMMENT 'الترتيب',
  `id` VARCHAR(64) NOT NULL COMMENT 'المعرّف',
  `name` VARCHAR(300) NULL COMMENT 'المخرج',
  `is_done` BOOLEAN NULL COMMENT 'سُلّم',
  PRIMARY KEY (`id`),
  KEY `ix_project_deliverables_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='تابع لجدول projects';

CREATE TABLE `project_kpis` (
  `project_id` VARCHAR(64) NOT NULL COMMENT 'العنصر الأب',
  `seq` SMALLINT NULL COMMENT 'الترتيب',
  `id` VARCHAR(64) NOT NULL COMMENT 'المعرّف',
  `name` VARCHAR(300) NULL COMMENT 'المؤشر',
  `target` VARCHAR(120) NULL COMMENT 'المستهدف',
  `actual` VARCHAR(120) NULL COMMENT 'المتحقق',
  PRIMARY KEY (`id`),
  KEY `ix_project_kpis_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='تابع لجدول projects';

CREATE TABLE `courses` (
  `id` VARCHAR(64) NOT NULL COMMENT 'المعرّف',
  `code` VARCHAR(20) NULL COMMENT 'الرمز (C-1)',
  `title` VARCHAR(300) NOT NULL COMMENT 'عنوان الدورة',
  `program` VARCHAR(190) NULL COMMENT 'البرنامج التدريبي',
  `goals` TEXT NULL COMMENT 'الأهداف',
  `audience` VARCHAR(300) NULL COMMENT 'الفئة المستهدفة',
  `trainer_id` VARCHAR(64) NULL COMMENT 'المدرب',
  `department_id` VARCHAR(64) NULL COMMENT 'القسم المنظم',
  `status` VARCHAR(20) NULL COMMENT 'الحالة',
  `start_date` DATE NULL COMMENT 'تاريخ البدء',
  `end_date` DATE NULL COMMENT 'تاريخ الانتهاء',
  `start_time` TIME NULL COMMENT 'الوقت',
  `seats` SMALLINT NULL COMMENT 'عدد المقاعد',
  `location` VARCHAR(300) NULL COMMENT 'المكان',
  `meeting_url` VARCHAR(1000) NULL COMMENT 'رابط الحضور عن بُعد',
  `notes` TEXT NULL COMMENT 'ملاحظات',
  `created_at` DATETIME NULL COMMENT 'تاريخ الإنشاء (UTC)',
  `updated_at` DATETIME NULL COMMENT 'تاريخ آخر تعديل (UTC)',
  `extra_json` JSON NULL COMMENT 'حقول إضافية غير مُعرّفة في الأعمدة (للحفاظ على كل البيانات)',
  PRIMARY KEY (`id`),
  KEY `ix_courses_code` (`code`),
  KEY `ix_courses_trainer_id` (`trainer_id`),
  KEY `ix_courses_department_id` (`department_id`),
  KEY `ix_courses_status` (`status`),
  KEY `ix_courses_start_date` (`start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='الدورات والبرامج التدريبية';

CREATE TABLE `course_prep_items` (
  `course_id` VARCHAR(64) NOT NULL COMMENT 'العنصر الأب',
  `seq` SMALLINT NULL COMMENT 'الترتيب',
  `id` VARCHAR(64) NOT NULL COMMENT 'المعرّف',
  `item_key` VARCHAR(40) NULL COMMENT 'نوع البند',
  `label` VARCHAR(300) NULL COMMENT 'البند',
  `due_date` DATE NULL COMMENT 'الموعد',
  `is_done` BOOLEAN NULL COMMENT 'منجز',
  `done_at` DATETIME NULL COMMENT 'تاريخ الإنجاز',
  `is_manual` BOOLEAN NULL COMMENT 'موعد معدل يدويًا',
  PRIMARY KEY (`id`),
  KEY `ix_course_prep_items_course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='تابع لجدول courses';

CREATE TABLE `course_enrollments` (
  `course_id` VARCHAR(64) NOT NULL COMMENT 'العنصر الأب',
  `seq` SMALLINT NULL COMMENT 'الترتيب',
  `person_id` VARCHAR(64) NULL COMMENT 'المتدرب',
  `is_registered` BOOLEAN NULL COMMENT 'مسجل',
  `attended` BOOLEAN NULL COMMENT 'حضر',
  `completed` BOOLEAN NULL COMMENT 'أكمل',
  `rating` TINYINT NULL COMMENT 'التقييم 1-5',
  `note` TEXT NULL COMMENT 'ملاحظة',
  KEY `ix_course_enrollments_course_id` (`course_id`),
  KEY `ix_course_enrollments_person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='تابع لجدول courses';

CREATE TABLE `tasks` (
  `id` VARCHAR(64) NOT NULL COMMENT 'المعرّف',
  `code` VARCHAR(20) NULL COMMENT 'الرمز (T-1)',
  `title` VARCHAR(300) NOT NULL COMMENT 'عنوان المهمة',
  `description` TEXT NULL COMMENT 'الوصف',
  `status` VARCHAR(20) NULL COMMENT 'الحالة («متأخرة» تُحسب ولا تُخزَّن)',
  `priority` VARCHAR(4) NULL COMMENT 'الأولوية',
  `assignee_id` VARCHAR(64) NULL COMMENT 'المسؤول',
  `department_id` VARCHAR(64) NULL COMMENT 'القسم',
  `start_date` DATE NULL COMMENT 'تاريخ البدء',
  `due_date` DATE NULL COMMENT 'الموعد النهائي',
  `due_time` TIME NULL COMMENT 'وقت الموعد',
  `progress` TINYINT NULL COMMENT 'نسبة الإنجاز %',
  `blockers` TEXT NULL COMMENT 'العوائق',
  `next_step` TEXT NULL COMMENT 'الخطوة التالية',
  `project_id` VARCHAR(64) NULL COMMENT 'المشروع',
  `course_id` VARCHAR(64) NULL COMMENT 'الدورة',
  `idea_id` VARCHAR(64) NULL COMMENT 'الفكرة',
  `parent_task_id` VARCHAR(64) NULL COMMENT 'المهمة الأم',
  `visibility` VARCHAR(20) NULL COMMENT 'من يرى المهمة',
  `reminder_mode` VARCHAR(20) NULL COMMENT 'وضع التذكير (default/custom/off)',
  `completed_at` DATETIME NULL COMMENT 'تاريخ الإكمال',
  `last_update_at` DATETIME NULL COMMENT 'آخر تحديث للعمل',
  `created_by_id` VARCHAR(64) NULL COMMENT 'أنشأها',
  `source` VARCHAR(300) NULL COMMENT 'المصدر',
  `import_batch_id` VARCHAR(64) NULL COMMENT 'دفعة الاستيراد',
  `excel_no` VARCHAR(20) NULL COMMENT 'رقم المهمة في Excel',
  `year` VARCHAR(10) NULL COMMENT 'السنة',
  `month` VARCHAR(20) NULL COMMENT 'الشهر',
  `custom_json` JSON NULL COMMENT 'الحقول المخصصة',
  `raw_import_json` JSON NULL COMMENT 'صف Excel الأصلي كما استُورد',
  `created_at` DATETIME NULL COMMENT 'تاريخ الإنشاء (UTC)',
  `updated_at` DATETIME NULL COMMENT 'تاريخ آخر تعديل (UTC)',
  `extra_json` JSON NULL COMMENT 'حقول إضافية غير مُعرّفة في الأعمدة (للحفاظ على كل البيانات)',
  PRIMARY KEY (`id`),
  KEY `ix_tasks_code` (`code`),
  KEY `ix_tasks_status` (`status`),
  KEY `ix_tasks_priority` (`priority`),
  KEY `ix_tasks_assignee_id` (`assignee_id`),
  KEY `ix_tasks_department_id` (`department_id`),
  KEY `ix_tasks_due_date` (`due_date`),
  KEY `ix_tasks_project_id` (`project_id`),
  KEY `ix_tasks_course_id` (`course_id`),
  KEY `ix_tasks_idea_id` (`idea_id`),
  KEY `ix_tasks_parent_task_id` (`parent_task_id`),
  KEY `ix_tasks_visibility` (`visibility`),
  KEY `ix_tasks_created_by_id` (`created_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='المهام';

CREATE TABLE `task_dependencies` (
  `task_id` VARCHAR(64) NOT NULL COMMENT 'العنصر الأب',
  `seq` SMALLINT NULL COMMENT 'الترتيب',
  `depends_on_task_id` VARCHAR(64) NULL COMMENT 'المهمة التي تعتمد عليها',
  KEY `ix_task_dependencies_task_id` (`task_id`),
  KEY `ix_task_dependencies_depends_on_task_id` (`depends_on_task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='تابع لجدول tasks';

CREATE TABLE `task_reminders` (
  `task_id` VARCHAR(64) NOT NULL COMMENT 'العنصر الأب',
  `seq` SMALLINT NULL COMMENT 'الترتيب',
  `id` VARCHAR(64) NOT NULL COMMENT 'المعرّف',
  `when_type` VARCHAR(10) NULL COMMENT 'التوقيت',
  `offset_value` SMALLINT NULL COMMENT 'العدد',
  `offset_unit` VARCHAR(2) NULL COMMENT 'الوحدة',
  `channels` VARCHAR(100) NULL COMMENT 'القنوات (مفصولة بفاصلة)',
  `recipient` VARCHAR(20) NULL COMMENT 'المستلم',
  PRIMARY KEY (`id`),
  KEY `ix_task_reminders_task_id` (`task_id`),
  KEY `ix_task_reminders_when_type` (`when_type`),
  KEY `ix_task_reminders_offset_unit` (`offset_unit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='تابع لجدول tasks';

CREATE TABLE `assignments` (
  `id` VARCHAR(64) NOT NULL COMMENT 'المعرّف',
  `code` VARCHAR(20) NULL COMMENT 'الرمز (A-1)',
  `title` VARCHAR(300) NOT NULL COMMENT 'عنوان التكليف',
  `expected_outcome` TEXT NULL COMMENT 'النتيجة المتوقعة',
  `due_date` DATE NULL COMMENT 'الموعد النهائي',
  `priority` VARCHAR(4) NULL COMMENT 'الأولوية',
  `status` VARCHAR(20) NULL COMMENT 'الحالة',
  `needs_approval` BOOLEAN NULL COMMENT 'يتطلب موافقة المدير',
  `project_id` VARCHAR(64) NULL COMMENT 'المشروع',
  `course_id` VARCHAR(64) NULL COMMENT 'الدورة',
  `note` TEXT NULL COMMENT 'ملاحظة للموظف',
  `completed_at` DATETIME NULL COMMENT 'تاريخ الإغلاق',
  `created_at` DATETIME NULL COMMENT 'تاريخ الإنشاء (UTC)',
  `updated_at` DATETIME NULL COMMENT 'تاريخ آخر تعديل (UTC)',
  `extra_json` JSON NULL COMMENT 'حقول إضافية غير مُعرّفة في الأعمدة (للحفاظ على كل البيانات)',
  PRIMARY KEY (`id`),
  KEY `ix_assignments_code` (`code`),
  KEY `ix_assignments_due_date` (`due_date`),
  KEY `ix_assignments_priority` (`priority`),
  KEY `ix_assignments_status` (`status`),
  KEY `ix_assignments_project_id` (`project_id`),
  KEY `ix_assignments_course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='تكليفات الموظفين';

CREATE TABLE `assignment_assignees` (
  `assignment_id` VARCHAR(64) NOT NULL COMMENT 'العنصر الأب',
  `seq` SMALLINT NULL COMMENT 'الترتيب',
  `person_id` VARCHAR(64) NULL COMMENT 'الموظف المكلف',
  `seen_at` DATETIME NULL COMMENT 'آخر اطلاع للمدير',
  `approval_status` VARCHAR(20) NULL COMMENT 'اعتماد المدير (approved/returned)',
  `approval_at` DATETIME NULL COMMENT 'تاريخ الاعتماد',
  `reply_text` TEXT NULL COMMENT 'رد المدير',
  `reply_at` DATETIME NULL COMMENT 'تاريخ الرد',
  KEY `ix_assignment_assignees_assignment_id` (`assignment_id`),
  KEY `ix_assignment_assignees_person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='تابع لجدول assignments';

CREATE TABLE `assignment_links` (
  `assignment_id` VARCHAR(64) NOT NULL COMMENT 'العنصر الأب',
  `seq` SMALLINT NULL COMMENT 'الترتيب',
  `id` VARCHAR(64) NOT NULL COMMENT 'المعرّف',
  `title` VARCHAR(300) NULL COMMENT 'عنوان المرجع',
  `url` VARCHAR(1000) NULL COMMENT 'الرابط',
  PRIMARY KEY (`id`),
  KEY `ix_assignment_links_assignment_id` (`assignment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='تابع لجدول assignments';

CREATE TABLE `ideas` (
  `id` VARCHAR(64) NOT NULL COMMENT 'المعرّف',
  `code` VARCHAR(20) NULL COMMENT 'الرمز (I-1)',
  `title` VARCHAR(300) NOT NULL COMMENT 'عنوان الفكرة',
  `problem` TEXT NULL COMMENT 'المشكلة',
  `beneficiaries` TEXT NULL COMMENT 'الفئة المستفيدة',
  `solution` TEXT NULL COMMENT 'الحل المقترح',
  `value_proposition` TEXT NULL COMMENT 'القيمة',
  `assumptions` TEXT NULL COMMENT 'الافتراضات',
  `risks` TEXT NULL COMMENT 'المخاطر',
  `next_step` TEXT NULL COMMENT 'الخطوة التالية',
  `impact` TINYINT NULL COMMENT 'الأثر 1-5',
  `effort` TINYINT NULL COMMENT 'الجهد 1-5',
  `cost` TINYINT NULL COMMENT 'التكلفة 1-5',
  `ease` TINYINT NULL COMMENT 'سهولة التنفيذ 1-5',
  `stage` VARCHAR(20) NULL COMMENT 'المرحلة',
  `project_id` VARCHAR(64) NULL COMMENT 'المشروع التجريبي',
  `source` VARCHAR(40) NULL COMMENT 'المصدر (ai = مقترحة آليًا)',
  `notes` TEXT NULL COMMENT 'ملاحظات',
  `created_at` DATETIME NULL COMMENT 'تاريخ الإنشاء (UTC)',
  `updated_at` DATETIME NULL COMMENT 'تاريخ آخر تعديل (UTC)',
  `extra_json` JSON NULL COMMENT 'حقول إضافية غير مُعرّفة في الأعمدة (للحفاظ على كل البيانات)',
  PRIMARY KEY (`id`),
  KEY `ix_ideas_code` (`code`),
  KEY `ix_ideas_stage` (`stage`),
  KEY `ix_ideas_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='الأفكار والابتكار';

CREATE TABLE `idea_links` (
  `idea_id` VARCHAR(64) NOT NULL COMMENT 'العنصر الأب',
  `seq` SMALLINT NULL COMMENT 'الترتيب',
  `id` VARCHAR(64) NOT NULL COMMENT 'المعرّف',
  `title` VARCHAR(300) NULL COMMENT 'عنوان المرجع',
  `url` VARCHAR(1000) NULL COMMENT 'الرابط',
  PRIMARY KEY (`id`),
  KEY `ix_idea_links_idea_id` (`idea_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='تابع لجدول ideas';

CREATE TABLE `strategic_themes` (
  `id` VARCHAR(64) NOT NULL COMMENT 'المعرّف',
  `code` VARCHAR(20) NULL COMMENT 'الرمز (TH-1)',
  `name` VARCHAR(300) NOT NULL COMMENT 'اسم المحور',
  `description` TEXT NULL COMMENT 'الوصف',
  `owner_id` VARCHAR(64) NULL COMMENT 'مسؤول المحور',
  `sort_order` SMALLINT NULL COMMENT 'الترتيب',
  `created_at` DATETIME NULL COMMENT 'تاريخ الإنشاء (UTC)',
  `updated_at` DATETIME NULL COMMENT 'تاريخ آخر تعديل (UTC)',
  `extra_json` JSON NULL COMMENT 'حقول إضافية غير مُعرّفة في الأعمدة (للحفاظ على كل البيانات)',
  PRIMARY KEY (`id`),
  KEY `ix_strategic_themes_code` (`code`),
  KEY `ix_strategic_themes_owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='المحاور الاستراتيجية (Themes)';

CREATE TABLE `strategic_goals` (
  `id` VARCHAR(64) NOT NULL COMMENT 'المعرّف',
  `code` VARCHAR(20) NULL COMMENT 'الرمز (G-1)',
  `theme_id` VARCHAR(64) NOT NULL COMMENT 'المحور',
  `name` VARCHAR(300) NOT NULL COMMENT 'الهدف',
  `description` TEXT NULL COMMENT 'الوصف',
  `indicator` VARCHAR(300) NULL COMMENT 'مؤشر قياس الهدف',
  `target` VARCHAR(120) NULL COMMENT 'المستهدف',
  `sort_order` SMALLINT NULL COMMENT 'الترتيب',
  `created_at` DATETIME NULL COMMENT 'تاريخ الإنشاء (UTC)',
  `updated_at` DATETIME NULL COMMENT 'تاريخ آخر تعديل (UTC)',
  `extra_json` JSON NULL COMMENT 'حقول إضافية غير مُعرّفة في الأعمدة (للحفاظ على كل البيانات)',
  PRIMARY KEY (`id`),
  KEY `ix_strategic_goals_code` (`code`),
  KEY `ix_strategic_goals_theme_id` (`theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='الأهداف الاستراتيجية';

CREATE TABLE `strategic_initiatives` (
  `id` VARCHAR(64) NOT NULL COMMENT 'المعرّف',
  `code` VARCHAR(20) NULL COMMENT 'الرمز (IN-1)',
  `goal_id` VARCHAR(64) NOT NULL COMMENT 'الهدف',
  `name` VARCHAR(300) NOT NULL COMMENT 'المبادرة',
  `description` TEXT NULL COMMENT 'الوصف',
  `owner_id` VARCHAR(64) NULL COMMENT 'المسؤول',
  `department_id` VARCHAR(64) NULL COMMENT 'القسم',
  `status` VARCHAR(20) NULL COMMENT 'الحالة',
  `start_date` DATE NULL COMMENT 'البداية',
  `due_date` DATE NULL COMMENT 'النهاية المخططة',
  `progress` TINYINT NULL COMMENT 'نسبة الإنجاز 0-100',
  `progress_note` TEXT NULL COMMENT 'ملاحظة الإنجاز',
  `project_id` VARCHAR(64) NULL COMMENT 'المشروع المرتبط',
  `created_at` DATETIME NULL COMMENT 'تاريخ الإنشاء (UTC)',
  `updated_at` DATETIME NULL COMMENT 'تاريخ آخر تعديل (UTC)',
  `extra_json` JSON NULL COMMENT 'حقول إضافية غير مُعرّفة في الأعمدة (للحفاظ على كل البيانات)',
  PRIMARY KEY (`id`),
  KEY `ix_strategic_initiatives_code` (`code`),
  KEY `ix_strategic_initiatives_goal_id` (`goal_id`),
  KEY `ix_strategic_initiatives_owner_id` (`owner_id`),
  KEY `ix_strategic_initiatives_department_id` (`department_id`),
  KEY `ix_strategic_initiatives_status` (`status`),
  KEY `ix_strategic_initiatives_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='المبادرات الاستراتيجية';

CREATE TABLE `initiative_evidence` (
  `initiative_id` VARCHAR(64) NOT NULL COMMENT 'العنصر الأب',
  `seq` SMALLINT NULL COMMENT 'الترتيب',
  `id` VARCHAR(64) NOT NULL COMMENT 'المعرّف',
  `title` VARCHAR(300) NULL COMMENT 'الدليل',
  `url` VARCHAR(1000) NULL COMMENT 'الرابط',
  `note` TEXT NULL COMMENT 'ملاحظة',
  `added_on` DATE NULL COMMENT 'التاريخ',
  PRIMARY KEY (`id`),
  KEY `ix_initiative_evidence_initiative_id` (`initiative_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='تابع لجدول strategic_initiatives';

CREATE TABLE `files` (
  `id` VARCHAR(64) NOT NULL COMMENT 'المعرّف',
  `code` VARCHAR(20) NULL COMMENT 'الرمز (F-1)',
  `name` VARCHAR(300) NOT NULL COMMENT 'اسم الملف',
  `mime_type` VARCHAR(120) NULL COMMENT 'النوع',
  `size_bytes` BIGINT NULL COMMENT 'الحجم بالبايت',
  `storage` VARCHAR(20) NULL COMMENT 'مكان الحفظ (drive/drive-link/link)',
  `drive_file_id` VARCHAR(120) NULL COMMENT 'معرّف الملف في Drive',
  `url` VARCHAR(1000) NULL COMMENT 'الرابط',
  `folder_path` VARCHAR(500) NULL COMMENT 'مسار المجلد',
  `entity_type` VARCHAR(40) NULL COMMENT 'نوع العنصر المرتبط',
  `entity_id` VARCHAR(64) NULL COMMENT 'العنصر المرتبط',
  `visibility` VARCHAR(20) NULL COMMENT 'مستوى الوصول',
  `visibility_label` VARCHAR(120) NULL COMMENT 'وصف مستوى الوصول',
  `checked_at` DATETIME NULL COMMENT 'آخر تحقق من الصلاحيات',
  `uploaded_at` DATETIME NULL COMMENT 'تاريخ الرفع',
  `created_at` DATETIME NULL COMMENT 'تاريخ الإنشاء (UTC)',
  `updated_at` DATETIME NULL COMMENT 'تاريخ آخر تعديل (UTC)',
  `extra_json` JSON NULL COMMENT 'حقول إضافية غير مُعرّفة في الأعمدة (للحفاظ على كل البيانات)',
  PRIMARY KEY (`id`),
  KEY `ix_files_code` (`code`),
  KEY `ix_files_entity_type` (`entity_type`),
  KEY `ix_files_entity_id` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='الملفات';

CREATE TABLE `links` (
  `id` VARCHAR(64) NOT NULL COMMENT 'المعرّف',
  `code` VARCHAR(20) NULL COMMENT 'الرمز (L-1)',
  `title` VARCHAR(300) NOT NULL COMMENT 'العنوان',
  `url` VARCHAR(1000) NOT NULL COMMENT 'الرابط',
  `description` TEXT NULL COMMENT 'الوصف',
  `category` VARCHAR(120) NULL COMMENT 'التصنيف',
  `entity_type` VARCHAR(40) NULL COMMENT 'نوع العنصر المرتبط',
  `entity_id` VARCHAR(64) NULL COMMENT 'العنصر المرتبط',
  `created_at` DATETIME NULL COMMENT 'تاريخ الإنشاء (UTC)',
  `updated_at` DATETIME NULL COMMENT 'تاريخ آخر تعديل (UTC)',
  `extra_json` JSON NULL COMMENT 'حقول إضافية غير مُعرّفة في الأعمدة (للحفاظ على كل البيانات)',
  PRIMARY KEY (`id`),
  KEY `ix_links_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='الروابط المهمة';

CREATE TABLE `summaries` (
  `id` VARCHAR(64) NOT NULL COMMENT 'المعرّف',
  `code` VARCHAR(20) NULL COMMENT 'الرمز (S-1)',
  `title` VARCHAR(300) NOT NULL COMMENT 'العنوان',
  `period` VARCHAR(20) NULL COMMENT 'الفترة (week/month/custom/ai)',
  `range_start` DATE NULL COMMENT 'بداية الفترة',
  `range_end` DATE NULL COMMENT 'نهاية الفترة',
  `kind` VARCHAR(10) NULL COMMENT 'data = من البيانات، ai = مسودة ذكاء اصطناعي',
  `body` MEDIUMTEXT NULL COMMENT 'النص',
  `created_at` DATETIME NULL COMMENT 'تاريخ الإنشاء (UTC)',
  `updated_at` DATETIME NULL COMMENT 'تاريخ آخر تعديل (UTC)',
  `extra_json` JSON NULL COMMENT 'حقول إضافية غير مُعرّفة في الأعمدة (للحفاظ على كل البيانات)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ملخصات المتابعة';

CREATE TABLE `activity_log` (
  `id` VARCHAR(80) NOT NULL COMMENT 'المعرّف',
  `entity_type` VARCHAR(40) NOT NULL COMMENT 'نوع العنصر',
  `entity_id` VARCHAR(64) NOT NULL COMMENT 'العنصر',
  `seq` INT NULL COMMENT 'الترتيب',
  `logged_at` DATETIME NULL COMMENT 'الوقت',
  `message` TEXT NULL COMMENT 'التغيير',
  PRIMARY KEY (`id`),
  KEY `ix_activity_log_entity_type` (`entity_type`),
  KEY `ix_activity_log_entity_id` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='سجل التغييرات لكل العناصر';

CREATE TABLE `app_settings` (
  `setting_key` VARCHAR(64) NOT NULL COMMENT 'المفتاح (settings/notif/backup/imports/strategy/platform = بيانات المنصة: المعهد والمدير والتواصل والترخيص)',
  `value_json` JSON NOT NULL COMMENT 'القيمة',
  `updated_at` DATETIME NULL COMMENT 'آخر تعديل',
  PRIMARY KEY (`setting_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='الإعدادات والبيانات العامة';

CREATE TABLE `users` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `person_id` VARCHAR(64) NULL COMMENT 'الشخص المرتبط',
  `name` VARCHAR(190) NOT NULL,
  `email` VARCHAR(190) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `remember_token` VARCHAR(100) NULL,
  `created_at` TIMESTAMP NULL, `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`), UNIQUE KEY `uq_users_email` (`email`), KEY `ix_users_person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='حسابات الدخول (Laravel)';

-- المفاتيح الأجنبية
ALTER TABLE `departments` ADD CONSTRAINT `fk_departments_head_id` FOREIGN KEY (`head_id`) REFERENCES `people` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `departments` ADD CONSTRAINT `fk_departments_status` FOREIGN KEY (`status`) REFERENCES `lk_dept_status` (`code`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `people` ADD CONSTRAINT `fk_people_kind` FOREIGN KEY (`kind`) REFERENCES `lk_person_kind` (`code`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `people` ADD CONSTRAINT `fk_people_role` FOREIGN KEY (`role`) REFERENCES `lk_role` (`code`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `people` ADD CONSTRAINT `fk_people_department_id` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `people` ADD CONSTRAINT `fk_people_reports_to_id` FOREIGN KEY (`reports_to_id`) REFERENCES `people` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `people` ADD CONSTRAINT `fk_people_duty_status` FOREIGN KEY (`duty_status`) REFERENCES `lk_duty_status` (`code`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `person_subjects` ADD CONSTRAINT `fk_person_subjects_person_id` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `person_certificates` ADD CONSTRAINT `fk_person_certificates_person_id` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `projects` ADD CONSTRAINT `fk_projects_status` FOREIGN KEY (`status`) REFERENCES `lk_project_status` (`code`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `projects` ADD CONSTRAINT `fk_projects_owner_id` FOREIGN KEY (`owner_id`) REFERENCES `people` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `projects` ADD CONSTRAINT `fk_projects_department_id` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `projects` ADD CONSTRAINT `fk_projects_from_idea_id` FOREIGN KEY (`from_idea_id`) REFERENCES `ideas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `project_phases` ADD CONSTRAINT `fk_project_phases_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `project_deliverables` ADD CONSTRAINT `fk_project_deliverables_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `project_kpis` ADD CONSTRAINT `fk_project_kpis_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `courses` ADD CONSTRAINT `fk_courses_trainer_id` FOREIGN KEY (`trainer_id`) REFERENCES `people` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `courses` ADD CONSTRAINT `fk_courses_department_id` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `courses` ADD CONSTRAINT `fk_courses_status` FOREIGN KEY (`status`) REFERENCES `lk_course_status` (`code`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `course_prep_items` ADD CONSTRAINT `fk_course_prep_items_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `course_enrollments` ADD CONSTRAINT `fk_course_enrollments_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `course_enrollments` ADD CONSTRAINT `fk_course_enrollments_person_id` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `tasks` ADD CONSTRAINT `fk_tasks_status` FOREIGN KEY (`status`) REFERENCES `lk_task_status` (`code`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `tasks` ADD CONSTRAINT `fk_tasks_priority` FOREIGN KEY (`priority`) REFERENCES `lk_priority` (`code`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `tasks` ADD CONSTRAINT `fk_tasks_assignee_id` FOREIGN KEY (`assignee_id`) REFERENCES `people` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `tasks` ADD CONSTRAINT `fk_tasks_department_id` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `tasks` ADD CONSTRAINT `fk_tasks_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `tasks` ADD CONSTRAINT `fk_tasks_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `tasks` ADD CONSTRAINT `fk_tasks_idea_id` FOREIGN KEY (`idea_id`) REFERENCES `ideas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `tasks` ADD CONSTRAINT `fk_tasks_parent_task_id` FOREIGN KEY (`parent_task_id`) REFERENCES `tasks` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `tasks` ADD CONSTRAINT `fk_tasks_visibility` FOREIGN KEY (`visibility`) REFERENCES `lk_visibility` (`code`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `tasks` ADD CONSTRAINT `fk_tasks_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `people` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `task_dependencies` ADD CONSTRAINT `fk_task_dependencies_task_id` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `task_dependencies` ADD CONSTRAINT `fk_task_dependencies_depends_on_task_id` FOREIGN KEY (`depends_on_task_id`) REFERENCES `tasks` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `task_reminders` ADD CONSTRAINT `fk_task_reminders_task_id` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `task_reminders` ADD CONSTRAINT `fk_task_reminders_when_type` FOREIGN KEY (`when_type`) REFERENCES `lk_reminder_when` (`code`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `task_reminders` ADD CONSTRAINT `fk_task_reminders_offset_unit` FOREIGN KEY (`offset_unit`) REFERENCES `lk_reminder_unit` (`code`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `assignments` ADD CONSTRAINT `fk_assignments_priority` FOREIGN KEY (`priority`) REFERENCES `lk_priority` (`code`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `assignments` ADD CONSTRAINT `fk_assignments_status` FOREIGN KEY (`status`) REFERENCES `lk_task_status` (`code`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `assignments` ADD CONSTRAINT `fk_assignments_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `assignments` ADD CONSTRAINT `fk_assignments_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `assignment_assignees` ADD CONSTRAINT `fk_assignment_assignees_assignment_id` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `assignment_assignees` ADD CONSTRAINT `fk_assignment_assignees_person_id` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `assignment_links` ADD CONSTRAINT `fk_assignment_links_assignment_id` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `ideas` ADD CONSTRAINT `fk_ideas_stage` FOREIGN KEY (`stage`) REFERENCES `lk_idea_stage` (`code`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `ideas` ADD CONSTRAINT `fk_ideas_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `idea_links` ADD CONSTRAINT `fk_idea_links_idea_id` FOREIGN KEY (`idea_id`) REFERENCES `ideas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `strategic_themes` ADD CONSTRAINT `fk_strategic_themes_owner_id` FOREIGN KEY (`owner_id`) REFERENCES `people` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `strategic_goals` ADD CONSTRAINT `fk_strategic_goals_theme_id` FOREIGN KEY (`theme_id`) REFERENCES `strategic_themes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `strategic_initiatives` ADD CONSTRAINT `fk_strategic_initiatives_goal_id` FOREIGN KEY (`goal_id`) REFERENCES `strategic_goals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `strategic_initiatives` ADD CONSTRAINT `fk_strategic_initiatives_owner_id` FOREIGN KEY (`owner_id`) REFERENCES `people` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `strategic_initiatives` ADD CONSTRAINT `fk_strategic_initiatives_department_id` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `strategic_initiatives` ADD CONSTRAINT `fk_strategic_initiatives_status` FOREIGN KEY (`status`) REFERENCES `lk_task_status` (`code`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `strategic_initiatives` ADD CONSTRAINT `fk_strategic_initiatives_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `initiative_evidence` ADD CONSTRAINT `fk_initiative_evidence_initiative_id` FOREIGN KEY (`initiative_id`) REFERENCES `strategic_initiatives` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `users` ADD CONSTRAINT `fk_users_person_id` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

SET FOREIGN_KEY_CHECKS = 1;
