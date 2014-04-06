module Mcollective
  module Agent
    class Lvmsnapshot<Rpc::Agent

      action "create_snapshot" do

        type = request[:type] 
        if type == "percentage"
          snap_size = "-l#{request[:size]}%FREE"
        elsif type == "megabyte":
          snap_size = "-l#{request[:size]}M"
        elsif type == "gigabyte":
          snap_size = "-l#{request[:size]}G"
        else
          raise("#{request[:type]} not supported")
        end

        cmd = "lvcreate #{snap_size} -s -n #{request[:name]} /dev/#{request[:vg_name]}/#{request[:lv_name]}"

        reply[:status] = run("#{cmd}",
                              :stdout => :out,
                              :stderr => :err,
                              :chomp => true)
      end
      action "merge_snapshot" do

        cmd = "lvconvert --merge #{request[:vg_name]}/#{request[:lv_name]}"
        reply[:status] = run("#{cmd}",
                              :stdout => :out,
                              :stderr => :err,
                              :chomp => true)

      end
      action "remove_snapshot" do

        cmd = "lvremove /dev/#{request[:vg_name]}/#{request[:lv_name]} -f"
        reply[:status] = run("#{cmd}",
                              :stdout => :out,
                              :stderr => :err,
                              :chomp => true)

      end
      action "mount_snapshot" do

        cmd = "mkdir -p /mnt/snapshot; mount /dev/#{request[:vg_name]}/#{request[:name]} /mnt/snapshot"
        reply[:status] = run("#{cmd}",
                              :stdout => :out,
                              :stderr => :err,
                              :chomp => true)

      end
      action "umount_snapshot" do

        cmd = "umount /mnt/snapshot"
        reply[:status] = run("#{cmd}",
                              :stdout => :out,
                              :stderr => :err,
                              :chomp => true)

      end
    end
  end
end
