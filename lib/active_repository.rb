module ActiveRepository
  def self.Provide(adapter)
    Builder.new(adapter)
  end
end
