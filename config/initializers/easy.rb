class ActiveRecord::Base
  def self.[](n)
    find_by(id: n)
  end

  def self.top
      self.all.sort_by! { |x| x.calls.count }.reverse!.slice(0,5)
  end

  def self.top_fouled
    self.all.sort_by! { |x| x.fouls.count }.reverse!.slice(0,5)
  end

  def self.top_fouls
    self.all.sort_by! { |x| x.fouled.count }.reverse!.slice(0,5)
  end
end
