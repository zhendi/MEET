MEET::Application.routes.draw do
  devise_for :users
  
  resources	:blogs	do
    resources	:comments
    resources	:tags
  end

  # 课程相关的resources
  resources	:courses  do
    member  do
      post "collect"
      post "uncollect"
      get "study_course"
    end
  end
 
  resources :forums do
    resources :topics do
      resources :replys
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
#== Route Map
# Generated on 27 Sep 2010 22:40
#
#                 new_user_session GET    /users/sign_in(.:format)                                          {:action=>"new", :controller=>"devise/sessions"}
#                     user_session POST   /users/sign_in(.:format)                                          {:action=>"create", :controller=>"devise/sessions"}
#             destroy_user_session GET    /users/sign_out(.:format)                                         {:action=>"destroy", :controller=>"devise/sessions"}
#                user_registration POST   /users(.:format)                                                  {:action=>"create", :controller=>"devise/registrations"}
#            new_user_registration GET    /users/sign_up(.:format)                                          {:action=>"new", :controller=>"devise/registrations"}
#           edit_user_registration GET    /users/edit(.:format)                                             {:action=>"edit", :controller=>"devise/registrations"}
#                user_registration PUT    /users(.:format)                                                  {:action=>"update", :controller=>"devise/registrations"}
#                user_registration DELETE /users(.:format)                                                  {:action=>"destroy", :controller=>"devise/registrations"}
#                    blog_comments GET    /blogs/:blog_id/comments(.:format)                                {:action=>"index", :controller=>"comments"}
#                    blog_comments POST   /blogs/:blog_id/comments(.:format)                                {:action=>"create", :controller=>"comments"}
#                 new_blog_comment GET    /blogs/:blog_id/comments/new(.:format)                            {:action=>"new", :controller=>"comments"}
#                edit_blog_comment GET    /blogs/:blog_id/comments/:id/edit(.:format)                       {:action=>"edit", :controller=>"comments"}
#                     blog_comment GET    /blogs/:blog_id/comments/:id(.:format)                            {:action=>"show", :controller=>"comments"}
#                     blog_comment PUT    /blogs/:blog_id/comments/:id(.:format)                            {:action=>"update", :controller=>"comments"}
#                     blog_comment DELETE /blogs/:blog_id/comments/:id(.:format)                            {:action=>"destroy", :controller=>"comments"}
#                        blog_tags GET    /blogs/:blog_id/tags(.:format)                                    {:action=>"index", :controller=>"tags"}
#                        blog_tags POST   /blogs/:blog_id/tags(.:format)                                    {:action=>"create", :controller=>"tags"}
#                     new_blog_tag GET    /blogs/:blog_id/tags/new(.:format)                                {:action=>"new", :controller=>"tags"}
#                    edit_blog_tag GET    /blogs/:blog_id/tags/:id/edit(.:format)                           {:action=>"edit", :controller=>"tags"}
#                         blog_tag GET    /blogs/:blog_id/tags/:id(.:format)                                {:action=>"show", :controller=>"tags"}
#                         blog_tag PUT    /blogs/:blog_id/tags/:id(.:format)                                {:action=>"update", :controller=>"tags"}
#                         blog_tag DELETE /blogs/:blog_id/tags/:id(.:format)                                {:action=>"destroy", :controller=>"tags"}
#                            blogs GET    /blogs(.:format)                                                  {:action=>"index", :controller=>"blogs"}
#                            blogs POST   /blogs(.:format)                                                  {:action=>"create", :controller=>"blogs"}
#                         new_blog GET    /blogs/new(.:format)                                              {:action=>"new", :controller=>"blogs"}
#                        edit_blog GET    /blogs/:id/edit(.:format)                                         {:action=>"edit", :controller=>"blogs"}
#                             blog GET    /blogs/:id(.:format)                                              {:action=>"show", :controller=>"blogs"}
#                             blog PUT    /blogs/:id(.:format)                                              {:action=>"update", :controller=>"blogs"}
#                             blog DELETE /blogs/:id(.:format)                                              {:action=>"destroy", :controller=>"blogs"}
#                   collect_course POST   /courses/:id/collect(.:format)                                    {:action=>"collect", :controller=>"courses"}
#                 uncollect_course POST   /courses/:id/uncollect(.:format)                                  {:action=>"uncollect", :controller=>"courses"}
#              study_course_course GET    /courses/:id/study_course(.:format)                               {:action=>"study_course", :controller=>"courses"}
#                          courses GET    /courses(.:format)                                                {:action=>"index", :controller=>"courses"}
#                          courses POST   /courses(.:format)                                                {:action=>"create", :controller=>"courses"}
#                       new_course GET    /courses/new(.:format)                                            {:action=>"new", :controller=>"courses"}
#                      edit_course GET    /courses/:id/edit(.:format)                                       {:action=>"edit", :controller=>"courses"}
#                           course GET    /courses/:id(.:format)                                            {:action=>"show", :controller=>"courses"}
#                           course PUT    /courses/:id(.:format)                                            {:action=>"update", :controller=>"courses"}
#                           course DELETE /courses/:id(.:format)                                            {:action=>"destroy", :controller=>"courses"}
#          forum_topic_forum_posts GET    /forums/:forum_id/topics/:topic_id/forum_posts(.:format)          {:action=>"index", :controller=>"forum_posts"}
#          forum_topic_forum_posts POST   /forums/:forum_id/topics/:topic_id/forum_posts(.:format)          {:action=>"create", :controller=>"forum_posts"}
#       new_forum_topic_forum_post GET    /forums/:forum_id/topics/:topic_id/forum_posts/new(.:format)      {:action=>"new", :controller=>"forum_posts"}
#      edit_forum_topic_forum_post GET    /forums/:forum_id/topics/:topic_id/forum_posts/:id/edit(.:format) {:action=>"edit", :controller=>"forum_posts"}
#           forum_topic_forum_post GET    /forums/:forum_id/topics/:topic_id/forum_posts/:id(.:format)      {:action=>"show", :controller=>"forum_posts"}
#           forum_topic_forum_post PUT    /forums/:forum_id/topics/:topic_id/forum_posts/:id(.:format)      {:action=>"update", :controller=>"forum_posts"}
#           forum_topic_forum_post DELETE /forums/:forum_id/topics/:topic_id/forum_posts/:id(.:format)      {:action=>"destroy", :controller=>"forum_posts"}
#                     forum_topics GET    /forums/:forum_id/topics(.:format)                                {:action=>"index", :controller=>"topics"}
#                     forum_topics POST   /forums/:forum_id/topics(.:format)                                {:action=>"create", :controller=>"topics"}
#                  new_forum_topic GET    /forums/:forum_id/topics/new(.:format)                            {:action=>"new", :controller=>"topics"}
#                 edit_forum_topic GET    /forums/:forum_id/topics/:id/edit(.:format)                       {:action=>"edit", :controller=>"topics"}
#                      forum_topic GET    /forums/:forum_id/topics/:id(.:format)                            {:action=>"show", :controller=>"topics"}
#                      forum_topic PUT    /forums/:forum_id/topics/:id(.:format)                            {:action=>"update", :controller=>"topics"}
#                      forum_topic DELETE /forums/:forum_id/topics/:id(.:format)                            {:action=>"destroy", :controller=>"topics"}
#                           forums GET    /forums(.:format)                                                 {:action=>"index", :controller=>"forums"}
#                           forums POST   /forums(.:format)                                                 {:action=>"create", :controller=>"forums"}
#                        new_forum GET    /forums/new(.:format)                                             {:action=>"new", :controller=>"forums"}
#                       edit_forum GET    /forums/:id/edit(.:format)                                        {:action=>"edit", :controller=>"forums"}
#                            forum GET    /forums/:id(.:format)                                             {:action=>"show", :controller=>"forums"}
#                            forum PUT    /forums/:id(.:format)                                             {:action=>"update", :controller=>"forums"}
#                            forum DELETE /forums/:id(.:format)                                             {:action=>"destroy", :controller=>"forums"}
#                    profile_index GET    /profile(.:format)                                                {:action=>"index", :controller=>"profile"}
#                    profile_index POST   /profile(.:format)                                                {:action=>"create", :controller=>"profile"}
#                      new_profile GET    /profile/new(.:format)                                            {:action=>"new", :controller=>"profile"}
#                     edit_profile GET    /profile/:id/edit(.:format)                                       {:action=>"edit", :controller=>"profile"}
#                          profile GET    /profile/:id(.:format)                                            {:action=>"show", :controller=>"profile"}
#                          profile PUT    /profile/:id(.:format)                                            {:action=>"update", :controller=>"profile"}
#                          profile DELETE /profile/:id(.:format)                                            {:action=>"destroy", :controller=>"profile"}
#                             root        /(.:format)                                                       {:controller=>"blogs", :action=>"index"}
#                 admin_data_index        /admin_data                                                       {:controller=>"admin_data/main", :action=>"all_models"}
# admin_data_migration_information        /admin_data/migration                                             {:controller=>"admin_data/migration", :action=>"index"}
#                admin_data_jstest        /admin_data/jstest                                                {:controller=>"admin_data/migration", :action=>"jstest"}
#                  admin_data_feed        /admin_data/feed/:klasss                                          {:controller=>"admin_data/feed", :action=>"index", :format=>:rss}
#                admin_data_search        /admin_data/quick_search/:klass                                   {:controller=>"admin_data/search", :action=>"quick_search"}
#        admin_data_advance_search        /admin_data/advance_search/:klass                                 {:controller=>"admin_data/search", :action=>"advance_search"}
#  table_structure_admin_data_on_k GET    /admin_data/klass/:klass/table_structure(.:format)                {:controller=>"admin_data/main", :action=>"table_structure"}
#            admin_data_on_k_index GET    /admin_data/klass(/:klass(.:format))                              {:controller=>"admin_data/main", :action=>"index"}
#                                  POST   /admin_data/klass(/:klass(.:format))                              {:controller=>"admin_data/main", :action=>"create"}
#              new_admin_data_on_k GET    /admin_data/klass/:klass/new(.:format)                            {:controller=>"admin_data/main", :action=>"new"}
#              del_admin_data_on_k DELETE /admin_data/klass/:klass/:id/del(.:format)                        {:controller=>"admin_data/main", :action=>"del"}
#             edit_admin_data_on_k GET    /admin_data/klass/:klass/:id/edit(.:format)                       {:controller=>"admin_data/main", :action=>"edit"}
#                  admin_data_on_k GET    /admin_data/klass/:klass/:id(.:format)                            {:controller=>"admin_data/main", :action=>"show"}
#                                  PUT    /admin_data/klass/:klass/:id(.:format)                            {:controller=>"admin_data/main", :action=>"update"}
#                                  DELETE /admin_data/klass/:klass/:id(.:format)                            {:controller=>"admin_data/main", :action=>"destroy"}
