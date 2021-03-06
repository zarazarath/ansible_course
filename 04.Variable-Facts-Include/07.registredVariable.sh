cat <<EOF> ansible.cfg
[defaults]
inventory = inventory
EOF
cat <<EOF> inventory
[all:vars]
byWho=nowage
[web]
n2
n3
[web:vars]
package=tree

[db]
n4
[db:vars]
package=curl
EOF

cat <<EOF> playbook.yml
- hosts: all
  tasks:
    - name: installs the {{ package }} package by {{ byWho }}
      yum:
        name: "{{ package }}"
        state: latest    
      register: r
    - debug: var=r
EOF

echo --------------------------------------------------------------------------------
echo 'ansible-playbook playbook.yml'
echo --------------------------------------------------------------------------------
ansible-playbook  playbook.yml
echo --------------------------------------------------------------------------------


echo "diff 05.groupVariables.sh 07.registredVariable.sh"