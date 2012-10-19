# desc "Synchronize avatar and logo images from remote production to local repo"

namespace :db do
  task :clone do
    STDERR.print "Getting production database... "
    reval = system("scp iebservices:/var/www/services/domosweb/db/domosaics_website.sqlite3 db/")
    STDERR.puts "done."
  end 
end
