#app/controllers/omnicalc_controller.rb
class OmnicalcController < ApplicationController

  def square_form
  
    render({:template => "omnicalc_templates/square_form"})
  end

  def square_result
    @num = params.fetch("number").to_i
    @results = @num * @num
    @results = @results.to_f

    render({:template => "omnicalc_templates/square_result"})
  end

  def square_root_form
    render({:template => "omnicalc_templates/square_root_form"})

  end

  def square_root_result
    @num = params.fetch("user_number").to_i
    @result = Math.sqrt(@num)
    @result = @result.to_f

    render({:template => "omnicalc_templates/square_root_result"})
  end





end
