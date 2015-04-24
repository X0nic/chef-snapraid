# SnapRAID cookbook [![GitHub license](https://img.shields.io/github/license/X0nic/chef-snapraid.svg)](https://github.com/X0nic/chef-snapraid/blob/master/LICENSE.md) [![Cookbook Version](http://img.shields.io/cookbook/v/snapraid.svg)](https://supermarket.chef.io/cookbooks/snapraid) [![Build Status](https://travis-ci.org/X0nic/chef-snapraid.svg)](https://travis-ci.org/X0nic/chef-snapraid)  
This cookbook provides a default recipe to install and configure SnapRAID.  
Uses [Chronial's snapraid-runner](https://github.com/Chronial/snapraid-runner) as an optional cronjob.

# Requirements
## Operating Systems
**Ubuntu:** 12.04, 14.04  
**CentOS:** 6.6, 7.0

## Misc
 * Network access to SourceForge
 * Network access to GitHub

## Packages
 * python
# Usage
Add the SnapRAID cookbook to your runlist, and set the `data_disks`, `parity_disks`, and `content_files` attributes in accordance with the desired SnapRAID configuration.   
See the [SnapRAID FAQ](http://snapraid.sourceforge.net/faq.html) for more details.

## Example

```
default_attributes(  
  'snapraid' => {  
    'data_disks'=> ['/media/disk1/','/media/disk2/'],  
    'parity_disks' => ['/media/disk3/'],  
    'content_files' => ['/media/disk1/', '/media/disk1/']  
  }  
)
```

# Attributes
#### snapraid::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Mandatory</th>
  </tr>
  <tr>
    <td><tt>['snapraid']['data_disks']</tt></td>
    <td>array</td>
    <td>list of disks mount paths on which protected data will be stored</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['snapraid']['parity_disks']</tt></td>
    <td>array</td>
    <td>list of disks mount paths on which SnapRAID parity data will be stored</td>
    <td><tt>true</tt></td>
  </tr>
   <tr>
    <td><tt>['snapraid']['content_files']</tt></td>
    <td>array</td>
    <td>list of file paths which will be specified as SnapRaid content files</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['snapraid']['block_size']</tt></td>
    <td>int</td>
    <td>kibibyte block size of SnapRAID parity</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['snapraid']['exclude_list']</tt></td>
    <td>array</td>
    <td>list of filepath patterns to exclude from SnapRAID parity generation</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['snapraid']['version']['number']</tt></td>
    <td>double</td>
    <td>SnapRAID version number</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['snapraid']['version']['url']</tt></td>
    <td>string</td>
    <td>url to SnapRAID tar.gz</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['snapraid']['version']['url']</tt></td>
    <td>string</td>
    <td>SHA-256 hash of SnapRAID tar.gz</td>
    <td><tt>false</tt></td>
  </tr>
</table>
#### snapraid::scheduler
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Mandatory</th>
  </tr>
  <tr>
    <td><tt>['snapraid']['scheduler']['script_url']</tt></td>
    <td>string</td>
    <td>url to snapraid_runner</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['snapraid']['scheduler']['script_directory']</tt></td>
    <td>string</td>
    <td>directory in which to place snapraid_runner.py</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['snapraid']['scheduler']['config_file']</tt></td>
    <td>string</td>
    <td>filepath to snapraid_runner.conf</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['snapraid']['scheduler']['execution_hour']</tt></td>
    <td>string</td>
    <td>hour of the day to execute snapraid_runner (cron)</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['snapraid']['scheduler']['execution_minute']</tt></td>
    <td>string</td>
    <td>minute of the day to execute snapraid_runner (cron)</td>
    <td><tt>true</tt></td>
  </tr>
    <tr>
    <td><tt>['snapraid']['scheduler']['scrub_after_sync']</tt></td>
    <td>boolean</td>
    <td>whether snapraid_runner will run scrub after each sync (recommended)</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['snapraid']['scheduler']['scrub_percentage']</tt></td>
    <td>int</td>
    <td>percentage of the protected data for snapraid_runner to scrub</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['snapraid']['scheduler']['scrub_older_than']</tt></td>
    <td>int</td>
    <td>files older than *x* days will be scrubbed</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['snapraid']['scheduler']['deletion_abort_threshold']</tt></td>
    <td>int</td>
    <td>abort scheduled operation if there are more deletes than this, set to -1 to disable</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['snapraid']['scheduler']['email_from']</tt></td>
    <td>string</td>
    <td>email address snapraid_runner will impersonate when sending status emails</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['snapraid']['scheduler']['email_to']</tt></td>
    <td>string</td>
    <td>email address snapraid_runner will notify when sending status emails</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['snapraid']['scheduler']['smtp_host']</tt></td>
    <td>string</td>
    <td>smtp host snapraid_runner will use</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['snapraid']['scheduler']['smtp_port']</tt></td>
    <td>string</td>
    <td>smtp port snapraid_runner will use</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['snapraid']['scheduler']['smtp_ssl']</tt></td>
    <td>boolean</td>
    <td>whether snapraid_runner will use ssl for emails</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['snapraid']['scheduler']['smtp_user']</tt></td>
    <td>string</td>
    <td>optional username for snapraid_runner to login to smtp server</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['snapraid']['scheduler']['smtp_password']</tt></td>
    <td>string</td>
    <td>optional password for snapraid_runner to login to smtp server</td>
    <td><tt>false</tt></td>
  </tr>
</table>

# Recipes
## default 
Used to install and configure SnapRAID.
## scheduler
Used to install and configure [Chronial's snapraid-runner](https://github.com/Chronial/snapraid-runner) as a cronjob.

# Authors

Author:: Nathan Lee (<nathan@globalphobia.com>)  
Author:: Sam Martin (<samjackmartin@gmail.com>)