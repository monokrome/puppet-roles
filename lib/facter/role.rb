Facter.add('role') do
        setcode do
                %x{cat /etc/role}.chomp
        end
end

