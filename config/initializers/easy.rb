class ActiveRecord::Base
  def self.[](n)
    find_by(id: n)
  end
end
