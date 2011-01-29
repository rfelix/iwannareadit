class Author < ActiveRecord::Base
  has_and_belongs_to_many :books

  validates_presence_of :first_name, :last_name

  def full_name
    [first_name, middle_name, last_name].join(' ').strip
  end

  def full_name=(full_name)
    components       = full_name.strip.split(' ')
    self.first_name  = components.shift
    self.last_name   = components.pop
    self.middle_name = components.join(' ')
  end
end
