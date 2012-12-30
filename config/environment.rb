# Load the rails application
require File.expand_path('../application', __FILE__)

# GLOBAL VARS
TEAM_EMAIL  = "domosaics@uni-muenster.de"
DOWNLOAD_LOC  = "/var/www/services/domosaics/download"
CURRENT_JAR   = "domosaics.jar" 
REVISION = "179"

BINARIES = {
  'Windows' => 'domosaics_win.exe', 
  'Linux' => 'domosaics_linux.sh', 
  'iOS' => 'domosaics.jar', 
  'unknown' => 'domosaics.jar'
}

# Initialize the rails application
Domosaics::Application.initialize!

