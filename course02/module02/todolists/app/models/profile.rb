class Profile < ActiveRecord::Base
  belongs_to :user

  validate :full_name
  validate :biological_gender
  validate :proper_names

  def self.get_all_profiles(min_year, max_year)
    Profile.where(['birth_year BETWEEN ? AND ?', min_year, max_year]).
      order('birth_year ASC')
  end

  def full_name
    if first_name == nil && last_name == nil
      errors.add(:first_name, 'cannot be nil if last_name is nil too')
      errors.add(:last_name, 'cannot be nil if first_name is nil too')
    end
  end

  def biological_gender
    unless ['female', 'male'].include? gender
      errors.add(:gender, 'must be either "female" or "male"')
    end
  end

  def proper_names
    if gender == 'male' && first_name == 'Sue'
      errors.add(:first_name, 'cannot be Sue if you are a boy')
    end
  end
end
