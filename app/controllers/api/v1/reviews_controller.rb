class Api::V1::ReviewsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index

  end
end
