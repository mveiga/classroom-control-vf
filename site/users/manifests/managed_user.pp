define users::managed_user  (
        $username = $title,
        $userhome = "/home/${title}",
        $groupname = $title,
        $sshdir = "${userhome}/.ssh",
      ){
        File {
             owner => $username,
             group => $groupname,
             }
        user { $username:
                ensure => present,
                home => $userhome,
                gid => $groupname,
              }
        group { $groupname :
                ensure => present,
              }
        file { $userhome: 
               ensure => directory,
               mode => 0755,
              }
         file { $sshdir: 
               ensure => directory,
               mode => 0700,
               require => File["$userhome"],
              }
               
        }
