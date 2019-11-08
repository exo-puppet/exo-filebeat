class filebeat::service {
  service { 'filebeat' :
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => [Package['filebeat'],Class['filebeat::config'],Class['filebeat::install']],
  }
}

