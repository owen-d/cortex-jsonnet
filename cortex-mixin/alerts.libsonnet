{
  prometheusAlerts+::
    (import 'alerts/alerts.libsonnet') +

    (if std.member($._config.storage_engine, 'blocks')
     then
       (import 'alerts/blocks.libsonnet') +
       (import 'alerts/compactor.libsonnet')
     else {}) +

    { _config:: $._config },
}
