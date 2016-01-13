# exo-filebeat

A puppet module for managing [filebeat](https://www.elastic.co/guide/en/beats/filebeat/current/index.html)

## Requirements

* The [concat](https://forge.puppetlabs.com/puppetlabs/concat) Puppet library.

## Usage

Installation, make sure service is running and will be started at boot time:

     class { 'filebeat': }

Install a certain version:

     class { 'logstashforwarder':
       version => '1.0'
     }

## Configuration

### Prospectors

Declare a new prospector 

    filebeat::config::prospector { 'prospector' :
      paths                     => ["/var/log/file1", "/var/log/file2"],
      fields                    => [ "field1: value", "field2: value"], // optional
      multiline                 => true, // enable multiline parsing
      multiline_pattern         => "^[0-9]",
      multiline_pattern_negate  => true,
      multiline_match           => "after",
    }

### Output

Only logstash is supported in this version

    class { 'filebeat::config::output_logstash' :
      hosts           => ["server1:8889"],
      tls             => true,
      ca_authorities  => [ "/path/to/cafile" ],
      certificate     => "/path/to/certfile",
      certificate_key => "/path/to/certkey"
    }

# TODO
* Document classes
* Support more output
* Allow to configure filebeat section
* Allow to configure logging section

# License

Copyright (C) 2016 eXo Platform SAS.

This is free software; you can redistribute it and/or modify it
under the terms of the GNU Lesser General Public License as
published by the Free Software Foundation; either version 3 of
the License, or (at your option) any later version.

This software is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this software; if not, write to the Free
Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
02110-1301 USA, or see the FSF site: <http://www.fsf.org>.

# Contact

eXo platform - Software Factory Team 
mailto : <exo-swf@exoplatform.com>

# Support

Please log tickets and issues at our [Projects site](https://github.com/exo-puppet/exo-filebeat)
