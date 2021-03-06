define filebeat::config::prospector (
  $paths,
  $fields_under_root          = true,
  $fields                     = [],
  $encoding                   = 'plain',
  $include_lines              = [],
  $exclude_lines              = [],
  $multiline                  = false,
  $multiline_pattern          = '',
  $multiline_pattern_negate   = true,
  $multiline_match            = 'after',
) {
    # TODO check multiline parameters if multiline=true
  include filebeat::params
  concat::fragment { "filebeat_prospector_${name}" :
    target  => $filebeat::params::config_file,
    content => template('filebeat/config_fragment/10_filebeat_prospector_entry.yml.erb'),
    order   => '10',
    require => Class['filebeat', 'filebeat::params'],
  }
}
