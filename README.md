opennode-salt
=============

Saltstack magic for OpenNode artifacts

OMS installation
----------------

Prepare managed node:

	[remote]# yum install salt-minion
	[remote]# mkdir /srv/salt

Upload configuration:

	[local]~ scp -r oms <REMOTE_IP>:/srv/salt/

Run Salt:

	[remote]# salt-call --local state.sls oms

All done.
