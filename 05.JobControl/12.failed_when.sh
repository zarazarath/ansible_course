echo --------------------------------------------------------------------------------
echo [ Clear ]
echo --------------------------------------------------------------------------------
[[ -f ansible.cfg ]]&& rm ansible.cfg
ansible web -m shell -a "rm -rf /tmp/xx* warn=no"
echo --------------------------------------------------------------------------------

echo --------------------------------------------------------------------------------
echo [ Setting ]
echo ansible web -m file -a "path=/tmp/xxbb state=directory"
echo --------------------------------------------------------------------------------
ansible web -m file -a "path=/tmp/xxbb state=directory"
echo --------------------------------------------------------------------------------

cat <<EOF> playbook.yml
- name : Special Tags
  hosts : web
  tasks:
    - copy:
        dest: "/tmp/do.sh" 
        content: "[[ -d /tmp/xxbb ]] && echo 'a123'"
        mode: "a+x"
    - shell: /tmp/do.sh
      register: result
      failed_when: "'a123' in result.stdout"

EOF

echo "--------------------------------------------------------------------------------"
echo 'ansible-playbook playbook.yml'
echo "--------------------------------------------------------------------------------"
ansible-playbook playbook.yml
echo "--------------------------------------------------------------------------------"


read -p "<< press enter, or cancel to ctl+c >>" ok
echo --------------------------------------------------------------------------------
echo [ Clear ]
echo ansible web -m shell -a "rm -rf /tmp/xx* warn=no"
echo --------------------------------------------------------------------------------
ansible web -m shell -a "rm -rf /tmp/xx* warn=no"
echo --------------------------------------------------------------------------------

echo "--------------------------------------------------------------------------------"
echo 'ansible-playbook playbook.yml'
echo "--------------------------------------------------------------------------------"
ansible-playbook playbook.yml
echo "--------------------------------------------------------------------------------"

echo --------------------------------------------------------------------------------
echo [ Clear ]
echo --------------------------------------------------------------------------------
ansible web -m shell -a "rm -rf /tmp/xx* warn=no"
echo --------------------------------------------------------------------------------
