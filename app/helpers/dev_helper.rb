module DevHelper
  def emvironmental_title
    if Rails.env == 'development'
      'Gamba (dev)'
    else
      'Gamba'
    end
  end
end
