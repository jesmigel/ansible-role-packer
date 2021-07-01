Vagrant.configure('2') do |config|
    # INPUT PAYLOAD
    payload_file=File.expand_path('./env.yaml')
    payload=YAML.load_file(payload_file)['esxi']

    config.vm.hostname = "workstation"
    # OS image
    config.vm.box = payload['vm']['box']

    # PLUGINS
    config.vagrant.plugins = payload['plugins']
  
    #  Use rsync and NFS synced folders. (or disable them)
    #    https://www.vagrantup.com/docs/synced-folders/
    #config.vm.synced_folder('.', '/vagrant', type: 'rsync')
    config.vm.synced_folder('.', '/vagrant', type: 'nfs', disabled: true)

    #
    #  Provider (esxi) settings
    #
    config.vm.hostname = payload['vm']['guest_name']
    config.vm.provider :vmware_esxi do |esxi|
      esxi.esxi_hostname = payload['host']
  
      #  ESXi username
      esxi.esxi_username = payload['user']
      esxi.esxi_password = payload['password']
  
      #  SSH port.
      #esxi.esxi_hostport = 22
  
      #  HIGHLY RECOMMENDED!  Virtual Network
      esxi.esxi_virtual_network = payload['networks']
  
      #  OPTIONAL.  Specify a Disk Store
      #    If it's not specified, the Default is to use the least used Disk Store.
      esxi.esxi_disk_store = payload['vm']['datastore']
  
      #  OPTIONAL.  Resource Pool
      #esxi.esxi_resource_pool = '/Vagrant'
  
      #  Optional. Specify a VM to clone instead of uploading a box.
      #esxi.clone_from_vm = 'resource_pool/source_vm'
  
      #  OPTIONAL.  Guest VM name to use.
      esxi.guest_name = payload['vm']['guest_name']
  
      #  OPTIONAL.  When automatically naming VMs, use this prefix.
      esxi.guest_name_prefix = payload['vm']['guest_name_prefix']
  
      #  OPTIONAL.  Set the guest username login.  The default is 'vagrant'.
      #esxi.guest_username = 'vagrant'
  
      #  OPTIONAL.  Memory size override
      esxi.guest_memsize = payload['vm']['ram']
  
      #  OPTIONAL.  Virtual CPUs override
      esxi.guest_numvcpus = payload['vm']['vcpu']
  
      #  OPTIONAL. Specify a disk type.
      esxi.guest_disk_type = 'thick'
  
      #  OPTIONAL. Boot disk size.
      esxi.guest_boot_disk_size = payload['vm']['disk']
  
      #  OPTIONAL.  Create additional storage for guests.
      #esxi.guest_storage = [ 10, 20, { size: 30, datastore: 'datastore1' } ]
  
      #  OPTIONAL & RISKY.  Specify up to 4 MAC addresses
      #esxi.guest_mac_address = ['00:50:56:aa:bb:cc', '00:50:56:01:01:01','00:50:56:02:02:02','00:50:56:BE:AF:01' ]
  
      #   OPTIONAL & RISKY.  Specify a guest_nic_type
      #     The default is to have the virtual nic hw type automatically
      #     determined by the ovftool.  However, you can override it by specifying
      #     it here.  This is a global setting.  (all 4 virtual networks will be set)
      #     The validated list of guest_nic_types are 'e1000', 'e1000e', 'vmxnet',
      #     'vmxnet2', 'vmxnet3', 'Vlance', and 'Flexible'.  I consider this
      #     risky because I don't validate if the specified guest_nic_type is
      #     compatible with your OS version.
      #    *** Invalid setting could cause 'vagrant up' to fail ***
      #esxi.guest_nic_type = 'e1000'
  
      #  OPTIONAL. specify snapshot options.
      #esxi.guest_snapshot_includememory = 'true'
      #esxi.guest_snapshot_quiesced = 'true'
  
      #  RISKY. guest_guestos
      #    if unspecified, the default will be generated by the OVFTool.  Most
      #    of the time, you don't need to change this unless ovftool doesn't get
      #    the correct information from the box.  See my page on supported guest_guestos
      #    types for ESXI.
      #    https://github.com/josenk/vagrant-vmware-esxi/blob/master/ESXi_guestos_types.md
      #esxi.guest_guestos = 'centos-64'
  
      #  OPTIONAL. guest_virtualhw_version
      #    If unspecified, the default will be generated by the OVFTool.  Most
      #    of the time, you don't need to change this unless you are using advanced
      #    custom vmx settings that require it.
      #    ESXi 6.5 supports these versions. 4,7,8,9,10,11,12,13 & 14.
      #esxi.guest_virtualhw_version = '9'
  
      #  OPTIONAL. guest_autostart
      #    If unspecified, the guest VM will not autostart.  Set this to 'true' if
      #    you want the guest VM to autostart when the esxi host is booted.  The autostart
      #    options are all DEFAULT and there is no options in this plugin to modify them.
      #    Valid options. 'true' or 'false'(default)
      #esxi.guest_autostart = 'false'
  
      #  RISKY. guest_custom_vmx_settings
      #    You can specify an array of custom vmx settings to add (or to override
      #    existing settings).   ****  I don't do any validation, so if you
      #    make any errors, it will not be caught ***   This is the place you would
      #    add any special settings you need in your vmx.  (Like adding a USB, DVD
      #    CPU settings, etc...).
      #    ex vhv.enable = 'TRUE' will be appended, floppy0.presend = 'TRUE' will be modified
      #esxi.guest_custom_vmx_settings = [['vhv.enable','TRUE'], ['floppy0.present','TRUE']]
  
      #  OPTIONAL. local_lax
      #    If unspecified, the ovftool option --lax is disabled.   If you are
      #    importing ovf boxes that generate errors, you may want to enable local_lax
      #    to convert the errors to warning. (then the import could succeed)
      #esxi.local_lax = 'true'
  
      #  OPTIONAL.  Guest IP Caching
      #    If unspecified, guest IP caching will be enabled.  This will result in
      #    faster vagrant command executution.   However, vagrant could get incorrect
      #    information if an IP changes on the guest.   Set this 'False' to disable
      #    IP caching.
      #esxi.local_use_ip_cache = 'False'
  
      #  DANGEROUS!  Allow Overwrite
      #    If unspecified, the default is to produce an error if overwriting
      #    vm's and packages.
      #    Set this to 'True' will overwrite existing VMs (with the same name)
      #    when you run vagrant up.   ie,  if the guest_name already exists,
      #    it will be destroyed, then over written...  This is helpful
      #    if you have a VM that became an orphan (vagrant lost association).
      #    This will also overwrite your box when using vagrant package.
      #esxi.local_allow_overwrite = 'True'
  
      #  Advanced users.
      #    If unspecified or set to 'False', all WARNINGS will produce a WARNING and vagrant
      #    will continue.   If set to 'True', all WARNINGS will produce a FAILURE and
      #    vagrant will stop.
      #esxi.local_failonwarning = 'True'
  
      #  Plugin debug output.
      #    Send bug reports with this debug output...
      #esxi.debug = 'true'
  
    end

    config.vm.provision "ansible" do |ansible|
      ansible.config_file          = 'ansible.cfg'
      ansible.extra_vars           = payload['ansible']['extra_vars']
      ansible.playbook             = "./playbook.yaml"
      ansible.limit                = "all"
      ansible.tags                 = ['fetch']
    end
  end
  