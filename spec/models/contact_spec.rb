require 'spec_helper'

describe Contact do

#let(:followed) { FactoryGirl.create(:user) }
#  let(:relationship) { follower.relationships.build(followed_id: followed.id) }

  let(:client) { FactoryGirl.create(:client) }
  let (:employee) {client.employees.build(name: "")}
  before do
    @
  end

  subject { contact }

  it { should respond_to(:client_id) }
  it { should respond_to(:contactcype_id) }
  it { should respond_to(:employee_id) }
  it { should respond_to(:value) }
  
  it { should be_valid }  

end
