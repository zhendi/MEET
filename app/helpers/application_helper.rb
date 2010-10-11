# coding: utf-8

module ApplicationHelper
  def sex_display(sex)
    if sex 
      return "男"
    else
      return "女"
    end
  end
end
