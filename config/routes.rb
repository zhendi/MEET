MEET::Application.routes.draw do

  devise_for :admins

  devise_for :teachers

  devise_for :users
  
  resources	:blogs	do
    resources	:comments
    resources	:tags
  end

  # 课程相关的resources
  resources	:courses  do
    member  do
      post  "collect"
      get "study_course"
    end
  end
 
  resources	:profile
  
  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "blogs#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
