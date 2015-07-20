class InboundsController < ApplicationController
  def index
    @body = params[:Body]
    @from_number = params[:From]
    render 'index.xml.erb', content_type: 'text/xml'
  end

end
