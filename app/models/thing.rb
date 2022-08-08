class Thing
  include ActiveModel::Model

  attr_accessor :id, :name, :year

  def name_with_year
    string = name

    string << " (#{year})" if year.present?

    string
  end
end
