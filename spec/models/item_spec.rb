require 'rails_helper'

describe Item, type: :model do
  it { should have_valid(:title).when('Street Sharks') }
  it { should_not have_valid(:title).when(nil,'') }

  it { should have_valid(:description).when('Jawesome!') }
  it { should_not have_valid(:description).when(nil,'') }
end
