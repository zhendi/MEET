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
root = Subject.create(:name=>"Engineering （工程）", :course_category => c)
s1 = root.children.create(:name=>"Electrical （电子工程）", :course_category => c)
s2 = root.children.create(:name=>"Mechanical （机械工程）", :course_category => c)

sch_1 = School.create(:name=>"Harvard （哈佛大学）", :course_category => c)
sch_2 = School.create(:name=>"MIT （麻省理工学院）", :course_category => c)
