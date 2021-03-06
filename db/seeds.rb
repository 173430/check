# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

School.create(:schoolname => '島根県立出雲商業高校')

Grade.create(:grade => '１年')
Grade.create(:grade => '２年')
Grade.create(:grade => '３年')

Subject.create(:subjectname => '国語')
Subject.create(:subjectname => '数学')
Subject.create(:subjectname => '英語')
Subject.create(:subjectname => '科学と人間生活')
Subject.create(:subjectname => '生物基礎')
Subject.create(:subjectname => '世界史')
Subject.create(:subjectname => '日本史')
Subject.create(:subjectname => '現代社会')
Subject.create(:subjectname => '簿記')
Subject.create(:subjectname => '財務会計')
Subject.create(:subjectname => '原価計算')
Subject.create(:subjectname => '情報処理')
Subject.create(:subjectname => 'プログラミング')
Subject.create(:subjectname => '電子商取引')
Subject.create(:subjectname => 'ビジネス情報')
Subject.create(:subjectname => 'ビジネス情報管理')
Subject.create(:subjectname => 'ビジネス基礎')
Subject.create(:subjectname => '課題研究')
Subject.create(:subjectname => '総合実践')
Subject.create(:subjectname => 'ビジネス実務')
Subject.create(:subjectname => 'マーケティング')
Subject.create(:subjectname => '商品開発')
Subject.create(:subjectname => '広告と販売促進')
Subject.create(:subjectname => 'ビジネス経済')
Subject.create(:subjectname => 'ビジネス経済応用')
Subject.create(:subjectname => '経済活動と法')
Subject.create(:subjectname => '家庭総合')
Subject.create(:subjectname => 'EC')
Subject.create(:subjectname => '保健・体育')
Subject.create(:subjectname => '音楽')
Subject.create(:subjectname => '美術')
Subject.create(:subjectname => '書道')
Subject.create(:subjectname => '珠算・電卓実務検定')
Subject.create(:subjectname => '簿記実務検定')
Subject.create(:subjectname => 'ビジネス文書実務検定')
Subject.create(:subjectname => '英語検定')
Subject.create(:subjectname => '情報処理検定')
Subject.create(:subjectname => '商業経済検定')
Subject.create(:subjectname => '会計実務検定')
Subject.create(:subjectname => 'ビジネスコミュニケーション検定')
Subject.create(:subjectname => '日商簿記3級')
Subject.create(:subjectname => '日商簿記2級')
Subject.create(:subjectname => 'ITパスポート試験')
Subject.create(:subjectname => '基本情報技術者試験')

Classroom.create(:grade => 3, :classname => '４組', :department => '情報処理科')
Classroom.create(:grade => 1, :classname => '１２Ｒ', :department =>'普通科')

User.create(:classroom_id => 1, :userid => 's20171434', :name => '三島帆夏', :introduce => 'みしまほのかです', :password => '1111')
User.create(:classroom_id => 2, :userid => 's20171414', :name => '金築拓也', :introduce => 'こんにちは', :password => '8989')

Note.create(:user_id => 1, :title => '地震', :grade_id => 3, :subject_id => 2, :extra => 'プレートテクトニクスです', :good => 4)

Group.create(:name => '森田')


User.create(:classroom_id => 2, :userid => 's20171414', :name => '金築拓也', :introduce => 'こんにちは', :password => '8989')
User.create(:classroom_id => 3, :userid => 's20171421', :name => '佐野友哉', :introduce => 'こんばんは', :password => '2222')

