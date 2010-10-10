# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
#

Level.delete_all()

Level.create(:name=>"Low")
Level.create(:name=>"Middle")
Level.create(:name=>"High")


CourseCategory.delete_all()

cat = [
  "College education(美国大学本科)",
  "Graduate education(美国研究生院)",
  "K12 education(美国中小学教育)",
  "Hot topic course(美国热点话题课程)",
  "Test prep(留学考试准备)",
  "US school application(美国留学申请)",
  "Live and study in USA(在美国留学)",
  "Job seeking(找工作)",
  "Career enhancement(职业提升)",
  "Career enhancement(IT外包职业培训)",
  "Exporting training(出口业务培训)",
  "Conversational communications(口语沟通)",
  "Writing communications(写作沟通)",
  "Business finance/accounting(金融/财务培训)",
  "Parenting(子女教育)",
  "Games and others(教育游戏及其他)"
]
cat.each do |c|
  ct = CourseCategory.new(:name=>c)
  ct.save!
end

c = CourseCategory.first
Subject.delete_all()

root = Subject.create(:name=>"Engineering （工程）", :course_category => c)
root.children.create(:name=>"Electrical （电子工程）", :course_category => c )
root.children.create(:name=>"Mechanical （机械工程）", :course_category => c)
root.children.create(:name=>"Civil and Environmental（土木及环境）", :course_category => c)
root.children.create(:name=>"Chemical （化学工程）", :course_category => c)
root.children.create(:name=>"Materials （材料科学及工程）", :course_category => c)
root.children.create(:name=>"Industrial （工业工程）", :course_category => c)
root.children.create(:name=>"Computer （计算机科学及工程）", :course_category => c)
root.children.create(:name=>"Nuclear & Radiological （核物理）", :course_category => c)
root1 = Subject.create(:name=>"Science （科学）", :course_category => c)
root1.children.create(:name=>"Biology （生物学）", :course_category => c)
root1.children.create(:name=>"Chemistry （化学）", :course_category => c)
root1.children.create(:name=>"Geology （地理学）", :course_category => c)
root1.children.create(:name=>"Mathematics （数学）", :course_category => c)
root1.children.create(:name=>"Physics （物理学）", :course_category => c)

Subject.create(:name=>"Uncategoried", :course_category => c)

School.delete_all()

School.create(:name=>"Harvard （哈佛大学）", :course_category => c)
School.create(:name=>"MIT （麻省理工学院）", :course_category => c)
School.create(:name=>"Princeton （普林斯顿大学）", :course_category => c)
School.create(:name=>"Yale （耶鲁大学）", :course_category => c)
School.create(:name=>"Stanford （斯坦佛大学）", :course_category => c)
School.create(:name=>"UC Berkeley （加大伯克利分校）", :course_category => c)
School.create(:name=>"Cornell Univ. （康奈尔大学）", :course_category => c)
School.create(:name=>"Univ. of Michigan（密西根大学）", :course_category => c)

School.create(:name=>"Uncategoried", :course_catetory=>c)
