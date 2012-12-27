# Load the rails application
require File.expand_path('../application', __FILE__)

# GLOBAL VARS
TEAM_EMAIL  = "domosaics@uni-muenster.de"
DOWNLOAD_LOC  = "/var/www/services/domosaics/download"
CURRENT_JAR   = "domosaics-rv179.jar" 
REVISION = "179"

BINARIES = {
  'Windows' => 'domosaics_win.exe', 
  'Linux' => 'domosaics_linux.sh', 
  'iOS' => 'domosaics_ios', 
  'unknown' => 'domosaics-rv179.jar'
}

# Initialize the rails application
Domosaics::Application.initialize!

