class filebeat (
  $installed      = true,
  $version,
  $download_dir   = '/srv/download',
  $config         = []
) inherits filebeat::params {

  include filebeat::install
  include filebeat::config
  include filebeat::service
}
