class filebeat::params {
  # $download_file  = "logstash-${filebeat::version}-${::architecture}.deb"
#   $download_url   = "https://download.elastic.co/beats/filebeat/filebeat_${filebeat::version}_${::architecture}.deb"
  # Temporary use nightly builds to support multiline parsing
  $download_file    = "filebeat_${filebeat::version}_${::architecture}.deb"
  # 1.1.0-nightlylatest
  $download_url     = "https://beats-nightlies.s3.amazonaws.com/filebeat/${download_file}"

  $config_file      = '/etc/filebeat/filebeat.yml'
}
