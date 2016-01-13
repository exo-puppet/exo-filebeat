class filebeat::install {
#sudo dpkg -i filebeat_master_amd64.deb
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
        exec { "install_filebeat_${filebeat::version}" :
          command           => "dpkg -i ${filebeat::download_dir}/$filebeat::params::download_file",
          unless            => "test -d ${filebeat::params::install_dir}/logstash-${$filebeat::params::version}",
          refreshonly       => true,
          subscribe         => Exec["wget-download-filebeat-${filebeat::version}"]
        }
      }
      default           : {
        fail("The ${module_name} module is not supported on ${::operatingsystem}")
      }
    }
  }

  file { '/var/log/filebeat' :
    ensure  => directory,
  }
}
