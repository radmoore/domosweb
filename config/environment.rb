# Load the rails application
require File.expand_path('../application', __FILE__)

# GLOBAL VARS
TEAM_EMAIL  = "domosaics@uni-muenster.de"
DOWNLOAD_LOC  = "/var/www/services/angstd/download"
CURRENT_JAR   = "Jangstd-rv175.jar" 

# Initialize the rails application
Domosaics::Application.initialize!

