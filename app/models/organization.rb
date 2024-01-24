
#represents users organization
#validates information and modifies the status to either approves or denies 
#if approved it allows you to log in if rejected you are not allowed to


class Organization < ApplicationRecord

  attr_accessor :agreement_one, :agreement_two, :agreement_three, :agreement_four, :agreement_five, :agreement_six, :agreement_seven, :agreement_eight

  enum status: [:approved, :submitted, :rejected, :locked]
  enum transportation: [:yes, :no, :maybe]

  after_initialize :set_default_status, :if => :new_record?

  has_many :users
  has_many :tickets
  has_and_belongs_to_many :resource_categories

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_presence_of :email, :name, :phone, :status, :primary_name, :secondary_name, :secondary_phone
  validates_length_of :email, minimum: 1, maximum: 255, on: :create
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates_uniqueness_of :email, case_sensitive: false
  validates_length_of :name, minimum: 1, maximum: 255, on: :create
  validates_uniqueness_of :name, case_sensitive: false
  validates_length_of :description, maximum: 1020, on: :create

  def approve
    self.status = :approved
  end

  def reject
    self.status = :rejected
  end

  def set_default_status
    self.status ||= :submitted
  end

  def to_s
    name
  end

end
