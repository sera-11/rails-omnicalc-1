#app/controllers/omnicalc_controller.rb
class OmnicalcController < ApplicationController

  def square_form
  
    render({:template => "omnicalc_templates/square_form"})
  end



end
