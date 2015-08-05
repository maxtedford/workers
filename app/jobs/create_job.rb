class CreateJob
  @queue = :create
  
  def self.perform(seconds)
    sleep(seconds)
  end
end
