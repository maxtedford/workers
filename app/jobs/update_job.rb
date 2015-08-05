class UpdateJob
  @queue = :update

  def self.perform(seconds)
    sleep(seconds)
  end
end
