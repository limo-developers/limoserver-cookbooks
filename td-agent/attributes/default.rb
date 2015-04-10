default["td_agent"]["api_key"] = ''

default["td_agent"]["plugins"] = [] # TODO can't use this..

default["td_agent"]["uid"] = nil
default["td_agent"]["gid"] = nil

default["td_agent"]["includes"] = false
default["td_agent"]["default_config"] = true
default["td_agent"]["in_http"]["enable_api"] = true
default["td_agent"]["version"] = '1.1.19'
default["td_agent"]["pinning_version"] = true
default["td_agent"]["in_forward"] = {
  port: 24224,
  bind: '0.0.0.0'
}
default["td_agent"]["in_http"] = {
  port: 8888,
  bind: '0.0.0.0'
}