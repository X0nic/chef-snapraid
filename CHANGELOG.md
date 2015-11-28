#snapraid CHANGELOG


This file is used to list changes made in each version of the snapraid cookbook.

0.4.0
-----
Added Windows Support, upgraded default to SnapRAID v9.1  

0.3.1
-----
#### Features
 - Updated SnapRAID to 8.1


0.3.0
-----
#### Features
- Updated SnapRAID to 7.1
- Parameterised SnapRAID version
- Added support for [Chronial's snapraid-runner](https://github.com/Chronial/snapraid-runner) as an optional cronjob

#### Testing
- Added functional testing with `snapraid sync`
- Fixed CentOS tests
- Added RuboCop and FoodCritic
- Added ServerSpec tests to cover packages, files, and the cronjob

#### Tidiness
- Removed usage-specific defaults
