MEET::Application.routes.draw do
  devise_for :users

  resources :people

  resources	:comments

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

      get "show_college_edution"
      get "show_hot_topic_course"
      get "show_test_prep"
      get "show_us_school_application"
      get "show_job_seeking"
      get "show_conversational_communications"
      get "show_k12_education"
      get "show_online_practice_and_games"
      get "show_watch_and_listen"
    end
  end

  match "/course/category/:id"  => "courses#list"
  match "/course/show_school/:id" =>  "courses#show_school"
  match "/course/show_subject/:id"  =>  "courses#show_subject"

  resources :forums do
    resources :topics
  end

  resources :topics do
    resources :forum_posts
  end

  resources :friendships  do
    post "accept"
  end
  resources	:profile

  namespace :admin  do
    resources :course_categories
    resources :forums
    resources :roles
    resources :schools
    resources :subjects
    resources :users
    resources :courses  do
      resources :lectures
      resources	:comments
    end
    resources :friendships
  end
  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "courses#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
#== Route Map
# Generated on 21 Oct 2010 23:18
#
#                   new_user_session GET    /users/sign_in(.:format)                         {:action=>"new", :controller=>"devise/sessions"}
#                       user_session POST   /users/sign_in(.:format)                         {:action=>"create", :controller=>"devise/sessions"}
#               destroy_user_session GET    /users/sign_out(.:format)                        {:action=>"destroy", :controller=>"devise/sessions"}
#                  user_registration POST   /users(.:format)                                 {:action=>"create", :controller=>"devise/registrations"}
#              new_user_registration GET    /users/sign_up(.:format)                         {:action=>"new", :controller=>"devise/registrations"}
#             edit_user_registration GET    /users/edit(.:format)                            {:action=>"edit", :controller=>"devise/registrations"}
#                  user_registration PUT    /users(.:format)                                 {:action=>"update", :controller=>"devise/registrations"}
#                  user_registration DELETE /users(.:format)                                 {:action=>"destroy", :controller=>"devise/registrations"}
#                             people GET    /people(.:format)                                {:action=>"index", :controller=>"people"}
#                             people POST   /people(.:format)                                {:action=>"create", :controller=>"people"}
#                         new_person GET    /people/new(.:format)                            {:action=>"new", :controller=>"people"}
#                        edit_person GET    /people/:id/edit(.:format)                       {:action=>"edit", :controller=>"people"}
#                             person GET    /people/:id(.:format)                            {:action=>"show", :controller=>"people"}
#                             person PUT    /people/:id(.:format)                            {:action=>"update", :controller=>"people"}
#                             person DELETE /people/:id(.:format)                            {:action=>"destroy", :controller=>"people"}
#                      blog_comments GET    /blogs/:blog_id/comments(.:format)               {:action=>"index", :controller=>"comments"}
#                      blog_comments POST   /blogs/:blog_id/comments(.:format)               {:action=>"create", :controller=>"comments"}
#                   new_blog_comment GET    /blogs/:blog_id/comments/new(.:format)           {:action=>"new", :controller=>"comments"}
#                  edit_blog_comment GET    /blogs/:blog_id/comments/:id/edit(.:format)      {:action=>"edit", :controller=>"comments"}
#                       blog_comment GET    /blogs/:blog_id/comments/:id(.:format)           {:action=>"show", :controller=>"comments"}
#                       blog_comment PUT    /blogs/:blog_id/comments/:id(.:format)           {:action=>"update", :controller=>"comments"}
#                       blog_comment DELETE /blogs/:blog_id/comments/:id(.:format)           {:action=>"destroy", :controller=>"comments"}
#                          blog_tags GET    /blogs/:blog_id/tags(.:format)                   {:action=>"index", :controller=>"tags"}
#                          blog_tags POST   /blogs/:blog_id/tags(.:format)                   {:action=>"create", :controller=>"tags"}
#                       new_blog_tag GET    /blogs/:blog_id/tags/new(.:format)               {:action=>"new", :controller=>"tags"}
#                      edit_blog_tag GET    /blogs/:blog_id/tags/:id/edit(.:format)          {:action=>"edit", :controller=>"tags"}
#                           blog_tag GET    /blogs/:blog_id/tags/:id(.:format)               {:action=>"show", :controller=>"tags"}
#                           blog_tag PUT    /blogs/:blog_id/tags/:id(.:format)               {:action=>"update", :controller=>"tags"}
#                           blog_tag DELETE /blogs/:blog_id/tags/:id(.:format)               {:action=>"destroy", :controller=>"tags"}
#                              blogs GET    /blogs(.:format)                                 {:action=>"index", :controller=>"blogs"}
#                              blogs POST   /blogs(.:format)                                 {:action=>"create", :controller=>"blogs"}
#                           new_blog GET    /blogs/new(.:format)                             {:action=>"new", :controller=>"blogs"}
#                          edit_blog GET    /blogs/:id/edit(.:format)                        {:action=>"edit", :controller=>"blogs"}
#                               blog GET    /blogs/:id(.:format)                             {:action=>"show", :controller=>"blogs"}
#                               blog PUT    /blogs/:id(.:format)                             {:action=>"update", :controller=>"blogs"}
#                               blog DELETE /blogs/:id(.:format)                             {:action=>"destroy", :controller=>"blogs"}
#                     collect_course POST   /courses/:id/collect(.:format)                   {:action=>"collect", :controller=>"courses"}
#                   uncollect_course POST   /courses/:id/uncollect(.:format)                 {:action=>"uncollect", :controller=>"courses"}
#                study_course_course GET    /courses/:id/study_course(.:format)              {:action=>"study_course", :controller=>"courses"}
#                            courses GET    /courses(.:format)                               {:action=>"index", :controller=>"courses"}
#                            courses POST   /courses(.:format)                               {:action=>"create", :controller=>"courses"}
#                         new_course GET    /courses/new(.:format)                           {:action=>"new", :controller=>"courses"}
#                        edit_course GET    /courses/:id/edit(.:format)                      {:action=>"edit", :controller=>"courses"}
#                             course GET    /courses/:id(.:format)                           {:action=>"show", :controller=>"courses"}
#                             course PUT    /courses/:id(.:format)                           {:action=>"update", :controller=>"courses"}
#                             course DELETE /courses/:id(.:format)                           {:action=>"destroy", :controller=>"courses"}
#                                           /course/category/:id(.:format)                   {:controller=>"courses", :action=>"list"}
#                                           /course/show_school/:id(.:format)                {:controller=>"courses", :action=>"show_school"}
#                                           /course/show_subject/:id(.:format)               {:controller=>"courses", :action=>"show_subject"}
#                       forum_topics GET    /forums/:forum_id/topics(.:format)               {:action=>"index", :controller=>"topics"}
#                       forum_topics POST   /forums/:forum_id/topics(.:format)               {:action=>"create", :controller=>"topics"}
#                    new_forum_topic GET    /forums/:forum_id/topics/new(.:format)           {:action=>"new", :controller=>"topics"}
#                   edit_forum_topic GET    /forums/:forum_id/topics/:id/edit(.:format)      {:action=>"edit", :controller=>"topics"}
#                        forum_topic GET    /forums/:forum_id/topics/:id(.:format)           {:action=>"show", :controller=>"topics"}
#                        forum_topic PUT    /forums/:forum_id/topics/:id(.:format)           {:action=>"update", :controller=>"topics"}
#                        forum_topic DELETE /forums/:forum_id/topics/:id(.:format)           {:action=>"destroy", :controller=>"topics"}
#                             forums GET    /forums(.:format)                                {:action=>"index", :controller=>"forums"}
#                             forums POST   /forums(.:format)                                {:action=>"create", :controller=>"forums"}
#                          new_forum GET    /forums/new(.:format)                            {:action=>"new", :controller=>"forums"}
#                         edit_forum GET    /forums/:id/edit(.:format)                       {:action=>"edit", :controller=>"forums"}
#                              forum GET    /forums/:id(.:format)                            {:action=>"show", :controller=>"forums"}
#                              forum PUT    /forums/:id(.:format)                            {:action=>"update", :controller=>"forums"}
#                              forum DELETE /forums/:id(.:format)                            {:action=>"destroy", :controller=>"forums"}
#                  topic_forum_posts GET    /topics/:topic_id/forum_posts(.:format)          {:action=>"index", :controller=>"forum_posts"}
#                  topic_forum_posts POST   /topics/:topic_id/forum_posts(.:format)          {:action=>"create", :controller=>"forum_posts"}
#               new_topic_forum_post GET    /topics/:topic_id/forum_posts/new(.:format)      {:action=>"new", :controller=>"forum_posts"}
#              edit_topic_forum_post GET    /topics/:topic_id/forum_posts/:id/edit(.:format) {:action=>"edit", :controller=>"forum_posts"}
#                   topic_forum_post GET    /topics/:topic_id/forum_posts/:id(.:format)      {:action=>"show", :controller=>"forum_posts"}
#                   topic_forum_post PUT    /topics/:topic_id/forum_posts/:id(.:format)      {:action=>"update", :controller=>"forum_posts"}
#                   topic_forum_post DELETE /topics/:topic_id/forum_posts/:id(.:format)      {:action=>"destroy", :controller=>"forum_posts"}
#                             topics GET    /topics(.:format)                                {:action=>"index", :controller=>"topics"}
#                             topics POST   /topics(.:format)                                {:action=>"create", :controller=>"topics"}
#                          new_topic GET    /topics/new(.:format)                            {:action=>"new", :controller=>"topics"}
#                         edit_topic GET    /topics/:id/edit(.:format)                       {:action=>"edit", :controller=>"topics"}
#                              topic GET    /topics/:id(.:format)                            {:action=>"show", :controller=>"topics"}
#                              topic PUT    /topics/:id(.:format)                            {:action=>"update", :controller=>"topics"}
#                              topic DELETE /topics/:id(.:format)                            {:action=>"destroy", :controller=>"topics"}
#                        friendships GET    /friendships(.:format)                           {:action=>"index", :controller=>"friendships"}
#                        friendships POST   /friendships(.:format)                           {:action=>"create", :controller=>"friendships"}
#                     new_friendship GET    /friendships/new(.:format)                       {:action=>"new", :controller=>"friendships"}
#                    edit_friendship GET    /friendships/:id/edit(.:format)                  {:action=>"edit", :controller=>"friendships"}
#                         friendship GET    /friendships/:id(.:format)                       {:action=>"show", :controller=>"friendships"}
#                         friendship PUT    /friendships/:id(.:format)                       {:action=>"update", :controller=>"friendships"}
#                         friendship DELETE /friendships/:id(.:format)                       {:action=>"destroy", :controller=>"friendships"}
#                      profile_index GET    /profile(.:format)                               {:action=>"index", :controller=>"profile"}
#                      profile_index POST   /profile(.:format)                               {:action=>"create", :controller=>"profile"}
#                        new_profile GET    /profile/new(.:format)                           {:action=>"new", :controller=>"profile"}
#                       edit_profile GET    /profile/:id/edit(.:format)                      {:action=>"edit", :controller=>"profile"}
#                            profile GET    /profile/:id(.:format)                           {:action=>"show", :controller=>"profile"}
#                            profile PUT    /profile/:id(.:format)                           {:action=>"update", :controller=>"profile"}
#                            profile DELETE /profile/:id(.:format)                           {:action=>"destroy", :controller=>"profile"}
#            admin_course_categories GET    /admin/course_categories(.:format)               {:action=>"index", :controller=>"admin/course_categories"}
#            admin_course_categories POST   /admin/course_categories(.:format)               {:action=>"create", :controller=>"admin/course_categories"}
#          new_admin_course_category GET    /admin/course_categories/new(.:format)           {:action=>"new", :controller=>"admin/course_categories"}
#         edit_admin_course_category GET    /admin/course_categories/:id/edit(.:format)      {:action=>"edit", :controller=>"admin/course_categories"}
#              admin_course_category GET    /admin/course_categories/:id(.:format)           {:action=>"show", :controller=>"admin/course_categories"}
#              admin_course_category PUT    /admin/course_categories/:id(.:format)           {:action=>"update", :controller=>"admin/course_categories"}
#              admin_course_category DELETE /admin/course_categories/:id(.:format)           {:action=>"destroy", :controller=>"admin/course_categories"}
#                       admin_forums GET    /admin/forums(.:format)                          {:action=>"index", :controller=>"admin/forums"}
#                       admin_forums POST   /admin/forums(.:format)                          {:action=>"create", :controller=>"admin/forums"}
#                    new_admin_forum GET    /admin/forums/new(.:format)                      {:action=>"new", :controller=>"admin/forums"}
#                   edit_admin_forum GET    /admin/forums/:id/edit(.:format)                 {:action=>"edit", :controller=>"admin/forums"}
#                        admin_forum GET    /admin/forums/:id(.:format)                      {:action=>"show", :controller=>"admin/forums"}
#                        admin_forum PUT    /admin/forums/:id(.:format)                      {:action=>"update", :controller=>"admin/forums"}
#                        admin_forum DELETE /admin/forums/:id(.:format)                      {:action=>"destroy", :controller=>"admin/forums"}
#                        admin_roles GET    /admin/roles(.:format)                           {:action=>"index", :controller=>"admin/roles"}
#                        admin_roles POST   /admin/roles(.:format)                           {:action=>"create", :controller=>"admin/roles"}
#                     new_admin_role GET    /admin/roles/new(.:format)                       {:action=>"new", :controller=>"admin/roles"}
#                    edit_admin_role GET    /admin/roles/:id/edit(.:format)                  {:action=>"edit", :controller=>"admin/roles"}
#                         admin_role GET    /admin/roles/:id(.:format)                       {:action=>"show", :controller=>"admin/roles"}
#                         admin_role PUT    /admin/roles/:id(.:format)                       {:action=>"update", :controller=>"admin/roles"}
#                         admin_role DELETE /admin/roles/:id(.:format)                       {:action=>"destroy", :controller=>"admin/roles"}
#                      admin_schools GET    /admin/schools(.:format)                         {:action=>"index", :controller=>"admin/schools"}
#                      admin_schools POST   /admin/schools(.:format)                         {:action=>"create", :controller=>"admin/schools"}
#                   new_admin_school GET    /admin/schools/new(.:format)                     {:action=>"new", :controller=>"admin/schools"}
#                  edit_admin_school GET    /admin/schools/:id/edit(.:format)                {:action=>"edit", :controller=>"admin/schools"}
#                       admin_school GET    /admin/schools/:id(.:format)                     {:action=>"show", :controller=>"admin/schools"}
#                       admin_school PUT    /admin/schools/:id(.:format)                     {:action=>"update", :controller=>"admin/schools"}
#                       admin_school DELETE /admin/schools/:id(.:format)                     {:action=>"destroy", :controller=>"admin/schools"}
#                     admin_subjects GET    /admin/subjects(.:format)                        {:action=>"index", :controller=>"admin/subjects"}
#                     admin_subjects POST   /admin/subjects(.:format)                        {:action=>"create", :controller=>"admin/subjects"}
#                  new_admin_subject GET    /admin/subjects/new(.:format)                    {:action=>"new", :controller=>"admin/subjects"}
#                 edit_admin_subject GET    /admin/subjects/:id/edit(.:format)               {:action=>"edit", :controller=>"admin/subjects"}
#                      admin_subject GET    /admin/subjects/:id(.:format)                    {:action=>"show", :controller=>"admin/subjects"}
#                      admin_subject PUT    /admin/subjects/:id(.:format)                    {:action=>"update", :controller=>"admin/subjects"}
#                      admin_subject DELETE /admin/subjects/:id(.:format)                    {:action=>"destroy", :controller=>"admin/subjects"}
#                        admin_users GET    /admin/users(.:format)                           {:action=>"index", :controller=>"admin/users"}
#                        admin_users POST   /admin/users(.:format)                           {:action=>"create", :controller=>"admin/users"}
#                     new_admin_user GET    /admin/users/new(.:format)                       {:action=>"new", :controller=>"admin/users"}
#                    edit_admin_user GET    /admin/users/:id/edit(.:format)                  {:action=>"edit", :controller=>"admin/users"}
#                         admin_user GET    /admin/users/:id(.:format)                       {:action=>"show", :controller=>"admin/users"}
#                         admin_user PUT    /admin/users/:id(.:format)                       {:action=>"update", :controller=>"admin/users"}
#                         admin_user DELETE /admin/users/:id(.:format)                       {:action=>"destroy", :controller=>"admin/users"}
#                               root        /(.:format)                                      {:controller=>"courses", :action=>"index"}
#          graph_authorization_rules GET    /authorization_rules/graph(.:format)             {:controller=>"authorization_rules", :action=>"graph"}
#         change_authorization_rules GET    /authorization_rules/change(.:format)            {:controller=>"authorization_rules", :action=>"change"}
# suggest_change_authorization_rules GET    /authorization_rules/suggest_change(.:format)    {:controller=>"authorization_rules", :action=>"suggest_change"}
#                authorization_rules GET    /authorization_rules(.:format)                   {:controller=>"authorization_rules", :action=>"index"}
#               authorization_usages GET    /authorization_usages(.:format)                  {:controller=>"authorization_usages", :action=>"index"}
