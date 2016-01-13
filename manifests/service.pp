class filebeat::service {
  service { "filebeat" :
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Exec["install_filebeat_${filebeat::version}"],
  }
}
