class HardJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    # Do something later
    puts "Start task"
    Car.all.each(&:save)
    puts "Price update"
  end	
end
