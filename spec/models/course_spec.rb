require 'spec_helper'

describe Course do
  before { @course = FactoryGirl.build(:course) }
  subject { @course }
  
  it { should be_valid }
  
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:duration) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:code) }
  it { should validate_presence_of(:discipline) }
  it { should validate_presence_of(:level) }
  it { should validate_presence_of(:teacher) }
  
  it { should validate_presence_of(:index) }
  it { should validate_numericality_of(:index).only_integer }
  it { should validate_uniqueness_of(:index).scoped_to(:discipline_id) }
  
  it { should belong_to(:discipline) }
  it { should belong_to(:level) }
  it { should have_many(:lessons) }
  it { should belong_to(:teacher) }
end
