#app/controllers/omnicalc_controller.rb
class OmnicalcController < ApplicationController
  def square_form
    render({ :template => "omnicalc_templates/square_form" })
  end

  def square_result
    @num = params.fetch("number").to_f
    @results = @num * @num
    @results = @results.to_f

    render({ :template => "omnicalc_templates/square_result" })
  end

  def square_root_form
    render({ :template => "omnicalc_templates/square_root_form" })
  end

  def square_root_result
    @num = params.fetch("user_number").to_f
    @result = Math.sqrt(@num)
    @result = @result.to_f

    render({ :template => "omnicalc_templates/square_root_result" })
  end

  def payment_form
    render({ :template => "omnicalc_templates/payment_form" })
  end

  def payment_result
    @rate = params.fetch("user_apr").to_f
    @years = params.fetch("user_years").to_i
    @principal = params.fetch("user_pv").to_f

    @periods = @years * 12

    def calculate_monthly_payment(principal, rate, periods)
      monthly_rate = rate / 12.0 / 100.0 # Convert annual rate to monthly and percentage to decimal
      numerator = principal * monthly_rate
      denominator = 1 - (1 + monthly_rate) ** -periods
      monthly_payment = numerator / denominator
      monthly_payment.round(2) # rounding to two decimal places
    end

    @payment = calculate_monthly_payment(@principal, @rate, @periods)

    @formatted_apr = format("%.4f%%", @rate)
    @formatted_principal = format("$%.2f", @principal)
    @formatted_payment = format("$%.2f", @payment)

    render({ :template => "omnicalc_templates/payment_result" })
  end

  def random_form
    render({ :template => "omnicalc_templates/random_form" })
  end

  def random_results
    @min = params.fetch("user_min").to_f
    @max = params.fetch("user_max").to_f

    @random = rand(@min..@max)
    render({ :template => "omnicalc_templates/random_result" })
  end
end
