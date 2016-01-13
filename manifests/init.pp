class filebeat (
  $installed      = true,
  $version,
  $download_dir   = '/srv/download',
  $config         = []
  ) {
  include params
  include install
  include service
  include config
}
