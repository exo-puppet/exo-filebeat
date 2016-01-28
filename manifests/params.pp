class filebeat::params {
  # $download_file  = "logstash-${filebeat::version}-${::architecture}.deb"
  $download_file    = "filebeat_${filebeat::version}_${::architecture}.deb"
  $download_url   = "https://download.elastic.co/beats/filebeat/${download_file}"

  $config_file      = '/etc/filebeat/filebeat.yml'
}
