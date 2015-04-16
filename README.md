# SnapRAID cookbook
This cookbook provides a default recipe to install and configure SnapRAID

# Requirements

## Operating Systems

## Misc
 * Network access to SourceForge
# Usage
Add the SnapRAID cookbook to your runlist, specify the `data_disks`, `parity_disks`, and `content_files` in accordance with the disks you wish to control with SnapRAID.   
See the [SnapRAID FAQ](http://snapraid.sourceforge.net/faq.html) for more details.

# Attributes
#### transmission::default
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

# Recipes
## Default 
Used to install and configure SnapRAID.

# Author

Author:: Nathan Lee(<nathan@globalphobia.com>)
