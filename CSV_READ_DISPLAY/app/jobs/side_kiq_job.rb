class SideKiqJob < ApplicationJob
  queue_as :default
  require 'csv'
 
  def perform(*args)
    CSV.foreach(args[0], headers: true) do |row|
      Student.create! row.to_hash
    end
    
    
  end

end
