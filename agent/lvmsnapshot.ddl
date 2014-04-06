metadata :name        => "lvm_snapshot",
         :description => "Agent to handle lvm snapshots",
         :author      => "Marcin Spoczynski",
         :license     => "BSD",
         :version     => "1.0",
         :url         => "https://github.com/sandlbn",
         :timeout     => 100

action "create_snapshot", :description => "Creates snapshot" do

    display :always

    input :size,
          :prompt      => "Snapshot size",
          :description => "Snapshot size",
          :type        => :integer,
          :validation  => '^[0-9]+$',
          :optional    => false,
          :maxlength   => 3

    input :type,
          :prompt      => "Snapshot size type",
          :description => "Snapshot size type eg: percentage, megabyte, gigabyte",
          :type        => :string,
          :validation  => '^[A-Za-z0-9._]+$',
          :optional    => false,
          :maxlength   => 10

    input :vg_name,
          :prompt      => "Volume Group Name",
          :description => "Volume Group Name eg. vg_root",
          :type        => :string,
          :validation  => '^[A-Za-z0-9._]+$',
          :optional    => false,
          :maxlength   => 30

    input :lv_name,
          :prompt      => "Logical Volume Name",
          :description => "Logical Volume Name eg. lv_root",
          :type        => :string,
          :validation  => '^[A-Za-z0-9._]+$',
          :optional    => false,
          :maxlength   => 30

    input :name,
          :prompt      => "Snapshot Name",
          :description => "Snapshot Name eg. snapshot",
          :type        => :string,
          :validation  => '^[A-Za-z0-9._]+$',
          :optional    => false,
          :maxlength   => 30

    output :status,
           :description => "The output of the command",
           :display_as  => "Command result",
           :default     => "no output"
    summarize do
      aggregate summary(:status)
end

action "merge_snapshot", :description => "Merge snapshot" do

    display :always

    input :lv_name,
          :prompt      => "Logical Volume Name",
          :description => "Logical Volume eg. lv_root",
          :type        => :string,
          :validation  => '^[A-Za-z0-9._]+$',
          :optional    => false,
          :maxlength   => 30

    input :vg_name,
          :prompt      => "Volume Group Name",
          :description => "Volume Group Name eg. vg_root",
          :type        => :string,
          :validation  => '^[A-Za-z0-9._]+$',
          :optional    => false,
          :maxlength   => 30

    output :status,
           :description => "The output of the command",
           :display_as  => "Command result",
           :default     => "no output"
    summarize do
      aggregate summary(:status)
end

action "remove_snapshot", :description => "Remove snapshot" do

    display :always

    input :lv_name,
          :prompt      => "Logical Volume Name",
          :description => "Logical Volume eg. lv_root",
          :type        => :string,
          :validation  => '^[A-Za-z0-9._]+$',
          :optional    => false,
          :maxlength   => 30

    input :vg_name,
          :prompt      => "Volume Group Name",
          :description => "Volume Group Name eg. vg_root",
          :type        => :string,
          :validation  => '^[A-Za-z0-9._]+$',
          :optional    => false,
          :maxlength   => 30

    output :status,
           :description => "The output of the command",
           :display_as  => "Command result",
           :default     => "no output"
    summarize do
      aggregate summary(:status)
end

action "umount_snapshot", :description => "Umount snapshot" do

    display :always

    output :status,
           :description => "The output of the command",
           :display_as  => "Command result",
           :default     => "no output"
    summarize do
      aggregate summary(:status)
end

action "remove_snapshot_from_model", :description => "Remove snapshot from model" do

    display :always

    output :status,
           :description => "The output of the command",
           :display_as  => "Command result",
           :default     => "no output"
    summarize do
      aggregate summary(:status)
end

