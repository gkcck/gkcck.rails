class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :registerable, :recoverable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :rememberable, :trackable, :validatable
  include HasImage

  has_many :partners
  accepts_nested_attributes_for :partners

  before_save :check_access

  def to_s
    (name.blank? ? email : name).to_s
  end

  def admin?
    is_admin
  end

  def staff?
    in_staff
  end

  private

  def check_access
    self.in_staff = true if is_admin
  end
end