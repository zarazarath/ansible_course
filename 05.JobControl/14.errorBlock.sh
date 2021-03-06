echo --------------------------------------------------------------------------------
echo [ Clear ]
echo --------------------------------------------------------------------------------
[[ -f ansible.cfg ]]&& rm ansible.cfg
ansible web -m shell -a "rm -rf /tmp/xx* warn=no"
echo --------------------------------------------------------------------------------

echo --------------------------------------------------------------------------------
echo [ Setting ]
echo ansible n2 -m file -a "path=/tmp/xxbb state=directory"
echo --------------------------------------------------------------------------------
ansible n2 -m file -a "path=/tmp/xxbb state=directory"
echo --------------------------------------------------------------------------------

cat <<EOF> playbook.yml
- name : Special Tags
  hosts : web
  tasks:
    - copy:
        dest: /tmp/xxaa
        content: "xxaa"
    - block:
      - copy:
          dest: /tmp/xxbb
          content: "xxbb"
      rescue:
        - shell: "rm -rf /tmp/xxbb warn=no"
        - copy:
            dest: /tmp/xxbb
            content: "xxbb"
      always:
        - shell: "ls /tmp/xx*"
          register: p
        - debug: var=p.stdout_lines

    - copy:
        dest: /tmp/xxcc
        content: "xxcc"

EOF

echo "--------------------------------------------------------------------------------"
echo 'ansible-playbook playbook.yml'
echo "--------------------------------------------------------------------------------"
ansible-playbook playbook.yml
echo "--------------------------------------------------------------------------------"


echo --------------------------------------------------------------------------------
echo ansible web -m shell -a "ls /tmp/xx*"
echo --------------------------------------------------------------------------------
ansible web -m shell -a "ls /tmp/xx*"
echo --------------------------------------------------------------------------------

read -p "<< press enter, or cancel to ctl+c >>" ok

echo --------------------------------------------------------------------------------
echo [ Clear ]
echo --------------------------------------------------------------------------------
ansible web -m shell -a "rm -rf /tmp/xx* warn=no"
echo --------------------------------------------------------------------------------
