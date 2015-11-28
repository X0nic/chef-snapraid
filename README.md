# SnapRAID cookbook [![GitHub license](https://img.shields.io/github/license/X0nic/chef-snapraid.svg)](https://github.com/X0nic/chef-snapraid/blob/master/LICENSE.md) [![Cookbook Version](http://img.shields.io/cookbook/v/snapraid.svg)](https://supermarket.chef.io/cookbooks/snapraid) [![Build Status](https://travis-ci.org/X0nic/chef-snapraid.svg)](https://travis-ci.org/X0nic/chef-snapraid)  
This cookbook provides a default recipe to install and configure SnapRAID.  
Uses [Chronial's snapraid-runner](https://github.com/Chronial/snapraid-runner) as an optional cronjob.

# Requirements
## Operating Systems
**Ubuntu:** 12.04, 14.04  
**CentOS:** 6.6, 7.0  
**Windows:** 2012 R2

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
You *must* set the above three arrays containing your disks and content files otherwise SnapRAID will not run!

# Windows Support
This cookbook has been tested on Windows 2012 R2, but should work wherever Chef and SnapRAID do.

# Attributes
Too many to list! Refer to `attributes/default.rb`.  
Some attributes are Windows/Linux specific (paths, etc.) and some only exist in one platform or the other (e.g. cron/scheduled task timings).  


# Recipes
## default 
Used to install and configure SnapRAID.
## scheduler
Used to install and configure [Chronial's snapraid-runner](https://github.com/Chronial/snapraid-runner) as a cronjob.

# Authors

Author:: Nathan Lee (<nathan@globalphobia.com>)  
Author:: Sam Martin (<samjackmartin@gmail.com>)
