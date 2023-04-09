class TestsController < ApplicationController
  def index
    render html: Test.all
  end
end
