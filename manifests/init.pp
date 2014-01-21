# == Class: role_foreman_proxy
#
#
class role_foreman_proxy (
  $dhcp                         = true,
  $dhcp_gateway                 = '10.61.0.1',
  $dhcp_interface               = 'eth0',
  $dhcp_managed                 = true,
  $dns                          = true,
  $dns_reverse                  = '61.10.in-addr-arpa',
  $dns_server                   = 'localhost',
  $foreman_base_url             = 'https://foreman.naturalis.nl',
  $oauth_consumer_key,
  $oauth_consumer_secret,
  $puppetca                     = false,
  $ssldir                       = '/var/lib/puppet/ssl',
  $ssl_ca                       = '/var/lib/puppet/ssl/certs/ca.pem',
){
  class { "foreman_proxy":
    dhcp                       => $dhcp,
    dhcp_gateway               => $dhcp_gateway,
    dhcp_interface             => $dhcp_interface,
    dhcp_managed               => $dhcp_managed,
    dns                        => $dns,
    dns_reverse                => $dns_reverse,
    dns_server                 => $dns_server,
    foreman_base_url           => $foreman_base_url,
    oauth_consumer_key         => $oauth_consumer_key,
    oauth_consumer_secret      => $oauth_consumer_secret,
    puppetca                   => $puppetca,
    ssldir                     => $ssldir,
    ssl_ca                     => $ssl_ca,
    register_in_foreman        => false,
    ssl_cert                   => "${ssldir}/certs/${fqdn}.pem",
    ssl_key                    => "${ssldir}/private_keys/${fqdn}.pem",
  }
}