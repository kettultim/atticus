module RequiresDisclaimer
  def disclaimer
    @disclaimer == '1'
  end

  def self.extended(base)
    base.instance_eval do
      class << self
        attr_writer :disclaimer
        validates_presence_of :disclaimer
      end
    end
  end
end
