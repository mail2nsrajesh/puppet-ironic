Puppet::Type.newtype(:ironic_config) do

  ensurable

  newparam(:name, :namevar => true) do
    desc 'Section/setting name to manage from ironic.conf'
    newvalues(/\S+\/\S+/)
  end

  newproperty(:value) do
    desc 'The value of the setting to be defined.'
    munge do |value|
      value = value.to_s.strip
      value.capitalize! if value =~ /^(true|false)$/i
      value
    end
  end
end