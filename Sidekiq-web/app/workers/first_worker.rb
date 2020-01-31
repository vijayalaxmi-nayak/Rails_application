class FirstWorker
  include Sidekiq::Worker
  require 'csv'
  def perform(*args)
    # Do something
    print "---------------------\n"
    print "Im background worker\n"
    print "---------------------\n"
    CSV.foreach(args[0], headers: true) do |row|
      Student.create! row.to_hash
    end
  end
end
