class TextsController < ApplicationController

  def index
    @texts = Text.all
  end

  def new
    @text = Text.new
  end

  def create

  end

end
