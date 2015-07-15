module RequiresDisclaimer
  attr_accessor :disclaimer

  def disclaimer
    ["1", true].include? @disclaimer
  end

  def self.extended(base)
    base.instance_eval do
      class << self
        validates_presence_of :disclaimer
      end
    end
  end
end
