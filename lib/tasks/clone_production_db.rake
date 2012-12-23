namespace :dbops do
  # desc "clones the production database into the local development"
  task :clone do
    STDERR.print "Getting production database... "
    reval = system("scp iebservices:/var/www/services/domosweb/db/domosaics_website.sqlite3 db/")
    STDERR.puts "done."
  end 
end
