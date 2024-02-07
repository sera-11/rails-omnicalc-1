#app/controllers/omnicalc_controller.rb
class OmnicalcController < ApplicationController

  def square_form
  
    render({:template => "omnicalc_templates/square_form"})
  end

  def square_result
    @num = params.fetch("number").to_i
    @results = @num * @num
    @results = @results.to_f

    render({:template => "omnicalc_templates/square_results"})
  end





end
