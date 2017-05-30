class filebeat::install {

  assert_private()

  file { '/var/log/filebeat' :
    ensure  => directory,
  }

  $download_file  = "filebeat_${filebeat::version}_${::architecture}.deb"
  $download_url   = "https://download.elastic.co/beats/filebeat/${download_file}"

  if $filebeat::installed {
    # Download the archive
    wget::fetch { "download-filebeat-${filebeat::version}":
      source_url        => $download_url,
      target_directory  => $filebeat::download_dir,
      target_file       => $download_file,
      require           => File[$filebeat::download_dir],
    }

    case $::operatingsystem {
      /(Ubuntu|Debian)/ : {
        ensure_packages ( 'filebeat', {
          'provider'  => 'dpkg',
          'ensure'    => 'latest',
          'source'    => "${filebeat::download_dir}/$download_file",
          'require'   => Wget::Fetch["download-filebeat-${filebeat::version}"],
        })
      }
      default           : {
        fail("The ${module_name} module is not supported on ${::operatingsystem}")
      }
    }
  }

}
