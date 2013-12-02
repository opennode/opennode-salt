# -*- coding: utf-8; indent-tabs-mode: nil; tab-width: 2; -*-

os_packages:
  pkg.installed:
  - pkgs:
    - salt-master

/etc/logrotate.d/omsd:
  file.managed:
  - source: salt://oms/etc/logrotate.d/omsd

/etc/opennode/authorized_keys:
  file.managed:
  - replace: False
  - source: salt://oms/etc/opennode/authorized_keys

/etc/opennode/logging.conf:
  file.managed:
  - source: salt://oms/etc/opennode/logging.conf

/etc/opennode/oms.conf:
  file.managed:
  - source: salt://oms/etc/opennode/oms.conf

/opt/oms/oms_passwd:
  file.managed:
  - source: salt://oms/oms_passwd

/usr/lib/systemd/system/oms.service:
  file.managed:
  - source: salt://oms/systemd/oms.service

/var/log/opennode:
  file.directory

/opt/oms:
  virtualenv.managed:
  - system_site_packages: True

/opt/oms/db:
  file.directory

oms:
  service:
  - enable: True
