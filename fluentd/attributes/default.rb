default["fluentd"]["uid"] = nil
default["fluentd"]["gid"] = nil

default["fluentd"]["includes"] = false
default["fluentd"]["default_config"] = true
default["fluentd"]["in_http"]["enable_api"] = false
# default["fluentd"]["version"] = '1.1.19'
default["fluentd"]["pinning_version"] = false
default["fluentd"]["in_forward"] = {
  port: 24224,
  bind: '0.0.0.0'
}
default["fluentd"]["in_http"] = {
  port: 8888,
  bind: '0.0.0.0'
}
