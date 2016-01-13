class filebeat::config::output_logstash (
  $hosts,
  $workers          = 1,
  $tls              = false,
  $ca_authorities   = [ ],
  $certificate      = '',
  $certificate_key  = '',
  $insecure         = false,
){
  # TODO check ssl parameters if tls=true

  concat::fragment { 'filebeat_output_logtsash' :
    target    => "${filebeat::params::config_file}",
    content   => template("filebeat/config_fragment/20_output_logstash.yml.erb"),
    order     => '20'
  }
}
