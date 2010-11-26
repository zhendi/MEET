class CoursesController < ApplicationController
  layout  "course"
  respond_to :html,:js

  before_filter :select_categories

  def index
  end

  def new
    @course = Course.new()
    @course_category = CourseCategory.find(params[:course_category_id])

    if params[:school_id]
      @school = School.find(params[:school_id])
      @subject = Subject.where("name=?", "Uncategoried").first
    end

    if params[:subject_id]
      @subject = Subject.find(params[:subject_id])
      @school = School.where("name=?", "Uncategoried").first
    end

    @subjects = @course_category.subjects
    @schools = @course_category.schools

    respond_with(@course)
  end

  def show
    @course = Course.find(params[:id])

    respond_with(@course)
  end

  def create
    @course = Course.new(params[:course])
    @course.author = current_user

    if @course.save
      redirect_to study_course_course_path(@course), :notice=>"Create Succeed"
    else
      render	:action=>:new, :notice=>"Create Failed"
    end
  end

  def edit
    @course = Course.find(params[:id])
    @course_category = CourseCategory.find(params[:course_category_id])

    @school = School.find(params[:school_id])
    @subject = Subject.find(params[:subject_id])

    @subjects = @course_category.subjects
    @schools = @course_category.schools

    respond_with(@course)	
  end

  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(params[:course])
      redirect_to study_course_course_path(@course), :notice=>"Update Succeed"
    else
      render	:action=>:edit, :notice=>"Update Failed"
    end
  end

  def destroy
    @course = Course.find(params[:id])
    if @course.destroy
      redirect_to	:action=>"index", :notice=>"Destroy Succeed"
    end
  end

  def collect
    @course = Course.find(params[:id])
    current_user.collected_courses << @course

    respond_with(@course)
  end

  def uncollect
    @course = Course.find(params[:id])
    current_user.collected_courses.delete(@course)

    respond_with(@course)
  end

  # 列出某个大类中的所有的Subject以及学校
  def list
    @course_category = CourseCategory.find(params[:id])
    course_name = @course_category.name.downcase
    if course_name.index("college education")
      redirect_to :action=>:show_college_edution, :id=>params[:id]
    elsif course_name.index("hot topic course")
      redirect_to :action=>:show_hot_topic_course,  :id=>params[:id]
    elsif course_name.index("test prep")
      redirect_to :action=>:show_test_prep, :id=>params[:id]
    elsif course_name.index("job seeking")
      redirect_to :action=>:show_job_seeking, :id=>params[:id]
    elsif course_name.index("conversational communications")
      redirect_to :action=>:show_conversational_communications, :id=>params[:id]
    elsif course_name.index("us school application")
      redirect_to :action=>:show_us_school_application, :id=>params[:id]
    elsif course_name.index("k12 education")
      redirect_to :action=>:show_k12_education, :id=>params[:id]
    elsif course_name.index("online practice and games")
      redirect_to :action=>:show_online_practice_and_games, :id=>params[:id]
    elsif course_name.index("watch and listen")
      redirect_to :action=>:show_watch_and_listen,  :id=>params[:id]
    else
      redirect_to  :action=>:index
    end
  end

  def show_college_edution
    @course_category = CourseCategory.find(params[:id])
    @subjects = @course_category.subjects.roots
    @schools = @course_category.schools   
  end

  def show_hot_topic_course
    @course_category = CourseCategory.find(params[:id])
    @subjects = @course_category.subjects.roots
    @schools = @course_category.schools    
  end

  def show_test_prep
    @course_category = CourseCategory.find(params[:id])
    @subjects = @course_category.subjects.roots
    @schools = @course_category.schools    
  end

  def show_job_seeking
    @course_category = CourseCategory.find(params[:id])
    @subjects = @course_category.subjects.roots
    @schools = @course_category.schools    
  end

  def show_conversational_communications
    @course_category = CourseCategory.find(params[:id])
    @subjects = @course_category.subjects.roots
    @schools = @course_category.schools    
  end

  def show_k12_education
    @course_category = CourseCategory.find(params[:id])
    @subjects = @course_category.subjects.roots
    @schools = @course_category.schools    
  end

  def show_online_practice_and_games
    @course_category = CourseCategory.find(params[:id])
    @subjects = @course_category.subjects.roots
    @schools = @course_category.schools    
  end

  def show_watch_and_listen
    @course_category = CourseCategory.find(params[:id])
    @subjects = @course_category.subjects.roots
    @schools = @course_category.schools    
  end

  def show_us_school_application
    @course_category = CourseCategory.find(params[:id])
    @subjects = @course_category.subjects.roots
    @schools = @course_category.schools    
  end

  # 显示学校信息
  def show_school
    @school = School.find(params[:id])
    @course_category = CourseCategory.find(params[:course_category_id])
    @courses = @school.courses

    @subjects = []
    @courses.each do |c|
      @subjects << c.subject
    end
    @subjects.uniq!
  end

  def show_subject
    @subject = Subject.find(params[:id])
    @course_category = CourseCategory.find(params[:course_category_id])
    @courses = @subject.courses

    @schools = []
    @courses.each do |c|
      @schools << c.school
    end
  end

  def study_course
    @course = Course.find(params[:id])

    @course_category = @course.course_category
    @school = @course.school
    @subject = @course.subject
  end

  protected
  def select_categories
    @categories = CourseCategory.all
  end
end

