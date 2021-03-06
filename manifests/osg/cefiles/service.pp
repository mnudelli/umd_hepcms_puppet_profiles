
class profile::osg::cefiles::service {

 
  include osg::cacerts
  
  /*Service class for Compute Element
   services require to ensure they are enabled
   condor and condor-ce */
  
  
  service {'condor':
   ensure => 'running',
   enable => true,
   hasstatus => true,
   hasrestart => true,
  }
  
  service { 'condor-ce':
   ensure => 'running',
   enable => true,
   hasstatus => true,
   hasrestart => true,
  }
  service { 'httpd':
   ensure => 'running',
   enable => true,
   hasstatus => true,
   hasrestart => true,
  }
 service { 'condor-cron':
   ensure => 'running',
   enable => true,
   hasstatus => true,
   hasrestart => true,
  }
 service { 'rsv':
   ensure => 'running',
   enable => true,
   hasstatus => true,
   hasrestart => true,
  }

# insert something here to make sure puppet does not auto run..
  exec { 'kill-puppet':
   path => ['/bin', '/sbin/'],
   command => 'chkconfig puppet off',
   onlyif => 'chkconfig --list puppet | grep on',
  }

}
