require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: profiles
#
#  id                  :integer         not null, primary key
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  name                :string(255)
#  address             :string(255)
#  mobile              :string(255)
#  home_phone          :string(255)
#  age                 :integer
#  sex                 :boolean         default(FALSE)
#  created_at          :datetime
#  updated_at          :datetime
#  user_id             :integer
#  english_name        :string(255)
#  birthday            :date
#  star                :string(255)
#  home_province       :string(255)
#  home_city           :string(255)
#  english_level       :string(255)
#  msn                 :string(255)
#  qq                  :string(255)
#  gmail               :string(255)
#  blog                :string(255)
#  homepage            :string(255)
#  company             :string(255)
#  company_description :text
#  company_province    :string(255)
#  company_city        :string(255)
#  education_level     :string(255)
#  school_name         :string(255)
#  income_year         :integer
#  interest            :text
#  loved_music         :text
#  loved_movie         :text
#  loved_game          :text
#  loved_sport         :text
#  loved_person        :text
#  self_description    :text
#

