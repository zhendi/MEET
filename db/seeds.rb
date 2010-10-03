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


Category.delete_all()

cat = ["美国大学本科","美国研究生院","美国中小学教育","美国热点话题课程","留学考试准备",
  "美国留学申请","在美国留学","找工作","职业提升","IT外包职业培训","出口业务培训","口语沟通",
  "写作沟通","金融/财务培训","子女教育","教育游戏及其他"]
cat.each do |c|
  ct = Category.new(:name=>c)
  ct.save!
end
