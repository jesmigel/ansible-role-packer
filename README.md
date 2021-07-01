# ansible-role-packer
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)[![CI](https://github.com/jesmigel/ansible-role-packer/actions/workflows/build.yaml/badge.svg?branch=main)](https://github.com/jesmigel/ansible-role-packer/actions/workflows/build.yaml)

An ansible role for building vm templates using packer

### References
| Name | Comments |
| - | - |
| [Dependencies](https://github.com/jesmigel/ansible-role-common#dependencies) | Deployment Toolchain |
| [Make Commands](https://github.com/jesmigel/ansible-role-common#make-commands) | Deployment Shortcuts |
| [Preflight Steps](https://github.com/jesmigel/ansible-role-common#preflieght-steps) | Pre deployment configuration 
|||

### Variables
| Name | Comments |
| - | - |
| `build_paths` | Packer sub directories |
| `http_files` | [Http server serving preseed related files](https://www.packer.io/docs/builders/vmware/iso#http-directory-configuration) |
| `vcenter` | [Object](./defaults/main.yaml#L10) containing vcenter details |
| `packer_builds` | [Packer payload](./vars/main.yaml#L2) containing details necessary for building a target ISO. |
| | |

### ToDo
- Variable structure breakdown