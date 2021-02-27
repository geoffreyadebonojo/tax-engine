class TaxableIncome
  attr_reader :brackets
  def initialize(brackets)
    # sort just in case our array is out of order
    @brackets = brackets.sort_by {|hsh| hsh[:limit]}.reverse!
  end

  def calculate_total_amount(taxed_income)
    # establish the existing amount of income and total taxes
    total_tax_amount = 0

    brackets.each do |bracket|
      amount_over_limit = taxed_income - bracket[:limit]

      if amount_over_limit > 0
        taxed_income -= amount_over_limit
        total_tax_amount += amount_over_limit * bracket[:percentage]
      else
        total_tax_amount += 0
      end

    end

    total_tax_amount.round(3)
  end
end