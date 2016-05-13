class filebeat::install {

  file { '/var/log/filebeat' :
    ensure  => directory,
  }

  if $filebeat::installed {
    # Download the archive
    wget::fetch { "download-filebeat-${filebeat::version}":
      source_url        => $filebeat::params::download_url,
      target_directory  => $filebeat::download_dir,
      target_file       => $filebeat::params::download_file,
      require           => File[$filebeat::download_dir],
    }

    case $::operatingsystem {
      /(Ubuntu|Debian)/ : {
        ensure_packages ( 'filebeat', {
          'provider'  => 'dpkg',
          'ensure'    => 'latest',
          'source'    => "${filebeat::download_dir}/$filebeat::params::download_file",
          'require'   => Wget::Fetch["download-filebeat-${filebeat::version}"],
        })
      }
      default           : {
        fail("The ${module_name} module is not supported on ${::operatingsystem}")
      }
    }
  }

}
