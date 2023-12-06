class GenerateDataJob < ApplicationJob
  queue_as :default

  def perform(team_id)
    counter = 0

    loop do
      counter += 1
      Car.create(:name => "Test car #{Random.rand(777777)}", :team_id => team_id )
    
      sleep(Random.rand(5)) 
      
      break if counter >= 10
    end
  end
end
