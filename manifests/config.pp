class filebeat::config inherits filebeat::params {
  assert_private()

  file { '/etc/filebeat':
    ensure => directory,
  }
  concat { "${filebeat::params::config_file}" :
    notify          => Service["filebeat"],
    require         => File['/etc/filebeat/']
  }
  concat::fragment{ 'filebeat_header':
    target          => "${filebeat::params::config_file}",
    source          => "puppet:///modules/filebeat/config_fragment/00_filebeat.yml",
    order           => '00'
  }
  concat::fragment { 'filebeat_prospector' :
    target          => "${filebeat::params::config_file}",
    source          => "puppet:///modules/filebeat/config_fragment/05_filebeat_prospectors.yml",
    order           => '05'
  }
  concat::fragment { 'filebeat_output' :
    target          => "${filebeat::params::config_file}",
    source          => "puppet:///modules/filebeat/config_fragment/15_output.yml",
    order           => '15'
  }
  concat::fragment { 'filebeat_shipper' :
    target          => "${filebeat::params::config_file}",
    source          => "puppet:///modules/filebeat/config_fragment/25_shipper.yml",
    order           => '25'
  }
  concat::fragment { 'filebeat_logging' :
    target          => "${filebeat::params::config_file}",
    content         => template("filebeat/config_fragment/35_logging.yml.erb"),
    order           => '35'
  }
}
